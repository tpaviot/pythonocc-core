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
%module (package="OCC") Geom2dAdaptor

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

%include Geom2dAdaptor_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(geom2dadaptor) Geom2dAdaptor;
%nodefaultctor Geom2dAdaptor;
class Geom2dAdaptor {
	public:
		%feature("autodoc", "Args:
	HC(Adaptor2d_Curve2d)

Returns:
	static Handle_Geom2d_Curve

Inherited  from    GHCurve.   Provides a  curve  
         handled by reference.  Creates  a 2d  curve  from  a  HCurve2d.  This  
         cannot process the OtherCurves.") MakeCurve;
		static Handle_Geom2d_Curve MakeCurve (const Adaptor2d_Curve2d & HC);
};


%feature("shadow") Geom2dAdaptor::~Geom2dAdaptor %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dAdaptor {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dAdaptor_Curve;
class Geom2dAdaptor_Curve : public Adaptor2d_Curve2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve ();
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	UFirst(Standard_Real)
	ULast(Standard_Real)

Returns:
	None

ConstructionError is raised if Ufirst>Ulast") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve (const Handle_Geom2d_Curve & C,const Standard_Real UFirst,const Standard_Real ULast);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	UFirst(Standard_Real)
	ULast(Standard_Real)

Returns:
	None

ConstructionError is raised if Ufirst>Ulast") Load;
		void Load (const Handle_Geom2d_Curve & C,const Standard_Real UFirst,const Standard_Real ULast);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") Curve;
		const Handle_Geom2d_Curve & Curve ();
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

Computes the point of parameter U on the curve") Value;
		gp_Pnt2d Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)

Returns:
	None

Computes the point of parameter U.") D0;
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
	Ruv(Standard_Real)

Returns:
	Standard_Real

returns the parametric resolution") Resolution;
		Standard_Real Resolution (const Standard_Real Ruv);
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
	virtual Standard_Integer

No detailed docstring for this function.") NbSamples;
		virtual Standard_Integer NbSamples ();
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


%feature("shadow") Geom2dAdaptor_Curve::~Geom2dAdaptor_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dAdaptor_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Geom2dAdaptor_GHCurve;
class Geom2dAdaptor_GHCurve : public Adaptor2d_HCurve2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dAdaptor_GHCurve;
		 Geom2dAdaptor_GHCurve ();
		%feature("autodoc", "Args:
	C(Geom2dAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") Geom2dAdaptor_GHCurve;
		 Geom2dAdaptor_GHCurve (const Geom2dAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(Geom2dAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const Geom2dAdaptor_Curve & C);
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor2d_Curve2d

No detailed docstring for this function.") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Geom2dAdaptor_Curve

No detailed docstring for this function.") ChangeCurve2d;
		Geom2dAdaptor_Curve & ChangeCurve2d ();
};


%feature("shadow") Geom2dAdaptor_GHCurve::~Geom2dAdaptor_GHCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dAdaptor_GHCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom2dAdaptor_GHCurve {
	Handle_Geom2dAdaptor_GHCurve GetHandle() {
	return *(Handle_Geom2dAdaptor_GHCurve*) &$self;
	}
};

%nodefaultctor Handle_Geom2dAdaptor_GHCurve;
class Handle_Geom2dAdaptor_GHCurve : public Handle_Adaptor2d_HCurve2d {

    public:
        // constructors
        Handle_Geom2dAdaptor_GHCurve();
        Handle_Geom2dAdaptor_GHCurve(const Handle_Geom2dAdaptor_GHCurve &aHandle);
        Handle_Geom2dAdaptor_GHCurve(const Geom2dAdaptor_GHCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom2dAdaptor_GHCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom2dAdaptor_GHCurve {
    Geom2dAdaptor_GHCurve* GetObject() {
    return (Geom2dAdaptor_GHCurve*)$self->Access();
    }
};
%feature("shadow") Handle_Geom2dAdaptor_GHCurve::~Handle_Geom2dAdaptor_GHCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom2dAdaptor_GHCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Geom2dAdaptor_HCurve;
class Geom2dAdaptor_HCurve : public Geom2dAdaptor_GHCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve ();
		%feature("autodoc", "Args:
	AS(Geom2dAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve (const Geom2dAdaptor_Curve & AS);
		%feature("autodoc", "Args:
	S(Handle_Geom2d_Curve)

Returns:
	None

No detailed docstring for this function.") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve (const Handle_Geom2d_Curve & S);
		%feature("autodoc", "Args:
	S(Handle_Geom2d_Curve)
	UFirst(Standard_Real)
	ULast(Standard_Real)

Returns:
	None

ConstructionError is raised if UFirst>ULast or VFirst>VLast") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve (const Handle_Geom2d_Curve & S,const Standard_Real UFirst,const Standard_Real ULast);
};


%feature("shadow") Geom2dAdaptor_HCurve::~Geom2dAdaptor_HCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Geom2dAdaptor_HCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Geom2dAdaptor_HCurve {
	Handle_Geom2dAdaptor_HCurve GetHandle() {
	return *(Handle_Geom2dAdaptor_HCurve*) &$self;
	}
};

%nodefaultctor Handle_Geom2dAdaptor_HCurve;
class Handle_Geom2dAdaptor_HCurve : public Handle_Geom2dAdaptor_GHCurve {

    public:
        // constructors
        Handle_Geom2dAdaptor_HCurve();
        Handle_Geom2dAdaptor_HCurve(const Handle_Geom2dAdaptor_HCurve &aHandle);
        Handle_Geom2dAdaptor_HCurve(const Geom2dAdaptor_HCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Geom2dAdaptor_HCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Geom2dAdaptor_HCurve {
    Geom2dAdaptor_HCurve* GetObject() {
    return (Geom2dAdaptor_HCurve*)$self->Access();
    }
};
%feature("shadow") Handle_Geom2dAdaptor_HCurve::~Handle_Geom2dAdaptor_HCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Geom2dAdaptor_HCurve {
    void _kill_pointed() {
        delete $self;
    }
};

