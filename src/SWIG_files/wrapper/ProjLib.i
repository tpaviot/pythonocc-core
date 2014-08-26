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
%module ProjLib

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

%include ProjLib_required_python_modules.i
%include ProjLib_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(projlib) ProjLib;
%nodefaultctor ProjLib;
class ProjLib {
	public:
		%feature("autodoc", "Args:
	Pl(gp_Pln)
	P(gp_Pnt)

Returns:
	static gp_Pnt2d

Projection on a torus.") Project;
		static gp_Pnt2d Project (const gp_Pln & Pl,const gp_Pnt & P);
		%feature("autodoc", "Args:
	Pl(gp_Pln)
	L(gp_Lin)

Returns:
	static gp_Lin2d

No detailed docstring for this function.") Project;
		static gp_Lin2d Project (const gp_Pln & Pl,const gp_Lin & L);
		%feature("autodoc", "Args:
	Pl(gp_Pln)
	C(gp_Circ)

Returns:
	static gp_Circ2d

No detailed docstring for this function.") Project;
		static gp_Circ2d Project (const gp_Pln & Pl,const gp_Circ & C);
		%feature("autodoc", "Args:
	Pl(gp_Pln)
	E(gp_Elips)

Returns:
	static gp_Elips2d

No detailed docstring for this function.") Project;
		static gp_Elips2d Project (const gp_Pln & Pl,const gp_Elips & E);
		%feature("autodoc", "Args:
	Pl(gp_Pln)
	P(gp_Parab)

Returns:
	static gp_Parab2d

No detailed docstring for this function.") Project;
		static gp_Parab2d Project (const gp_Pln & Pl,const gp_Parab & P);
		%feature("autodoc", "Args:
	Pl(gp_Pln)
	H(gp_Hypr)

Returns:
	static gp_Hypr2d

No detailed docstring for this function.") Project;
		static gp_Hypr2d Project (const gp_Pln & Pl,const gp_Hypr & H);
		%feature("autodoc", "Args:
	Cy(gp_Cylinder)
	P(gp_Pnt)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") Project;
		static gp_Pnt2d Project (const gp_Cylinder & Cy,const gp_Pnt & P);
		%feature("autodoc", "Args:
	Cy(gp_Cylinder)
	L(gp_Lin)

Returns:
	static gp_Lin2d

No detailed docstring for this function.") Project;
		static gp_Lin2d Project (const gp_Cylinder & Cy,const gp_Lin & L);
		%feature("autodoc", "Args:
	Cy(gp_Cylinder)
	Ci(gp_Circ)

Returns:
	static gp_Lin2d

No detailed docstring for this function.") Project;
		static gp_Lin2d Project (const gp_Cylinder & Cy,const gp_Circ & Ci);
		%feature("autodoc", "Args:
	Co(gp_Cone)
	P(gp_Pnt)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") Project;
		static gp_Pnt2d Project (const gp_Cone & Co,const gp_Pnt & P);
		%feature("autodoc", "Args:
	Co(gp_Cone)
	L(gp_Lin)

Returns:
	static gp_Lin2d

No detailed docstring for this function.") Project;
		static gp_Lin2d Project (const gp_Cone & Co,const gp_Lin & L);
		%feature("autodoc", "Args:
	Co(gp_Cone)
	Ci(gp_Circ)

Returns:
	static gp_Lin2d

No detailed docstring for this function.") Project;
		static gp_Lin2d Project (const gp_Cone & Co,const gp_Circ & Ci);
		%feature("autodoc", "Args:
	Sp(gp_Sphere)
	P(gp_Pnt)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") Project;
		static gp_Pnt2d Project (const gp_Sphere & Sp,const gp_Pnt & P);
		%feature("autodoc", "Args:
	Sp(gp_Sphere)
	Ci(gp_Circ)

Returns:
	static gp_Lin2d

No detailed docstring for this function.") Project;
		static gp_Lin2d Project (const gp_Sphere & Sp,const gp_Circ & Ci);
		%feature("autodoc", "Args:
	To(gp_Torus)
	P(gp_Pnt)

Returns:
	static gp_Pnt2d

No detailed docstring for this function.") Project;
		static gp_Pnt2d Project (const gp_Torus & To,const gp_Pnt & P);
		%feature("autodoc", "Args:
	To(gp_Torus)
	Ci(gp_Circ)

Returns:
	static gp_Lin2d

No detailed docstring for this function.") Project;
		static gp_Lin2d Project (const gp_Torus & To,const gp_Circ & Ci);
};


%feature("shadow") ProjLib::~ProjLib %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ProjLib_CompProjectedCurve;
class ProjLib_CompProjectedCurve : public Adaptor2d_Curve2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve ();
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	C(Handle_Adaptor3d_HCurve)
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

try to find all solutions") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Standard_Real TolU,const Standard_Real TolV);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	C(Handle_Adaptor3d_HCurve)
	TolU(Standard_Real)
	TolV(Standard_Real)
	MaxDist(Standard_Real)

Returns:
	None

this constructor tries to optimize the search using the  
assamption that maximum distance between surface and curve less or  
equal then MaxDist.  
if MaxDist < 0 then algorithm works as above.") ProjLib_CompProjectedCurve;
		 ProjLib_CompProjectedCurve (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Standard_Real TolU,const Standard_Real TolV,const Standard_Real MaxDist);
		%feature("autodoc", "Args:
	None
Returns:
	None

computes a set of projected point and determine the  
continuous parts of the projected  curves. The  points  
corresponding to a projection on the bounds of the surface are  
included  in this set of points.") Init;
		void Init ();
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	None

Changes the surface.") Load;
		void Load (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	None

Changes the  curve.") Load;
		void Load (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") GetSurface;
		const Handle_Adaptor3d_HSurface & GetSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HCurve

No detailed docstring for this function.") GetCurve;
		const Handle_Adaptor3d_HCurve & GetCurve ();
		%feature("autodoc", "Args:
	TolU(Standard_Real)
	TolV(Standard_Real)

Returns:
	None

No detailed docstring for this function.") GetTolerance;
		void GetTolerance (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of continuous part of the projected curve") NbCurves;
		Standard_Integer NbCurves ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Udeb(Standard_Real)
	Ufin(Standard_Real)

Returns:
	None

returns the bounds of the continuous part corresponding to Index") Bounds;
		void Bounds (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	P(gp_Pnt2d)

Returns:
	Standard_Boolean

returns  True  if  part  of  projection with  number  Index is  a  single  point  and  writes  its  coordinats in  P") IsSinglePnt;
		Standard_Boolean IsSinglePnt (const Standard_Integer Index,gp_Pnt2d & P);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	U(Standard_Real)

Returns:
	Standard_Boolean

returns  True  if  part  of  projection with  number  Index is  an  u-isoparametric curve  of  input  surface") IsUIso;
		Standard_Boolean IsUIso (const Standard_Integer Index,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	V(Standard_Real)

Returns:
	Standard_Boolean

returns  True  if  part  of  projection with  number  Index is  an  v-isoparametric curve  of  input  surface") IsVIso;
		Standard_Boolean IsVIso (const Standard_Integer Index,Standard_Real &OutValue);
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
	N(Standard_Integer)

Returns:
	gp_Vec2d

The returned vector gives the value of the derivative for the  
 order of derivation N.  Raised if N < 1.  Raised if N > 2.") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns  the  first  parameter of  the  curve  C  
 which  has  a  projection  on  S.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns  the  last  parameter of  the  curve  C  
 which  has  a  projection  on  S.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns  the number  of  intervals which  define  
 an  S  continuous  part  of  the  projected  curve") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	FirstParam(Standard_Real)
	LastParam(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Adaptor2d_HCurve2d

Returns    a  curve equivalent   of  <self>  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 2d points confusion.  If <First> >= <Last>") Trim;
		Handle_Adaptor2d_HCurve2d Trim (const Standard_Real FirstParam,const Standard_Real LastParam,const Standard_Real Tol);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Returns  the  parameters  corresponding  to  
         S  discontinuities.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

returns  the  maximum  distance  between  
 curve  to  project  and  surface") MaxDistance;
		Standard_Real MaxDistance (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ProjLib_HSequenceOfHSequenceOfPnt

No detailed docstring for this function.") GetSequence;
		const Handle_ProjLib_HSequenceOfHSequenceOfPnt & GetSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_CurveType

Returns  the  type of the   curve  in the  current  
         interval :   Line,   Circle,   Ellipse, Hyperbola,  
         Parabola, BezierCurve, BSplineCurve, OtherCurve.") GetType;
		GeomAbs_CurveType GetType ();
};


%feature("shadow") ProjLib_CompProjectedCurve::~ProjLib_CompProjectedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_CompProjectedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ProjLib_ComputeApprox;
class ProjLib_ComputeApprox {
	public:
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	S(Handle_Adaptor3d_HSurface)
	Tol(Standard_Real)

Returns:
	None

<Tol>    is   the   tolerance   with  which    the  
         approximation is performed.") ProjLib_ComputeApprox;
		 ProjLib_ComputeApprox (const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HSurface & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") BSpline;
		Handle_Geom2d_BSplineCurve BSpline ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BezierCurve

No detailed docstring for this function.") Bezier;
		Handle_Geom2d_BezierCurve Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the reached Tolerance.") Tolerance;
		Standard_Real Tolerance ();
};


%feature("shadow") ProjLib_ComputeApprox::~ProjLib_ComputeApprox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_ComputeApprox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ProjLib_ComputeApproxOnPolarSurface;
class ProjLib_ComputeApproxOnPolarSurface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface ();
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	S(Handle_Adaptor3d_HSurface)
	Tol(Standard_Real)=1.0e-4

Returns:
	None

No detailed docstring for this function.") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface (const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HSurface & S,const Standard_Real Tol = 1.0e-4);
		%feature("autodoc", "Args:
	InitCurve2d(Handle_Adaptor2d_HCurve2d)
	C(Handle_Adaptor3d_HCurve)
	S(Handle_Adaptor3d_HSurface)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface (const Handle_Adaptor2d_HCurve2d & InitCurve2d,const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HSurface & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InitCurve2d(Handle_Adaptor2d_HCurve2d)
	InitCurve2dBis(Handle_Adaptor2d_HCurve2d)
	C(Handle_Adaptor3d_HCurve)
	S(Handle_Adaptor3d_HSurface)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ProjLib_ComputeApproxOnPolarSurface;
		 ProjLib_ComputeApproxOnPolarSurface (const Handle_Adaptor2d_HCurve2d & InitCurve2d,const Handle_Adaptor2d_HCurve2d & InitCurve2dBis,const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HSurface & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	InitCurve2d(Handle_Adaptor2d_HCurve2d)
	C(Handle_Adaptor3d_HCurve)
	S(Handle_Adaptor3d_HSurface)

Returns:
	Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") Perform;
		Handle_Geom2d_BSplineCurve Perform (const Handle_Adaptor2d_HCurve2d & InitCurve2d,const Handle_Adaptor3d_HCurve & C,const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	Curve(Handle_Adaptor3d_HCurve)
	S(Handle_Adaptor3d_HSurface)

Returns:
	Handle_Adaptor2d_HCurve2d

No detailed docstring for this function.") BuildInitialCurve2d;
		Handle_Adaptor2d_HCurve2d BuildInitialCurve2d (const Handle_Adaptor3d_HCurve & Curve,const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	Curve(Handle_Adaptor3d_HCurve)
	S(Handle_Adaptor3d_HSurface)
	InitCurve2d(Handle_Adaptor2d_HCurve2d)

Returns:
	Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") ProjectUsingInitialCurve2d;
		Handle_Geom2d_BSplineCurve ProjectUsingInitialCurve2d (const Handle_Adaptor3d_HCurve & Curve,const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor2d_HCurve2d & InitCurve2d);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BSplineCurve

No detailed docstring for this function.") BSpline;
		Handle_Geom2d_BSplineCurve BSpline ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") Curve2d;
		Handle_Geom2d_Curve Curve2d ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
};


%feature("shadow") ProjLib_ComputeApproxOnPolarSurface::~ProjLib_ComputeApproxOnPolarSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_ComputeApproxOnPolarSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ProjLib_HCompProjectedCurve;
class ProjLib_HCompProjectedCurve : public Adaptor2d_HCurve2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ProjLib_HCompProjectedCurve;
		 ProjLib_HCompProjectedCurve ();
		%feature("autodoc", "Args:
	C(ProjLib_CompProjectedCurve)

Returns:
	None

No detailed docstring for this function.") ProjLib_HCompProjectedCurve;
		 ProjLib_HCompProjectedCurve (const ProjLib_CompProjectedCurve & C);
		%feature("autodoc", "Args:
	C(ProjLib_CompProjectedCurve)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const ProjLib_CompProjectedCurve & C);
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor2d_Curve2d

No detailed docstring for this function.") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();
		%feature("autodoc", "Args:
	None
Returns:
	ProjLib_CompProjectedCurve

No detailed docstring for this function.") ChangeCurve2d;
		ProjLib_CompProjectedCurve & ChangeCurve2d ();
};


%feature("shadow") ProjLib_HCompProjectedCurve::~ProjLib_HCompProjectedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_HCompProjectedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ProjLib_HCompProjectedCurve {
	Handle_ProjLib_HCompProjectedCurve GetHandle() {
	return *(Handle_ProjLib_HCompProjectedCurve*) &$self;
	}
};

%nodefaultctor Handle_ProjLib_HCompProjectedCurve;
class Handle_ProjLib_HCompProjectedCurve : public Handle_Adaptor2d_HCurve2d {

    public:
        // constructors
        Handle_ProjLib_HCompProjectedCurve();
        Handle_ProjLib_HCompProjectedCurve(const Handle_ProjLib_HCompProjectedCurve &aHandle);
        Handle_ProjLib_HCompProjectedCurve(const ProjLib_HCompProjectedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ProjLib_HCompProjectedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ProjLib_HCompProjectedCurve {
    ProjLib_HCompProjectedCurve* GetObject() {
    return (ProjLib_HCompProjectedCurve*)$self->Access();
    }
};
%feature("shadow") Handle_ProjLib_HCompProjectedCurve::~Handle_ProjLib_HCompProjectedCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ProjLib_HCompProjectedCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ProjLib_HProjectedCurve;
class ProjLib_HProjectedCurve : public Adaptor2d_HCurve2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ProjLib_HProjectedCurve;
		 ProjLib_HProjectedCurve ();
		%feature("autodoc", "Args:
	C(ProjLib_ProjectedCurve)

Returns:
	None

No detailed docstring for this function.") ProjLib_HProjectedCurve;
		 ProjLib_HProjectedCurve (const ProjLib_ProjectedCurve & C);
		%feature("autodoc", "Args:
	C(ProjLib_ProjectedCurve)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const ProjLib_ProjectedCurve & C);
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor2d_Curve2d

No detailed docstring for this function.") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();
		%feature("autodoc", "Args:
	None
Returns:
	ProjLib_ProjectedCurve

No detailed docstring for this function.") ChangeCurve2d;
		ProjLib_ProjectedCurve & ChangeCurve2d ();
};


%feature("shadow") ProjLib_HProjectedCurve::~ProjLib_HProjectedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_HProjectedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ProjLib_HProjectedCurve {
	Handle_ProjLib_HProjectedCurve GetHandle() {
	return *(Handle_ProjLib_HProjectedCurve*) &$self;
	}
};

%nodefaultctor Handle_ProjLib_HProjectedCurve;
class Handle_ProjLib_HProjectedCurve : public Handle_Adaptor2d_HCurve2d {

    public:
        // constructors
        Handle_ProjLib_HProjectedCurve();
        Handle_ProjLib_HProjectedCurve(const Handle_ProjLib_HProjectedCurve &aHandle);
        Handle_ProjLib_HProjectedCurve(const ProjLib_HProjectedCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ProjLib_HProjectedCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ProjLib_HProjectedCurve {
    ProjLib_HProjectedCurve* GetObject() {
    return (ProjLib_HProjectedCurve*)$self->Access();
    }
};
%feature("shadow") Handle_ProjLib_HProjectedCurve::~Handle_ProjLib_HProjectedCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ProjLib_HProjectedCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ProjLib_HSequenceOfHSequenceOfPnt;
class ProjLib_HSequenceOfHSequenceOfPnt : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ProjLib_HSequenceOfHSequenceOfPnt;
		 ProjLib_HSequenceOfHSequenceOfPnt ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	anItem(Handle_TColgp_HSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColgp_HSequenceOfPnt & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_ProjLib_HSequenceOfHSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_ProjLib_HSequenceOfHSequenceOfPnt & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_TColgp_HSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColgp_HSequenceOfPnt & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_ProjLib_HSequenceOfHSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_ProjLib_HSequenceOfHSequenceOfPnt & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_TColgp_HSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfPnt & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_ProjLib_HSequenceOfHSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_ProjLib_HSequenceOfHSequenceOfPnt & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_TColgp_HSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfPnt & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_ProjLib_HSequenceOfHSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_ProjLib_HSequenceOfHSequenceOfPnt & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anOtherIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Exchange;
		void Exchange (const Standard_Integer anIndex,const Standard_Integer anOtherIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_ProjLib_HSequenceOfHSequenceOfPnt

No detailed docstring for this function.") Split;
		Handle_ProjLib_HSequenceOfHSequenceOfPnt Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_TColgp_HSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_TColgp_HSequenceOfPnt & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TColgp_HSequenceOfPnt

No detailed docstring for this function.") Value;
		const Handle_TColgp_HSequenceOfPnt & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_TColgp_HSequenceOfPnt

No detailed docstring for this function.") ChangeValue;
		Handle_TColgp_HSequenceOfPnt & ChangeValue (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	fromIndex(Standard_Integer)
	toIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer fromIndex,const Standard_Integer toIndex);
		%feature("autodoc", "Args:
	None
Returns:
	ProjLib_SequenceOfHSequenceOfPnt

No detailed docstring for this function.") Sequence;
		const ProjLib_SequenceOfHSequenceOfPnt & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	ProjLib_SequenceOfHSequenceOfPnt

No detailed docstring for this function.") ChangeSequence;
		ProjLib_SequenceOfHSequenceOfPnt & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_ProjLib_HSequenceOfHSequenceOfPnt

No detailed docstring for this function.") ShallowCopy;
		Handle_ProjLib_HSequenceOfHSequenceOfPnt ShallowCopy ();
};


%feature("shadow") ProjLib_HSequenceOfHSequenceOfPnt::~ProjLib_HSequenceOfHSequenceOfPnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_HSequenceOfHSequenceOfPnt {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ProjLib_HSequenceOfHSequenceOfPnt {
	Handle_ProjLib_HSequenceOfHSequenceOfPnt GetHandle() {
	return *(Handle_ProjLib_HSequenceOfHSequenceOfPnt*) &$self;
	}
};

%nodefaultctor Handle_ProjLib_HSequenceOfHSequenceOfPnt;
class Handle_ProjLib_HSequenceOfHSequenceOfPnt : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ProjLib_HSequenceOfHSequenceOfPnt();
        Handle_ProjLib_HSequenceOfHSequenceOfPnt(const Handle_ProjLib_HSequenceOfHSequenceOfPnt &aHandle);
        Handle_ProjLib_HSequenceOfHSequenceOfPnt(const ProjLib_HSequenceOfHSequenceOfPnt *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ProjLib_HSequenceOfHSequenceOfPnt DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ProjLib_HSequenceOfHSequenceOfPnt {
    ProjLib_HSequenceOfHSequenceOfPnt* GetObject() {
    return (ProjLib_HSequenceOfHSequenceOfPnt*)$self->Access();
    }
};
%feature("shadow") Handle_ProjLib_HSequenceOfHSequenceOfPnt::~Handle_ProjLib_HSequenceOfHSequenceOfPnt %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ProjLib_HSequenceOfHSequenceOfPnt {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ProjLib_PrjFunc;
class ProjLib_PrjFunc : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	C(Adaptor3d_CurvePtr)
	FixVal(Standard_Real)
	S(Adaptor3d_SurfacePtr)
	Fix(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ProjLib_PrjFunc;
		 ProjLib_PrjFunc (const Adaptor3d_CurvePtr & C,const Standard_Real FixVal,const Adaptor3d_SurfacePtr & S,const Standard_Integer Fix);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of variables of the function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of equations of the function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

computes the values <F> of the Functions for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <D> of the derivatives for the  
         variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

returns the values <F> of the functions and the derivatives  
         <D> for the variable <X>.  
         Returns True if the computation was done successfully,  
         False otherwise.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

returns  point  on  surface") Solution;
		gp_Pnt2d Solution ();
};


%feature("shadow") ProjLib_PrjFunc::~ProjLib_PrjFunc %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_PrjFunc {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ProjLib_PrjResolve;
class ProjLib_PrjResolve {
	public:
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	S(Adaptor3d_Surface)
	Fix(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ProjLib_PrjResolve;
		 ProjLib_PrjResolve (const Adaptor3d_Curve & C,const Adaptor3d_Surface & S,const Standard_Integer Fix);
		%feature("autodoc", "Args:
	t(Standard_Real)
	U(Standard_Real)
	V(Standard_Real)
	Tol(gp_Pnt2d)
	Inf(gp_Pnt2d)
	Sup(gp_Pnt2d)
	FTol(Standard_Real)=- 1
	StrictInside(Standard_Boolean)=Standard_False

Returns:
	None

Calculates the ort from  C(t)  to  S  with a close point.  
         The close point is defined by the parameter values  
         U0 and V0.  
         The function F(u,v)=distance(S(u,v),C(t)) has an  
         extremum when gradient(F)=0. The algorithm searchs  
         a zero near the close point.") Perform;
		void Perform (const Standard_Real t,const Standard_Real U,const Standard_Real V,const gp_Pnt2d & Tol,const gp_Pnt2d & Inf,const gp_Pnt2d & Sup,const Standard_Real FTol = - 1,const Standard_Boolean StrictInside = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the distance is found.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the point of the extremum distance.") Solution;
		gp_Pnt2d Solution ();
};


%feature("shadow") ProjLib_PrjResolve::~ProjLib_PrjResolve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_PrjResolve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ProjLib_ProjectOnPlane;
class ProjLib_ProjectOnPlane : public Adaptor3d_Curve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane ();
		%feature("autodoc", "Args:
	Pl(gp_Ax3)

Returns:
	None

The projection will be normal to the Plane defined  
         by the Ax3 <Pl>.") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane (const gp_Ax3 & Pl);
		%feature("autodoc", "Args:
	Pl(gp_Ax3)
	D(gp_Dir)

Returns:
	None

The projection will be  along the direction <D> on  
         the plane defined by the Ax3 <Pl>.  raises  if the direction  <D>  is parallel  to the  
         plane <Pl>.") ProjLib_ProjectOnPlane;
		 ProjLib_ProjectOnPlane (const gp_Ax3 & Pl,const gp_Dir & D);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	Tolerance(Standard_Real)
	KeepParametrization(Standard_Boolean)=Standard_True

Returns:
	None

Sets the  Curve  and perform  the projection.   if  
         <KeepParametrization> is true, the parametrization  
         of the Projected Curve <PC>  will  be the same  as  
         the parametrization of the initial  curve <C>.  It  
         meens: proj(C(u)) = PC(u) for  each u.  Otherwize,  
         the parametrization may change.") Load;
		void Load (const Handle_Adaptor3d_HCurve & C,const Standard_Real Tolerance,const Standard_Boolean KeepParametrization = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax3

No detailed docstring for this function.") GetPlane;
		const gp_Ax3 & GetPlane ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") GetDirection;
		const gp_Dir & GetDirection ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HCurve

No detailed docstring for this function.") GetCurve;
		const Handle_Adaptor3d_HCurve & GetCurve ();
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

Warning ! this will NOT make a copy of the  
        Bezier Curve : If you want to modify  
        the Curve please make a copy yourself  
        Also it will NOT trim the surface to  
        myFirst/Last.") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineCurve

Warning ! this will NOT make a copy of the  
        BSpline Curve : If you want to modify  
        the Curve please make a copy yourself  
        Also it will NOT trim the surface to  
        myFirst/Last.") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%feature("shadow") ProjLib_ProjectOnPlane::~ProjLib_ProjectOnPlane %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_ProjectOnPlane {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ProjLib_ProjectOnSurface;
class ProjLib_ProjectOnSurface {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Create an empty projector.") ProjLib_ProjectOnSurface;
		 ProjLib_ProjectOnSurface ();
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	None

Create a projector normaly to the surface <S>.") ProjLib_ProjectOnSurface;
		 ProjLib_ProjectOnSurface (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineCurve

No detailed docstring for this function.") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%feature("shadow") ProjLib_ProjectOnSurface::~ProjLib_ProjectOnSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_ProjectOnSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ProjLib_ProjectedCurve;
class ProjLib_ProjectedCurve : public Adaptor2d_Curve2d {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve ();
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)

Returns:
	None

No detailed docstring for this function.") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	C(Handle_Adaptor3d_HCurve)

Returns:
	None

No detailed docstring for this function.") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	C(Handle_Adaptor3d_HCurve)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ProjLib_ProjectedCurve;
		 ProjLib_ProjectedCurve (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") GetSurface;
		const Handle_Adaptor3d_HSurface & GetSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HCurve

No detailed docstring for this function.") GetCurve;
		const Handle_Adaptor3d_HCurve & GetCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the tolerance reached if an approximation  
         is Done.") GetTolerance;
		Standard_Real GetTolerance ();
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

Warning ! This will  NOT make a copy  of the -- Bezier Curve -  
        If you want to modify -- the Curve  please make a copy  
        yourself --  Also it will  NOT trim the surface  to --  
        myFirst/Last.") Bezier;
		Handle_Geom2d_BezierCurve Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_BSplineCurve

Warning ! This will NOT make a copy of the BSpline Curve - If  
        you want to  modify the   Curve  please make a   copy  
        yourself Also it   will  NOT  trim   the surface   to  
        myFirst/Last.") BSpline;
		Handle_Geom2d_BSplineCurve BSpline ();
};


%feature("shadow") ProjLib_ProjectedCurve::~ProjLib_ProjectedCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_ProjectedCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ProjLib_Projector;
class ProjLib_Projector {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the type to OtherCurve") ProjLib_Projector;
		 ProjLib_Projector ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Set isDone = Standard_True;") Done;
		void Done ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_CurveType

No detailed docstring for this function.") GetType;
		GeomAbs_CurveType GetType ();
		%feature("autodoc", "Args:
	C(Handle_Geom2d_BSplineCurve)

Returns:
	None

No detailed docstring for this function.") SetBSpline;
		void SetBSpline (const Handle_Geom2d_BSplineCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_BezierCurve)

Returns:
	None

No detailed docstring for this function.") SetBezier;
		void SetBezier (const Handle_Geom2d_BezierCurve & C);
		%feature("autodoc", "Args:
	Type(GeomAbs_CurveType)

Returns:
	None

No detailed docstring for this function.") SetType;
		void SetType (const GeomAbs_CurveType Type);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") SetPeriodic;
		void SetPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin2d

No detailed docstring for this function.") Line;
		const gp_Lin2d & Line ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ2d

No detailed docstring for this function.") Circle;
		const gp_Circ2d & Circle ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Elips2d

No detailed docstring for this function.") Ellipse;
		const gp_Elips2d & Ellipse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr2d

No detailed docstring for this function.") Hyperbola;
		const gp_Hypr2d & Hyperbola ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Parab2d

No detailed docstring for this function.") Parabola;
		const gp_Parab2d & Parabola ();
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
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Lin & L);
		%feature("autodoc", "Args:
	C(gp_Circ)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Circ & C);
		%feature("autodoc", "Args:
	E(gp_Elips)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Elips & E);
		%feature("autodoc", "Args:
	P(gp_Parab)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Parab & P);
		%feature("autodoc", "Args:
	H(gp_Hypr)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Hypr & H);
		%feature("autodoc", "Args:
	CFirst(Standard_Real)
	CLast(Standard_Real)
	UFirst(Standard_Real)
	Period(Standard_Real)

Returns:
	None

Translates the 2d curve  
         to set the part of the curve [CFirst, CLast]  
         in the range [ UFirst, UFirst + Period [") UFrame;
		void UFrame (const Standard_Real CFirst,const Standard_Real CLast,const Standard_Real UFirst,const Standard_Real Period);
		%feature("autodoc", "Args:
	CFirst(Standard_Real)
	CLast(Standard_Real)
	VFirst(Standard_Real)
	Period(Standard_Real)

Returns:
	None

Translates the 2d curve  
         to set the part of the curve [CFirst, CLast]  
         in the range [ VFirst, VFirst + Period [") VFrame;
		void VFrame (const Standard_Real CFirst,const Standard_Real CLast,const Standard_Real VFirst,const Standard_Real Period);
};


%feature("shadow") ProjLib_Projector::~ProjLib_Projector %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_Projector {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt;
class ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_TColgp_HSequenceOfPnt)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt;
		 ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt (const Handle_TColgp_HSequenceOfPnt & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColgp_HSequenceOfPnt

No detailed docstring for this function.") Value;
		Handle_TColgp_HSequenceOfPnt & Value ();
};


%feature("shadow") ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt::~ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt {
	void _kill_pointed() {
		delete $self;
	}
};
%extend ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt {
	Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt GetHandle() {
	return *(Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt*) &$self;
	}
};

%nodefaultctor Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt;
class Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt();
        Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt(const Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt &aHandle);
        Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt(const ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt {
    ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt* GetObject() {
    return (ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt*)$self->Access();
    }
};
%feature("shadow") Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt::~Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_ProjLib_SequenceNodeOfSequenceOfHSequenceOfPnt {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor ProjLib_SequenceOfHSequenceOfPnt;
class ProjLib_SequenceOfHSequenceOfPnt : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ProjLib_SequenceOfHSequenceOfPnt;
		 ProjLib_SequenceOfHSequenceOfPnt ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(ProjLib_SequenceOfHSequenceOfPnt)

Returns:
	ProjLib_SequenceOfHSequenceOfPnt

No detailed docstring for this function.") Assign;
		const ProjLib_SequenceOfHSequenceOfPnt & Assign (const ProjLib_SequenceOfHSequenceOfPnt & Other);
		%feature("autodoc", "Args:
	Other(ProjLib_SequenceOfHSequenceOfPnt)

Returns:
	ProjLib_SequenceOfHSequenceOfPnt

No detailed docstring for this function.") operator=;
		const ProjLib_SequenceOfHSequenceOfPnt & operator = (const ProjLib_SequenceOfHSequenceOfPnt & Other);
		%feature("autodoc", "Args:
	T(Handle_TColgp_HSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_TColgp_HSequenceOfPnt & T);
		%feature("autodoc", "Args:
	S(ProjLib_SequenceOfHSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (ProjLib_SequenceOfHSequenceOfPnt & S);
		%feature("autodoc", "Args:
	T(Handle_TColgp_HSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_TColgp_HSequenceOfPnt & T);
		%feature("autodoc", "Args:
	S(ProjLib_SequenceOfHSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (ProjLib_SequenceOfHSequenceOfPnt & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_TColgp_HSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_TColgp_HSequenceOfPnt & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(ProjLib_SequenceOfHSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,ProjLib_SequenceOfHSequenceOfPnt & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_TColgp_HSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_TColgp_HSequenceOfPnt & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(ProjLib_SequenceOfHSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,ProjLib_SequenceOfHSequenceOfPnt & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColgp_HSequenceOfPnt

No detailed docstring for this function.") First;
		const Handle_TColgp_HSequenceOfPnt & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColgp_HSequenceOfPnt

No detailed docstring for this function.") Last;
		const Handle_TColgp_HSequenceOfPnt & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(ProjLib_SequenceOfHSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,ProjLib_SequenceOfHSequenceOfPnt & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_TColgp_HSequenceOfPnt

No detailed docstring for this function.") Value;
		const Handle_TColgp_HSequenceOfPnt & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_TColgp_HSequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_TColgp_HSequenceOfPnt & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_TColgp_HSequenceOfPnt

No detailed docstring for this function.") ChangeValue;
		Handle_TColgp_HSequenceOfPnt & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") ProjLib_SequenceOfHSequenceOfPnt::~ProjLib_SequenceOfHSequenceOfPnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_SequenceOfHSequenceOfPnt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ProjLib_Cone;
class ProjLib_Cone : public ProjLib_Projector {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Undefined projection.") ProjLib_Cone;
		 ProjLib_Cone ();
		%feature("autodoc", "Args:
	Co(gp_Cone)

Returns:
	None

Projection on the cone <Co>.") ProjLib_Cone;
		 ProjLib_Cone (const gp_Cone & Co);
		%feature("autodoc", "Args:
	Co(gp_Cone)
	L(gp_Lin)

Returns:
	None

Projection of the line <L> on the cone <Co>.") ProjLib_Cone;
		 ProjLib_Cone (const gp_Cone & Co,const gp_Lin & L);
		%feature("autodoc", "Args:
	Co(gp_Cone)
	C(gp_Circ)

Returns:
	None

Projection of the circle <C> on the cone <Co>.") ProjLib_Cone;
		 ProjLib_Cone (const gp_Cone & Co,const gp_Circ & C);
		%feature("autodoc", "Args:
	Co(gp_Cone)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_Cone & Co);
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Lin & L);
		%feature("autodoc", "Args:
	C(gp_Circ)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Circ & C);
		%feature("autodoc", "Args:
	E(gp_Elips)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Elips & E);
		%feature("autodoc", "Args:
	P(gp_Parab)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Parab & P);
		%feature("autodoc", "Args:
	H(gp_Hypr)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Hypr & H);
};


%feature("shadow") ProjLib_Cone::~ProjLib_Cone %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_Cone {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ProjLib_Cylinder;
class ProjLib_Cylinder : public ProjLib_Projector {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Undefined projection.") ProjLib_Cylinder;
		 ProjLib_Cylinder ();
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)

Returns:
	None

Projection on the cylinder <Cyl>.") ProjLib_Cylinder;
		 ProjLib_Cylinder (const gp_Cylinder & Cyl);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	L(gp_Lin)

Returns:
	None

Projection of the line <L> on the cylinder <Cyl>.") ProjLib_Cylinder;
		 ProjLib_Cylinder (const gp_Cylinder & Cyl,const gp_Lin & L);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	C(gp_Circ)

Returns:
	None

Projection of the circle <C> on the cylinder <Cyl>.") ProjLib_Cylinder;
		 ProjLib_Cylinder (const gp_Cylinder & Cyl,const gp_Circ & C);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)
	E(gp_Elips)

Returns:
	None

Projection of the ellipse <E> on the cylinder <Cyl>.") ProjLib_Cylinder;
		 ProjLib_Cylinder (const gp_Cylinder & Cyl,const gp_Elips & E);
		%feature("autodoc", "Args:
	Cyl(gp_Cylinder)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_Cylinder & Cyl);
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Lin & L);
		%feature("autodoc", "Args:
	C(gp_Circ)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Circ & C);
		%feature("autodoc", "Args:
	E(gp_Elips)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Elips & E);
		%feature("autodoc", "Args:
	P(gp_Parab)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Parab & P);
		%feature("autodoc", "Args:
	H(gp_Hypr)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Hypr & H);
};


%feature("shadow") ProjLib_Cylinder::~ProjLib_Cylinder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_Cylinder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ProjLib_Plane;
class ProjLib_Plane : public ProjLib_Projector {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Undefined projection.") ProjLib_Plane;
		 ProjLib_Plane ();
		%feature("autodoc", "Args:
	Pl(gp_Pln)

Returns:
	None

Projection on the plane <Pl>.") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl);
		%feature("autodoc", "Args:
	Pl(gp_Pln)
	L(gp_Lin)

Returns:
	None

Projection of the line <L> on the plane <Pl>.") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl,const gp_Lin & L);
		%feature("autodoc", "Args:
	Pl(gp_Pln)
	C(gp_Circ)

Returns:
	None

Projection of the circle <C> on the plane <Pl>.") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl,const gp_Circ & C);
		%feature("autodoc", "Args:
	Pl(gp_Pln)
	E(gp_Elips)

Returns:
	None

Projection of the ellipse <E> on the plane <Pl>.") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl,const gp_Elips & E);
		%feature("autodoc", "Args:
	Pl(gp_Pln)
	P(gp_Parab)

Returns:
	None

Projection of the parabola <P> on the plane <Pl>.") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl,const gp_Parab & P);
		%feature("autodoc", "Args:
	Pl(gp_Pln)
	H(gp_Hypr)

Returns:
	None

Projection of the hyperbola <H> on the plane <Pl>.") ProjLib_Plane;
		 ProjLib_Plane (const gp_Pln & Pl,const gp_Hypr & H);
		%feature("autodoc", "Args:
	Pl(gp_Pln)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_Pln & Pl);
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Lin & L);
		%feature("autodoc", "Args:
	C(gp_Circ)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Circ & C);
		%feature("autodoc", "Args:
	E(gp_Elips)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Elips & E);
		%feature("autodoc", "Args:
	P(gp_Parab)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Parab & P);
		%feature("autodoc", "Args:
	H(gp_Hypr)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Hypr & H);
};


%feature("shadow") ProjLib_Plane::~ProjLib_Plane %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_Plane {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ProjLib_Sphere;
class ProjLib_Sphere : public ProjLib_Projector {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Undefined projection.") ProjLib_Sphere;
		 ProjLib_Sphere ();
		%feature("autodoc", "Args:
	Sp(gp_Sphere)

Returns:
	None

Projection on the sphere <Sp>.") ProjLib_Sphere;
		 ProjLib_Sphere (const gp_Sphere & Sp);
		%feature("autodoc", "Args:
	Sp(gp_Sphere)
	C(gp_Circ)

Returns:
	None

Projection of the circle <C> on the sphere <Sp>.") ProjLib_Sphere;
		 ProjLib_Sphere (const gp_Sphere & Sp,const gp_Circ & C);
		%feature("autodoc", "Args:
	Sp(gp_Sphere)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_Sphere & Sp);
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Lin & L);
		%feature("autodoc", "Args:
	C(gp_Circ)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Circ & C);
		%feature("autodoc", "Args:
	E(gp_Elips)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Elips & E);
		%feature("autodoc", "Args:
	P(gp_Parab)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Parab & P);
		%feature("autodoc", "Args:
	H(gp_Hypr)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Hypr & H);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	None

Set the point of parameter U on C in the natural  
         restrictions of the sphere.") SetInBounds;
		void SetInBounds (const Standard_Real U);
};


%feature("shadow") ProjLib_Sphere::~ProjLib_Sphere %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_Sphere {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor ProjLib_Torus;
class ProjLib_Torus : public ProjLib_Projector {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Undefined projection.") ProjLib_Torus;
		 ProjLib_Torus ();
		%feature("autodoc", "Args:
	To(gp_Torus)

Returns:
	None

Projection on the torus <To>.") ProjLib_Torus;
		 ProjLib_Torus (const gp_Torus & To);
		%feature("autodoc", "Args:
	To(gp_Torus)
	C(gp_Circ)

Returns:
	None

Projection of the circle <C> on the torus <To>.") ProjLib_Torus;
		 ProjLib_Torus (const gp_Torus & To,const gp_Circ & C);
		%feature("autodoc", "Args:
	To(gp_Torus)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const gp_Torus & To);
		%feature("autodoc", "Args:
	L(gp_Lin)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Lin & L);
		%feature("autodoc", "Args:
	C(gp_Circ)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Circ & C);
		%feature("autodoc", "Args:
	E(gp_Elips)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Elips & E);
		%feature("autodoc", "Args:
	P(gp_Parab)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Parab & P);
		%feature("autodoc", "Args:
	H(gp_Hypr)

Returns:
	virtual void

No detailed docstring for this function.") Project;
		virtual void Project (const gp_Hypr & H);
};


%feature("shadow") ProjLib_Torus::~ProjLib_Torus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend ProjLib_Torus {
	void _kill_pointed() {
		delete $self;
	}
};
