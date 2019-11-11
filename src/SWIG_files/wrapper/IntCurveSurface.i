/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define INTCURVESURFACEDOCSTRING
"IntCurveSurface module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_IntCurveSurface.html"
%enddef
%module (package="OCC.Core", docstring=INTCURVESURFACEDOCSTRING) IntCurveSurface

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include IntCurveSurface_headers.i

/* public enums */
enum IntCurveSurface_TransitionOnCurve {
	IntCurveSurface_Tangent = 0,
	IntCurveSurface_In = 1,
	IntCurveSurface_Out = 2,
};

/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(IntCurveSurface_SequenceOfSeg) NCollection_Sequence <IntCurveSurface_IntersectionSegment>;
%template(IntCurveSurface_SequenceOfPnt) NCollection_Sequence <IntCurveSurface_IntersectionPoint>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <IntCurveSurface_IntersectionSegment> IntCurveSurface_SequenceOfSeg;
typedef NCollection_Sequence <IntCurveSurface_IntersectionPoint> IntCurveSurface_SequenceOfPnt;
/* end typedefs declaration */

%nodefaultctor IntCurveSurface_Intersection;
%ignore IntCurveSurface_Intersection::~IntCurveSurface_Intersection();
class IntCurveSurface_Intersection {
	public:
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dump all the fields.

	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* returns the <done> field.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "	* Returns true if curve is parallel or belongs surface This case is recognized only for some pairs of analytical curves and surfaces (plane - line, ...)

	:rtype: bool
") IsParallel;
		Standard_Boolean IsParallel ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* returns the number of IntersectionPoint if IsDone returns True. else NotDone is raised.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	* returns the number of IntersectionSegment if IsDone returns True. else NotDone is raised.

	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* returns the IntersectionPoint of range <Index> raises NotDone if the computation has failed or if the computation has not been done raises OutOfRange if Index is not in the range <1..NbPoints>

	:param Index:
	:type Index: int
	:rtype: IntCurveSurface_IntersectionPoint
") Point;
		const IntCurveSurface_IntersectionPoint & Point (const Standard_Integer Index);
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "	* returns the IntersectionSegment of range <Index> raises NotDone if the computation has failed or if the computation has not been done raises OutOfRange if Index is not in the range <1..NbSegment>

	:param Index:
	:type Index: int
	:rtype: IntCurveSurface_IntersectionSegment
") Segment;
		const IntCurveSurface_IntersectionSegment & Segment (const Standard_Integer Index);
};


