/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%define ADAPTOR3DDOCSTRING
"The Adaptor3d package  is used to help defining
reusable geometric algorithms. i.e. that can be
used on curves and surfaces.

It defines general services for 3 kind of objects :

- the 2d curve.   Curve2d
- the 3d curve.   Curve
- the 3d surface.  Surface

The services are :

- Usual services found in Geom or Geom2d :

* parameter range, value and derivatives, etc...

- Continuity breakout services :

* Allows to divide a curve or a surfaces in
parts with a given derivation order.

- Special geometries detection services :

* Allows to test for special cases that can
be processed more easily :
- Conics, Quadrics, Bezier, BSpline ...

And to get the correponding data form the
package gp or  Geom.  The special type
OtherCurve means that no special case has
been detected and the algorithm may use
only the evaluation methods (D0, D1, ...)


For  each category Curve2d, Curve,  Surface we
define  three classes, we illustrate now the
principles with the Curve, the same applies to
Curve2d and Surface.

The class Curve is the  abstract root for all
Curves used by algorithms, it is handled by value
and  provides as deferred methods the services
described above.

Some services (breakout) requires to create new
curves,   this  leads  to  memory allocation
considerations (who create the curve, who deletes
it ?). To solve this problem elegantly the curve
will return a HCurve, the  HCurve is a  curve
handled by reference  so it will  be deallocated
automatically when it is not used.

A third class GenHCurve is provided, this class is
generic and its utility  is to provide automatic
generation of the HCurve class when you have
written the Curve class.


* Let us show an example (with 2d curves) :

Imagine an algorithm to intersect curves, this
algorithms is written to process Curve2d from
Adaptor3d :

A method may look like :

Intersect(C1,C2 : Curve2d from Adaptor3d);

Which will look like in C++

