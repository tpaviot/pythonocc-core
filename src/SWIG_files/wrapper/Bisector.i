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
%module Bisector

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

%include Bisector_required_python_modules.i
%include Bisector_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(bisector) Bisector;
%nodefaultctor Bisector;
class Bisector {
	public:
		%feature("autodoc", "Args:
	Cu(Handle_Geom2d_Curve)
	Sign(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsConvex;
		static Standard_Boolean IsConvex (const Handle_Geom2d_Curve & Cu,const Standard_Real Sign);
};


%feature("shadow") Bisector::~Bisector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bisector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bisector_Bisec;
class Bisector_Bisec {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Bisector_Bisec;
		 Bisector_Bisec ();
		%feature("autodoc", "Args:
	Cu1(Handle_Geom2d_Curve)
	Cu2(Handle_Geom2d_Curve)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	Sense(Standard_Real)
	Tolerance(Standard_Real)
	oncurve(Standard_Boolean)=Standard_True

Returns:
	None

Performs  the bisecting line  between the  curves  
           <Cu1> and <Cu2>.  
           <oncurve> is True if the point <P> is common to <Cu1>  
           and <Cu2>.") Perform;
		void Perform (const Handle_Geom2d_Curve & Cu1,const Handle_Geom2d_Curve & Cu2,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);
		%feature("autodoc", "Args:
	Cu(Handle_Geom2d_Curve)
	Pnt(Handle_Geom2d_Point)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	Sense(Standard_Real)
	Tolerance(Standard_Real)
	oncurve(Standard_Boolean)=Standard_True

Returns:
	None

Performs  the bisecting line  between the  curve  
           <Cu1> and the point <Pnt>.  
           <oncurve> is True if the point <P> is the point <Pnt>.") Perform;
		void Perform (const Handle_Geom2d_Curve & Cu,const Handle_Geom2d_Point & Pnt,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);
		%feature("autodoc", "Args:
	Pnt(Handle_Geom2d_Point)
	Cu(Handle_Geom2d_Curve)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	Sense(Standard_Real)
	Tolerance(Standard_Real)
	oncurve(Standard_Boolean)=Standard_True

Returns:
	None

Performs  the bisecting line  between the  curve  
           <Cu> and the point <Pnt>.  
           <oncurve> is True if the point <P> is the point <Pnt>.") Perform;
		void Perform (const Handle_Geom2d_Point & Pnt,const Handle_Geom2d_Curve & Cu,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);
		%feature("autodoc", "Args:
	Pnt1(Handle_Geom2d_Point)
	Pnt2(Handle_Geom2d_Point)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	Sense(Standard_Real)
	Tolerance(Standard_Real)=0.0
	oncurve(Standard_Boolean)=Standard_True

Returns:
	None

Performs  the bisecting line  between the two points  
           <Pnt1>  and <Pnt2>.") Perform;
		void Perform (const Handle_Geom2d_Point & Pnt1,const Handle_Geom2d_Point & Pnt2,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance = 0.0,const Standard_Boolean oncurve = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_TrimmedCurve

Returns the Curve of <self>.") Value;
		const Handle_Geom2d_TrimmedCurve & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_TrimmedCurve

Returns the Curve of <self>.") ChangeValue;
		const Handle_Geom2d_TrimmedCurve & ChangeValue ();
};


%feature("shadow") Bisector_Bisec::~Bisector_Bisec %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bisector_Bisec {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bisector_Curve;
class Bisector_Curve : public Geom2d_Curve {
	public:
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	virtual Standard_Real

No detailed docstring for this function.") Parameter;
		virtual Standard_Real Parameter (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsExtendAtStart;
		virtual Standard_Boolean IsExtendAtStart ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsExtendAtEnd;
		virtual Standard_Boolean IsExtendAtEnd ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

If necessary,  breaks the  curve in  intervals  of  
         continuity  <C1>.    And  returns   the number   of  
         intervals.") NbIntervals;
		virtual Standard_Integer NbIntervals ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	virtual Standard_Real

Returns  the  first  parameter    of  the  current  
         interval.") IntervalFirst;
		virtual Standard_Real IntervalFirst (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	virtual Standard_Real

Returns  the  last  parameter    of  the  current  
         interval.") IntervalLast;
		virtual Standard_Real IntervalLast (const Standard_Integer Index);
};


%feature("shadow") Bisector_Curve::~Bisector_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bisector_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Bisector_Curve {
	Handle_Bisector_Curve GetHandle() {
	return *(Handle_Bisector_Curve*) &$self;
	}
};

%nodefaultctor Handle_Bisector_Curve;
class Handle_Bisector_Curve : public Handle_Geom2d_Curve {

    public:
        // constructors
        Handle_Bisector_Curve();
        Handle_Bisector_Curve(const Handle_Bisector_Curve &aHandle);
        Handle_Bisector_Curve(const Bisector_Curve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Bisector_Curve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Bisector_Curve {
    Bisector_Curve* GetObject() {
    return (Bisector_Curve*)$self->Access();
    }
};
%feature("shadow") Handle_Bisector_Curve::~Handle_Bisector_Curve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Bisector_Curve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Bisector_FunctionH;
class Bisector_FunctionH : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	C2(Handle_Geom2d_Curve)
	P1(gp_Pnt2d)
	T1(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") Bisector_FunctionH;
		 Bisector_FunctionH (const Handle_Geom2d_Curve & C2,const gp_Pnt2d & P1,const gp_Vec2d & T1);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

Computes the values of the Functions for the variable <X>.") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

Returns the values of the functions and the derivatives  
         for the variable <X>.") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Bisector_FunctionH::~Bisector_FunctionH %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bisector_FunctionH {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bisector_FunctionInter;
class Bisector_FunctionInter : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Bisector_FunctionInter;
		 Bisector_FunctionInter ();
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	Bis1(Handle_Bisector_Curve)
	Bis2(Handle_Bisector_Curve)

Returns:
	None

No detailed docstring for this function.") Bisector_FunctionInter;
		 Bisector_FunctionInter (const Handle_Geom2d_Curve & C,const Handle_Bisector_Curve & Bis1,const Handle_Bisector_Curve & Bis2);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)
	Bis1(Handle_Bisector_Curve)
	Bis2(Handle_Bisector_Curve)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Handle_Geom2d_Curve & C,const Handle_Bisector_Curve & Bis1,const Handle_Bisector_Curve & Bis2);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

Computes the values of the Functions for the variable <X>.") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

Returns the values of the functions and the derivatives  
         for the variable <X>.") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") Bisector_FunctionInter::~Bisector_FunctionInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bisector_FunctionInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bisector_Inter;
class Bisector_Inter : public IntRes2d_Intersection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Bisector_Inter;
		 Bisector_Inter ();
		%feature("autodoc", "Args:
	C1(Bisector_Bisec)
	D1(IntRes2d_Domain)
	C2(Bisector_Bisec)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)
	ComunElement(Standard_Boolean)

Returns:
	None

Intersection between 2 curves.  
         C1 separates the element A and B.  
         C2 separates the elements C et D.  
         If B an C have the same geometry. <ComunElement>  
         Has to be True.  
         It Permits an optimiztion of the computation.") Bisector_Inter;
		 Bisector_Inter (const Bisector_Bisec & C1,const IntRes2d_Domain & D1,const Bisector_Bisec & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol,const Standard_Boolean ComunElement);
		%feature("autodoc", "Args:
	C1(Bisector_Bisec)
	D1(IntRes2d_Domain)
	C2(Bisector_Bisec)
	D2(IntRes2d_Domain)
	TolConf(Standard_Real)
	Tol(Standard_Real)
	ComunElement(Standard_Boolean)

Returns:
	None

Intersection between 2 curves.  
         C1 separates the element A and B.  
         C2 separates the elements C et D.  
         If B an C have the same geometry. <ComunElement>  
         Has to be True.  
         It Permits an optimiztion of the computation.") Perform;
		void Perform (const Bisector_Bisec & C1,const IntRes2d_Domain & D1,const Bisector_Bisec & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol,const Standard_Boolean ComunElement);
};


%feature("shadow") Bisector_Inter::~Bisector_Inter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bisector_Inter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bisector_PointOnBis;
class Bisector_PointOnBis {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Bisector_PointOnBis;
		 Bisector_PointOnBis ();
		%feature("autodoc", "Args:
	Param1(Standard_Real)
	Param2(Standard_Real)
	ParamBis(Standard_Real)
	Distance(Standard_Real)
	Point(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Bisector_PointOnBis;
		 Bisector_PointOnBis (const Standard_Real Param1,const Standard_Real Param2,const Standard_Real ParamBis,const Standard_Real Distance,const gp_Pnt2d & Point);
		%feature("autodoc", "Args:
	Param(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ParamOnC1;
		void ParamOnC1 (const Standard_Real Param);
		%feature("autodoc", "Args:
	Param(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ParamOnC2;
		void ParamOnC2 (const Standard_Real Param);
		%feature("autodoc", "Args:
	Param(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ParamOnBis;
		void ParamOnBis (const Standard_Real Param);
		%feature("autodoc", "Args:
	Distance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Distance;
		void Distance (const Standard_Real Distance);
		%feature("autodoc", "Args:
	Infinite(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") IsInfinite;
		void IsInfinite (const Standard_Boolean Infinite);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") Point;
		void Point (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParamOnC1;
		Standard_Real ParamOnC1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParamOnC2;
		Standard_Real ParamOnC2 ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParamOnBis;
		Standard_Real ParamOnBis ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Distance;
		Standard_Real Distance ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") Point;
		gp_Pnt2d Point ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsInfinite;
		Standard_Boolean IsInfinite ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
};


%feature("shadow") Bisector_PointOnBis::~Bisector_PointOnBis %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bisector_PointOnBis {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bisector_PolyBis;
class Bisector_PolyBis {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Bisector_PolyBis;
		 Bisector_PolyBis ();
		%feature("autodoc", "Args:
	Point(Bisector_PointOnBis)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Bisector_PointOnBis & Point);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Bisector_PointOnBis

No detailed docstring for this function.") Value;
		const Bisector_PointOnBis & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Bisector_PointOnBis

No detailed docstring for this function.") First;
		const Bisector_PointOnBis & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Bisector_PointOnBis

No detailed docstring for this function.") Last;
		const Bisector_PointOnBis & Last ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Integer

No detailed docstring for this function.") Interval;
		Standard_Integer Interval (const Standard_Real U);
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf2d & T);
};


%feature("shadow") Bisector_PolyBis::~Bisector_PolyBis %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bisector_PolyBis {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Bisector_BisecAna;
class Bisector_BisecAna : public Bisector_Curve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Bisector_BisecAna;
		 Bisector_BisecAna ();
		%feature("autodoc", "Args:
	Cu1(Handle_Geom2d_Curve)
	Cu2(Handle_Geom2d_Curve)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	Sense(Standard_Real)
	Tolerance(Standard_Real)
	oncurve(Standard_Boolean)=Standard_True

Returns:
	None

Performs  the bisecting line  between the  curves  
           <Cu1> and <Cu2>.  
           <oncurve> is True if the point <P> is common to <Cu1>  
           and <Cu2>.") Perform;
		void Perform (const Handle_Geom2d_Curve & Cu1,const Handle_Geom2d_Curve & Cu2,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);
		%feature("autodoc", "Args:
	Cu(Handle_Geom2d_Curve)
	Pnt(Handle_Geom2d_Point)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	Sense(Standard_Real)
	Tolerance(Standard_Real)
	oncurve(Standard_Boolean)=Standard_True

Returns:
	None

Performs  the bisecting line  between the  curve  
           <Cu1> and the point <Pnt>.  
           <oncurve> is True if the point <P> is the point <Pnt>.") Perform;
		void Perform (const Handle_Geom2d_Curve & Cu,const Handle_Geom2d_Point & Pnt,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);
		%feature("autodoc", "Args:
	Pnt(Handle_Geom2d_Point)
	Cu(Handle_Geom2d_Curve)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	Sense(Standard_Real)
	Tolerance(Standard_Real)
	oncurve(Standard_Boolean)=Standard_True

Returns:
	None

Performs  the bisecting line  between the  curve  
           <Cu> and the point <Pnt>.  
           <oncurve> is True if the point <P> is the point <Pnt>.") Perform;
		void Perform (const Handle_Geom2d_Point & Pnt,const Handle_Geom2d_Curve & Cu,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);
		%feature("autodoc", "Args:
	Pnt1(Handle_Geom2d_Point)
	Pnt2(Handle_Geom2d_Point)
	P(gp_Pnt2d)
	V1(gp_Vec2d)
	V2(gp_Vec2d)
	Sense(Standard_Real)
	Tolerance(Standard_Real)=0.0
	oncurve(Standard_Boolean)=Standard_True

Returns:
	None

Performs  the bisecting line  between the two points  
           <Pnt1>  and <Pnt2>.") Perform;
		void Perform (const Handle_Geom2d_Point & Pnt1,const Handle_Geom2d_Point & Pnt2,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance = 0.0,const Standard_Boolean oncurve = Standard_True);
		%feature("autodoc", "Args:
	bisector(Handle_Geom2d_TrimmedCurve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Handle_Geom2d_TrimmedCurve & bisector);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd ();
		%feature("autodoc", "Args:
	Cu(Handle_Geom2d_Curve)

Returns:
	None

Trim <self> by a domain defined by the curve <Cu>.  
           This domain is the set of the points which are  
           nearest from <Cu> than the extremitis of <Cu>.") SetTrim;
		void SetTrim (const Handle_Geom2d_Curve & Cu);
		%feature("autodoc", "Args:
	uf(Standard_Real)
	ul(Standard_Real)

Returns:
	None

Trim <self> by a domain defined by uf  and  ul") SetTrim;
		void SetTrim (const Standard_Real uf,const Standard_Real ul);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns the order of continuity of the curve.  Raised if N < 0.") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Geometry

No detailed docstring for this function.") Copy;
		Handle_Geom2d_Geometry Copy ();
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

No detailed docstring for this function.") Transform;
		void Transform (const gp_Trsf2d & T);
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
	GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		GeomAbs_Shape Continuity ();
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
	V1(gp_Vec2d)

Returns:
	None

No detailed docstring for this function.") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1);
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
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") Geom2dCurve;
		Handle_Geom2d_Curve Geom2dCurve ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParameterOfStartPoint;
		Standard_Real ParameterOfStartPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParameterOfEndPoint;
		Standard_Real ParameterOfEndPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

If necessary,  breaks the  curve in  intervals  of  
         continuity  <C1>.    And  returns   the number   of  
         intervals.") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns  the  first  parameter    of  the  current  
         interval.") IntervalFirst;
		Standard_Real IntervalFirst (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns  the  last  parameter    of  the  current  
         interval.") IntervalLast;
		Standard_Real IntervalLast (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Deep(Standard_Integer)=0
	Offset(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump (const Standard_Integer Deep = 0,const Standard_Integer Offset = 0);
};


%feature("shadow") Bisector_BisecAna::~Bisector_BisecAna %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bisector_BisecAna {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Bisector_BisecAna {
	Handle_Bisector_BisecAna GetHandle() {
	return *(Handle_Bisector_BisecAna*) &$self;
	}
};

%nodefaultctor Handle_Bisector_BisecAna;
class Handle_Bisector_BisecAna : public Handle_Bisector_Curve {

    public:
        // constructors
        Handle_Bisector_BisecAna();
        Handle_Bisector_BisecAna(const Handle_Bisector_BisecAna &aHandle);
        Handle_Bisector_BisecAna(const Bisector_BisecAna *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Bisector_BisecAna DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Bisector_BisecAna {
    Bisector_BisecAna* GetObject() {
    return (Bisector_BisecAna*)$self->Access();
    }
};
%feature("shadow") Handle_Bisector_BisecAna::~Handle_Bisector_BisecAna %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Bisector_BisecAna {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Bisector_BisecCC;
class Bisector_BisecCC : public Bisector_Curve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Bisector_BisecCC;
		 Bisector_BisecCC ();
		%feature("autodoc", "Args:
	Cu1(Handle_Geom2d_Curve)
	Cu2(Handle_Geom2d_Curve)
	Side1(Standard_Real)
	Side2(Standard_Real)
	Origin(gp_Pnt2d)
	DistMax(Standard_Real)=500

Returns:
	None

Constructs  the bisector  between the  curves <Cu1>  
         and <Cu2>.  
 
         <Side1>  (resp <Side2>) = 1   if the  
         bisector curve is on the left of <Cu1> (resp <Cu2>)  
         else <Side1> (resp <Side2>) = -1.  
 
         the Bisector is trimmed by the Point <Origin>.  
         <DistMax> is used to trim the bisector.The distance  
         between the points of the bisector and <Cu> is smaller  
         than <DistMax>.") Bisector_BisecCC;
		 Bisector_BisecCC (const Handle_Geom2d_Curve & Cu1,const Handle_Geom2d_Curve & Cu2,const Standard_Real Side1,const Standard_Real Side2,const gp_Pnt2d & Origin,const Standard_Real DistMax = 500);
		%feature("autodoc", "Args:
	Cu1(Handle_Geom2d_Curve)
	Cu2(Handle_Geom2d_Curve)
	Side1(Standard_Real)
	Side2(Standard_Real)
	Origin(gp_Pnt2d)
	DistMax(Standard_Real)=500

Returns:
	None

Computes the bisector  between the  curves <Cu1>  
         and <Cu2>.  
 
         <Side1>  (resp <Side2>) = 1   if the  
         bisector curve is on the left of <Cu1> (resp <Cu2>)  
         else <Side1> (resp <Side2>) = -1.  
 
         the Bisector is trimmed by the Point <Origin>.  
 
         <DistMax> is used to trim the bisector.The distance  
         between the points of the bisector and <Cu> is smaller  
         than <DistMax>.") Perform;
		void Perform (const Handle_Geom2d_Curve & Cu1,const Handle_Geom2d_Curve & Cu2,const Standard_Real Side1,const Standard_Real Side2,const gp_Pnt2d & Origin,const Standard_Real DistMax = 500);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns the order of continuity of the curve.  Raised if N < 0.") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Bisector_BisecCC

The parameter  on <self> is linked to  the parameter  
         on the first curve. This method creates the same bisector  
         where the curves are inversed.") ChangeGuide;
		Handle_Bisector_BisecCC ChangeGuide ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Geometry

No detailed docstring for this function.") Copy;
		Handle_Geom2d_Geometry Copy ();
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

Transformation of a geometric object. This tansformation  
 can be a translation, a rotation, a symmetry, a scaling  
 or a complex transformation obtained by combination of  
 the previous elementaries transformations.") Transform;
		void Transform (const gp_Trsf2d & T);
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
	None
Returns:
	Standard_Integer

If necessary,  breaks the  curve in  intervals  of  
         continuity  <C1>.    And  returns   the number   of  
         intervals.") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns  the  first  parameter    of  the  current  
         interval.") IntervalFirst;
		Standard_Real IntervalFirst (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns  the  last  parameter    of  the  current  
         interval.") IntervalLast;
		Standard_Real IntervalLast (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") IntervalContinuity;
		GeomAbs_Shape IntervalContinuity ();
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
	U(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Distance(Standard_Real)

Returns:
	gp_Pnt2d

Returns the point of parameter U.  
         Computes the distance between the current point and  
         the two curves I separate.  
         Computes the parameters on each curve corresponding  
         of the projection of the current point.") ValueAndDist;
		gp_Pnt2d ValueAndDist (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Distance(Standard_Real)

Returns:
	gp_Pnt2d

Returns the point of parameter U.  
         Computes the distance between the current point and  
         the two curves I separate.  
         Computes the parameters on each curve corresponding  
         of the projection of the current point.") ValueByInt;
		gp_Pnt2d ValueByInt (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
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
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Returns the parameter on the curve1 of the projection  
         of the point of parameter U on <self>.") LinkBisCurve;
		Standard_Real LinkBisCurve (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Returns the reciproque of LinkBisCurve.") LinkCurveBis;
		Standard_Real LinkCurveBis (const Standard_Real U);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	IndCurve(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") Curve;
		Handle_Geom2d_Curve Curve (const Standard_Integer IndCurve);
		%feature("autodoc", "Args:
	None
Returns:
	Bisector_PolyBis

No detailed docstring for this function.") Polygon;
		const Bisector_PolyBis & Polygon ();
		%feature("autodoc", "Args:
	Deep(Standard_Integer)=0
	Offset(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump (const Standard_Integer Deep = 0,const Standard_Integer Offset = 0);
};


%feature("shadow") Bisector_BisecCC::~Bisector_BisecCC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bisector_BisecCC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Bisector_BisecCC {
	Handle_Bisector_BisecCC GetHandle() {
	return *(Handle_Bisector_BisecCC*) &$self;
	}
};

%nodefaultctor Handle_Bisector_BisecCC;
class Handle_Bisector_BisecCC : public Handle_Bisector_Curve {

    public:
        // constructors
        Handle_Bisector_BisecCC();
        Handle_Bisector_BisecCC(const Handle_Bisector_BisecCC &aHandle);
        Handle_Bisector_BisecCC(const Bisector_BisecCC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Bisector_BisecCC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Bisector_BisecCC {
    Bisector_BisecCC* GetObject() {
    return (Bisector_BisecCC*)$self->Access();
    }
};
%feature("shadow") Handle_Bisector_BisecCC::~Handle_Bisector_BisecCC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Bisector_BisecCC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Bisector_BisecPC;
class Bisector_BisecPC : public Bisector_Curve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Bisector_BisecPC;
		 Bisector_BisecPC ();
		%feature("autodoc", "Args:
	Cu(Handle_Geom2d_Curve)
	P(gp_Pnt2d)
	Side(Standard_Real)
	DistMax(Standard_Real)=500

Returns:
	None

Constructs the bisector between the point <P> and  
         the curve <Cu>.  
         <Side> = 1. if the bisector curve is on the Left of <Cu>  
         else <Side> = -1.  
         <DistMax> is used to trim the bisector.The distance  
         between the points of the bisector and <Cu> is smaller  
         than <DistMax>.") Bisector_BisecPC;
		 Bisector_BisecPC (const Handle_Geom2d_Curve & Cu,const gp_Pnt2d & P,const Standard_Real Side,const Standard_Real DistMax = 500);
		%feature("autodoc", "Args:
	Cu(Handle_Geom2d_Curve)
	P(gp_Pnt2d)
	Side(Standard_Real)
	UMin(Standard_Real)
	UMax(Standard_Real)

Returns:
	None

Constructs the bisector between the point <P> and  
         the curve <Cu> Trimmed by <UMin> and <UMax>  
         <Side> = 1. if the bisector curve is on the Left of <Cu>  
         else <Side> = -1.  
 Warning: the bisector is supposed all over defined between  
         <UMin> and <UMax>.") Bisector_BisecPC;
		 Bisector_BisecPC (const Handle_Geom2d_Curve & Cu,const gp_Pnt2d & P,const Standard_Real Side,const Standard_Real UMin,const Standard_Real UMax);
		%feature("autodoc", "Args:
	Cu(Handle_Geom2d_Curve)
	P(gp_Pnt2d)
	Side(Standard_Real)
	DistMax(Standard_Real)=500

Returns:
	None

Construct the bisector between the point <P> and  
         the curve <Cu>.  
         <Side> = 1. if the bisector curve is on the Left of <Cu>  
         else <Side> = -1.  
         <DistMax> is used to trim the bisector.The distance  
         between the points of the bisector and <Cu> is smaller  
         than <DistMax>.") Perform;
		void Perform (const Handle_Geom2d_Curve & Cu,const gp_Pnt2d & P,const Standard_Real Side,const Standard_Real DistMax = 500);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the bisector is extended at start.") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the bisector is extended at end.") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Changes the direction of parametrization of <self>.  
 The orientation  of the curve is modified. If the curve  
 is bounded the StartPoint of the initial curve becomes the  
 EndPoint of the reversed curve  and the EndPoint of the initial  
 curve becomes the StartPoint of the reversed curve.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Returns the  parameter on the  reversed  curve for  
         the point of parameter U on <self>.") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Geometry

No detailed docstring for this function.") Copy;
		Handle_Geom2d_Geometry Copy ();
		%feature("autodoc", "Args:
	T(gp_Trsf2d)

Returns:
	None

Transformation of a geometric object. This tansformation  
 can be a translation, a rotation, a symmetry, a scaling  
 or a complex transformation obtained by combination of  
 the previous elementaries transformations.") Transform;
		void Transform (const gp_Trsf2d & T);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Boolean

Returns the order of continuity of the curve.  Raised if N < 0.") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Value of the first parameter.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Value of the last parameter.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

If necessary,  breaks the  curve in  intervals  of  
         continuity  <C1>.    And  returns   the number   of  
         intervals.") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns  the  first  parameter    of  the  current  
         interval.") IntervalFirst;
		Standard_Real IntervalFirst (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns  the  last  parameter    of  the  current  
         interval.") IntervalLast;
		Standard_Real IntervalLast (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") IntervalContinuity;
		GeomAbs_Shape IntervalContinuity ();
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
	U(Standard_Real)

Returns:
	Standard_Real

Returns   the   distance   between  the  point  of  
         parameter U on <self> and my point or my curve.") Distance;
		Standard_Real Distance (const Standard_Real U);
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
	Deep(Standard_Integer)=0
	Offset(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump (const Standard_Integer Deep = 0,const Standard_Integer Offset = 0);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Returns the parameter on the curve1 of the projection  
         of the point of parameter U on <self>.") LinkBisCurve;
		Standard_Real LinkBisCurve (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	Standard_Real

Returns the reciproque of LinkBisCurve.") LinkCurveBis;
		Standard_Real LinkCurveBis (const Standard_Real U);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)

Returns:
	Standard_Real

Returns the parameter on <self> corresponding to <P>.") Parameter;
		Standard_Real Parameter (const gp_Pnt2d & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns <True> if the bisector is empty.") IsEmpty;
		Standard_Boolean IsEmpty ();
};


%feature("shadow") Bisector_BisecPC::~Bisector_BisecPC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Bisector_BisecPC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Bisector_BisecPC {
	Handle_Bisector_BisecPC GetHandle() {
	return *(Handle_Bisector_BisecPC*) &$self;
	}
};

%nodefaultctor Handle_Bisector_BisecPC;
class Handle_Bisector_BisecPC : public Handle_Bisector_Curve {

    public:
        // constructors
        Handle_Bisector_BisecPC();
        Handle_Bisector_BisecPC(const Handle_Bisector_BisecPC &aHandle);
        Handle_Bisector_BisecPC(const Bisector_BisecPC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Bisector_BisecPC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Bisector_BisecPC {
    Bisector_BisecPC* GetObject() {
    return (Bisector_BisecPC*)$self->Access();
    }
};
%feature("shadow") Handle_Bisector_BisecPC::~Handle_Bisector_BisecPC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Bisector_BisecPC {
    void _kill_pointed() {
        delete $self;
    }
};