%extend IntCurveSurface_Intersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_IntersectionPoint;
class IntCurveSurface_IntersectionPoint {
	public:
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dump all the fields.

	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") IntCurveSurface_IntersectionPoint;
		%feature("autodoc", "	* Empty Constructor.

	:rtype: None
") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint ();
		%feature("compactdefaultargs") IntCurveSurface_IntersectionPoint;
		%feature("autodoc", "	* Create an IntersectionPoint.

	:param P:
	:type P: gp_Pnt
	:param USurf:
	:type USurf: float
	:param VSurf:
	:type VSurf: float
	:param UCurv:
	:type UCurv: float
	:param TrCurv:
	:type TrCurv: IntCurveSurface_TransitionOnCurve
	:rtype: None
") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint (const gp_Pnt & P,const Standard_Real USurf,const Standard_Real VSurf,const Standard_Real UCurv,const IntCurveSurface_TransitionOnCurve TrCurv);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	* returns the geometric point.

	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt ();
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	* Set the fields of the current IntersectionPoint.

	:param P:
	:type P: gp_Pnt
	:param USurf:
	:type USurf: float
	:param VSurf:
	:type VSurf: float
	:param UCurv:
	:type UCurv: float
	:param TrCurv:
	:type TrCurv: IntCurveSurface_TransitionOnCurve
	:rtype: None
") SetValues;
		void SetValues (const gp_Pnt & P,const Standard_Real USurf,const Standard_Real VSurf,const Standard_Real UCurv,const IntCurveSurface_TransitionOnCurve TrCurv);
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	* returns the Transition of the point.

	:rtype: IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition ();
		%feature("compactdefaultargs") U;
		%feature("autodoc", "	* returns the U parameter on the surface.

	:rtype: float
") U;
		Standard_Real U ();
		%feature("compactdefaultargs") V;
		%feature("autodoc", "	* returns the V parameter on the surface.

	:rtype: float
") V;
		Standard_Real V ();
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Get the fields of the current IntersectionPoint.

	:param P:
	:type P: gp_Pnt
	:param USurf:
	:type USurf: float &
	:param VSurf:
	:type VSurf: float &
	:param UCurv:
	:type UCurv: float &
	:param TrCurv:
	:type TrCurv: IntCurveSurface_TransitionOnCurve &
	:rtype: None
") Values;
		void Values (gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,IntCurveSurface_TransitionOnCurve & TrCurv);
		%feature("compactdefaultargs") W;
		%feature("autodoc", "	* returns the parameter on the curve.

	:rtype: float
") W;
		Standard_Real W ();
};


%extend IntCurveSurface_IntersectionPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_IntersectionSegment;
class IntCurveSurface_IntersectionSegment {
	public:
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	:param P1:
	:type P1: IntCurveSurface_IntersectionPoint &
	:rtype: None
") FirstPoint;
		void FirstPoint (IntCurveSurface_IntersectionPoint & P1);
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionPoint
") FirstPoint;
		const IntCurveSurface_IntersectionPoint & FirstPoint ();
		%feature("compactdefaultargs") IntCurveSurface_IntersectionSegment;
		%feature("autodoc", "	:rtype: None
") IntCurveSurface_IntersectionSegment;
		 IntCurveSurface_IntersectionSegment ();
		%feature("compactdefaultargs") IntCurveSurface_IntersectionSegment;
		%feature("autodoc", "	:param P1:
	:type P1: IntCurveSurface_IntersectionPoint &
	:param P2:
	:type P2: IntCurveSurface_IntersectionPoint &
	:rtype: None
") IntCurveSurface_IntersectionSegment;
		 IntCurveSurface_IntersectionSegment (const IntCurveSurface_IntersectionPoint & P1,const IntCurveSurface_IntersectionPoint & P2);
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "	:param P2:
	:type P2: IntCurveSurface_IntersectionPoint &
	:rtype: None
") SecondPoint;
		void SecondPoint (IntCurveSurface_IntersectionPoint & P2);
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionPoint
") SecondPoint;
		const IntCurveSurface_IntersectionPoint & SecondPoint ();
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	:param P1:
	:type P1: IntCurveSurface_IntersectionPoint &
	:param P2:
	:type P2: IntCurveSurface_IntersectionPoint &
	:rtype: None
") SetValues;
		void SetValues (const IntCurveSurface_IntersectionPoint & P1,const IntCurveSurface_IntersectionPoint & P2);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param P1:
	:type P1: IntCurveSurface_IntersectionPoint &
	:param P2:
	:type P2: IntCurveSurface_IntersectionPoint &
	:rtype: None
") Values;
		void Values (IntCurveSurface_IntersectionPoint & P1,IntCurveSurface_IntersectionPoint & P2);
};


%extend IntCurveSurface_IntersectionSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_TheCSFunctionOfHInter;
class IntCurveSurface_TheCSFunctionOfHInter : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", "	:rtype: opencascade::handle<Adaptor3d_HCurve>
") AuxillarCurve;
		const opencascade::handle<Adaptor3d_HCurve> & AuxillarCurve ();
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", "	:rtype: opencascade::handle<Adaptor3d_HSurface>
") AuxillarSurface;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface ();
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("compactdefaultargs") IntCurveSurface_TheCSFunctionOfHInter;
		%feature("autodoc", "	:param S:
	:type S: opencascade::handle<Adaptor3d_HSurface> &
	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: None
") IntCurveSurface_TheCSFunctionOfHInter;
		 IntCurveSurface_TheCSFunctionOfHInter (const opencascade::handle<Adaptor3d_HSurface> & S,const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
};


%extend IntCurveSurface_TheCSFunctionOfHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_TheExactHInter;
class IntCurveSurface_TheExactHInter {
	public:
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	* return the math function which is used to compute the intersection

	:rtype: IntCurveSurface_TheCSFunctionOfHInter
") Function;
		IntCurveSurface_TheCSFunctionOfHInter & Function ();
		%feature("compactdefaultargs") IntCurveSurface_TheExactHInter;
		%feature("autodoc", "	* compute the solution point with the close point MarginCoef is the coefficient for extension of UV bounds. Ex., UFirst -= MarginCoef*(ULast-UFirst)

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param F:
	:type F: IntCurveSurface_TheCSFunctionOfHInter &
	:param TolTangency:
	:type TolTangency: float
	:param MarginCoef: default value is 0.0
	:type MarginCoef: float
	:rtype: None
") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter (const Standard_Real U,const Standard_Real V,const Standard_Real W,const IntCurveSurface_TheCSFunctionOfHInter & F,const Standard_Real TolTangency,const Standard_Real MarginCoef = 0.0);
		%feature("compactdefaultargs") IntCurveSurface_TheExactHInter;
		%feature("autodoc", "	* initialize the parameters to compute the solution

	:param F:
	:type F: IntCurveSurface_TheCSFunctionOfHInter &
	:param TolTangency:
	:type TolTangency: float
	:rtype: None
") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter (const IntCurveSurface_TheCSFunctionOfHInter & F,const Standard_Real TolTangency);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the creation completed without failure.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", "	:rtype: float
") ParameterOnCurve;
		Standard_Real ParameterOnCurve ();
		%feature("compactdefaultargs") ParameterOnSurface;
		%feature("autodoc", "	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") ParameterOnSurface;
		void ParameterOnSurface (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* compute the solution it's possible to write to optimize: IntImp_IntCS inter(S1,C1,Toltangency) math_FunctionSetRoot rsnld(Inter.function()) while ...{ u=... v=... w=... inter.Perform(u,v,w,rsnld) } or IntImp_IntCS inter(Toltangency) inter.SetSurface(S); math_FunctionSetRoot rsnld(Inter.function()) while ...{ C=... inter.SetCurve(C); u=... v=... w=... inter.Perform(u,v,w,rsnld) }

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot &
	:param u0:
	:type u0: float
	:param v0:
	:type v0: float
	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param w0:
	:type w0: float
	:param w1:
	:type w1: float
	:rtype: None
") Perform;
		void Perform (const Standard_Real U,const Standard_Real V,const Standard_Real W,math_FunctionSetRoot & Rsnld,const Standard_Real u0,const Standard_Real v0,const Standard_Real u1,const Standard_Real v1,const Standard_Real w0,const Standard_Real w1);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* returns the intersection point The exception NotDone is raised if IsDone is false. The exception DomainError is raised if IsEmpty is true.

	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
};


%extend IntCurveSurface_TheExactHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class IntCurveSurface_TheHCurveTool {
	public:
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: opencascade::handle<Geom_BSplineCurve>
") BSpline;
		static opencascade::handle<Geom_BSplineCurve> BSpline (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: opencascade::handle<Geom_BezierCurve>
") Bezier;
		static opencascade::handle<Geom_BezierCurve> Bezier (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: gp_Circ
") Circle;
		static gp_Circ Circle (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		static void D0 (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real U,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None
") D1;
		static void D1 (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
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
		static void D2 (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.

	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
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
		static void D3 (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: gp_Elips
") Ellipse;
		static gp_Elips Ellipse (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: gp_Hypr
") Hyperbola;
		static gp_Hypr Hyperbola (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		static void Intervals (const opencascade::handle<Adaptor3d_HCurve> & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: gp_Lin
") Line;
		static gp_Lin Line (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>

	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const opencascade::handle<Adaptor3d_HCurve> & C,const GeomAbs_Shape S);
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real U0,const Standard_Real U1);
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: gp_Parab
") Parabola;
		static gp_Parab Parabola (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: float
") Period;
		static Standard_Real Period (const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the parametric resolution corresponding to the real space resolution <R3d>.

	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real R3d);
		%feature("compactdefaultargs") SamplePars;
		%feature("autodoc", "	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:param Defl:
	:type Defl: float
	:param NbMin:
	:type NbMin: int
	:param Pars:
	:type Pars: opencascade::handle<TColStd_HArray1OfReal> &
	:rtype: void
") SamplePars;
		static void SamplePars (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real U0,const Standard_Real U1,const Standard_Real Defl,const Standard_Integer NbMin,opencascade::handle<TColStd_HArray1OfReal> & Pars);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real U);
};


%extend IntCurveSurface_TheHCurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_TheInterferenceOfHInter;
class IntCurveSurface_TheInterferenceOfHInter : public Intf_Interference {
	public:
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "	* Constructs an empty interference between Polygon and Polyhedron.

	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter ();
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "	* Constructs and computes an interference between the Polygon and the Polyhedron.

	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "	* Constructs and computes an interference between the Straight Line and the Polyhedron.

	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "	* Constructs and computes an interference between the Straight Lines and the Polyhedron.

	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "	* Constructs and computes an interference between the Polygon and the Polyhedron.

	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "	* Constructs and computes an interference between the Straight Line and the Polyhedron.

	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "	* Constructs and computes an interference between the Straight Lines and the Polyhedron.

	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "	* Compares the boundings between the segment of <thePolyg> and the facets of <thePolyh>.

	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Interference;
		void Interference (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "	* Compares the boundings between the segment of <thePolyg> and the facets of <thePolyh>.

	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Interference;
		void Interference (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes an interference between the Polygon and the Polyhedron.

	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Perform;
		void Perform (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes an interference between the Straight Line and the Polyhedron.

	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes an interference between the Straight Lines and the Polyhedron.

	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Perform;
		void Perform (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes an interference between the Polygon and the Polyhedron.

	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes an interference between the Straight Line and the Polyhedron.

	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes an interference between the Straight Lines and the Polyhedron.

	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
};


%extend IntCurveSurface_TheInterferenceOfHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_ThePolygonOfHInter;
class IntCurveSurface_ThePolygonOfHInter {
	public:
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "	* Give an approximation of the parameter on the curve according to the discretization of the Curve.

	:param Index:
	:type Index: int
	:param ParamOnLine:
	:type ParamOnLine: float
	:rtype: float
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve (const Standard_Integer Index,const Standard_Real ParamOnLine);
		%feature("compactdefaultargs") BeginOfSeg;
		%feature("autodoc", "	* Give the point of range Index in the Polygon.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") BeginOfSeg;
		const gp_Pnt  BeginOfSeg (const Standard_Integer Index);
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "	* Give the bounding box of the polygon.

	:rtype: Bnd_Box
") Bounding;
		const Bnd_Box & Bounding ();
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	:param clos:
	:type clos: bool
	:rtype: None
") Closed;
		void Closed (const Standard_Boolean clos);
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	:rtype: bool
") Closed;
		Standard_Boolean Closed ();
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "	:rtype: float
") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
		%feature("compactdefaultargs") EndOfSeg;
		%feature("autodoc", "	* Give the point of range Index in the Polygon.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") EndOfSeg;
		const gp_Pnt  EndOfSeg (const Standard_Integer Index);
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "	* Returns the parameter (On the curve) of the first point of the Polygon

	:rtype: float
") InfParameter;
		Standard_Real InfParameter ();
		%feature("compactdefaultargs") IntCurveSurface_ThePolygonOfHInter;
		%feature("autodoc", "	:param Curve:
	:type Curve: opencascade::handle<Adaptor3d_HCurve> &
	:param NbPnt:
	:type NbPnt: int
	:rtype: None
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter (const opencascade::handle<Adaptor3d_HCurve> & Curve,const Standard_Integer NbPnt);
		%feature("compactdefaultargs") IntCurveSurface_ThePolygonOfHInter;
		%feature("autodoc", "	:param Curve:
	:type Curve: opencascade::handle<Adaptor3d_HCurve> &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param NbPnt:
	:type NbPnt: int
	:rtype: None
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter (const opencascade::handle<Adaptor3d_HCurve> & Curve,const Standard_Real U1,const Standard_Real U2,const Standard_Integer NbPnt);
		%feature("compactdefaultargs") IntCurveSurface_ThePolygonOfHInter;
		%feature("autodoc", "	:param Curve:
	:type Curve: opencascade::handle<Adaptor3d_HCurve> &
	:param Upars:
	:type Upars: TColStd_Array1OfReal &
	:rtype: None
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter (const opencascade::handle<Adaptor3d_HCurve> & Curve,const TColStd_Array1OfReal & Upars);
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	* Give the number of Segments in the polyline.

	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "	:param x:
	:type x: float
	:rtype: None
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation (const Standard_Real x);
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "	* Returns the parameter (On the curve) of the last point of the Polygon

	:rtype: float
") SupParameter;
		Standard_Real SupParameter ();
};


%extend IntCurveSurface_ThePolygonOfHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class IntCurveSurface_ThePolygonToolOfHInter {
	public:
		%feature("compactdefaultargs") BeginOfSeg;
		%feature("autodoc", "	* Give the point of range Index in the Polygon.

	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") BeginOfSeg;
		static const gp_Pnt  BeginOfSeg (const IntCurveSurface_ThePolygonOfHInter & thePolygon,const Standard_Integer Index);
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "	* Give the bounding box of the polygon.

	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:rtype: Bnd_Box
") Bounding;
		static const Bnd_Box & Bounding (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:rtype: bool
") Closed;
		static Standard_Boolean Closed (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:rtype: float
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:rtype: void
") Dump;
		static void Dump (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("compactdefaultargs") EndOfSeg;
		%feature("autodoc", "	* Give the point of range Index in the Polygon.

	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") EndOfSeg;
		static const gp_Pnt  EndOfSeg (const IntCurveSurface_ThePolygonOfHInter & thePolygon,const Standard_Integer Index);
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:rtype: int
") NbSegments;
		static Standard_Integer NbSegments (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
};


%extend IntCurveSurface_ThePolygonToolOfHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class IntCurveSurface_ThePolyhedronToolOfHInter {
	public:
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "	* Give the bounding box of the PolyhedronTool.

	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: Bnd_Box
") Bounding;
		static const Bnd_Box & Bounding (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") ComponentsBounding;
		%feature("autodoc", "	* Give the array of boxes. The box <n> corresponding to the triangle <n>.

	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: opencascade::handle<Bnd_HArray1OfBox>
") ComponentsBounding;
		static const opencascade::handle<Bnd_HArray1OfBox> & ComponentsBounding (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "	* Give the tolerance of the polygon.

	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: float
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: void
") Dump;
		static void Dump (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") GetBorderDeflection;
		%feature("autodoc", "	* This method returns a border deflection of the polyhedron.

	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: float
") GetBorderDeflection;
		static Standard_Real GetBorderDeflection (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") IsOnBound;
		%feature("autodoc", "	* This method returns true if the edge based on points with indices Index1 and Index2 represents a boundary edge. It is necessary to take into account the boundary deflection for this edge.

	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param Index1:
	:type Index1: int
	:param Index2:
	:type Index2: int
	:rtype: bool
") IsOnBound;
		static Standard_Boolean IsOnBound (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Index1,const Standard_Integer Index2);
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "	* Give the number of triangles in this polyedral surface.

	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: int
") NbTriangles;
		static Standard_Integer NbTriangles (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Give the point of index i in the polyedral surface.

	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Point;
		static const gp_Pnt  Point (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Index);
		%feature("compactdefaultargs") TriConnex;
		%feature("autodoc", "	* Give the addresse Tricon of the triangle connexe to the triangle of address Triang by the edge Pivot Pedge and the third point of this connexe triangle. When we are on a free edge TriCon==0 but the function return the value of the triangle in the other side of Pivot on the free edge. Used to turn around a vertex.

	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param Triang:
	:type Triang: int
	:param Pivot:
	:type Pivot: int
	:param Pedge:
	:type Pedge: int
	:param TriCon:
	:type TriCon: int &
	:param OtherP:
	:type OtherP: int &
	:rtype: int
") TriConnex;
		static Standard_Integer TriConnex (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Triang,const Standard_Integer Pivot,const Standard_Integer Pedge,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "	* Give the indices of the 3 points of the triangle of address Index in the PolyhedronTool.

	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param Index:
	:type Index: int
	:param P1:
	:type P1: int &
	:param P2:
	:type P2: int &
	:param P3:
	:type P3: int &
	:rtype: None
") Triangle;
		static void Triangle (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%extend IntCurveSurface_ThePolyhedronToolOfHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_TheQuadCurvExactHInter;
class IntCurveSurface_TheQuadCurvExactHInter {
	public:
		%feature("compactdefaultargs") IntCurveSurface_TheQuadCurvExactHInter;
		%feature("autodoc", "	* Provides the signed distance function : Q(w) and its first derivative dQ(w)/dw

	:param S:
	:type S: opencascade::handle<Adaptor3d_HSurface> &
	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: None
") IntCurveSurface_TheQuadCurvExactHInter;
		 IntCurveSurface_TheQuadCurvExactHInter (const opencascade::handle<Adaptor3d_HSurface> & S,const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* U1 and U2 are the parameters of a segment on the curve.

	:param Index:
	:type Index: int
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:rtype: None
") Intervals;
		void Intervals (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "	:rtype: int
") NbRoots;
		Standard_Integer NbRoots ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") Root;
		Standard_Real Root (const Standard_Integer Index);
};


%extend IntCurveSurface_TheQuadCurvExactHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter;
class IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	* Computes the derivative of the previous function at parameter Param. Derivative always returns True.

	:param Param:
	:type Param: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real Param,Standard_Real &OutValue);
		%feature("compactdefaultargs") IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter;
		%feature("autodoc", "	* Create the function.

	:param Q:
	:type Q: IntSurf_Quadric &
	:param C:
	:type C: opencascade::handle<Adaptor3d_HCurve> &
	:rtype: None
") IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter;
		 IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter (const IntSurf_Quadric & Q,const opencascade::handle<Adaptor3d_HCurve> & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the value of the signed distance between the implicit surface and the point at parameter Param on the parametrised curve. Value always returns True.

	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real Param,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Computes the value and the derivative of the function. returns True.

	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real Param,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntCurveSurface_HInter;
class IntCurveSurface_HInter : public IntCurveSurface_Intersection {
	public:
		%feature("compactdefaultargs") IntCurveSurface_HInter;
		%feature("autodoc", "	* Empty Constructor

	:rtype: None
") IntCurveSurface_HInter;
		 IntCurveSurface_HInter ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Compute the Intersection between the curve and the surface

	:param Curve:
	:type Curve: opencascade::handle<Adaptor3d_HCurve> &
	:param Surface:
	:type Surface: opencascade::handle<Adaptor3d_HSurface> &
	:rtype: None
") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HCurve> & Curve,const opencascade::handle<Adaptor3d_HSurface> & Surface);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Compute the Intersection between the curve and the surface. The Curve is already sampled and its polygon : <Polygon> is given.

	:param Curve:
	:type Curve: opencascade::handle<Adaptor3d_HCurve> &
	:param Polygon:
	:type Polygon: IntCurveSurface_ThePolygonOfHInter &
	:param Surface:
	:type Surface: opencascade::handle<Adaptor3d_HSurface> &
	:rtype: None
") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HCurve> & Curve,const IntCurveSurface_ThePolygonOfHInter & Polygon,const opencascade::handle<Adaptor3d_HSurface> & Surface);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Compute the Intersection between the curve and the surface. The Curve is already sampled and its polygon : <Polygon> is given. The Surface is also sampled and <Polyhedron> is given.

	:param Curve:
	:type Curve: opencascade::handle<Adaptor3d_HCurve> &
	:param ThePolygon:
	:type ThePolygon: IntCurveSurface_ThePolygonOfHInter &
	:param Surface:
	:type Surface: opencascade::handle<Adaptor3d_HSurface> &
	:param Polyhedron:
	:type Polyhedron: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HCurve> & Curve,const IntCurveSurface_ThePolygonOfHInter & ThePolygon,const opencascade::handle<Adaptor3d_HSurface> & Surface,const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Compute the Intersection between the curve and the surface. The Curve is already sampled and its polygon : <Polygon> is given. The Surface is also sampled and <Polyhedron> is given.

	:param Curve:
	:type Curve: opencascade::handle<Adaptor3d_HCurve> &
	:param ThePolygon:
	:type ThePolygon: IntCurveSurface_ThePolygonOfHInter &
	:param Surface:
	:type Surface: opencascade::handle<Adaptor3d_HSurface> &
	:param Polyhedron:
	:type Polyhedron: IntCurveSurface_ThePolyhedronOfHInter &
	:param BndBSB:
	:type BndBSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HCurve> & Curve,const IntCurveSurface_ThePolygonOfHInter & ThePolygon,const opencascade::handle<Adaptor3d_HSurface> & Surface,const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron,Bnd_BoundSortBox & BndBSB);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Compute the Intersection between the curve and the surface. The Surface is already sampled and its polyhedron : <Polyhedron> is given.

	:param Curve:
	:type Curve: opencascade::handle<Adaptor3d_HCurve> &
	:param Surface:
	:type Surface: opencascade::handle<Adaptor3d_HSurface> &
	:param Polyhedron:
	:type Polyhedron: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HCurve> & Curve,const opencascade::handle<Adaptor3d_HSurface> & Surface,const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron);
};


%extend IntCurveSurface_HInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
