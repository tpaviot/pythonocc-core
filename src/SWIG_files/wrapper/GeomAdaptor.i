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
%module (package="OCC") GeomAdaptor

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

%include GeomAdaptor_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(geomadaptor) GeomAdaptor;
%nodefaultctor GeomAdaptor;
class GeomAdaptor {
	public:
		%feature("autodoc", "	* Inherited from GHCurve. Provides a curve handled by reference. Build a Geom_Curve using the informations from the Curve from Adaptor3d

	:param C:
	:type C: Adaptor3d_Curve &
	:rtype: Handle_Geom_Curve
") MakeCurve;
		static Handle_Geom_Curve MakeCurve (const Adaptor3d_Curve & C);
		%feature("autodoc", "	* Build a Geom_Surface using the informations from the Surface from Adaptor3d

	:param S:
	:type S: Adaptor3d_Surface &
	:rtype: Handle_Geom_Surface
") MakeSurface;
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
		%feature("autodoc", "	:rtype: None
") GeomAdaptor_Curve;
		 GeomAdaptor_Curve ();
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: None
") GeomAdaptor_Curve;
		 GeomAdaptor_Curve (const Handle_Geom_Curve & C);
		%feature("autodoc", "	* ConstructionError is raised if Ufirst>Ulast

	:param C:
	:type C: Handle_Geom_Curve &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None
") GeomAdaptor_Curve;
		 GeomAdaptor_Curve (const Handle_Geom_Curve & C,const Standard_Real UFirst,const Standard_Real ULast);
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: None
") Load;
		void Load (const Handle_Geom_Curve & C);
		%feature("autodoc", "	* ConstructionError is raised if Ufirst>Ulast

	:param C:
	:type C: Handle_Geom_Curve &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None
") Load;
		void Load (const Handle_Geom_Curve & C,const Standard_Real UFirst,const Standard_Real ULast);
		%feature("autodoc", "	* Provides a curve inherited from Hcurve from Adaptor. This is inherited to provide easy to use constructors.

	:rtype: Handle_Geom_Curve
") Curve;
		const Handle_Geom_Curve & Curve ();
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

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
	:rtype: Handle_Adaptor3d_HCurve
") Trim;
		Handle_Adaptor3d_HCurve Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
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
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("autodoc", "	* Computes the point of parameter U.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Warning : On the specific case of BSplineCurve: if the curve is cut in interval of continuity at least C1, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Warning : On the specific case of BSplineCurve: if the curve is cut in interval of continuity at least C2, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Warning : On the specific case of BSplineCurve: if the curve is cut in interval of continuity at least C3, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve.

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
	:rtype: None
") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Warning : On the specific case of BSplineCurve: if the curve is cut in interval of continuity CN, the derivatives are computed on the current interval. else the derivatives are computed on the basis curve. Raised if N < 1.

	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	* returns the parametric resolution

	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "	:rtype: gp_Elips
") Ellipse;
		gp_Elips Ellipse ();
		%feature("autodoc", "	:rtype: gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("autodoc", "	:rtype: gp_Parab
") Parabola;
		gp_Parab Parabola ();
		%feature("autodoc", "	* this should NEVER make a copy of the underlying curve to read the relevant information

	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "	* this should NEVER make a copy of the underlying curve to read the relevant information

	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "	* this should NEVER make a copy of the underlying curve to read the relevant information

	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "	* this should NEVER make a copy of the underlying curve to read the relevant information

	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "	* this will NOT make a copy of the  Bezier Curve : If you want to modify  the Curve please make a copy yourself  Also it will NOT trim the surface to  myFirst/Last.

	:rtype: Handle_Geom_BezierCurve
") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("autodoc", "	* this will NOT make a copy of the  BSpline Curve : If you want to modify  the Curve please make a copy yourself  Also it will NOT trim the surface to  myFirst/Last.

	:rtype: Handle_Geom_BSplineCurve
") BSpline;
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
		%feature("autodoc", "	:rtype: None
") GeomAdaptor_GHCurve;
		 GeomAdaptor_GHCurve ();
		%feature("autodoc", "	:param C:
	:type C: GeomAdaptor_Curve &
	:rtype: None
") GeomAdaptor_GHCurve;
		 GeomAdaptor_GHCurve (const GeomAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: GeomAdaptor_Curve &
	:rtype: None
") Set;
		void Set (const GeomAdaptor_Curve & C);
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve ();
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve ();
		%feature("autodoc", "	:rtype: GeomAdaptor_Curve
") ChangeCurve;
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
		%feature("autodoc", "	:rtype: None
") GeomAdaptor_GHSurface;
		 GeomAdaptor_GHSurface ();
		%feature("autodoc", "	:param S:
	:type S: GeomAdaptor_Surface &
	:rtype: None
") GeomAdaptor_GHSurface;
		 GeomAdaptor_GHSurface (const GeomAdaptor_Surface & S);
		%feature("autodoc", "	:param S:
	:type S: GeomAdaptor_Surface &
	:rtype: None
") Set;
		void Set (const GeomAdaptor_Surface & S);
		%feature("autodoc", "	:rtype: Adaptor3d_Surface
") Surface;
		const Adaptor3d_Surface & Surface ();
		%feature("autodoc", "	:rtype: GeomAdaptor_Surface
") ChangeSurface;
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
		%feature("autodoc", "	:rtype: None
") GeomAdaptor_Surface;
		 GeomAdaptor_Surface ();
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") GeomAdaptor_Surface;
		 GeomAdaptor_Surface (const Handle_Geom_Surface & S);
		%feature("autodoc", "	* ConstructionError is raised if UFirst>ULast or VFirst>VLast

	:param S:
	:type S: Handle_Geom_Surface &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param VFirst:
	:type VFirst: float
	:param VLast:
	:type VLast: float
	:param TolU: default value is 0.0
	:type TolU: float
	:param TolV: default value is 0.0
	:type TolV: float
	:rtype: None
") GeomAdaptor_Surface;
		 GeomAdaptor_Surface (const Handle_Geom_Surface & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast,const Standard_Real TolU = 0.0,const Standard_Real TolV = 0.0);
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") Load;
		void Load (const Handle_Geom_Surface & S);
		%feature("autodoc", "	* ConstructionError is raised if UFirst>ULast or VFirst>VLast

	:param S:
	:type S: Handle_Geom_Surface &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param VFirst:
	:type VFirst: float
	:param VLast:
	:type VLast: float
	:param TolU: default value is 0.0
	:type TolU: float
	:param TolV: default value is 0.0
	:type TolV: float
	:rtype: None
") Load;
		void Load (const Handle_Geom_Surface & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast,const Standard_Real TolU = 0.0,const Standard_Real TolV = 0.0);
		%feature("autodoc", "	:rtype: Handle_Geom_Surface
") Surface;
		const Handle_Geom_Surface & Surface ();
		%feature("autodoc", "	:rtype: float
") FirstUParameter;
		Standard_Real FirstUParameter ();
		%feature("autodoc", "	:rtype: float
") LastUParameter;
		Standard_Real LastUParameter ();
		%feature("autodoc", "	:rtype: float
") FirstVParameter;
		Standard_Real FirstVParameter ();
		%feature("autodoc", "	:rtype: float
") LastVParameter;
		Standard_Real LastVParameter ();
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") UContinuity;
		GeomAbs_Shape UContinuity ();
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") VContinuity;
		GeomAbs_Shape VContinuity ();
		%feature("autodoc", "	* Returns the number of U intervals for continuity <S>. May be one if UContinuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbUIntervals;
		Standard_Integer NbUIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	* Returns the number of V intervals for continuity <S>. May be one if VContinuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbVIntervals;
		Standard_Integer NbVIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	* Returns the intervals with the requested continuity in the U direction.

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") UIntervals;
		void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	* Returns the intervals with the requested continuity in the V direction.

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") VIntervals;
		void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	* Returns a surface trimmed in the U direction equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HSurface
") UTrim;
		Handle_Adaptor3d_HSurface UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "	* Returns a surface trimmed in the V direction between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HSurface
") VTrim;
		Handle_Adaptor3d_HSurface VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "	:rtype: bool
") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "	:rtype: bool
") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "	:rtype: bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "	:rtype: float
") UPeriod;
		Standard_Real UPeriod ();
		%feature("autodoc", "	:rtype: bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "	:rtype: float
") VPeriod;
		Standard_Real VPeriod ();
		%feature("autodoc", "	* Computes the point of parameters U,V on the surface.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "	* Computes the point of parameters U,V on the surface.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "	* Computes the point and the first derivatives on the surface. Warning : On the specific case of BSplineSurface: if the surface is cut in interval of continuity at least C1, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface.

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
	:rtype: None
") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "	* Computes the point, the first and second derivatives on the surface. Warning : On the specific case of BSplineSurface: if the surface is cut in interval of continuity at least C2, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface.

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
	:param D2UV:
	:type D2UV: gp_Vec
	:rtype: None
") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "	* Computes the point, the first, second and third derivatives on the surface. Warning : On the specific case of BSplineSurface: if the surface is cut in interval of continuity at least C3, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface.

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
	:rtype: None
") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "	* Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). Warning : On the specific case of BSplineSurface: if the surface is cut in interval of continuity CN, the derivatives are computed on the current interval. else the derivatives are computed on the basis surface. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.

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
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "	* Returns the parametric U resolution corresponding  to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") UResolution;
		Standard_Real UResolution (const Standard_Real R3d);
		%feature("autodoc", "	* Returns the parametric V resolution corresponding  to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") VResolution;
		Standard_Real VResolution (const Standard_Real R3d);
		%feature("autodoc", "	* Returns the type of the surface : Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface

	:rtype: GeomAbs_SurfaceType
") GetType;
		GeomAbs_SurfaceType GetType ();
		%feature("autodoc", "	:rtype: gp_Pln
") Plane;
		gp_Pln Plane ();
		%feature("autodoc", "	:rtype: gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder ();
		%feature("autodoc", "	:rtype: gp_Cone
") Cone;
		gp_Cone Cone ();
		%feature("autodoc", "	:rtype: gp_Sphere
") Sphere;
		gp_Sphere Sphere ();
		%feature("autodoc", "	:rtype: gp_Torus
") Torus;
		gp_Torus Torus ();
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "	:rtype: int
") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "	:rtype: int
") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("autodoc", "	:rtype: int
") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("autodoc", "	:rtype: int
") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("autodoc", "	:rtype: bool
") IsURational;
		Standard_Boolean IsURational ();
		%feature("autodoc", "	:rtype: bool
") IsVRational;
		Standard_Boolean IsVRational ();
		%feature("autodoc", "	* This will NOT make a copy of the Bezier Surface : If you want to modify the Surface please make a copy yourself Also it will NOT trim the surface to myU/VFirst/Last.

	:rtype: Handle_Geom_BezierSurface
") Bezier;
		Handle_Geom_BezierSurface Bezier ();
		%feature("autodoc", "	* This will NOT make a copy of the BSpline Surface : If you want to modify the Surface please make a copy yourself Also it will NOT trim the surface to myU/VFirst/Last.

	:rtype: Handle_Geom_BSplineSurface
") BSpline;
		Handle_Geom_BSplineSurface BSpline ();
		%feature("autodoc", "	:rtype: gp_Ax1
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution ();
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		gp_Dir Direction ();
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HCurve
") BasisCurve;
		Handle_Adaptor3d_HCurve BasisCurve ();
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") BasisSurface;
		Handle_Adaptor3d_HSurface BasisSurface ();
		%feature("autodoc", "	:rtype: float
") OffsetValue;
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
		%feature("autodoc", "	:rtype: None
") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve ();
		%feature("autodoc", "	:param AS:
	:type AS: GeomAdaptor_Curve &
	:rtype: None
") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve (const GeomAdaptor_Curve & AS);
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Curve &
	:rtype: None
") GeomAdaptor_HCurve;
		 GeomAdaptor_HCurve (const Handle_Geom_Curve & S);
		%feature("autodoc", "	* ConstructionError is raised if UFirst>ULast or VFirst>VLast

	:param S:
	:type S: Handle_Geom_Curve &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:rtype: None
") GeomAdaptor_HCurve;
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
		%feature("autodoc", "	:rtype: None
") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface ();
		%feature("autodoc", "	:param AS:
	:type AS: GeomAdaptor_Surface &
	:rtype: None
") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface (const GeomAdaptor_Surface & AS);
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: None
") GeomAdaptor_HSurface;
		 GeomAdaptor_HSurface (const Handle_Geom_Surface & S);
		%feature("autodoc", "	* ConstructionError is raised if UFirst>ULast or VFirst>VLast

	:param S:
	:type S: Handle_Geom_Surface &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param VFirst:
	:type VFirst: float
	:param VLast:
	:type VLast: float
	:param TolU: default value is 0.0
	:type TolU: float
	:param TolV: default value is 0.0
	:type TolV: float
	:rtype: None
") GeomAdaptor_HSurface;
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

