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
%module GeomAdaptor

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

%include GeomAdaptor_required_python_modules.i
%include GeomAdaptor_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(geomadaptor) GeomAdaptor;
%nodefaultctor GeomAdaptor;
class GeomAdaptor {
	public:
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static Handle_Geom_Curve

Inherited  from    GHCurve.   Provides a  curve  
         handled by reference.  Build a Geom_Curve using the informations from the  
         Curve from Adaptor3d") MakeCurve;
		static Handle_Geom_Curve MakeCurve (const Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	S(Adaptor3d_Surface)

Returns:
	static Handle_Geom_Surface

Build a Geom_Surface using the informations from the  
         Surface from Adaptor3d") MakeSurface;
		static Handle_Geom_Surface MakeSurface (const Adaptor3d_Surface & S);
};


%feature("shadow") GeomAdaptor::~GeomAdaptor %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAdaptor {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomAdaptor_Curve;
class GeomAdaptor_Curve : public Adaptor3d_Curve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GeomAdaptor_Curve;
		 GeomAdaptor_Curve ();
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") GeomAdaptor_Curve;
		 GeomAdaptor_Curve (const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	UFirst(Standard_Real)
	ULast(Standard_Real)

Returns:
	None

ConstructionError is raised if Ufirst>Ulast") GeomAdaptor_Curve;
		 GeomAdaptor_Curve (const Handle_Geom_Curve & C,const Standard_Real UFirst,const Standard_Real ULast);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	UFirst(Standard_Real)
	ULast(Standard_Real)

Returns:
	None

ConstructionError is raised if Ufirst>Ulast") Load;
		void Load (const Handle_Geom_Curve & C,const Standard_Real UFirst,const Standard_Real ULast);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

Provides a curve inherited from Hcurve from Adaptor.  
This is inherited to provide easy to use constructors.") Curve;
		const Handle_Geom_Curve & Curve ();
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

Computes the point of parameter U on the curve") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the point of parameter U.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	None

Computes the point of parameter U on the curve  
 with its first derivative.  
 
 Warning : On the specific case of BSplineCurve:  
 if the curve is cut in interval of continuity at least C1, the  
 derivatives are computed on the current interval.  
 else the derivatives are computed on the basis curve.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.  
 
 Warning : On the specific case of BSplineCurve:  
 if the curve is cut in interval of continuity at least C2, the  
 derivatives are computed on the current interval.  
 else the derivatives are computed on the basis curve.") D2;
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
 and the third derivative.  
 
 Warning : On the specific case of BSplineCurve:  
 if the curve is cut in interval of continuity at least C3, the  
 derivatives are computed on the current interval.  
 else the derivatives are computed on the basis curve.") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec

The returned vector gives the value of the derivative for the  
 order of derivation N.  
 Warning : On the specific case of BSplineCurve:  
 if the curve is cut in interval of continuity CN, the  
 derivatives are computed on the current interval.  
 else the derivatives are computed on the basis curve.  Raised if N < 1.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	Standard_Real

returns the parametric resolution") Resolution;
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

this should NEVER make a copy  
         of the underlying curve to read  
         the relevant information") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

this should NEVER make a copy  
         of the underlying curve to read  
         the relevant information") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

this should NEVER make a copy  
         of the underlying curve to read  
         the relevant information") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

this should NEVER make a copy  
         of the underlying curve to read  
         the relevant information") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BezierCurve

this will NOT make a copy of the  
        Bezier Curve : If you want to modify  
        the Curve please make a copy yourself  
        Also it will NOT trim the surface to  
        myFirst/Last.") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineCurve

this will NOT make a copy of the  
        BSpline Curve : If you want to modify  
        the Curve please make a copy yourself  
        Also it will NOT trim the surface to  
        myFirst/Last.") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%feature("shadow") GeomAdaptor_Curve::~GeomAdaptor_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAdaptor_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomAdaptor_GHCurve;
class GeomAdaptor_GHCurve : public Adaptor3d_HCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GeomAdaptor_GHCurve;
		 GeomAdaptor_GHCurve ();
		%feature("autodoc", "Args:
	C(GeomAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") GeomAdaptor_GHCurve;
		 GeomAdaptor_GHCurve (const GeomAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(GeomAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const GeomAdaptor_Curve & C);
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
	GeomAdaptor_Curve

No detailed docstring for this function.") ChangeCurve;
		GeomAdaptor_Curve & ChangeCurve ();
};


%feature("shadow") GeomAdaptor_GHCurve::~GeomAdaptor_GHCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAdaptor_GHCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GeomAdaptor_GHCurve {
	Handle_GeomAdaptor_GHCurve GetHandle() {
	return *(Handle_GeomAdaptor_GHCurve*) &$self;
	}
};

%nodefaultctor Handle_GeomAdaptor_GHCurve;
class Handle_GeomAdaptor_GHCurve : public Handle_Adaptor3d_HCurve {

    public:
        // constructors
        Handle_GeomAdaptor_GHCurve();
        Handle_GeomAdaptor_GHCurve(const Handle_GeomAdaptor_GHCurve &aHandle);
        Handle_GeomAdaptor_GHCurve(const GeomAdaptor_GHCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomAdaptor_GHCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomAdaptor_GHCurve {
    GeomAdaptor_GHCurve* GetObject() {
    return (GeomAdaptor_GHCurve*)$self->Access();
    }
};
%feature("shadow") Handle_GeomAdaptor_GHCurve::~Handle_GeomAdaptor_GHCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GeomAdaptor_GHCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GeomAdaptor_GHSurface;
class GeomAdaptor_GHSurface : public Adaptor3d_HSurface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GeomAdaptor_GHSurface;
		 GeomAdaptor_GHSurface ();
		%feature("autodoc", "Args:
	S(GeomAdaptor_Surface)

Returns:
	None

No detailed docstring for this function.") GeomAdaptor_GHSurface;
		 GeomAdaptor_GHSurface (const GeomAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(GeomAdaptor_Surface)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const GeomAdaptor_Surface & S);
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_Surface

No detailed docstring for this function.") Surface;
		const Adaptor3d_Surface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAdaptor_Surface

No detailed docstring for this function.") ChangeSurface;
		GeomAdaptor_Surface & ChangeSurface ();
};


%feature("shadow") GeomAdaptor_GHSurface::~GeomAdaptor_GHSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAdaptor_GHSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GeomAdaptor_GHSurface {
	Handle_GeomAdaptor_GHSurface GetHandle() {
	return *(Handle_GeomAdaptor_GHSurface*) &$self;
	}
};

%nodefaultctor Handle_GeomAdaptor_GHSurface;
class Handle_GeomAdaptor_GHSurface : public Handle_Adaptor3d_HSurface {

    public:
        // constructors
        Handle_GeomAdaptor_GHSurface();
        Handle_GeomAdaptor_GHSurface(const Handle_GeomAdaptor_GHSurface &aHandle);
        Handle_GeomAdaptor_GHSurface(const GeomAdaptor_GHSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomAdaptor_GHSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomAdaptor_GHSurface {
    GeomAdaptor_GHSurface* GetObject() {
    return (GeomAdaptor_GHSurface*)$self->Access();
    }
};
%feature("shadow") Handle_GeomAdaptor_GHSurface::~Handle_GeomAdaptor_GHSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GeomAdaptor_GHSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GeomAdaptor_Surface;
class GeomAdaptor_Surface : public Adaptor3d_Surface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GeomAdaptor_Surface;
		 GeomAdaptor_Surface ();
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") GeomAdaptor_Surface;
		 GeomAdaptor_Surface (const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	UFirst(Standard_Real)
	ULast(Standard_Real)
	VFirst(Standard_Real)
	VLast(Standard_Real)
	TolU(Standard_Real)=0.0
	TolV(Standard_Real)=0.0

Returns:
	None

ConstructionError is raised if UFirst>ULast or VFirst>VLast") GeomAdaptor_Surface;
		 GeomAdaptor_Surface (const Handle_Geom_Surface & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast,const Standard_Real TolU = 0.0,const Standard_Real TolV = 0.0);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	UFirst(Standard_Real)
	ULast(Standard_Real)
	VFirst(Standard_Real)
	VLast(Standard_Real)
	TolU(Standard_Real)=0.0
	TolV(Standard_Real)=0.0

Returns:
	None

ConstructionError is raised if UFirst>ULast or VFirst>VLast") Load;
		void Load (const Handle_Geom_Surface & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast,const Standard_Real TolU = 0.0,const Standard_Real TolV = 0.0);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Surface;
		const Handle_Geom_Surface & Surface ();
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
 the surface.  
 
 Warning : On the specific case of BSplineSurface:  
 if the surface is cut in interval of continuity at least C1,  
 the derivatives are computed on the current interval.  
 else the derivatives are computed on the basis surface.") D1;
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
 derivatives on the surface.  
 
 Warning : On the specific case of BSplineSurface:  
 if the surface is cut in interval of continuity at least C2,  
 the derivatives are computed on the current interval.  
 else the derivatives are computed on the basis surface.") D2;
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
 derivatives on the surface.  
 
 Warning : On the specific case of BSplineSurface:  
 if the surface is cut in interval of continuity at least C3,  
 the derivatives are computed on the current interval.  
 else the derivatives are computed on the basis surface.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

Computes the derivative of order Nu in the  
 direction U and Nv in the direction V at the point P(U, V).  
 
 Warning : On the specific case of BSplineSurface:  
 if the surface is cut in interval of continuity CN,  
 the derivatives are computed on the current interval.  
 else the derivatives are computed on the basis surface.  Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.") DN;
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

This will NOT make a copy of the  
          Bezier Surface : If you want to modify  
          the Surface please make a copy yourself  
          Also it will NOT trim the surface to  
          myU/VFirst/Last.") Bezier;
		Handle_Geom_BezierSurface Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineSurface

This will NOT make a copy of the  
          BSpline Surface : If you want to modify  
          the Surface please make a copy yourself  
          Also it will NOT trim the surface to  
          myU/VFirst/Last.") BSpline;
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


%feature("shadow") GeomAdaptor_Surface::~GeomAdaptor_Surface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAdaptor_Surface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GeomAdaptor_HCurve;
class GeomAdaptor_HCurve : public GeomAdaptor_GHCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve ();
		%feature("autodoc", "Args:
	AS(GeomAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve (const GeomAdaptor_Curve & AS);
		%feature("autodoc", "Args:
	S(Handle_Geom_Curve)

Returns:
	None

No detailed docstring for this function.") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve (const Handle_Geom_Curve & S);
		%feature("autodoc", "Args:
	S(Handle_Geom_Curve)
	UFirst(Standard_Real)
	ULast(Standard_Real)

Returns:
	None

ConstructionError is raised if UFirst>ULast or VFirst>VLast") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve (const Handle_Geom_Curve & S,const Standard_Real UFirst,const Standard_Real ULast);
};


%feature("shadow") GeomAdaptor_HCurve::~GeomAdaptor_HCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAdaptor_HCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GeomAdaptor_HCurve {
	Handle_GeomAdaptor_HCurve GetHandle() {
	return *(Handle_GeomAdaptor_HCurve*) &$self;
	}
};

%nodefaultctor Handle_GeomAdaptor_HCurve;
class Handle_GeomAdaptor_HCurve : public Handle_GeomAdaptor_GHCurve {

    public:
        // constructors
        Handle_GeomAdaptor_HCurve();
        Handle_GeomAdaptor_HCurve(const Handle_GeomAdaptor_HCurve &aHandle);
        Handle_GeomAdaptor_HCurve(const GeomAdaptor_HCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomAdaptor_HCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomAdaptor_HCurve {
    GeomAdaptor_HCurve* GetObject() {
    return (GeomAdaptor_HCurve*)$self->Access();
    }
};
%feature("shadow") Handle_GeomAdaptor_HCurve::~Handle_GeomAdaptor_HCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GeomAdaptor_HCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GeomAdaptor_HSurface;
class GeomAdaptor_HSurface : public GeomAdaptor_GHSurface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface ();
		%feature("autodoc", "Args:
	AS(GeomAdaptor_Surface)

Returns:
	None

No detailed docstring for this function.") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface (const GeomAdaptor_Surface & AS);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface (const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	UFirst(Standard_Real)
	ULast(Standard_Real)
	VFirst(Standard_Real)
	VLast(Standard_Real)
	TolU(Standard_Real)=0.0
	TolV(Standard_Real)=0.0

Returns:
	None

ConstructionError is raised if UFirst>ULast or VFirst>VLast") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface (const Handle_Geom_Surface & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast,const Standard_Real TolU = 0.0,const Standard_Real TolV = 0.0);
};


%feature("shadow") GeomAdaptor_HSurface::~GeomAdaptor_HSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GeomAdaptor_HSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GeomAdaptor_HSurface {
	Handle_GeomAdaptor_HSurface GetHandle() {
	return *(Handle_GeomAdaptor_HSurface*) &$self;
	}
};

%nodefaultctor Handle_GeomAdaptor_HSurface;
class Handle_GeomAdaptor_HSurface : public Handle_GeomAdaptor_GHSurface {

    public:
        // constructors
        Handle_GeomAdaptor_HSurface();
        Handle_GeomAdaptor_HSurface(const Handle_GeomAdaptor_HSurface &aHandle);
        Handle_GeomAdaptor_HSurface(const GeomAdaptor_HSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GeomAdaptor_HSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GeomAdaptor_HSurface {
    GeomAdaptor_HSurface* GetObject() {
    return (GeomAdaptor_HSurface*)$self->Access();
    }
};
%feature("shadow") Handle_GeomAdaptor_HSurface::~Handle_GeomAdaptor_HSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GeomAdaptor_HSurface {
    void _kill_pointed() {
        delete $self;
    }
};