Intersect(const Adaptor2d_Curve2d& C1,
const Adaptor2d_Curve2d& C2)
{
// you can call any method
Standard_Real first1 = C1.FirstParameter();

// but avoid to copy in an Adaptor3d_Curve which
// is an Abstract class, use a reference or a pointer

const Adaptor3d_Curve& C = C1;
const Adaptor3d_Curve *pC = &C1;

// If you are interseted in Intervals you must
// store them in a HCurve to ensure they are kept
// in memory. Then a referrence may be used.

Handle(Adaptor3d_HCurve) HCI = C1.Interval(1);

const Adaptor3d_Curve& CI = HCI->Curve();
pC = &(HCI->Curve());


* The  Adaptor3d provides also Generic classes
implementing algorithmic curves and surfaces.

- IsoCurve    : Isoparametric curve on a surface.
- CurveOnSurface : 2D curve in the parametric
space of a surface.


- OffsetCurve2d : 2d offset curve
- ProjectedCurve : 3d curve projected on a plane
- SurfaceOfLinearExtrusion
- SurfaceOfRevolution

They are instantiated with HCurve, HSurface, HCurved2d
"
%enddef
%module (package="OCC.Core", docstring=ADAPTOR3DDOCSTRING) Adaptor3d

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
%include ../common/OccHandle.i


%include Adaptor3d_headers.i

/* typedefs */
typedef Adaptor3d_Surface * Adaptor3d_SurfacePtr;
typedef Adaptor3d_Curve * Adaptor3d_CurvePtr;
typedef Adaptor3d_CurveOnSurface * Adaptor3d_CurveOnSurfacePtr;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(Adaptor3d_HCurve)
%wrap_handle(Adaptor3d_HOffsetCurve)
%wrap_handle(Adaptor3d_HSurface)
%wrap_handle(Adaptor3d_HVertex)
%wrap_handle(Adaptor3d_TopolTool)
%wrap_handle(Adaptor3d_HCurveOnSurface)
%wrap_handle(Adaptor3d_HIsoCurve)
%wrap_handle(Adaptor3d_HSurfaceOfLinearExtrusion)
%wrap_handle(Adaptor3d_HSurfaceOfRevolution)

class Adaptor3d_Curve {
	public:
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		virtual Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		virtual Standard_Real LastParameter ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HCurve
") Trim;
		virtual Handle_Adaptor3d_HCurve Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		virtual Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:rtype: float
") Period;
		virtual Standard_Real Period ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		virtual gp_Pnt Value (const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		virtual void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: void
") D1;
		virtual void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		virtual void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.

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
	:rtype: void
") D3;
		virtual void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		virtual gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the parametric resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		virtual Standard_Real Resolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:rtype: GeomAbs_CurveType
") GetType;
		virtual GeomAbs_CurveType GetType ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		virtual gp_Lin Line ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		virtual gp_Circ Circle ();
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:rtype: gp_Elips
") Ellipse;
		virtual gp_Elips Ellipse ();
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:rtype: gp_Hypr
") Hyperbola;
		virtual gp_Hypr Hyperbola ();
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:rtype: gp_Parab
") Parabola;
		virtual gp_Parab Parabola ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:rtype: int
") Degree;
		virtual Standard_Integer Degree ();
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	:rtype: bool
") IsRational;
		virtual Standard_Boolean IsRational ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	:rtype: int
") NbPoles;
		virtual Standard_Integer NbPoles ();
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:rtype: int
") NbKnots;
		virtual Standard_Integer NbKnots ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:rtype: Handle_Geom_BezierCurve
") Bezier;
		virtual Handle_Geom_BezierCurve Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		virtual Handle_Geom_BSplineCurve BSpline ();
};


%extend Adaptor3d_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Adaptor3d_HCurve;
class Adaptor3d_HCurve : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	* Returns a pointer to the Curve inside the HCurve.

	:rtype: Adaptor3d_Curve
") Curve;
		virtual const Adaptor3d_Curve & Curve ();
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	* Returns a pointer to the Curve inside the HCurve.

	:rtype: Adaptor3d_Curve
") GetCurve;
		virtual Adaptor3d_Curve & GetCurve ();
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. //! If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HCurve
") Trim;
		Handle_Adaptor3d_HCurve Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
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
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
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
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:rtype: gp_Elips
") Ellipse;
		gp_Elips Ellipse ();
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:rtype: gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:rtype: gp_Parab
") Parabola;
		gp_Parab Parabola ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:rtype: Handle_Geom_BezierCurve
") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%make_alias(Adaptor3d_HCurve)

%extend Adaptor3d_HCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Adaptor3d_HOffsetCurve;
class Adaptor3d_HOffsetCurve : public Adaptor2d_HCurve2d {
	public:
		%feature("compactdefaultargs") Adaptor3d_HOffsetCurve;
		%feature("autodoc", "	:rtype: None
") Adaptor3d_HOffsetCurve;
		 Adaptor3d_HOffsetCurve ();
		%feature("compactdefaultargs") Adaptor3d_HOffsetCurve;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:rtype: None
") Adaptor3d_HOffsetCurve;
		 Adaptor3d_HOffsetCurve (const Adaptor3d_OffsetCurve & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_OffsetCurve &
	:rtype: None
") Set;
		void Set (const Adaptor3d_OffsetCurve & C);
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	:rtype: Adaptor2d_Curve2d
") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "	:rtype: Adaptor3d_OffsetCurve
") ChangeCurve2d;
		Adaptor3d_OffsetCurve & ChangeCurve2d ();
};


%make_alias(Adaptor3d_HOffsetCurve)

%extend Adaptor3d_HOffsetCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Adaptor3d_HSurface;
class Adaptor3d_HSurface : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* Returns a reference to the Surface inside the HSurface.

	:rtype: Adaptor3d_Surface
") Surface;
		virtual const Adaptor3d_Surface & Surface ();
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "	:rtype: float
") FirstUParameter;
		Standard_Real FirstUParameter ();
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "	:rtype: float
") LastUParameter;
		Standard_Real LastUParameter ();
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "	:rtype: float
") FirstVParameter;
		Standard_Real FirstVParameter ();
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "	:rtype: float
") LastVParameter;
		Standard_Real LastVParameter ();
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") UContinuity;
		GeomAbs_Shape UContinuity ();
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") VContinuity;
		GeomAbs_Shape VContinuity ();
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbUIntervals;
		Standard_Integer NbUIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbVIntervals;
		Standard_Integer NbVIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") UIntervals;
		void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") VIntervals;
		void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HSurface
") UTrim;
		Handle_Adaptor3d_HSurface UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HSurface
") VTrim;
		Handle_Adaptor3d_HSurface VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "	:rtype: bool
") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "	:rtype: bool
") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "	:rtype: float
") UPeriod;
		Standard_Real UPeriod ();
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "	:rtype: float
") VPeriod;
		Standard_Real VPeriod ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
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
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
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
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
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
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "	:param R3d:
	:type R3d: float
	:rtype: float
") UResolution;
		Standard_Real UResolution (const Standard_Real R3d);
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "	:param R3d:
	:type R3d: float
	:rtype: float
") VResolution;
		Standard_Real VResolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:rtype: GeomAbs_SurfaceType
") GetType;
		GeomAbs_SurfaceType GetType ();
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	:rtype: gp_Pln
") Plane;
		gp_Pln Plane ();
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "	:rtype: gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder ();
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "	:rtype: gp_Cone
") Cone;
		gp_Cone Cone ();
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "	:rtype: gp_Sphere
") Sphere;
		gp_Sphere Sphere ();
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "	:rtype: gp_Torus
") Torus;
		gp_Torus Torus ();
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "	:rtype: int
") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "	:rtype: int
") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "	:rtype: int
") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "	:rtype: int
") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "	:rtype: bool
") IsURational;
		Standard_Boolean IsURational ();
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "	:rtype: bool
") IsVRational;
		Standard_Boolean IsVRational ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:rtype: Handle_Geom_BezierSurface
") Bezier;
		Handle_Geom_BezierSurface Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineSurface
") BSpline;
		Handle_Geom_BSplineSurface BSpline ();
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "	:rtype: gp_Ax1
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		gp_Dir Direction ();
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HCurve
") BasisCurve;
		Handle_Adaptor3d_HCurve BasisCurve ();
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") BasisSurface;
		Handle_Adaptor3d_HSurface BasisSurface ();
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "	:rtype: float
") OffsetValue;
		Standard_Real OffsetValue ();
};


%make_alias(Adaptor3d_HSurface)

%extend Adaptor3d_HSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Adaptor3d_HSurfaceTool {
	public:
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: float
") FirstUParameter;
		static Standard_Real FirstUParameter (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: float
") FirstVParameter;
		static Standard_Real FirstVParameter (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: float
") LastUParameter;
		static Standard_Real LastUParameter (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: float
") LastVParameter;
		static Standard_Real LastVParameter (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: int
") NbUIntervals;
		static Standard_Integer NbUIntervals (const Handle_Adaptor3d_HSurface & S,const GeomAbs_Shape Sh);
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: int
") NbVIntervals;
		static Standard_Integer NbVIntervals (const Handle_Adaptor3d_HSurface & S,const GeomAbs_Shape Sh);
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: void
") UIntervals;
		static void UIntervals (const Handle_Adaptor3d_HSurface & S,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param Sh:
	:type Sh: GeomAbs_Shape
	:rtype: void
") VIntervals;
		static void VIntervals (const Handle_Adaptor3d_HSurface & S,TColStd_Array1OfReal & T,const GeomAbs_Shape Sh);
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "	* If <First> >= <Last>

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HSurface
") UTrim;
		static Handle_Adaptor3d_HSurface UTrim (const Handle_Adaptor3d_HSurface & S,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "	* If <First> >= <Last>

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HSurface
") VTrim;
		static Handle_Adaptor3d_HSurface VTrim (const Handle_Adaptor3d_HSurface & S,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") IsUClosed;
		static Standard_Boolean IsUClosed (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") IsVClosed;
		static Standard_Boolean IsVClosed (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") IsUPeriodic;
		static Standard_Boolean IsUPeriodic (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: float
") UPeriod;
		static Standard_Real UPeriod (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") IsVPeriodic;
		static Standard_Boolean IsVPeriodic (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: float
") VPeriod;
		static Standard_Real VPeriod (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param u:
	:type u: float
	:param v:
	:type v: float
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Handle_Adaptor3d_HSurface & S,const Standard_Real u,const Standard_Real v);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const Handle_Adaptor3d_HSurface & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param P:
	:type P: gp_Pnt
	:param D1u:
	:type D1u: gp_Vec
	:param D1v:
	:type D1v: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Handle_Adaptor3d_HSurface & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1u,gp_Vec & D1v);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param u:
	:type u: float
	:param v:
	:type v: float
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
	:rtype: void
") D2;
		static void D2 (const Handle_Adaptor3d_HSurface & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param u:
	:type u: float
	:param v:
	:type v: float
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
	:rtype: void
") D3;
		static void D3 (const Handle_Adaptor3d_HSurface & S,const Standard_Real u,const Standard_Real v,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param u:
	:type u: float
	:param v:
	:type v: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Handle_Adaptor3d_HSurface & S,const Standard_Real u,const Standard_Real v,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param R3d:
	:type R3d: float
	:rtype: float
") UResolution;
		static Standard_Real UResolution (const Handle_Adaptor3d_HSurface & S,const Standard_Real R3d);
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param R3d:
	:type R3d: float
	:rtype: float
") VResolution;
		static Standard_Real VResolution (const Handle_Adaptor3d_HSurface & S,const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: GeomAbs_SurfaceType
") GetType;
		static GeomAbs_SurfaceType GetType (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: gp_Pln
") Plane;
		static gp_Pln Plane (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: gp_Cylinder
") Cylinder;
		static gp_Cylinder Cylinder (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: gp_Cone
") Cone;
		static gp_Cone Cone (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: gp_Torus
") Torus;
		static gp_Torus Torus (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: gp_Sphere
") Sphere;
		static gp_Sphere Sphere (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: Handle_Geom_BezierSurface
") Bezier;
		static Handle_Geom_BezierSurface Bezier (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: Handle_Geom_BSplineSurface
") BSpline;
		static Handle_Geom_BSplineSurface BSpline (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: gp_Ax1
") AxeOfRevolution;
		static gp_Ax1 AxeOfRevolution (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: gp_Dir
") Direction;
		static gp_Dir Direction (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: Handle_Adaptor3d_HCurve
") BasisCurve;
		static Handle_Adaptor3d_HCurve BasisCurve (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: Handle_Adaptor3d_HSurface
") BasisSurface;
		static Handle_Adaptor3d_HSurface BasisSurface (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: float
") OffsetValue;
		static Standard_Real OffsetValue (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: int
") NbSamplesU;
		static Standard_Integer NbSamplesU (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: int
") NbSamplesV;
		static Standard_Integer NbSamplesV (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param u1:
	:type u1: float
	:param u2:
	:type u2: float
	:rtype: int
") NbSamplesU;
		static Standard_Integer NbSamplesU (const Handle_Adaptor3d_HSurface & S,const Standard_Real u1,const Standard_Real u2);
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param v1:
	:type v1: float
	:param v2:
	:type v2: float
	:rtype: int
") NbSamplesV;
		static Standard_Integer NbSamplesV (const Handle_Adaptor3d_HSurface & S,const Standard_Real v1,const Standard_Real v2);
};


%extend Adaptor3d_HSurfaceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Adaptor3d_HVertex;
class Adaptor3d_HVertex : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Adaptor3d_HVertex;
		%feature("autodoc", "	:rtype: None
") Adaptor3d_HVertex;
		 Adaptor3d_HVertex ();
		%feature("compactdefaultargs") Adaptor3d_HVertex;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param Ori:
	:type Ori: TopAbs_Orientation
	:param Resolution:
	:type Resolution: float
	:rtype: None
") Adaptor3d_HVertex;
		 Adaptor3d_HVertex (const gp_Pnt2d & P,const TopAbs_Orientation Ori,const Standard_Real Resolution);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Pnt2d
") Value;
		virtual gp_Pnt2d Value ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Parameter;
		virtual Standard_Real Parameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Parametric resolution (2d).

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Resolution;
		virtual Standard_Real Resolution (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation ();
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "	:param Other:
	:type Other: Handle_Adaptor3d_HVertex &
	:rtype: bool
") IsSame;
		virtual Standard_Boolean IsSame (const Handle_Adaptor3d_HVertex & Other);
};


%make_alias(Adaptor3d_HVertex)

%extend Adaptor3d_HVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Adaptor3d_InterFunc;
class Adaptor3d_InterFunc : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Adaptor3d_InterFunc;
		%feature("autodoc", "	* build the function U(t)=FixVal if Fix =1 or V(t)=FixVal if Fix=2

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param FixVal:
	:type FixVal: float
	:param Fix:
	:type Fix: int
	:rtype: None
") Adaptor3d_InterFunc;
		 Adaptor3d_InterFunc (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real FixVal,const Standard_Integer Fix);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* computes the value <F>of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* computes the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.

	:param X:
	:type X: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* computes the value <F> and the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Adaptor3d_InterFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Adaptor3d_OffsetCurve;
class Adaptor3d_OffsetCurve : public Adaptor2d_Curve2d {
	public:
		%feature("compactdefaultargs") Adaptor3d_OffsetCurve;
		%feature("autodoc", "	* The Offset is set to 0.

	:rtype: None
") Adaptor3d_OffsetCurve;
		 Adaptor3d_OffsetCurve ();
		%feature("compactdefaultargs") Adaptor3d_OffsetCurve;
		%feature("autodoc", "	* The curve is loaded. The Offset is set to 0.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Adaptor3d_OffsetCurve;
		 Adaptor3d_OffsetCurve (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Adaptor3d_OffsetCurve;
		%feature("autodoc", "	* Creates an OffsetCurve curve. The Offset is set to Offset.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Offset:
	:type Offset: float
	:rtype: None
") Adaptor3d_OffsetCurve;
		 Adaptor3d_OffsetCurve (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real Offset);
		%feature("compactdefaultargs") Adaptor3d_OffsetCurve;
		%feature("autodoc", "	* Create an Offset curve. WFirst,WLast define the bounds of the Offset curve.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Offset:
	:type Offset: float
	:param WFirst:
	:type WFirst: float
	:param WLast:
	:type WLast: float
	:rtype: None
") Adaptor3d_OffsetCurve;
		 Adaptor3d_OffsetCurve (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real Offset,const Standard_Real WFirst,const Standard_Real WLast);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Changes the curve. The Offset is reset to 0.

	:param S:
	:type S: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Load;
		void Load (const Handle_Adaptor2d_HCurve2d & S);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Changes the Offset on the current Curve.

	:param Offset:
	:type Offset: float
	:rtype: None
") Load;
		void Load (const Standard_Real Offset);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Changes the Offset Curve on the current Curve.

	:param Offset:
	:type Offset: float
	:param WFirst:
	:type WFirst: float
	:param WLast:
	:type WLast: float
	:rtype: None
") Load;
		void Load (const Standard_Real Offset,const Standard_Real WFirst,const Standard_Real WLast);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Curve;
		Handle_Adaptor2d_HCurve2d Curve ();
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "	:rtype: float
") Offset;
		Standard_Real Offset ();
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Trim;
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
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		gp_Pnt2d Value (const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);
		%feature("compactdefaultargs") D1;
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
		%feature("compactdefaultargs") D2;
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
		%feature("compactdefaultargs") D3;
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
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the parametric resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: gp_Lin2d
") Line;
		gp_Lin2d Line ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:rtype: gp_Circ2d
") Circle;
		gp_Circ2d Circle ();
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:rtype: gp_Elips2d
") Ellipse;
		gp_Elips2d Ellipse ();
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:rtype: gp_Hypr2d
") Hyperbola;
		gp_Hypr2d Hyperbola ();
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:rtype: gp_Parab2d
") Parabola;
		gp_Parab2d Parabola ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:rtype: Handle_Geom2d_BezierCurve
") Bezier;
		Handle_Geom2d_BezierCurve Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
		Handle_Geom2d_BSplineCurve BSpline ();
};


%extend Adaptor3d_OffsetCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Adaptor3d_Surface {
	public:
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "	:rtype: float
") FirstUParameter;
		virtual Standard_Real FirstUParameter ();
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "	:rtype: float
") LastUParameter;
		virtual Standard_Real LastUParameter ();
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "	:rtype: float
") FirstVParameter;
		virtual Standard_Real FirstVParameter ();
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "	:rtype: float
") LastVParameter;
		virtual Standard_Real LastVParameter ();
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") UContinuity;
		virtual GeomAbs_Shape UContinuity ();
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") VContinuity;
		virtual GeomAbs_Shape VContinuity ();
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "	* Returns the number of U intervals for continuity <S>. May be one if UContinuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbUIntervals;
		virtual Standard_Integer NbUIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "	* Returns the number of V intervals for continuity <S>. May be one if VContinuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbVIntervals;
		virtual Standard_Integer NbVIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "	* Returns the intervals with the requested continuity in the U direction.

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") UIntervals;
		virtual void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "	* Returns the intervals with the requested continuity in the V direction.

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") VIntervals;
		virtual void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "	* Returns a surface trimmed in the U direction equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HSurface
") UTrim;
		virtual Handle_Adaptor3d_HSurface UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "	* Returns a surface trimmed in the V direction between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HSurface
") VTrim;
		virtual Handle_Adaptor3d_HSurface VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "	:rtype: bool
") IsUClosed;
		virtual Standard_Boolean IsUClosed ();
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "	:rtype: bool
") IsVClosed;
		virtual Standard_Boolean IsVClosed ();
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic ();
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "	:rtype: float
") UPeriod;
		virtual Standard_Real UPeriod ();
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic ();
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "	:rtype: float
") VPeriod;
		virtual Standard_Real VPeriod ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameters U,V on the surface.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Pnt
") Value;
		virtual gp_Pnt Value (const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameters U,V on the surface.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		virtual void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point and the first derivatives on the surface. Raised if the continuity of the current intervals is not C1.

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
	:rtype: void
") D1;
		virtual void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Computes the point, the first and second derivatives on the surface. Raised if the continuity of the current intervals is not C2.

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
	:rtype: void
") D2;
		virtual void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Computes the point, the first, second and third derivatives on the surface. Raised if the continuity of the current intervals is not C3.

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
	:rtype: void
") D3;
		virtual void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). Raised if the current U interval is not not CNu and the current V interval is not CNv. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") DN;
		virtual gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "	* Returns the parametric U resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") UResolution;
		virtual Standard_Real UResolution (const Standard_Real R3d);
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "	* Returns the parametric V resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") VResolution;
		virtual Standard_Real VResolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the surface : Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface

	:rtype: GeomAbs_SurfaceType
") GetType;
		virtual GeomAbs_SurfaceType GetType ();
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	:rtype: gp_Pln
") Plane;
		virtual gp_Pln Plane ();
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "	:rtype: gp_Cylinder
") Cylinder;
		virtual gp_Cylinder Cylinder ();
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "	:rtype: gp_Cone
") Cone;
		virtual gp_Cone Cone ();
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "	:rtype: gp_Sphere
") Sphere;
		virtual gp_Sphere Sphere ();
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "	:rtype: gp_Torus
") Torus;
		virtual gp_Torus Torus ();
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "	:rtype: int
") UDegree;
		virtual Standard_Integer UDegree ();
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "	:rtype: int
") NbUPoles;
		virtual Standard_Integer NbUPoles ();
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "	:rtype: int
") VDegree;
		virtual Standard_Integer VDegree ();
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "	:rtype: int
") NbVPoles;
		virtual Standard_Integer NbVPoles ();
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "	:rtype: int
") NbUKnots;
		virtual Standard_Integer NbUKnots ();
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "	:rtype: int
") NbVKnots;
		virtual Standard_Integer NbVKnots ();
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "	:rtype: bool
") IsURational;
		virtual Standard_Boolean IsURational ();
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "	:rtype: bool
") IsVRational;
		virtual Standard_Boolean IsVRational ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:rtype: Handle_Geom_BezierSurface
") Bezier;
		virtual Handle_Geom_BezierSurface Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineSurface
") BSpline;
		virtual Handle_Geom_BSplineSurface BSpline ();
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "	:rtype: gp_Ax1
") AxeOfRevolution;
		virtual gp_Ax1 AxeOfRevolution ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		virtual gp_Dir Direction ();
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HCurve
") BasisCurve;
		virtual Handle_Adaptor3d_HCurve BasisCurve ();
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") BasisSurface;
		virtual Handle_Adaptor3d_HSurface BasisSurface ();
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "	:rtype: float
") OffsetValue;
		virtual Standard_Real OffsetValue ();
};


%extend Adaptor3d_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Adaptor3d_TopolTool;
class Adaptor3d_TopolTool : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Adaptor3d_TopolTool;
		%feature("autodoc", "	:rtype: None
") Adaptor3d_TopolTool;
		 Adaptor3d_TopolTool ();
		%feature("compactdefaultargs") Adaptor3d_TopolTool;
		%feature("autodoc", "	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:rtype: None
") Adaptor3d_TopolTool;
		 Adaptor3d_TopolTool (const Handle_Adaptor3d_HSurface & Surface);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:rtype: void
") Initialize;
		virtual void Initialize ();
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: void
") Initialize;
		virtual void Initialize (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor2d_HCurve2d &
	:rtype: void
") Initialize;
		virtual void Initialize (const Handle_Adaptor2d_HCurve2d & Curve);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: void
") Init;
		virtual void Init ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		virtual Standard_Boolean More ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Value;
		virtual Handle_Adaptor2d_HCurve2d Value ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: void
") Next;
		virtual void Next ();
		%feature("compactdefaultargs") InitVertexIterator;
		%feature("autodoc", "	:rtype: void
") InitVertexIterator;
		virtual void InitVertexIterator ();
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "	:rtype: bool
") MoreVertex;
		virtual Standard_Boolean MoreVertex ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HVertex
") Vertex;
		virtual Handle_Adaptor3d_HVertex Vertex ();
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "	:rtype: void
") NextVertex;
		virtual void NextVertex ();
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param ReacdreOnPeriodic: default value is Standard_True
	:type ReacdreOnPeriodic: bool
	:rtype: TopAbs_State
") Classify;
		virtual TopAbs_State Classify (const gp_Pnt2d & P,const Standard_Real Tol,const Standard_Boolean ReacdreOnPeriodic = Standard_True);
		%feature("compactdefaultargs") IsThePointOn;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:param ReacdreOnPeriodic: default value is Standard_True
	:type ReacdreOnPeriodic: bool
	:rtype: bool
") IsThePointOn;
		virtual Standard_Boolean IsThePointOn (const gp_Pnt2d & P,const Standard_Real Tol,const Standard_Boolean ReacdreOnPeriodic = Standard_True);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* If the function returns the orientation of the arc. If the orientation is FORWARD or REVERSED, the arc is a 'real' limit of the surface. If the orientation is INTERNAL or EXTERNAL, the arc is considered as an arc on the surface.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* Returns the orientation of the vertex V. The vertex has been found with an exploration on a given arc. The orientation is the orientation of the vertex on this arc.

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:rtype: TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation (const Handle_Adaptor3d_HVertex & V);
		%feature("compactdefaultargs") Identical;
		%feature("autodoc", "	* Returns True if the vertices V1 and V2 are identical. This method does not take the orientation of the vertices in account.

	:param V1:
	:type V1: Handle_Adaptor3d_HVertex &
	:param V2:
	:type V2: Handle_Adaptor3d_HVertex &
	:rtype: bool
") Identical;
		virtual Standard_Boolean Identical (const Handle_Adaptor3d_HVertex & V1,const Handle_Adaptor3d_HVertex & V2);
		%feature("compactdefaultargs") Has3d;
		%feature("autodoc", "	* answers if arcs and vertices may have 3d representations, so that we could use Tol3d and Pnt methods.

	:rtype: bool
") Has3d;
		virtual Standard_Boolean Has3d ();
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "	* returns 3d tolerance of the arc C

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Tol3d;
		virtual Standard_Real Tol3d (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "	* returns 3d tolerance of the vertex V

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:rtype: float
") Tol3d;
		virtual Standard_Real Tol3d (const Handle_Adaptor3d_HVertex & V);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	* returns 3d point of the vertex V

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:rtype: gp_Pnt
") Pnt;
		virtual gp_Pnt Pnt (const Handle_Adaptor3d_HVertex & V);
		%feature("compactdefaultargs") ComputeSamplePoints;
		%feature("autodoc", "	:rtype: void
") ComputeSamplePoints;
		virtual void ComputeSamplePoints ();
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "	* compute the sample-points for the intersections algorithms

	:rtype: int
") NbSamplesU;
		virtual Standard_Integer NbSamplesU ();
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "	* compute the sample-points for the intersections algorithms

	:rtype: int
") NbSamplesV;
		virtual Standard_Integer NbSamplesV ();
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "	* compute the sample-points for the intersections algorithms

	:rtype: int
") NbSamples;
		virtual Standard_Integer NbSamples ();
		%feature("compactdefaultargs") UParameters;
		%feature("autodoc", "	* return the set of U parameters on the surface obtained by the method SamplePnts

	:param theArray:
	:type theArray: TColStd_Array1OfReal &
	:rtype: None
") UParameters;
		void UParameters (TColStd_Array1OfReal & theArray);
		%feature("compactdefaultargs") VParameters;
		%feature("autodoc", "	* return the set of V parameters on the surface obtained by the method SamplePnts

	:param theArray:
	:type theArray: TColStd_Array1OfReal &
	:rtype: None
") VParameters;
		void VParameters (TColStd_Array1OfReal & theArray);
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param P2d:
	:type P2d: gp_Pnt2d
	:param P3d:
	:type P3d: gp_Pnt
	:rtype: void
") SamplePoint;
		virtual void SamplePoint (const Standard_Integer Index,gp_Pnt2d & P2d,gp_Pnt & P3d);
		%feature("compactdefaultargs") DomainIsInfinite;
		%feature("autodoc", "	:rtype: bool
") DomainIsInfinite;
		virtual Standard_Boolean DomainIsInfinite ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: Standard_Address
") Edge;
		virtual Standard_Address Edge ();
		%feature("compactdefaultargs") SamplePnts;
		%feature("autodoc", "	* compute the sample-points for the intersections algorithms by adaptive algorithm for BSpline surfaces. For other surfaces algorithm is the same as in method ComputeSamplePoints(), but only fill arrays of U and V sample parameters; theDefl is a requred deflection theNUmin, theNVmin are minimal nb points for U and V.

	:param theDefl:
	:type theDefl: float
	:param theNUmin:
	:type theNUmin: int
	:param theNVmin:
	:type theNVmin: int
	:rtype: void
") SamplePnts;
		virtual void SamplePnts (const Standard_Real theDefl,const Standard_Integer theNUmin,const Standard_Integer theNVmin);
		%feature("compactdefaultargs") BSplSamplePnts;
		%feature("autodoc", "	* compute the sample-points for the intersections algorithms by adaptive algorithm for BSpline surfaces - is used in SamplePnts theDefl is a requred deflection theNUmin, theNVmin are minimal nb points for U and V.

	:param theDefl:
	:type theDefl: float
	:param theNUmin:
	:type theNUmin: int
	:param theNVmin:
	:type theNVmin: int
	:rtype: void
") BSplSamplePnts;
		virtual void BSplSamplePnts (const Standard_Real theDefl,const Standard_Integer theNUmin,const Standard_Integer theNVmin);
		%feature("compactdefaultargs") IsUniformSampling;
		%feature("autodoc", "	* Returns true if provide uniform sampling of points.

	:rtype: bool
") IsUniformSampling;
		virtual Standard_Boolean IsUniformSampling ();
};


%make_alias(Adaptor3d_TopolTool)

%extend Adaptor3d_TopolTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Adaptor3d_CurveOnSurface;
class Adaptor3d_CurveOnSurface : public Adaptor3d_Curve {
	public:
		%feature("compactdefaultargs") Adaptor3d_CurveOnSurface;
		%feature("autodoc", "	:rtype: None
") Adaptor3d_CurveOnSurface;
		 Adaptor3d_CurveOnSurface ();
		%feature("compactdefaultargs") Adaptor3d_CurveOnSurface;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: None
") Adaptor3d_CurveOnSurface;
		 Adaptor3d_CurveOnSurface (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Adaptor3d_CurveOnSurface;
		%feature("autodoc", "	* Creates a CurveOnSurface from the 2d curve <C> and the surface <S>.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: None
") Adaptor3d_CurveOnSurface;
		 Adaptor3d_CurveOnSurface (const Handle_Adaptor2d_HCurve2d & C,const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Changes the surface.

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: None
") Load;
		void Load (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Changes the 2d curve.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Load;
		void Load (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") GetCurve;
		Handle_Adaptor2d_HCurve2d GetCurve ();
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") GetSurface;
		Handle_Adaptor3d_HSurface GetSurface ();
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") ChangeCurve;
		Handle_Adaptor2d_HCurve2d ChangeCurve ();
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") ChangeSurface;
		Handle_Adaptor3d_HSurface ChangeSurface ();
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Trim;
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
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

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
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.

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
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the parametric resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:rtype: gp_Elips
") Ellipse;
		gp_Elips Ellipse ();
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:rtype: gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:rtype: gp_Parab
") Parabola;
		gp_Parab Parabola ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:rtype: Handle_Geom_BezierCurve
") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%extend Adaptor3d_CurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Adaptor3d_HCurveOnSurface;
class Adaptor3d_HCurveOnSurface : public Adaptor3d_HCurve {
	public:
		%feature("compactdefaultargs") Adaptor3d_HCurveOnSurface;
		%feature("autodoc", "	:rtype: None
") Adaptor3d_HCurveOnSurface;
		 Adaptor3d_HCurveOnSurface ();
		%feature("compactdefaultargs") Adaptor3d_HCurveOnSurface;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_CurveOnSurface &
	:rtype: None
") Adaptor3d_HCurveOnSurface;
		 Adaptor3d_HCurveOnSurface (const Adaptor3d_CurveOnSurface & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_CurveOnSurface &
	:rtype: None
") Set;
		void Set (const Adaptor3d_CurveOnSurface & C);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve ();
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve ();
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "	:rtype: Adaptor3d_CurveOnSurface
") ChangeCurve;
		Adaptor3d_CurveOnSurface & ChangeCurve ();
};


%make_alias(Adaptor3d_HCurveOnSurface)

%extend Adaptor3d_HCurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Adaptor3d_HIsoCurve;
class Adaptor3d_HIsoCurve : public Adaptor3d_HCurve {
	public:
		%feature("compactdefaultargs") Adaptor3d_HIsoCurve;
		%feature("autodoc", "	:rtype: None
") Adaptor3d_HIsoCurve;
		 Adaptor3d_HIsoCurve ();
		%feature("compactdefaultargs") Adaptor3d_HIsoCurve;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_IsoCurve &
	:rtype: None
") Adaptor3d_HIsoCurve;
		 Adaptor3d_HIsoCurve (const Adaptor3d_IsoCurve & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: Adaptor3d_IsoCurve &
	:rtype: None
") Set;
		void Set (const Adaptor3d_IsoCurve & C);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve ();
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve ();
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "	:rtype: Adaptor3d_IsoCurve
") ChangeCurve;
		Adaptor3d_IsoCurve & ChangeCurve ();
};


%make_alias(Adaptor3d_HIsoCurve)

%extend Adaptor3d_HIsoCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Adaptor3d_HSurfaceOfLinearExtrusion;
class Adaptor3d_HSurfaceOfLinearExtrusion : public Adaptor3d_HSurface {
	public:
		%feature("compactdefaultargs") Adaptor3d_HSurfaceOfLinearExtrusion;
		%feature("autodoc", "	:rtype: None
") Adaptor3d_HSurfaceOfLinearExtrusion;
		 Adaptor3d_HSurfaceOfLinearExtrusion ();
		%feature("compactdefaultargs") Adaptor3d_HSurfaceOfLinearExtrusion;
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_SurfaceOfLinearExtrusion &
	:rtype: None
") Adaptor3d_HSurfaceOfLinearExtrusion;
		 Adaptor3d_HSurfaceOfLinearExtrusion (const Adaptor3d_SurfaceOfLinearExtrusion & S);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_SurfaceOfLinearExtrusion &
	:rtype: None
") Set;
		void Set (const Adaptor3d_SurfaceOfLinearExtrusion & S);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	:rtype: Adaptor3d_Surface
") Surface;
		const Adaptor3d_Surface & Surface ();
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "	:rtype: Adaptor3d_SurfaceOfLinearExtrusion
") ChangeSurface;
		Adaptor3d_SurfaceOfLinearExtrusion & ChangeSurface ();
};


%make_alias(Adaptor3d_HSurfaceOfLinearExtrusion)

%extend Adaptor3d_HSurfaceOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Adaptor3d_HSurfaceOfRevolution;
class Adaptor3d_HSurfaceOfRevolution : public Adaptor3d_HSurface {
	public:
		%feature("compactdefaultargs") Adaptor3d_HSurfaceOfRevolution;
		%feature("autodoc", "	:rtype: None
") Adaptor3d_HSurfaceOfRevolution;
		 Adaptor3d_HSurfaceOfRevolution ();
		%feature("compactdefaultargs") Adaptor3d_HSurfaceOfRevolution;
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_SurfaceOfRevolution &
	:rtype: None
") Adaptor3d_HSurfaceOfRevolution;
		 Adaptor3d_HSurfaceOfRevolution (const Adaptor3d_SurfaceOfRevolution & S);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param S:
	:type S: Adaptor3d_SurfaceOfRevolution &
	:rtype: None
") Set;
		void Set (const Adaptor3d_SurfaceOfRevolution & S);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	:rtype: Adaptor3d_Surface
") Surface;
		const Adaptor3d_Surface & Surface ();
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "	:rtype: Adaptor3d_SurfaceOfRevolution
") ChangeSurface;
		Adaptor3d_SurfaceOfRevolution & ChangeSurface ();
};


%make_alias(Adaptor3d_HSurfaceOfRevolution)

%extend Adaptor3d_HSurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Adaptor3d_IsoCurve;
class Adaptor3d_IsoCurve : public Adaptor3d_Curve {
	public:
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "	* The iso is set to NoneIso.

	:rtype: None
") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve ();
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "	* The surface is loaded. The iso is set to NoneIso.

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: None
") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "	* Creates an IsoCurve curve. Iso defines the type (isoU or isoU) Param defines the value of the iso. The bounds of the iso are the bounds of the surface.

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Iso:
	:type Iso: GeomAbs_IsoType
	:param Param:
	:type Param: float
	:rtype: None
") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve (const Handle_Adaptor3d_HSurface & S,const GeomAbs_IsoType Iso,const Standard_Real Param);
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "	* Create an IsoCurve curve. Iso defines the type (isoU or isov). Param defines the value of the iso. WFirst,WLast define the bounds of the iso.

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Iso:
	:type Iso: GeomAbs_IsoType
	:param Param:
	:type Param: float
	:param WFirst:
	:type WFirst: float
	:param WLast:
	:type WLast: float
	:rtype: None
") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve (const Handle_Adaptor3d_HSurface & S,const GeomAbs_IsoType Iso,const Standard_Real Param,const Standard_Real WFirst,const Standard_Real WLast);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Changes the surface. The iso is reset to NoneIso.

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: None
") Load;
		void Load (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Changes the iso on the current surface.

	:param Iso:
	:type Iso: GeomAbs_IsoType
	:param Param:
	:type Param: float
	:rtype: None
") Load;
		void Load (const GeomAbs_IsoType Iso,const Standard_Real Param);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Changes the iso on the current surface.

	:param Iso:
	:type Iso: GeomAbs_IsoType
	:param Param:
	:type Param: float
	:param WFirst:
	:type WFirst: float
	:param WLast:
	:type WLast: float
	:rtype: None
") Load;
		void Load (const GeomAbs_IsoType Iso,const Standard_Real Param,const Standard_Real WFirst,const Standard_Real WLast);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") Surface;
		Handle_Adaptor3d_HSurface Surface ();
		%feature("compactdefaultargs") Iso;
		%feature("autodoc", "	:rtype: GeomAbs_IsoType
") Iso;
		GeomAbs_IsoType Iso ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Trim;
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
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

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
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.

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
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the parametric resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:rtype: gp_Elips
") Ellipse;
		gp_Elips Ellipse ();
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:rtype: gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:rtype: gp_Parab
") Parabola;
		gp_Parab Parabola ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:rtype: Handle_Geom_BezierCurve
") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%extend Adaptor3d_IsoCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Adaptor3d_SurfaceOfLinearExtrusion;
class Adaptor3d_SurfaceOfLinearExtrusion : public Adaptor3d_Surface {
	public:
		%feature("compactdefaultargs") Adaptor3d_SurfaceOfLinearExtrusion;
		%feature("autodoc", "	:rtype: None
") Adaptor3d_SurfaceOfLinearExtrusion;
		 Adaptor3d_SurfaceOfLinearExtrusion ();
		%feature("compactdefaultargs") Adaptor3d_SurfaceOfLinearExtrusion;
		%feature("autodoc", "	* The Curve is loaded.

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") Adaptor3d_SurfaceOfLinearExtrusion;
		 Adaptor3d_SurfaceOfLinearExtrusion (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Adaptor3d_SurfaceOfLinearExtrusion;
		%feature("autodoc", "	* Thew Curve and the Direction are loaded.

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param V:
	:type V: gp_Dir
	:rtype: None
") Adaptor3d_SurfaceOfLinearExtrusion;
		 Adaptor3d_SurfaceOfLinearExtrusion (const Handle_Adaptor3d_HCurve & C,const gp_Dir & V);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Changes the Curve

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") Load;
		void Load (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Changes the Direction

	:param V:
	:type V: gp_Dir
	:rtype: None
") Load;
		void Load (const gp_Dir & V);
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "	:rtype: float
") FirstUParameter;
		Standard_Real FirstUParameter ();
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "	:rtype: float
") LastUParameter;
		Standard_Real LastUParameter ();
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "	:rtype: float
") FirstVParameter;
		Standard_Real FirstVParameter ();
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "	:rtype: float
") LastVParameter;
		Standard_Real LastVParameter ();
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") UContinuity;
		GeomAbs_Shape UContinuity ();
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "	* Return CN.

	:rtype: GeomAbs_Shape
") VContinuity;
		GeomAbs_Shape VContinuity ();
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "	* Returns the number of U intervals for continuity <S>. May be one if UContinuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbUIntervals;
		Standard_Integer NbUIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "	* Returns the number of V intervals for continuity <S>. May be one if VContinuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbVIntervals;
		Standard_Integer NbVIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "	* Returns the intervals with the requested continuity in the U direction.

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") UIntervals;
		void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "	* Returns the intervals with the requested continuity in the V direction.

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") VIntervals;
		void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") UTrim;
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
		%feature("compactdefaultargs") VTrim;
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
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "	:rtype: bool
") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "	:rtype: bool
") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "	:rtype: float
") UPeriod;
		Standard_Real UPeriod ();
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "	:rtype: float
") VPeriod;
		Standard_Real VPeriod ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameters U,V on the surface.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") D0;
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
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point and the first derivatives on the surface. Raised if the continuity of the current intervals is not C1.

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
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Computes the point, the first and second derivatives on the surface. Raised if the continuity of the current intervals is not C2.

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
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Computes the point, the first, second and third derivatives on the surface. Raised if the continuity of the current intervals is not C3.

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
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). Raised if the current U interval is not not CNu and the current V interval is not CNv. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "	* Returns the parametric U resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") UResolution;
		Standard_Real UResolution (const Standard_Real R3d);
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "	* Returns the parametric V resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") VResolution;
		Standard_Real VResolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the surface : Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface

	:rtype: GeomAbs_SurfaceType
") GetType;
		GeomAbs_SurfaceType GetType ();
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	:rtype: gp_Pln
") Plane;
		gp_Pln Plane ();
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "	:rtype: gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder ();
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "	:rtype: gp_Cone
") Cone;
		gp_Cone Cone ();
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "	:rtype: gp_Sphere
") Sphere;
		gp_Sphere Sphere ();
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "	:rtype: gp_Torus
") Torus;
		gp_Torus Torus ();
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "	:rtype: int
") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "	:rtype: int
") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "	:rtype: int
") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "	:rtype: int
") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "	:rtype: bool
") IsURational;
		Standard_Boolean IsURational ();
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "	:rtype: bool
") IsVRational;
		Standard_Boolean IsVRational ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:rtype: Handle_Geom_BezierSurface
") Bezier;
		Handle_Geom_BezierSurface Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineSurface
") BSpline;
		Handle_Geom_BSplineSurface BSpline ();
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "	:rtype: gp_Ax1
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		gp_Dir Direction ();
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HCurve
") BasisCurve;
		Handle_Adaptor3d_HCurve BasisCurve ();
};


%extend Adaptor3d_SurfaceOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Adaptor3d_SurfaceOfRevolution;
class Adaptor3d_SurfaceOfRevolution : public Adaptor3d_Surface {
	public:
		%feature("compactdefaultargs") Adaptor3d_SurfaceOfRevolution;
		%feature("autodoc", "	:rtype: None
") Adaptor3d_SurfaceOfRevolution;
		 Adaptor3d_SurfaceOfRevolution ();
		%feature("compactdefaultargs") Adaptor3d_SurfaceOfRevolution;
		%feature("autodoc", "	* The Curve is loaded.

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") Adaptor3d_SurfaceOfRevolution;
		 Adaptor3d_SurfaceOfRevolution (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Adaptor3d_SurfaceOfRevolution;
		%feature("autodoc", "	* The Curve and the Direction are loaded.

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param V:
	:type V: gp_Ax1
	:rtype: None
") Adaptor3d_SurfaceOfRevolution;
		 Adaptor3d_SurfaceOfRevolution (const Handle_Adaptor3d_HCurve & C,const gp_Ax1 & V);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Changes the Curve

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") Load;
		void Load (const Handle_Adaptor3d_HCurve & C);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Changes the Direction

	:param V:
	:type V: gp_Ax1
	:rtype: None
") Load;
		void Load (const gp_Ax1 & V);
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "	:rtype: gp_Ax1
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution ();
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "	:rtype: float
") FirstUParameter;
		Standard_Real FirstUParameter ();
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "	:rtype: float
") LastUParameter;
		Standard_Real LastUParameter ();
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "	:rtype: float
") FirstVParameter;
		Standard_Real FirstVParameter ();
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "	:rtype: float
") LastVParameter;
		Standard_Real LastVParameter ();
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") UContinuity;
		GeomAbs_Shape UContinuity ();
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "	* Return CN.

	:rtype: GeomAbs_Shape
") VContinuity;
		GeomAbs_Shape VContinuity ();
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "	* Returns the number of U intervals for continuity <S>. May be one if UContinuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbUIntervals;
		Standard_Integer NbUIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "	* Returns the number of V intervals for continuity <S>. May be one if VContinuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbVIntervals;
		Standard_Integer NbVIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "	* Returns the intervals with the requested continuity in the U direction.

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") UIntervals;
		void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "	* Returns the intervals with the requested continuity in the V direction.

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") VIntervals;
		void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") UTrim;
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
		%feature("compactdefaultargs") VTrim;
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
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "	:rtype: bool
") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "	:rtype: bool
") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "	:rtype: float
") UPeriod;
		Standard_Real UPeriod ();
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "	:rtype: float
") VPeriod;
		Standard_Real VPeriod ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameters U,V on the surface.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") D0;
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
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point and the first derivatives on the surface. Raised if the continuity of the current intervals is not C1.

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
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Computes the point, the first and second derivatives on the surface. Raised if the continuity of the current intervals is not C2.

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
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Computes the point, the first, second and third derivatives on the surface. Raised if the continuity of the current intervals is not C3.

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
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). Raised if the current U interval is not not CNu and the current V interval is not CNv. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "	* Returns the parametric U resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") UResolution;
		Standard_Real UResolution (const Standard_Real R3d);
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "	* Returns the parametric V resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") VResolution;
		Standard_Real VResolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the surface : Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface

	:rtype: GeomAbs_SurfaceType
") GetType;
		GeomAbs_SurfaceType GetType ();
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	:rtype: gp_Pln
") Plane;
		gp_Pln Plane ();
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "	:rtype: gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder ();
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "	* Apex of the Cone = Cone.Position().Location() ==> ReferenceRadius = 0.

	:rtype: gp_Cone
") Cone;
		gp_Cone Cone ();
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "	:rtype: gp_Sphere
") Sphere;
		gp_Sphere Sphere ();
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "	:rtype: gp_Torus
") Torus;
		gp_Torus Torus ();
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "	:rtype: int
") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "	:rtype: int
") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "	:rtype: int
") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "	:rtype: int
") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "	:rtype: bool
") IsURational;
		Standard_Boolean IsURational ();
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "	:rtype: bool
") IsVRational;
		Standard_Boolean IsVRational ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:rtype: Handle_Geom_BezierSurface
") Bezier;
		Handle_Geom_BezierSurface Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineSurface
") BSpline;
		Handle_Geom_BSplineSurface BSpline ();
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "	:rtype: gp_Ax3
") Axis;
		gp_Ax3 Axis ();
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		gp_Dir Direction ();
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HCurve
") BasisCurve;
		Handle_Adaptor3d_HCurve BasisCurve ();
};


%extend Adaptor3d_SurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
