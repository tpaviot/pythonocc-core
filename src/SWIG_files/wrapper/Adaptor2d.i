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
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		virtual Standard_Real FirstParameter ();
		%feature("autodoc", "	:rtype: float
") LastParameter;
		virtual Standard_Real LastParameter ();
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity ();
		%feature("autodoc", "	* If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>.  The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor2d_HCurve2d
") Trim;
		virtual Handle_Adaptor2d_HCurve2d Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		virtual Standard_Boolean IsClosed ();
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic ();
		%feature("autodoc", "	:rtype: float
") Period;
		virtual Standard_Real Period ();
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		virtual gp_Pnt2d Value (const Standard_Real U);
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: void
") D0;
		virtual void D0 (const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: void
") D1;
		virtual void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

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
		virtual void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
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
	:rtype: void
") D3;
		virtual void D3 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec2d
") DN;
		virtual gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	* Returns the parametric resolution corresponding  to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		virtual Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:rtype: GeomAbs_CurveType
") GetType;
		virtual GeomAbs_CurveType GetType ();
		%feature("autodoc", "	:rtype: gp_Lin2d
") Line;
		virtual gp_Lin2d Line ();
		%feature("autodoc", "	:rtype: gp_Circ2d
") Circle;
		virtual gp_Circ2d Circle ();
		%feature("autodoc", "	:rtype: gp_Elips2d
") Ellipse;
		virtual gp_Elips2d Ellipse ();
		%feature("autodoc", "	:rtype: gp_Hypr2d
") Hyperbola;
		virtual gp_Hypr2d Hyperbola ();
		%feature("autodoc", "	:rtype: gp_Parab2d
") Parabola;
		virtual gp_Parab2d Parabola ();
		%feature("autodoc", "	:rtype: int
") Degree;
		virtual Standard_Integer Degree ();
		%feature("autodoc", "	:rtype: bool
") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("autodoc", "	:rtype: int
") NbPoles;
		virtual Standard_Integer NbPoles ();
		%feature("autodoc", "	:rtype: int
") NbKnots;
		virtual Standard_Integer NbKnots ();
		%feature("autodoc", "	:rtype: int
") NbSamples;
		virtual Standard_Integer NbSamples ();
		%feature("autodoc", "	:rtype: Handle_Geom2d_BezierCurve
") Bezier;
		virtual Handle_Geom2d_BezierCurve Bezier ();
		%feature("autodoc", "	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
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
		%feature("autodoc", "	* Returns a reference to the Curve2d inside the HCurve2d.

	:rtype: Adaptor2d_Curve2d
") Curve2d;
		virtual const Adaptor2d_Curve2d & Curve2d ();
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	* If <First> >= <Last>

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
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		gp_Pnt2d Value (const Standard_Real U);
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "	:param U:
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
		%feature("autodoc", "	:param U:
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
		%feature("autodoc", "	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
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
		%feature("autodoc", "	:rtype: Handle_Geom2d_BezierCurve
") Bezier;
		Handle_Geom2d_BezierCurve Bezier ();
		%feature("autodoc", "	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
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
		%feature("autodoc", "	:rtype: None
") Adaptor2d_HLine2d;
		 Adaptor2d_HLine2d ();
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Line2d &
	:rtype: None
") Adaptor2d_HLine2d;
		 Adaptor2d_HLine2d (const Adaptor2d_Line2d & C);
		%feature("autodoc", "	:param C:
	:type C: Adaptor2d_Line2d &
	:rtype: None
") Set;
		void Set (const Adaptor2d_Line2d & C);
		%feature("autodoc", "	:rtype: Adaptor2d_Curve2d
") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();
		%feature("autodoc", "	:rtype: Adaptor2d_Line2d
") ChangeCurve2d;
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
		%feature("autodoc", "	:rtype: None
") Adaptor2d_Line2d;
		 Adaptor2d_Line2d ();
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param D:
	:type D: gp_Dir2d
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None
") Adaptor2d_Line2d;
		 Adaptor2d_Line2d (const gp_Pnt2d & P,const gp_Dir2d & D,const Standard_Real UFirst,const Standard_Real ULast);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:rtype: None
") Load;
		void Load (const gp_Lin2d & L);
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None
") Load;
		void Load (const gp_Lin2d & L,const Standard_Real UFirst,const Standard_Real ULast);
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
		%feature("autodoc", "	:param X:
	:type X: float
	:rtype: gp_Pnt2d
") Value;
		gp_Pnt2d Value (const Standard_Real X);
		%feature("autodoc", "	:param X:
	:type X: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0 (const Standard_Real X,gp_Pnt2d & P);
		%feature("autodoc", "	:param X:
	:type X: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None
") D1;
		void D1 (const Standard_Real X,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("autodoc", "	:param X:
	:type X: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2 (const Standard_Real X,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("autodoc", "	:param X:
	:type X: float
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
		void D3 (const Standard_Real X,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("autodoc", "	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
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
		%feature("autodoc", "	:rtype: Handle_Geom2d_BezierCurve
") Bezier;
		Handle_Geom2d_BezierCurve Bezier ();
		%feature("autodoc", "	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
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
