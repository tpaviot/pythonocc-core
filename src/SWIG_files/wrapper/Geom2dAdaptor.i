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
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include Geom2dAdaptor_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(geom2dadaptor) Geom2dAdaptor;
class Geom2dAdaptor {
	public:
		%feature("autodoc", "	* Inherited from GHCurve. Provides a curve handled by reference. Creates a 2d curve from a HCurve2d. This cannot process the OtherCurves.

	:param HC:
	:type HC: Adaptor2d_Curve2d &
	:rtype: Handle_Geom2d_Curve
") MakeCurve;
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
		%feature("autodoc", "	:rtype: None
") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve ();
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: None
") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "	* ConstructionError is raised if Ufirst>Ulast

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None
") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve (const Handle_Geom2d_Curve & C,const Standard_Real UFirst,const Standard_Real ULast);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: None
") Load;
		void Load (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "	* ConstructionError is raised if Ufirst>Ulast

	:param C:
	:type C: Handle_Geom2d_Curve &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None
") Load;
		void Load (const Handle_Geom2d_Curve & C,const Standard_Real UFirst,const Standard_Real ULast);
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") Curve;
		const Handle_Geom2d_Curve & Curve ();
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
		%feature("autodoc", "	* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor2d_HCurve2d
") Trim;
		Handle_Adaptor2d_HCurve2d Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("autodoc", "	* Computes the point of parameter U on the curve

	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		gp_Pnt2d Value (const Standard_Real U);
		%feature("autodoc", "	* Computes the point of parameter U.

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
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

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
		%feature("autodoc", "	* returns the parametric resolution

	:param Ruv:
	:type Ruv: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real Ruv);
		%feature("autodoc", "	:rtype: GeomAbs_CurveType
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
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "	:rtype: int
") NbSamples;
		virtual Standard_Integer NbSamples ();
		%feature("autodoc", "	:rtype: Handle_Geom2d_BezierCurve
") Bezier;
		Handle_Geom2d_BezierCurve Bezier ();
		%feature("autodoc", "	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
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
		%feature("autodoc", "	:rtype: None
") Geom2dAdaptor_GHCurve;
		 Geom2dAdaptor_GHCurve ();
		%feature("autodoc", "	:param C:
	:type C: Geom2dAdaptor_Curve &
	:rtype: None
") Geom2dAdaptor_GHCurve;
		 Geom2dAdaptor_GHCurve (const Geom2dAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: Geom2dAdaptor_Curve &
	:rtype: None
") Set;
		void Set (const Geom2dAdaptor_Curve & C);
		%feature("autodoc", "	:rtype: Adaptor2d_Curve2d
") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();
		%feature("autodoc", "	:rtype: Geom2dAdaptor_Curve
") ChangeCurve2d;
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
		%feature("autodoc", "	:rtype: None
") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve ();
		%feature("autodoc", "	:param AS:
	:type AS: Geom2dAdaptor_Curve &
	:rtype: None
") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve (const Geom2dAdaptor_Curve & AS);
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom2d_Curve &
	:rtype: None
") Geom2dAdaptor_HCurve;
		 Geom2dAdaptor_HCurve (const Handle_Geom2d_Curve & S);
		%feature("autodoc", "	* ConstructionError is raised if UFirst>ULast or VFirst>VLast

	:param S:
	:type S: Handle_Geom2d_Curve &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None
") Geom2dAdaptor_HCurve;
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

