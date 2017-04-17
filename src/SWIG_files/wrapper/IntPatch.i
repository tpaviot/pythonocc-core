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
%module (package="OCC") IntPatch

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


%include IntPatch_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef Intf_InterferencePolygon2d IntPatch_SearchPnt;
/* end typedefs declaration */

/* public enums */
enum IntPatch_IType {
	IntPatch_Lin = 0,
	IntPatch_Circle = 1,
	IntPatch_Ellipse = 2,
	IntPatch_Parabola = 3,
	IntPatch_Hyperbola = 4,
	IntPatch_Analytic = 5,
	IntPatch_Walking = 6,
	IntPatch_Restriction = 7,
};

/* end public enums declaration */

%nodefaultctor IntPatch_ALineToWLine;
class IntPatch_ALineToWLine {
	public:
		%feature("compactdefaultargs") IntPatch_ALineToWLine;
		%feature("autodoc", "	:param Quad1:
	:type Quad1: IntSurf_Quadric &
	:param Quad2:
	:type Quad2: IntSurf_Quadric &
	:rtype: None
") IntPatch_ALineToWLine;
		 IntPatch_ALineToWLine (const IntSurf_Quadric & Quad1,const IntSurf_Quadric & Quad2);
		%feature("compactdefaultargs") IntPatch_ALineToWLine;
		%feature("autodoc", "	:param Quad1:
	:type Quad1: IntSurf_Quadric &
	:param Quad2:
	:type Quad2: IntSurf_Quadric &
	:param Deflection:
	:type Deflection: float
	:param PasMaxUV:
	:type PasMaxUV: float
	:param NbMaxPoints:
	:type NbMaxPoints: int
	:rtype: None
") IntPatch_ALineToWLine;
		 IntPatch_ALineToWLine (const IntSurf_Quadric & Quad1,const IntSurf_Quadric & Quad2,const Standard_Real Deflection,const Standard_Real PasMaxUV,const Standard_Integer NbMaxPoints);
		%feature("compactdefaultargs") SetTolParam;
		%feature("autodoc", "	:param aT:
	:type aT: float
	:rtype: None
") SetTolParam;
		void SetTolParam (const Standard_Real aT);
		%feature("compactdefaultargs") TolParam;
		%feature("autodoc", "	:rtype: float
") TolParam;
		Standard_Real TolParam ();
		%feature("compactdefaultargs") SetTolOpenDomain;
		%feature("autodoc", "	:param aT:
	:type aT: float
	:rtype: None
") SetTolOpenDomain;
		void SetTolOpenDomain (const Standard_Real aT);
		%feature("compactdefaultargs") TolOpenDomain;
		%feature("autodoc", "	:rtype: float
") TolOpenDomain;
		Standard_Real TolOpenDomain ();
		%feature("compactdefaultargs") SetTolTransition;
		%feature("autodoc", "	:param aT:
	:type aT: float
	:rtype: None
") SetTolTransition;
		void SetTolTransition (const Standard_Real aT);
		%feature("compactdefaultargs") TolTransition;
		%feature("autodoc", "	:rtype: float
") TolTransition;
		Standard_Real TolTransition ();
		%feature("compactdefaultargs") SetTol3D;
		%feature("autodoc", "	:param aT:
	:type aT: float
	:rtype: None
") SetTol3D;
		void SetTol3D (const Standard_Real aT);
		%feature("compactdefaultargs") Tol3D;
		%feature("autodoc", "	:rtype: float
") Tol3D;
		Standard_Real Tol3D ();
		%feature("compactdefaultargs") SetConstantParameter;
		%feature("autodoc", "	:rtype: None
") SetConstantParameter;
		void SetConstantParameter ();
		%feature("compactdefaultargs") SetUniformAbscissa;
		%feature("autodoc", "	:rtype: None
") SetUniformAbscissa;
		void SetUniformAbscissa ();
		%feature("compactdefaultargs") SetUniformDeflection;
		%feature("autodoc", "	:rtype: None
") SetUniformDeflection;
		void SetUniformDeflection ();
		%feature("compactdefaultargs") MakeWLine;
		%feature("autodoc", "	:param aline:
	:type aline: Handle_IntPatch_ALine &
	:rtype: Handle_IntPatch_WLine
") MakeWLine;
		Handle_IntPatch_WLine MakeWLine (const Handle_IntPatch_ALine & aline);
		%feature("compactdefaultargs") MakeWLine;
		%feature("autodoc", "	:param aline:
	:type aline: Handle_IntPatch_ALine &
	:param paraminf:
	:type paraminf: float
	:param paramsup:
	:type paramsup: float
	:rtype: Handle_IntPatch_WLine
") MakeWLine;
		Handle_IntPatch_WLine MakeWLine (const Handle_IntPatch_ALine & aline,const Standard_Real paraminf,const Standard_Real paramsup);
};


%extend IntPatch_ALineToWLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_ArcFunction;
class IntPatch_ArcFunction : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") IntPatch_ArcFunction;
		%feature("autodoc", "	:rtype: None
") IntPatch_ArcFunction;
		 IntPatch_ArcFunction ();
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "	:param Q:
	:type Q: IntSurf_Quadric &
	:rtype: None
") SetQuadric;
		void SetQuadric (const IntSurf_Quadric & Q);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor2d_HCurve2d & A);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	:param X:
	:type X: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "	:rtype: int
") NbSamples;
		Standard_Integer NbSamples ();
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
		%feature("compactdefaultargs") Valpoint;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt
") Valpoint;
		const gp_Pnt  Valpoint (const Standard_Integer Index);
		%feature("compactdefaultargs") Quadric;
		%feature("autodoc", "	:rtype: IntSurf_Quadric
") Quadric;
		const IntSurf_Quadric & Quadric ();
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Arc;
		Handle_Adaptor2d_HCurve2d Arc ();
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") Surface;
		Handle_Adaptor3d_HSurface Surface ();
};


%extend IntPatch_ArcFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_CSFunction;
class IntPatch_CSFunction : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") IntPatch_CSFunction;
		%feature("autodoc", "	* S1 is the surface on which the intersection is searched. C is a curve on the surface S2.

	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:rtype: None
") IntPatch_CSFunction;
		 IntPatch_CSFunction (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor2d_HCurve2d & C,const Handle_Adaptor3d_HSurface & S2);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
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
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") AuxillarSurface;
		Handle_Adaptor3d_HSurface AuxillarSurface ();
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") AuxillarCurve;
		Handle_Adaptor2d_HCurve2d AuxillarCurve ();
};


%extend IntPatch_CSFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_CurvIntSurf;
class IntPatch_CurvIntSurf {
	public:
		%feature("compactdefaultargs") IntPatch_CurvIntSurf;
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param F:
	:type F: IntPatch_CSFunction &
	:param TolTangency:
	:type TolTangency: float
	:param MarginCoef: default value is 0.0
	:type MarginCoef: float
	:rtype: None
") IntPatch_CurvIntSurf;
		 IntPatch_CurvIntSurf (const Standard_Real U,const Standard_Real V,const Standard_Real W,const IntPatch_CSFunction & F,const Standard_Real TolTangency,const Standard_Real MarginCoef = 0.0);
		%feature("compactdefaultargs") IntPatch_CurvIntSurf;
		%feature("autodoc", "	:param F:
	:type F: IntPatch_CSFunction &
	:param TolTangency:
	:type TolTangency: float
	:rtype: None
") IntPatch_CurvIntSurf;
		 IntPatch_CurvIntSurf (const IntPatch_CSFunction & F,const Standard_Real TolTangency);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param U:
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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
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
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "	:rtype: IntPatch_CSFunction
") Function;
		IntPatch_CSFunction & Function ();
};


%extend IntPatch_CurvIntSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class IntPatch_HCurve2dTool {
	public:
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const Handle_Adaptor2d_HCurve2d & C,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		static void Intervals (const Handle_Adaptor2d_HCurve2d & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Period;
		static Standard_Real Period (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		static gp_Pnt2d Value (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: void
") D0;
		static void D0 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: void
") D1;
		static void D1 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
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
		static void D2 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
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
		static void D3 (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		static gp_Vec2d DN (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the parametric resolution corresponding to the real space resolution <R3d>.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Lin2d
") Line;
		static gp_Lin2d Line (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Circ2d
") Circle;
		static gp_Circ2d Circle (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: Handle_Geom2d_BezierCurve
") Bezier;
		static Handle_Geom2d_BezierCurve Bezier (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: Handle_Geom2d_BSplineCurve
") BSpline;
		static Handle_Geom2d_BSplineCurve BSpline (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const Handle_Adaptor2d_HCurve2d & C,const Standard_Real U0,const Standard_Real U1);
};


%extend IntPatch_HCurve2dTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_HInterTool;
class IntPatch_HInterTool {
	public:
		%feature("compactdefaultargs") IntPatch_HInterTool;
		%feature("autodoc", "	:rtype: None
") IntPatch_HInterTool;
		 IntPatch_HInterTool ();
		%feature("compactdefaultargs") SingularOnUMin;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") SingularOnUMin;
		static Standard_Boolean SingularOnUMin (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") SingularOnUMax;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") SingularOnUMax;
		static Standard_Boolean SingularOnUMax (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") SingularOnVMin;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") SingularOnVMin;
		static Standard_Boolean SingularOnVMin (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") SingularOnVMax;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: bool
") SingularOnVMax;
		static Standard_Boolean SingularOnVMax (const Handle_Adaptor3d_HSurface & S);
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
		%feature("compactdefaultargs") NbSamplePoints;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: int
") NbSamplePoints;
		Standard_Integer NbSamplePoints (const Handle_Adaptor3d_HSurface & S);
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Index:
	:type Index: int
	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") SamplePoint;
		void SamplePoint (const Handle_Adaptor3d_HSurface & S,const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") HasBeenSeen;
		%feature("autodoc", "	* Returns True if all the intersection point and edges are known on the Arc. The intersection point are given as vertices. The intersection edges are given as intervals between two vertices.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: bool
") HasBeenSeen;
		static Standard_Boolean HasBeenSeen (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") NbSamplesOnArc;
		%feature("autodoc", "	* returns the number of points which is used to make a sample on the arc. this number is a function of the Surface and the CurveOnSurface complexity.

	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: int
") NbSamplesOnArc;
		static Standard_Integer NbSamplesOnArc (const Handle_Adaptor2d_HCurve2d & A);
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	* Returns the parametric limits on the arc C. These limits must be finite : they are either the real limits of the arc, for a finite arc, or a bounding box for an infinite arc.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Ufirst:
	:type Ufirst: float &
	:param Ulast:
	:type Ulast: float &
	:rtype: void
") Bounds;
		static void Bounds (const Handle_Adaptor2d_HCurve2d & C,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* Projects the point P on the arc C. If the methods returns Standard_True, the projection is successful, and Paramproj is the parameter on the arc of the projected point, Ptproj is the projected Point. If the method returns Standard_False, Param proj and Ptproj are not significant.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param P:
	:type P: gp_Pnt2d
	:param Paramproj:
	:type Paramproj: float &
	:param Ptproj:
	:type Ptproj: gp_Pnt2d
	:rtype: bool
") Project;
		static Standard_Boolean Project (const Handle_Adaptor2d_HCurve2d & C,const gp_Pnt2d & P,Standard_Real &OutValue,gp_Pnt2d & Ptproj);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* Returns the parametric tolerance used to consider that the vertex and another point meet, i-e if Abs(parameter(Vertex) - parameter(OtherPnt))<= Tolerance, the points are 'merged'.

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Tolerance;
		static Standard_Real Tolerance (const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter of the vertex V on the arc A.

	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: float
") Parameter;
		static Standard_Real Parameter (const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	* Returns the number of intersection points on the arc A.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: int
") NbPoints;
		static Standard_Integer NbPoints (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the value (Pt), the tolerance (Tol), and the parameter (U) on the arc A , of the intersection point of range Index.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Index:
	:type Index: int
	:param Pt:
	:type Pt: gp_Pnt
	:param Tol:
	:type Tol: float &
	:param U:
	:type U: float &
	:rtype: void
") Value;
		static void Value (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,gp_Pnt & Pt,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "	* Returns True if the intersection point of range Index corresponds with a vertex on the arc A.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Index:
	:type Index: int
	:rtype: bool
") IsVertex;
		static Standard_Boolean IsVertex (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* When IsVertex returns True, this method returns the vertex on the arc A.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Index:
	:type Index: int
	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:rtype: void
") Vertex;
		static void Vertex (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,Handle_Adaptor3d_HVertex & V);
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	* returns the number of part of A solution of the of intersection problem.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: int
") NbSegments;
		static Standard_Integer NbSegments (const Handle_Adaptor2d_HCurve2d & C);
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "	* Returns True when the segment of range Index is not open at the left side. In that case, IndFirst is the range in the list intersection points (see NbPoints) of the one which defines the left bound of the segment. Otherwise, the method has to return False, and IndFirst has no meaning.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Index:
	:type Index: int
	:param IndFirst:
	:type IndFirst: int &
	:rtype: bool
") HasFirstPoint;
		static Standard_Boolean HasFirstPoint (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,Standard_Integer &OutValue);
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "	* Returns True when the segment of range Index is not open at the right side. In that case, IndLast is the range in the list intersection points (see NbPoints) of the one which defines the right bound of the segment. Otherwise, the method has to return False, and IndLast has no meaning.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:param Index:
	:type Index: int
	:param IndLast:
	:type IndLast: int &
	:rtype: bool
") HasLastPoint;
		static Standard_Boolean HasLastPoint (const Handle_Adaptor2d_HCurve2d & C,const Standard_Integer Index,Standard_Integer &OutValue);
		%feature("compactdefaultargs") IsAllSolution;
		%feature("autodoc", "	* Returns True when the whole restriction is solution of the intersection problem.

	:param C:
	:type C: Handle_Adaptor2d_HCurve2d &
	:rtype: bool
") IsAllSolution;
		static Standard_Boolean IsAllSolution (const Handle_Adaptor2d_HCurve2d & C);
};


%extend IntPatch_HInterTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_ImpImpIntersection;
class IntPatch_ImpImpIntersection {
	public:
		%feature("compactdefaultargs") IntPatch_ImpImpIntersection;
		%feature("autodoc", "	:rtype: None
") IntPatch_ImpImpIntersection;
		 IntPatch_ImpImpIntersection ();
		%feature("compactdefaultargs") IntPatch_ImpImpIntersection;
		%feature("autodoc", "	* Flag theIsReqToKeepRLine has been enterred only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. When intersection result returns IntPatch_RLine and another IntPatch_Line (not restriction) we (in case of theIsReqToKeepRLine==True) will always keep both lines even if they are coincided.

	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param D1:
	:type D1: Handle_Adaptor3d_TopolTool &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param D2:
	:type D2: Handle_Adaptor3d_TopolTool &
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:param theIsReqToKeepRLine: default value is Standard_False
	:type theIsReqToKeepRLine: bool
	:rtype: None
") IntPatch_ImpImpIntersection;
		 IntPatch_ImpImpIntersection (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_TopolTool & D1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_TopolTool & D2,const Standard_Real TolArc,const Standard_Real TolTang,const Standard_Boolean theIsReqToKeepRLine = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Flag theIsReqToKeepRLine has been enterred only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. When intersection result returns IntPatch_RLine and another IntPatch_Line (not restriction) we (in case of theIsReqToKeepRLine==True) will always keep both lines even if they are coincided.

	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param D1:
	:type D1: Handle_Adaptor3d_TopolTool &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param D2:
	:type D2: Handle_Adaptor3d_TopolTool &
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:param isTheTrimmed: default value is Standard_False
	:type isTheTrimmed: bool
	:param theIsReqToKeepRLine: default value is Standard_False
	:type theIsReqToKeepRLine: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_TopolTool & D1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_TopolTool & D2,const Standard_Real TolArc,const Standard_Real TolTang,const Standard_Boolean isTheTrimmed = Standard_False,const Standard_Boolean theIsReqToKeepRLine = Standard_False);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the calculus was succesfull.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns true if the is no intersection.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "	* Returns True if the two patches are considered as entierly tangent, i-e every restriction arc of one patch is inside the geometric base of the otehr patch.

	:rtype: bool
") TangentFaces;
		Standard_Boolean TangentFaces ();
		%feature("compactdefaultargs") OppositeFaces;
		%feature("autodoc", "	* Returns True when the TangentFaces returns True and the normal vectors evaluated at a point on the first and the second surface are opposite. The exception DomainError is raised if TangentFaces returns False.

	:rtype: bool
") OppositeFaces;
		Standard_Boolean OppositeFaces ();
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "	* Returns the number of 'single' points.

	:rtype: int
") NbPnts;
		Standard_Integer NbPnts ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of range Index. An exception is raised if Index<=0 or Index>NbPnt.

	:param Index:
	:type Index: int
	:rtype: IntPatch_Point
") Point;
		const IntPatch_Point & Point (const Standard_Integer Index);
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "	* Returns the number of intersection lines.

	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.

	:param Index:
	:type Index: int
	:rtype: Handle_IntPatch_Line
") Line;
		Handle_IntPatch_Line Line (const Standard_Integer Index);
};


%extend IntPatch_ImpImpIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_ImpPrmIntersection;
class IntPatch_ImpPrmIntersection {
	public:
		%feature("compactdefaultargs") IntPatch_ImpPrmIntersection;
		%feature("autodoc", "	:rtype: None
") IntPatch_ImpPrmIntersection;
		 IntPatch_ImpPrmIntersection ();
		%feature("compactdefaultargs") IntPatch_ImpPrmIntersection;
		%feature("autodoc", "	:param Surf1:
	:type Surf1: Handle_Adaptor3d_HSurface &
	:param D1:
	:type D1: Handle_Adaptor3d_TopolTool &
	:param Surf2:
	:type Surf2: Handle_Adaptor3d_HSurface &
	:param D2:
	:type D2: Handle_Adaptor3d_TopolTool &
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:param Fleche:
	:type Fleche: float
	:param Pas:
	:type Pas: float
	:rtype: None
") IntPatch_ImpPrmIntersection;
		 IntPatch_ImpPrmIntersection (const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor3d_TopolTool & D1,const Handle_Adaptor3d_HSurface & Surf2,const Handle_Adaptor3d_TopolTool & D2,const Standard_Real TolArc,const Standard_Real TolTang,const Standard_Real Fleche,const Standard_Real Pas);
		%feature("compactdefaultargs") SetStartPoint;
		%feature("autodoc", "	* to search for solution from the given point

	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") SetStartPoint;
		void SetStartPoint (const Standard_Real U,const Standard_Real V);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Surf1:
	:type Surf1: Handle_Adaptor3d_HSurface &
	:param D1:
	:type D1: Handle_Adaptor3d_TopolTool &
	:param Surf2:
	:type Surf2: Handle_Adaptor3d_HSurface &
	:param D2:
	:type D2: Handle_Adaptor3d_TopolTool &
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:param Fleche:
	:type Fleche: float
	:param Pas:
	:type Pas: float
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Surf1,const Handle_Adaptor3d_TopolTool & D1,const Handle_Adaptor3d_HSurface & Surf2,const Handle_Adaptor3d_TopolTool & D2,const Standard_Real TolArc,const Standard_Real TolTang,const Standard_Real Fleche,const Standard_Real Pas);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the calculus was succesfull.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns true if the is no intersection.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "	* Returns the number of 'single' points.

	:rtype: int
") NbPnts;
		Standard_Integer NbPnts ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of range Index. An exception is raised if Index<=0 or Index>NbPnt.

	:param Index:
	:type Index: int
	:rtype: IntPatch_Point
") Point;
		const IntPatch_Point & Point (const Standard_Integer Index);
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "	* Returns the number of intersection lines.

	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.

	:param Index:
	:type Index: int
	:rtype: Handle_IntPatch_Line
") Line;
		Handle_IntPatch_Line Line (const Standard_Integer Index);
};


%extend IntPatch_ImpPrmIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_InterferencePolyhedron;
class IntPatch_InterferencePolyhedron : public Intf_Interference {
	public:
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "	* Constructs an empty interference of Polyhedron.

	:rtype: None
") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron ();
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "	* Constructs and computes an interference between the two Polyhedra.

	:param Obje1:
	:type Obje1: IntPatch_Polyhedron &
	:param Obje2:
	:type Obje2: IntPatch_Polyhedron &
	:rtype: None
") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron (const IntPatch_Polyhedron & Obje1,const IntPatch_Polyhedron & Obje2);
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "	* Constructs and computes the self interference of a Polyhedron.

	:param Obje:
	:type Obje: IntPatch_Polyhedron &
	:rtype: None
") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron (const IntPatch_Polyhedron & Obje);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the interference between the two Polyhedra.

	:param Obje1:
	:type Obje1: IntPatch_Polyhedron &
	:param Obje2:
	:type Obje2: IntPatch_Polyhedron &
	:rtype: None
") Perform;
		void Perform (const IntPatch_Polyhedron & Obje1,const IntPatch_Polyhedron & Obje2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the self interference of a Polyhedron.

	:param Obje:
	:type Obje: IntPatch_Polyhedron &
	:rtype: None
") Perform;
		void Perform (const IntPatch_Polyhedron & Obje);
};


%extend IntPatch_InterferencePolyhedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_Intersection;
class IntPatch_Intersection {
	public:
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", "	:rtype: None
") IntPatch_Intersection;
		 IntPatch_Intersection ();
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param D1:
	:type D1: Handle_Adaptor3d_TopolTool &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param D2:
	:type D2: Handle_Adaptor3d_TopolTool &
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:rtype: None
") IntPatch_Intersection;
		 IntPatch_Intersection (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_TopolTool & D1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_TopolTool & D2,const Standard_Real TolArc,const Standard_Real TolTang);
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param D1:
	:type D1: Handle_Adaptor3d_TopolTool &
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:rtype: None
") IntPatch_Intersection;
		 IntPatch_Intersection (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_TopolTool & D1,const Standard_Real TolArc,const Standard_Real TolTang);
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "	* Set the tolerances used by the algorithms: --- Implicit - Parametric --- Parametric - Parametric --- Implicit - Implicit //! TolArc is used to compute the intersections between the restrictions of a surface and a walking line. //! TolTang is used to compute the points on a walking line, and in geometric algorithms. //! Fleche is a parameter used in the walking algorithms to provide small curvatures on a line. //! UVMaxStep is a parameter used in the walking algorithms to compute the distance between to points in their respective parametrtic spaces.

	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:param UVMaxStep:
	:type UVMaxStep: float
	:param Fleche:
	:type Fleche: float
	:rtype: None
") SetTolerances;
		void SetTolerances (const Standard_Real TolArc,const Standard_Real TolTang,const Standard_Real UVMaxStep,const Standard_Real Fleche);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Flag theIsReqToKeepRLine has been enterred only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. When intersection result returns IntPatch_RLine and another IntPatch_Line (not restriction) we (in case of theIsReqToKeepRLine==True) will always keep both lines even if they are coincided.

	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param D1:
	:type D1: Handle_Adaptor3d_TopolTool &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param D2:
	:type D2: Handle_Adaptor3d_TopolTool &
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:param isGeomInt: default value is Standard_True
	:type isGeomInt: bool
	:param theIsReqToKeepRLine: default value is Standard_False
	:type theIsReqToKeepRLine: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_TopolTool & D1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_TopolTool & D2,const Standard_Real TolArc,const Standard_Real TolTang,const Standard_Boolean isGeomInt = Standard_True,const Standard_Boolean theIsReqToKeepRLine = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* If isGeomInt == Standard_False, then method Param-Param intersection will be used.

	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param D1:
	:type D1: Handle_Adaptor3d_TopolTool &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param D2:
	:type D2: Handle_Adaptor3d_TopolTool &
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:param LOfPnts:
	:type LOfPnts: IntSurf_ListOfPntOn2S &
	:param RestrictLine: default value is Standard_True
	:type RestrictLine: bool
	:param isGeomInt: default value is Standard_True
	:type isGeomInt: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_TopolTool & D1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_TopolTool & D2,const Standard_Real TolArc,const Standard_Real TolTang,IntSurf_ListOfPntOn2S & LOfPnts,const Standard_Boolean RestrictLine = Standard_True,const Standard_Boolean isGeomInt = Standard_True);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param D1:
	:type D1: Handle_Adaptor3d_TopolTool &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param D2:
	:type D2: Handle_Adaptor3d_TopolTool &
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_TopolTool & D1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_TopolTool & D2,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real TolArc,const Standard_Real TolTang);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param D1:
	:type D1: Handle_Adaptor3d_TopolTool &
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_TopolTool & D1,const Standard_Real TolArc,const Standard_Real TolTang);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the calculus was succesfull.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns true if the is no intersection.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "	* Returns True if the two patches are considered as entierly tangent, i-e every restriction arc of one patch is inside the geometric base of the other patch.

	:rtype: bool
") TangentFaces;
		Standard_Boolean TangentFaces ();
		%feature("compactdefaultargs") OppositeFaces;
		%feature("autodoc", "	* Returns True when the TangentFaces returns True and the normal vectors evaluated at a point on the first and the second surface are opposite. The exception DomainError is raised if TangentFaces returns False.

	:rtype: bool
") OppositeFaces;
		Standard_Boolean OppositeFaces ();
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "	* Returns the number of 'single' points.

	:rtype: int
") NbPnts;
		Standard_Integer NbPnts ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point of range Index. An exception is raised if Index<=0 or Index>NbPnt.

	:param Index:
	:type Index: int
	:rtype: IntPatch_Point
") Point;
		const IntPatch_Point & Point (const Standard_Integer Index);
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "	* Returns the number of intersection lines.

	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.

	:param Index:
	:type Index: int
	:rtype: Handle_IntPatch_Line
") Line;
		Handle_IntPatch_Line Line (const Standard_Integer Index);
		%feature("compactdefaultargs") SequenceOfLine;
		%feature("autodoc", "	:rtype: IntPatch_SequenceOfLine
") SequenceOfLine;
		const IntPatch_SequenceOfLine & SequenceOfLine ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dump of each result line. Mode for more accurate dumps.

	:param Mode:
	:type Mode: int
	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param D1:
	:type D1: Handle_Adaptor3d_TopolTool &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param D2:
	:type D2: Handle_Adaptor3d_TopolTool &
	:rtype: None
") Dump;
		void Dump (const Standard_Integer Mode,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_TopolTool & D1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_TopolTool & D2);
};


%extend IntPatch_Intersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_Line;
class IntPatch_Line : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* To set the values returned by IsUIsoS1,.... The default values are False.

	:param Uiso1:
	:type Uiso1: bool
	:param Viso1:
	:type Viso1: bool
	:param Uiso2:
	:type Uiso2: bool
	:param Viso2:
	:type Viso2: bool
	:rtype: None
") SetValue;
		void SetValue (const Standard_Boolean Uiso1,const Standard_Boolean Viso1,const Standard_Boolean Uiso2,const Standard_Boolean Viso2);
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "	* Returns the type of geometry 3d (Line, Circle, Parabola, Hyperbola, Ellipse, Analytic, Walking, Restriction)

	:rtype: IntPatch_IType
") ArcType;
		IntPatch_IType ArcType ();
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	* Returns True if the intersection is a line of tangency between the 2 patches.

	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "	* Returns the type of the transition of the line for the first surface. The transition is 'constant' along the line. The transition is IN if the line is oriented in such a way that the system of vector (N1,N2,T) is right-handed, where N1 is the normal to the first surface at a point P, N2 is the normal to the second surface at a point P, T is the tangent to the intersection line at P. If the system of vector is left-handed, the transition is OUT. When N1 and N2 are colinear all along the intersection line, the transition will be - TOUCH, if it is possible to use the 2nd derivatives to determine the position of one surafce compared to the other (see Situation) - UNDECIDED otherwise. //! If one of the transition is TOUCH or UNDECIDED, the other one has got the same value.

	:rtype: IntSurf_TypeTrans
") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1 ();
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "	* Returns the type of the transition of the line for the second surface. The transition is 'constant' along the line.

	:rtype: IntSurf_TypeTrans
") TransitionOnS2;
		IntSurf_TypeTrans TransitionOnS2 ();
		%feature("compactdefaultargs") SituationS1;
		%feature("autodoc", "	* Returns the situation (INSIDE/OUTSIDE/UNKNOWN) of the first patch compared to the second one, when TransitionOnS1 or TransitionOnS2 returns TOUCH. Otherwise, an exception is raised.

	:rtype: IntSurf_Situation
") SituationS1;
		IntSurf_Situation SituationS1 ();
		%feature("compactdefaultargs") SituationS2;
		%feature("autodoc", "	* Returns the situation (INSIDE/OUTSIDE/UNKNOWN) of the second patch compared to the first one, when TransitionOnS1 or TransitionOnS2 returns TOUCH. Otherwise, an exception is raised.

	:rtype: IntSurf_Situation
") SituationS2;
		IntSurf_Situation SituationS2 ();
		%feature("compactdefaultargs") IsUIsoOnS1;
		%feature("autodoc", "	* Returns True if the intersection is a U isoparametric curve on the first patch.

	:rtype: bool
") IsUIsoOnS1;
		Standard_Boolean IsUIsoOnS1 ();
		%feature("compactdefaultargs") IsVIsoOnS1;
		%feature("autodoc", "	* Returns True if the intersection is a V isoparametric curve on the first patch.

	:rtype: bool
") IsVIsoOnS1;
		Standard_Boolean IsVIsoOnS1 ();
		%feature("compactdefaultargs") IsUIsoOnS2;
		%feature("autodoc", "	* Returns True if the intersection is a U isoparametric curve on the second patch.

	:rtype: bool
") IsUIsoOnS2;
		Standard_Boolean IsUIsoOnS2 ();
		%feature("compactdefaultargs") IsVIsoOnS2;
		%feature("autodoc", "	* Returns True if the intersection is a V isoparametric curve on the second patch.

	:rtype: bool
") IsVIsoOnS2;
		Standard_Boolean IsVIsoOnS2 ();
};


%extend IntPatch_Line {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntPatch_Line(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntPatch_Line::Handle_IntPatch_Line %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntPatch_Line;
class Handle_IntPatch_Line : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IntPatch_Line();
        Handle_IntPatch_Line(const Handle_IntPatch_Line &aHandle);
        Handle_IntPatch_Line(const IntPatch_Line *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntPatch_Line DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntPatch_Line {
    IntPatch_Line* _get_reference() {
    return (IntPatch_Line*)$self->Access();
    }
};

%extend Handle_IntPatch_Line {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntPatch_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_LineConstructor;
class IntPatch_LineConstructor {
	public:
		%feature("compactdefaultargs") IntPatch_LineConstructor;
		%feature("autodoc", "	:param mode:
	:type mode: int
	:rtype: None
") IntPatch_LineConstructor;
		 IntPatch_LineConstructor (const Standard_Integer mode);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param SL:
	:type SL: IntPatch_SequenceOfLine &
	:param L:
	:type L: Handle_IntPatch_Line &
	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param D1:
	:type D1: Handle_Adaptor3d_TopolTool &
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param D2:
	:type D2: Handle_Adaptor3d_TopolTool &
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const IntPatch_SequenceOfLine & SL,const Handle_IntPatch_Line & L,const Handle_Adaptor3d_HSurface & S1,const Handle_Adaptor3d_TopolTool & D1,const Handle_Adaptor3d_HSurface & S2,const Handle_Adaptor3d_TopolTool & D2,const Standard_Real Tol);
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:param index:
	:type index: int
	:rtype: Handle_IntPatch_Line
") Line;
		Handle_IntPatch_Line Line (const Standard_Integer index);
};


%extend IntPatch_LineConstructor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_Point;
class IntPatch_Point {
	public:
		%feature("compactdefaultargs") IntPatch_Point;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") IntPatch_Point;
		 IntPatch_Point ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets the values of a point which is on no domain, when both surfaces are implicit ones. If Tangent is True, the point is a point of tangency between the surfaces.

	:param Pt:
	:type Pt: gp_Pnt
	:param Tol:
	:type Tol: float
	:param Tangent:
	:type Tangent: bool
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pt,const Standard_Real Tol,const Standard_Boolean Tangent);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Pt:
	:type Pt: gp_Pnt
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & Pt);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "	* Sets the values of the parameters of the point on each surface.

	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: None
") SetParameters;
		void SetParameters (const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2);
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "	* Set the value of the parameter on the intersection line.

	:param Para:
	:type Para: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real Para);
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "	* Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface. If OnFirst is True, the point is on the domain of the first patch, otherwise the point is on the domain of the second surface.

	:param OnFirst:
	:type OnFirst: bool
	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:rtype: None
") SetVertex;
		void SetVertex (const Standard_Boolean OnFirst,const Handle_Adaptor3d_HVertex & V);
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "	* Sets the values of a point which is on one of the domain, when both surfaces are implicit ones. If OnFirst is True, the point is on the domain of the first patch, otherwise the point is on the domain of the second surface.

	:param OnFirst:
	:type OnFirst: bool
	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:param Param:
	:type Param: float
	:param TLine:
	:type TLine: IntSurf_Transition &
	:param TArc:
	:type TArc: IntSurf_Transition &
	:rtype: None
") SetArc;
		void SetArc (const Standard_Boolean OnFirst,const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Param,const IntSurf_Transition & TLine,const IntSurf_Transition & TArc);
		%feature("compactdefaultargs") SetMultiple;
		%feature("autodoc", "	* Sets (or unsets) the point as a point on several intersection line.

	:param IsMult:
	:type IsMult: bool
	:rtype: None
") SetMultiple;
		void SetMultiple (const Standard_Boolean IsMult);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the intersection point (geometric information).

	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("compactdefaultargs") ParameterOnLine;
		%feature("autodoc", "	* This method returns the parameter of the point on the intersection line. If the points does not belong to an intersection line, the value returned does not have any sens.

	:rtype: float
") ParameterOnLine;
		Standard_Real ParameterOnLine ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	* This method returns the fuzziness on the point.

	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "	* Returns True if the Point is a tangency point between the surfaces. If the Point is on one of the domain (IsOnDomS1 returns True or IsOnDomS2 returns True), an exception is raised.

	:rtype: bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "	* Returns the parameters on the first surface of the point.

	:param U1:
	:type U1: float &
	:param V1:
	:type V1: float &
	:rtype: None
") ParametersOnS1;
		void ParametersOnS1 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "	* Returns the parameters on the second surface of the point.

	:param U2:
	:type U2: float &
	:param V2:
	:type V2: float &
	:rtype: None
") ParametersOnS2;
		void ParametersOnS2 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "	* Returns True if the point belongs to several intersection lines.

	:rtype: bool
") IsMultiple;
		Standard_Boolean IsMultiple ();
		%feature("compactdefaultargs") IsOnDomS1;
		%feature("autodoc", "	* Returns True if the point is on a boundary of the domain of the first patch.

	:rtype: bool
") IsOnDomS1;
		Standard_Boolean IsOnDomS1 ();
		%feature("compactdefaultargs") IsVertexOnS1;
		%feature("autodoc", "	* Returns True if the point is a vertex on the initial restriction facet of the first surface.

	:rtype: bool
") IsVertexOnS1;
		Standard_Boolean IsVertexOnS1 ();
		%feature("compactdefaultargs") VertexOnS1;
		%feature("autodoc", "	* Returns the information about the point when it is on the domain of the first patch, i-e when the function IsVertexOnS1 returns True. Otherwise, an exception is raised.

	:rtype: Handle_Adaptor3d_HVertex
") VertexOnS1;
		Handle_Adaptor3d_HVertex VertexOnS1 ();
		%feature("compactdefaultargs") ArcOnS1;
		%feature("autodoc", "	* Returns the arc of restriction containing the vertex. The exception DomainError is raised if IsOnDomS1 returns False.

	:rtype: Handle_Adaptor2d_HCurve2d
") ArcOnS1;
		Handle_Adaptor2d_HCurve2d ArcOnS1 ();
		%feature("compactdefaultargs") TransitionLineArc1;
		%feature("autodoc", "	* Returns the transition of the point on the intersection line with the arc on S1. The exception DomainError is raised if IsOnDomS1 returns False.

	:rtype: IntSurf_Transition
") TransitionLineArc1;
		const IntSurf_Transition & TransitionLineArc1 ();
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "	* Returns the transition between the intersection line returned by the method Line and the arc on S1 returned by ArcOnS1(). The exception DomainError is raised if IsOnDomS1 returns False.

	:rtype: IntSurf_Transition
") TransitionOnS1;
		const IntSurf_Transition & TransitionOnS1 ();
		%feature("compactdefaultargs") ParameterOnArc1;
		%feature("autodoc", "	* Returns the parameter of the point on the arc returned by the method ArcOnS2. The exception DomainError is raised if IsOnDomS1 returns False.

	:rtype: float
") ParameterOnArc1;
		Standard_Real ParameterOnArc1 ();
		%feature("compactdefaultargs") IsOnDomS2;
		%feature("autodoc", "	* Returns True if the point is on a boundary of the domain of the second patch.

	:rtype: bool
") IsOnDomS2;
		Standard_Boolean IsOnDomS2 ();
		%feature("compactdefaultargs") IsVertexOnS2;
		%feature("autodoc", "	* Returns True if the point is a vertex on the initial restriction facet of the first surface.

	:rtype: bool
") IsVertexOnS2;
		Standard_Boolean IsVertexOnS2 ();
		%feature("compactdefaultargs") VertexOnS2;
		%feature("autodoc", "	* Returns the information about the point when it is on the domain of the second patch, i-e when the function IsVertexOnS2 returns True. Otherwise, an exception is raised.

	:rtype: Handle_Adaptor3d_HVertex
") VertexOnS2;
		Handle_Adaptor3d_HVertex VertexOnS2 ();
		%feature("compactdefaultargs") ArcOnS2;
		%feature("autodoc", "	* Returns the arc of restriction containing the vertex. The exception DomainError is raised if IsOnDomS2 returns False.

	:rtype: Handle_Adaptor2d_HCurve2d
") ArcOnS2;
		Handle_Adaptor2d_HCurve2d ArcOnS2 ();
		%feature("compactdefaultargs") TransitionLineArc2;
		%feature("autodoc", "	* Returns the transition of the point on the intersection line with the arc on S2. The exception DomainError is raised if IsOnDomS2 returns False.

	:rtype: IntSurf_Transition
") TransitionLineArc2;
		const IntSurf_Transition & TransitionLineArc2 ();
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "	* Returns the transition between the intersection line returned by the method Line and the arc on S2 returned by ArcOnS2. The exception DomainError is raised if IsOnDomS2 returns False.

	:rtype: IntSurf_Transition
") TransitionOnS2;
		const IntSurf_Transition & TransitionOnS2 ();
		%feature("compactdefaultargs") ParameterOnArc2;
		%feature("autodoc", "	* Returns the parameter of the point on the arc returned by the method ArcOnS2. The exception DomainError is raised if IsOnDomS2 returns False.

	:rtype: float
") ParameterOnArc2;
		Standard_Real ParameterOnArc2 ();
		%feature("compactdefaultargs") PntOn2S;
		%feature("autodoc", "	* Returns the PntOn2S (geometric Point and the parameters)

	:rtype: IntSurf_PntOn2S
") PntOn2S;
		const IntSurf_PntOn2S & PntOn2S ();
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Returns the parameters on the first and on the second surface of the point.

	:param U1:
	:type U1: float &
	:param V1:
	:type V1: float &
	:param U2:
	:type U2: float &
	:param V2:
	:type V2: float &
	:rtype: None
") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ReverseTransition;
		%feature("autodoc", "	:rtype: None
") ReverseTransition;
		void ReverseTransition ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%extend IntPatch_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_Polygo;
class IntPatch_Polygo : public Intf_Polygon2d {
	public:
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:rtype: float
") Error;
		Standard_Real Error ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		virtual Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d
") Point;
		virtual gp_Pnt2d Point (const Standard_Integer Index);
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "	* Returns the tolerance of the polygon.

	:rtype: float
") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation ();
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	* Returns the number of Segments in the polyline.

	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "	* Returns the points of the segment <Index> in the Polygon.

	:param theIndex:
	:type theIndex: int
	:param theBegin:
	:type theBegin: gp_Pnt2d
	:param theEnd:
	:type theEnd: gp_Pnt2d
	:rtype: None
") Segment;
		void Segment (const Standard_Integer theIndex,gp_Pnt2d & theBegin,gp_Pnt2d & theEnd);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%extend IntPatch_Polygo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_PrmPrmIntersection;
class IntPatch_PrmPrmIntersection {
	public:
		%feature("compactdefaultargs") IntPatch_PrmPrmIntersection;
		%feature("autodoc", "	* Empty Constructor

	:rtype: None
") IntPatch_PrmPrmIntersection;
		 IntPatch_PrmPrmIntersection ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the intersection between <Caro1> and <Caro2>. Associated Polyhedrons <Polyhedron1> and <Polyhedron2> are given.

	:param Caro1:
	:type Caro1: Handle_Adaptor3d_HSurface &
	:param Polyhedron1:
	:type Polyhedron1: IntPatch_Polyhedron &
	:param Domain1:
	:type Domain1: Handle_Adaptor3d_TopolTool &
	:param Caro2:
	:type Caro2: Handle_Adaptor3d_HSurface &
	:param Polyhedron2:
	:type Polyhedron2: IntPatch_Polyhedron &
	:param Domain2:
	:type Domain2: Handle_Adaptor3d_TopolTool &
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Caro1,const IntPatch_Polyhedron & Polyhedron1,const Handle_Adaptor3d_TopolTool & Domain1,const Handle_Adaptor3d_HSurface & Caro2,const IntPatch_Polyhedron & Polyhedron2,const Handle_Adaptor3d_TopolTool & Domain2,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Caro1:
	:type Caro1: Handle_Adaptor3d_HSurface &
	:param Polyhedron1:
	:type Polyhedron1: IntPatch_Polyhedron &
	:param Domain1:
	:type Domain1: Handle_Adaptor3d_TopolTool &
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Caro1,const IntPatch_Polyhedron & Polyhedron1,const Handle_Adaptor3d_TopolTool & Domain1,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.

	:param Caro1:
	:type Caro1: Handle_Adaptor3d_HSurface &
	:param Domain1:
	:type Domain1: Handle_Adaptor3d_TopolTool &
	:param Caro2:
	:type Caro2: Handle_Adaptor3d_HSurface &
	:param Domain2:
	:type Domain2: Handle_Adaptor3d_TopolTool &
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:param ClearFlag: default value is Standard_True
	:type ClearFlag: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Caro1,const Handle_Adaptor3d_TopolTool & Domain1,const Handle_Adaptor3d_HSurface & Caro2,const Handle_Adaptor3d_TopolTool & Domain2,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment,const Standard_Boolean ClearFlag = Standard_True);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.

	:param Caro1:
	:type Caro1: Handle_Adaptor3d_HSurface &
	:param Domain1:
	:type Domain1: Handle_Adaptor3d_TopolTool &
	:param Caro2:
	:type Caro2: Handle_Adaptor3d_HSurface &
	:param Domain2:
	:type Domain2: Handle_Adaptor3d_TopolTool &
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:param ListOfPnts:
	:type ListOfPnts: IntSurf_ListOfPntOn2S &
	:param RestrictLine:
	:type RestrictLine: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Caro1,const Handle_Adaptor3d_TopolTool & Domain1,const Handle_Adaptor3d_HSurface & Caro2,const Handle_Adaptor3d_TopolTool & Domain2,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment,IntSurf_ListOfPntOn2S & ListOfPnts,const Standard_Boolean RestrictLine);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.

	:param Caro1:
	:type Caro1: Handle_Adaptor3d_HSurface &
	:param Domain1:
	:type Domain1: Handle_Adaptor3d_TopolTool &
	:param Caro2:
	:type Caro2: Handle_Adaptor3d_HSurface &
	:param Domain2:
	:type Domain2: Handle_Adaptor3d_TopolTool &
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Caro1,const Handle_Adaptor3d_TopolTool & Domain1,const Handle_Adaptor3d_HSurface & Caro2,const Handle_Adaptor3d_TopolTool & Domain2,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.

	:param Caro1:
	:type Caro1: Handle_Adaptor3d_HSurface &
	:param Domain1:
	:type Domain1: Handle_Adaptor3d_TopolTool &
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Caro1,const Handle_Adaptor3d_TopolTool & Domain1,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the intersection between <Caro1> and <Caro2>. //! The polyhedron which approximates <Caro2>, <Polyhedron2> is given. The other one is computed.

	:param Caro1:
	:type Caro1: Handle_Adaptor3d_HSurface &
	:param Domain1:
	:type Domain1: Handle_Adaptor3d_TopolTool &
	:param Caro2:
	:type Caro2: Handle_Adaptor3d_HSurface &
	:param Polyhedron2:
	:type Polyhedron2: IntPatch_Polyhedron &
	:param Domain2:
	:type Domain2: Handle_Adaptor3d_TopolTool &
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Caro1,const Handle_Adaptor3d_TopolTool & Domain1,const Handle_Adaptor3d_HSurface & Caro2,const IntPatch_Polyhedron & Polyhedron2,const Handle_Adaptor3d_TopolTool & Domain2,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the intersection between <Caro1> and <Caro2>. //! The polyhedron which approximates <Caro1>, <Polyhedron1> is given. The other one is computed.

	:param Caro1:
	:type Caro1: Handle_Adaptor3d_HSurface &
	:param Polyhedron1:
	:type Polyhedron1: IntPatch_Polyhedron &
	:param Domain1:
	:type Domain1: Handle_Adaptor3d_TopolTool &
	:param Caro2:
	:type Caro2: Handle_Adaptor3d_HSurface &
	:param Domain2:
	:type Domain2: Handle_Adaptor3d_TopolTool &
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HSurface & Caro1,const IntPatch_Polyhedron & Polyhedron1,const Handle_Adaptor3d_TopolTool & Domain1,const Handle_Adaptor3d_HSurface & Caro2,const Handle_Adaptor3d_TopolTool & Domain2,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns true if the calculus was succesfull.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns true if the is no intersection.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "	* Returns the number of intersection lines.

	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.

	:param Index:
	:type Index: int
	:rtype: Handle_IntPatch_Line
") Line;
		Handle_IntPatch_Line Line (const Standard_Integer Index);
		%feature("compactdefaultargs") NewLine;
		%feature("autodoc", "	* Computes about <NbPoints> Intersection Points on the Line <IndexLine> between the Points of Index <LowPoint> and <HighPoint>. //! All the points of the line of index <IndexLine> with an index between <LowPoint> and <HighPoint> are in the returned line. New Points are inserted between existing points if those points are not too closed. //! An exception is raised if Index<=0 or Index>NbLine. or if IsDone returns False

	:param Caro1:
	:type Caro1: Handle_Adaptor3d_HSurface &
	:param Caro2:
	:type Caro2: Handle_Adaptor3d_HSurface &
	:param IndexLine:
	:type IndexLine: int
	:param LowPoint:
	:type LowPoint: int
	:param HighPoint:
	:type HighPoint: int
	:param NbPoints:
	:type NbPoints: int
	:rtype: Handle_IntPatch_Line
") NewLine;
		Handle_IntPatch_Line NewLine (const Handle_Adaptor3d_HSurface & Caro1,const Handle_Adaptor3d_HSurface & Caro2,const Standard_Integer IndexLine,const Standard_Integer LowPoint,const Standard_Integer HighPoint,const Standard_Integer NbPoints);
		%feature("compactdefaultargs") GrilleInteger;
		%feature("autodoc", "	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:rtype: int
") GrilleInteger;
		Standard_Integer GrilleInteger (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz);
		%feature("compactdefaultargs") IntegerGrille;
		%feature("autodoc", "	:param t:
	:type t: int
	:param ix:
	:type ix: int &
	:param iy:
	:type iy: int &
	:param iz:
	:type iz: int &
	:rtype: None
") IntegerGrille;
		void IntegerGrille (const Standard_Integer t,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") DansGrille;
		%feature("autodoc", "	:param t:
	:type t: int
	:rtype: int
") DansGrille;
		Standard_Integer DansGrille (const Standard_Integer t);
		%feature("compactdefaultargs") NbPointsGrille;
		%feature("autodoc", "	:rtype: int
") NbPointsGrille;
		Standard_Integer NbPointsGrille ();
		%feature("compactdefaultargs") RemplitLin;
		%feature("autodoc", "	:param x1:
	:type x1: int
	:param y1:
	:type y1: int
	:param z1:
	:type z1: int
	:param x2:
	:type x2: int
	:param y2:
	:type y2: int
	:param z2:
	:type z2: int
	:param Map:
	:type Map: IntPatch_PrmPrmIntersection_T3Bits &
	:rtype: None
") RemplitLin;
		void RemplitLin (const Standard_Integer x1,const Standard_Integer y1,const Standard_Integer z1,const Standard_Integer x2,const Standard_Integer y2,const Standard_Integer z2,IntPatch_PrmPrmIntersection_T3Bits & Map);
		%feature("compactdefaultargs") RemplitTri;
		%feature("autodoc", "	:param x1:
	:type x1: int
	:param y1:
	:type y1: int
	:param z1:
	:type z1: int
	:param x2:
	:type x2: int
	:param y2:
	:type y2: int
	:param z2:
	:type z2: int
	:param x3:
	:type x3: int
	:param y3:
	:type y3: int
	:param z3:
	:type z3: int
	:param Map:
	:type Map: IntPatch_PrmPrmIntersection_T3Bits &
	:rtype: None
") RemplitTri;
		void RemplitTri (const Standard_Integer x1,const Standard_Integer y1,const Standard_Integer z1,const Standard_Integer x2,const Standard_Integer y2,const Standard_Integer z2,const Standard_Integer x3,const Standard_Integer y3,const Standard_Integer z3,IntPatch_PrmPrmIntersection_T3Bits & Map);
		%feature("compactdefaultargs") Remplit;
		%feature("autodoc", "	:param a:
	:type a: int
	:param b:
	:type b: int
	:param c:
	:type c: int
	:param Map:
	:type Map: IntPatch_PrmPrmIntersection_T3Bits &
	:rtype: None
") Remplit;
		void Remplit (const Standard_Integer a,const Standard_Integer b,const Standard_Integer c,IntPatch_PrmPrmIntersection_T3Bits & Map);
		%feature("compactdefaultargs") CodeReject;
		%feature("autodoc", "	:param x1:
	:type x1: float
	:param y1:
	:type y1: float
	:param z1:
	:type z1: float
	:param x2:
	:type x2: float
	:param y2:
	:type y2: float
	:param z2:
	:type z2: float
	:param x3:
	:type x3: float
	:param y3:
	:type y3: float
	:param z3:
	:type z3: float
	:rtype: int
") CodeReject;
		Standard_Integer CodeReject (const Standard_Real x1,const Standard_Real y1,const Standard_Real z1,const Standard_Real x2,const Standard_Real y2,const Standard_Real z2,const Standard_Real x3,const Standard_Real y3,const Standard_Real z3);
		%feature("compactdefaultargs") PointDepart;
		%feature("autodoc", "	:param LineOn2S:
	:type LineOn2S: Handle_IntSurf_LineOn2S &
	:param S1:
	:type S1: Handle_Adaptor3d_HSurface &
	:param SU1:
	:type SU1: int
	:param SV1:
	:type SV1: int
	:param S2:
	:type S2: Handle_Adaptor3d_HSurface &
	:param SU2:
	:type SU2: int
	:param SV2:
	:type SV2: int
	:rtype: None
") PointDepart;
		void PointDepart (Handle_IntSurf_LineOn2S & LineOn2S,const Handle_Adaptor3d_HSurface & S1,const Standard_Integer SU1,const Standard_Integer SV1,const Handle_Adaptor3d_HSurface & S2,const Standard_Integer SU2,const Standard_Integer SV2);
};


%extend IntPatch_PrmPrmIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_PrmPrmIntersection_T3Bits;
class IntPatch_PrmPrmIntersection_T3Bits {
	public:
		%feature("compactdefaultargs") IntPatch_PrmPrmIntersection_T3Bits;
		%feature("autodoc", "	:param size:
	:type size: int
	:rtype: None
") IntPatch_PrmPrmIntersection_T3Bits;
		 IntPatch_PrmPrmIntersection_T3Bits (const Standard_Integer size);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param t:
	:type t: int
	:rtype: None
") Add;
		void Add (const Standard_Integer t);
		%feature("compactdefaultargs") Val;
		%feature("autodoc", "	:param t:
	:type t: int
	:rtype: int
") Val;
		Standard_Integer Val (const Standard_Integer t);
		%feature("compactdefaultargs") Raz;
		%feature("autodoc", "	:param t:
	:type t: int
	:rtype: None
") Raz;
		void Raz (const Standard_Integer t);
		%feature("compactdefaultargs") ResetAnd;
		%feature("autodoc", "	:rtype: None
") ResetAnd;
		void ResetAnd ();
		%feature("compactdefaultargs") And;
		%feature("autodoc", "	:param Oth:
	:type Oth: IntPatch_PrmPrmIntersection_T3Bits &
	:param indiceprecedent:
	:type indiceprecedent: int &
	:rtype: int
") And;
		Standard_Integer And (IntPatch_PrmPrmIntersection_T3Bits & Oth,Standard_Integer &OutValue);
};


%extend IntPatch_PrmPrmIntersection_T3Bits {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class IntPatch_RstInt {
	public:
		%feature("compactdefaultargs") PutVertexOnLine;
		%feature("autodoc", "	:param L:
	:type L: Handle_IntPatch_Line &
	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:param OtherSurf:
	:type OtherSurf: Handle_Adaptor3d_HSurface &
	:param OnFirst:
	:type OnFirst: bool
	:param Tol:
	:type Tol: float
	:param hasBeenAdded: default value is Standard_False
	:type hasBeenAdded: bool
	:rtype: void
") PutVertexOnLine;
		static void PutVertexOnLine (Handle_IntPatch_Line & L,const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & Domain,const Handle_Adaptor3d_HSurface & OtherSurf,const Standard_Boolean OnFirst,const Standard_Real Tol,const Standard_Boolean hasBeenAdded = Standard_False);
};


%extend IntPatch_RstInt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking;
class IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking;
		%feature("autodoc", "	:param I:
	:type I: Handle_IntPatch_TheIWLineOfTheIWalking &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking;
		 IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking (const Handle_IntPatch_TheIWLineOfTheIWalking & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_IntPatch_TheIWLineOfTheIWalking
") Value;
		Handle_IntPatch_TheIWLineOfTheIWalking Value ();
};


%extend IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking::Handle_IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking;
class Handle_IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking();
        Handle_IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking(const Handle_IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking &aHandle);
        Handle_IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking(const IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking {
    IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking* _get_reference() {
    return (IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking*)$self->Access();
    }
};

%extend Handle_IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntPatch_SequenceNodeOfSequenceOfIWLineOfTheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_SequenceNodeOfSequenceOfLine;
class IntPatch_SequenceNodeOfSequenceOfLine : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IntPatch_SequenceNodeOfSequenceOfLine;
		%feature("autodoc", "	:param I:
	:type I: Handle_IntPatch_Line &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntPatch_SequenceNodeOfSequenceOfLine;
		 IntPatch_SequenceNodeOfSequenceOfLine (const Handle_IntPatch_Line & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_IntPatch_Line
") Value;
		Handle_IntPatch_Line Value ();
};


%extend IntPatch_SequenceNodeOfSequenceOfLine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntPatch_SequenceNodeOfSequenceOfLine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntPatch_SequenceNodeOfSequenceOfLine::Handle_IntPatch_SequenceNodeOfSequenceOfLine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntPatch_SequenceNodeOfSequenceOfLine;
class Handle_IntPatch_SequenceNodeOfSequenceOfLine : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntPatch_SequenceNodeOfSequenceOfLine();
        Handle_IntPatch_SequenceNodeOfSequenceOfLine(const Handle_IntPatch_SequenceNodeOfSequenceOfLine &aHandle);
        Handle_IntPatch_SequenceNodeOfSequenceOfLine(const IntPatch_SequenceNodeOfSequenceOfLine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntPatch_SequenceNodeOfSequenceOfLine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntPatch_SequenceNodeOfSequenceOfLine {
    IntPatch_SequenceNodeOfSequenceOfLine* _get_reference() {
    return (IntPatch_SequenceNodeOfSequenceOfLine*)$self->Access();
    }
};

%extend Handle_IntPatch_SequenceNodeOfSequenceOfLine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntPatch_SequenceNodeOfSequenceOfLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds;
class IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds;
		%feature("autodoc", "	:param I:
	:type I: IntPatch_ThePathPointOfTheSOnBounds &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds;
		 IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds (const IntPatch_ThePathPointOfTheSOnBounds & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: IntPatch_ThePathPointOfTheSOnBounds
") Value;
		IntPatch_ThePathPointOfTheSOnBounds & Value ();
};


%extend IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds::Handle_IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds;
class Handle_IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds();
        Handle_IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds(const Handle_IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds &aHandle);
        Handle_IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds(const IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds {
    IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds* _get_reference() {
    return (IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds*)$self->Access();
    }
};

%extend Handle_IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntPatch_SequenceNodeOfSequenceOfPathPointOfTheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_SequenceNodeOfSequenceOfPoint;
class IntPatch_SequenceNodeOfSequenceOfPoint : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IntPatch_SequenceNodeOfSequenceOfPoint;
		%feature("autodoc", "	:param I:
	:type I: IntPatch_Point &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntPatch_SequenceNodeOfSequenceOfPoint;
		 IntPatch_SequenceNodeOfSequenceOfPoint (const IntPatch_Point & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: IntPatch_Point
") Value;
		IntPatch_Point & Value ();
};


%extend IntPatch_SequenceNodeOfSequenceOfPoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntPatch_SequenceNodeOfSequenceOfPoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntPatch_SequenceNodeOfSequenceOfPoint::Handle_IntPatch_SequenceNodeOfSequenceOfPoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntPatch_SequenceNodeOfSequenceOfPoint;
class Handle_IntPatch_SequenceNodeOfSequenceOfPoint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntPatch_SequenceNodeOfSequenceOfPoint();
        Handle_IntPatch_SequenceNodeOfSequenceOfPoint(const Handle_IntPatch_SequenceNodeOfSequenceOfPoint &aHandle);
        Handle_IntPatch_SequenceNodeOfSequenceOfPoint(const IntPatch_SequenceNodeOfSequenceOfPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntPatch_SequenceNodeOfSequenceOfPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntPatch_SequenceNodeOfSequenceOfPoint {
    IntPatch_SequenceNodeOfSequenceOfPoint* _get_reference() {
    return (IntPatch_SequenceNodeOfSequenceOfPoint*)$self->Access();
    }
};

%extend Handle_IntPatch_SequenceNodeOfSequenceOfPoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntPatch_SequenceNodeOfSequenceOfPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds;
class IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds;
		%feature("autodoc", "	:param I:
	:type I: IntPatch_TheSegmentOfTheSOnBounds &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds;
		 IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds (const IntPatch_TheSegmentOfTheSOnBounds & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: IntPatch_TheSegmentOfTheSOnBounds
") Value;
		IntPatch_TheSegmentOfTheSOnBounds & Value ();
};


%extend IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds::Handle_IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds;
class Handle_IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds();
        Handle_IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds(const Handle_IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds &aHandle);
        Handle_IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds(const IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds {
    IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds* _get_reference() {
    return (IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds*)$self->Access();
    }
};

%extend Handle_IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntPatch_SequenceNodeOfSequenceOfSegmentOfTheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_SequenceOfIWLineOfTheIWalking;
class IntPatch_SequenceOfIWLineOfTheIWalking : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IntPatch_SequenceOfIWLineOfTheIWalking;
		%feature("autodoc", "	:rtype: None
") IntPatch_SequenceOfIWLineOfTheIWalking;
		 IntPatch_SequenceOfIWLineOfTheIWalking ();
		%feature("compactdefaultargs") IntPatch_SequenceOfIWLineOfTheIWalking;
		%feature("autodoc", "	:param Other:
	:type Other: IntPatch_SequenceOfIWLineOfTheIWalking &
	:rtype: None
") IntPatch_SequenceOfIWLineOfTheIWalking;
		 IntPatch_SequenceOfIWLineOfTheIWalking (const IntPatch_SequenceOfIWLineOfTheIWalking & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IntPatch_SequenceOfIWLineOfTheIWalking &
	:rtype: IntPatch_SequenceOfIWLineOfTheIWalking
") Assign;
		const IntPatch_SequenceOfIWLineOfTheIWalking & Assign (const IntPatch_SequenceOfIWLineOfTheIWalking & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IntPatch_SequenceOfIWLineOfTheIWalking &
	:rtype: IntPatch_SequenceOfIWLineOfTheIWalking
") operator =;
		const IntPatch_SequenceOfIWLineOfTheIWalking & operator = (const IntPatch_SequenceOfIWLineOfTheIWalking & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_IntPatch_TheIWLineOfTheIWalking &
	:rtype: None
") Append;
		void Append (const Handle_IntPatch_TheIWLineOfTheIWalking & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IntPatch_SequenceOfIWLineOfTheIWalking &
	:rtype: None
") Append;
		void Append (IntPatch_SequenceOfIWLineOfTheIWalking & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_IntPatch_TheIWLineOfTheIWalking &
	:rtype: None
") Prepend;
		void Prepend (const Handle_IntPatch_TheIWLineOfTheIWalking & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IntPatch_SequenceOfIWLineOfTheIWalking &
	:rtype: None
") Prepend;
		void Prepend (IntPatch_SequenceOfIWLineOfTheIWalking & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_IntPatch_TheIWLineOfTheIWalking &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_IntPatch_TheIWLineOfTheIWalking & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntPatch_SequenceOfIWLineOfTheIWalking &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntPatch_SequenceOfIWLineOfTheIWalking & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_IntPatch_TheIWLineOfTheIWalking &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_IntPatch_TheIWLineOfTheIWalking & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntPatch_SequenceOfIWLineOfTheIWalking &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntPatch_SequenceOfIWLineOfTheIWalking & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_IntPatch_TheIWLineOfTheIWalking
") First;
		Handle_IntPatch_TheIWLineOfTheIWalking First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_IntPatch_TheIWLineOfTheIWalking
") Last;
		Handle_IntPatch_TheIWLineOfTheIWalking Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IntPatch_SequenceOfIWLineOfTheIWalking &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntPatch_SequenceOfIWLineOfTheIWalking & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_IntPatch_TheIWLineOfTheIWalking
") Value;
		Handle_IntPatch_TheIWLineOfTheIWalking Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_IntPatch_TheIWLineOfTheIWalking &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_IntPatch_TheIWLineOfTheIWalking & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_IntPatch_TheIWLineOfTheIWalking
") ChangeValue;
		Handle_IntPatch_TheIWLineOfTheIWalking ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend IntPatch_SequenceOfIWLineOfTheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_SequenceOfLine;
class IntPatch_SequenceOfLine : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IntPatch_SequenceOfLine;
		%feature("autodoc", "	:rtype: None
") IntPatch_SequenceOfLine;
		 IntPatch_SequenceOfLine ();
		%feature("compactdefaultargs") IntPatch_SequenceOfLine;
		%feature("autodoc", "	:param Other:
	:type Other: IntPatch_SequenceOfLine &
	:rtype: None
") IntPatch_SequenceOfLine;
		 IntPatch_SequenceOfLine (const IntPatch_SequenceOfLine & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IntPatch_SequenceOfLine &
	:rtype: IntPatch_SequenceOfLine
") Assign;
		const IntPatch_SequenceOfLine & Assign (const IntPatch_SequenceOfLine & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IntPatch_SequenceOfLine &
	:rtype: IntPatch_SequenceOfLine
") operator =;
		const IntPatch_SequenceOfLine & operator = (const IntPatch_SequenceOfLine & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_IntPatch_Line &
	:rtype: None
") Append;
		void Append (const Handle_IntPatch_Line & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IntPatch_SequenceOfLine &
	:rtype: None
") Append;
		void Append (IntPatch_SequenceOfLine & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_IntPatch_Line &
	:rtype: None
") Prepend;
		void Prepend (const Handle_IntPatch_Line & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IntPatch_SequenceOfLine &
	:rtype: None
") Prepend;
		void Prepend (IntPatch_SequenceOfLine & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_IntPatch_Line &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_IntPatch_Line & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntPatch_SequenceOfLine &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntPatch_SequenceOfLine & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_IntPatch_Line &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_IntPatch_Line & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntPatch_SequenceOfLine &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntPatch_SequenceOfLine & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_IntPatch_Line
") First;
		Handle_IntPatch_Line First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_IntPatch_Line
") Last;
		Handle_IntPatch_Line Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IntPatch_SequenceOfLine &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntPatch_SequenceOfLine & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_IntPatch_Line
") Value;
		Handle_IntPatch_Line Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_IntPatch_Line &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_IntPatch_Line & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_IntPatch_Line
") ChangeValue;
		Handle_IntPatch_Line ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend IntPatch_SequenceOfLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_SequenceOfPathPointOfTheSOnBounds;
class IntPatch_SequenceOfPathPointOfTheSOnBounds : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IntPatch_SequenceOfPathPointOfTheSOnBounds;
		%feature("autodoc", "	:rtype: None
") IntPatch_SequenceOfPathPointOfTheSOnBounds;
		 IntPatch_SequenceOfPathPointOfTheSOnBounds ();
		%feature("compactdefaultargs") IntPatch_SequenceOfPathPointOfTheSOnBounds;
		%feature("autodoc", "	:param Other:
	:type Other: IntPatch_SequenceOfPathPointOfTheSOnBounds &
	:rtype: None
") IntPatch_SequenceOfPathPointOfTheSOnBounds;
		 IntPatch_SequenceOfPathPointOfTheSOnBounds (const IntPatch_SequenceOfPathPointOfTheSOnBounds & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IntPatch_SequenceOfPathPointOfTheSOnBounds &
	:rtype: IntPatch_SequenceOfPathPointOfTheSOnBounds
") Assign;
		const IntPatch_SequenceOfPathPointOfTheSOnBounds & Assign (const IntPatch_SequenceOfPathPointOfTheSOnBounds & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IntPatch_SequenceOfPathPointOfTheSOnBounds &
	:rtype: IntPatch_SequenceOfPathPointOfTheSOnBounds
") operator =;
		const IntPatch_SequenceOfPathPointOfTheSOnBounds & operator = (const IntPatch_SequenceOfPathPointOfTheSOnBounds & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: IntPatch_ThePathPointOfTheSOnBounds &
	:rtype: None
") Append;
		void Append (const IntPatch_ThePathPointOfTheSOnBounds & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IntPatch_SequenceOfPathPointOfTheSOnBounds &
	:rtype: None
") Append;
		void Append (IntPatch_SequenceOfPathPointOfTheSOnBounds & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: IntPatch_ThePathPointOfTheSOnBounds &
	:rtype: None
") Prepend;
		void Prepend (const IntPatch_ThePathPointOfTheSOnBounds & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IntPatch_SequenceOfPathPointOfTheSOnBounds &
	:rtype: None
") Prepend;
		void Prepend (IntPatch_SequenceOfPathPointOfTheSOnBounds & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntPatch_ThePathPointOfTheSOnBounds &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntPatch_ThePathPointOfTheSOnBounds & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntPatch_SequenceOfPathPointOfTheSOnBounds &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntPatch_SequenceOfPathPointOfTheSOnBounds & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntPatch_ThePathPointOfTheSOnBounds &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntPatch_ThePathPointOfTheSOnBounds & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntPatch_SequenceOfPathPointOfTheSOnBounds &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntPatch_SequenceOfPathPointOfTheSOnBounds & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: IntPatch_ThePathPointOfTheSOnBounds
") First;
		const IntPatch_ThePathPointOfTheSOnBounds & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: IntPatch_ThePathPointOfTheSOnBounds
") Last;
		const IntPatch_ThePathPointOfTheSOnBounds & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IntPatch_SequenceOfPathPointOfTheSOnBounds &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntPatch_SequenceOfPathPointOfTheSOnBounds & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntPatch_ThePathPointOfTheSOnBounds
") Value;
		const IntPatch_ThePathPointOfTheSOnBounds & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: IntPatch_ThePathPointOfTheSOnBounds &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntPatch_ThePathPointOfTheSOnBounds & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntPatch_ThePathPointOfTheSOnBounds
") ChangeValue;
		IntPatch_ThePathPointOfTheSOnBounds & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend IntPatch_SequenceOfPathPointOfTheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_SequenceOfPoint;
class IntPatch_SequenceOfPoint : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IntPatch_SequenceOfPoint;
		%feature("autodoc", "	:rtype: None
") IntPatch_SequenceOfPoint;
		 IntPatch_SequenceOfPoint ();
		%feature("compactdefaultargs") IntPatch_SequenceOfPoint;
		%feature("autodoc", "	:param Other:
	:type Other: IntPatch_SequenceOfPoint &
	:rtype: None
") IntPatch_SequenceOfPoint;
		 IntPatch_SequenceOfPoint (const IntPatch_SequenceOfPoint & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IntPatch_SequenceOfPoint &
	:rtype: IntPatch_SequenceOfPoint
") Assign;
		const IntPatch_SequenceOfPoint & Assign (const IntPatch_SequenceOfPoint & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IntPatch_SequenceOfPoint &
	:rtype: IntPatch_SequenceOfPoint
") operator =;
		const IntPatch_SequenceOfPoint & operator = (const IntPatch_SequenceOfPoint & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: IntPatch_Point &
	:rtype: None
") Append;
		void Append (const IntPatch_Point & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IntPatch_SequenceOfPoint &
	:rtype: None
") Append;
		void Append (IntPatch_SequenceOfPoint & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: IntPatch_Point &
	:rtype: None
") Prepend;
		void Prepend (const IntPatch_Point & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IntPatch_SequenceOfPoint &
	:rtype: None
") Prepend;
		void Prepend (IntPatch_SequenceOfPoint & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntPatch_Point &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntPatch_Point & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntPatch_SequenceOfPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntPatch_SequenceOfPoint & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntPatch_Point &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntPatch_Point & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntPatch_SequenceOfPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntPatch_SequenceOfPoint & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: IntPatch_Point
") First;
		const IntPatch_Point & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: IntPatch_Point
") Last;
		const IntPatch_Point & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IntPatch_SequenceOfPoint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntPatch_SequenceOfPoint & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntPatch_Point
") Value;
		const IntPatch_Point & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: IntPatch_Point &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntPatch_Point & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntPatch_Point
") ChangeValue;
		IntPatch_Point & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend IntPatch_SequenceOfPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_SequenceOfSegmentOfTheSOnBounds;
class IntPatch_SequenceOfSegmentOfTheSOnBounds : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IntPatch_SequenceOfSegmentOfTheSOnBounds;
		%feature("autodoc", "	:rtype: None
") IntPatch_SequenceOfSegmentOfTheSOnBounds;
		 IntPatch_SequenceOfSegmentOfTheSOnBounds ();
		%feature("compactdefaultargs") IntPatch_SequenceOfSegmentOfTheSOnBounds;
		%feature("autodoc", "	:param Other:
	:type Other: IntPatch_SequenceOfSegmentOfTheSOnBounds &
	:rtype: None
") IntPatch_SequenceOfSegmentOfTheSOnBounds;
		 IntPatch_SequenceOfSegmentOfTheSOnBounds (const IntPatch_SequenceOfSegmentOfTheSOnBounds & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IntPatch_SequenceOfSegmentOfTheSOnBounds &
	:rtype: IntPatch_SequenceOfSegmentOfTheSOnBounds
") Assign;
		const IntPatch_SequenceOfSegmentOfTheSOnBounds & Assign (const IntPatch_SequenceOfSegmentOfTheSOnBounds & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IntPatch_SequenceOfSegmentOfTheSOnBounds &
	:rtype: IntPatch_SequenceOfSegmentOfTheSOnBounds
") operator =;
		const IntPatch_SequenceOfSegmentOfTheSOnBounds & operator = (const IntPatch_SequenceOfSegmentOfTheSOnBounds & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: IntPatch_TheSegmentOfTheSOnBounds &
	:rtype: None
") Append;
		void Append (const IntPatch_TheSegmentOfTheSOnBounds & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IntPatch_SequenceOfSegmentOfTheSOnBounds &
	:rtype: None
") Append;
		void Append (IntPatch_SequenceOfSegmentOfTheSOnBounds & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: IntPatch_TheSegmentOfTheSOnBounds &
	:rtype: None
") Prepend;
		void Prepend (const IntPatch_TheSegmentOfTheSOnBounds & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IntPatch_SequenceOfSegmentOfTheSOnBounds &
	:rtype: None
") Prepend;
		void Prepend (IntPatch_SequenceOfSegmentOfTheSOnBounds & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntPatch_TheSegmentOfTheSOnBounds &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntPatch_TheSegmentOfTheSOnBounds & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntPatch_SequenceOfSegmentOfTheSOnBounds &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntPatch_SequenceOfSegmentOfTheSOnBounds & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: IntPatch_TheSegmentOfTheSOnBounds &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntPatch_TheSegmentOfTheSOnBounds & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IntPatch_SequenceOfSegmentOfTheSOnBounds &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntPatch_SequenceOfSegmentOfTheSOnBounds & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: IntPatch_TheSegmentOfTheSOnBounds
") First;
		const IntPatch_TheSegmentOfTheSOnBounds & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: IntPatch_TheSegmentOfTheSOnBounds
") Last;
		const IntPatch_TheSegmentOfTheSOnBounds & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IntPatch_SequenceOfSegmentOfTheSOnBounds &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntPatch_SequenceOfSegmentOfTheSOnBounds & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntPatch_TheSegmentOfTheSOnBounds
") Value;
		const IntPatch_TheSegmentOfTheSOnBounds & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: IntPatch_TheSegmentOfTheSOnBounds &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntPatch_TheSegmentOfTheSOnBounds & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntPatch_TheSegmentOfTheSOnBounds
") ChangeValue;
		IntPatch_TheSegmentOfTheSOnBounds & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend IntPatch_SequenceOfSegmentOfTheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_TheIWLineOfTheIWalking;
class IntPatch_TheIWLineOfTheIWalking : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") IntPatch_TheIWLineOfTheIWalking;
		%feature("autodoc", "	:param theAllocator: default value is 0
	:type theAllocator: IntSurf_Allocator &
	:rtype: None
") IntPatch_TheIWLineOfTheIWalking;
		 IntPatch_TheIWLineOfTheIWalking (const IntSurf_Allocator & theAllocator = 0);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Cut;
		void Cut (const Standard_Integer Index);
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "	:param P:
	:type P: IntSurf_PntOn2S &
	:rtype: None
") AddPoint;
		void AddPoint (const IntSurf_PntOn2S & P);
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "	:param Closed:
	:type Closed: bool
	:param HasFirst:
	:type HasFirst: bool
	:rtype: None
") AddStatusFirst;
		void AddStatusFirst (const Standard_Boolean Closed,const Standard_Boolean HasFirst);
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "	:param Closed:
	:type Closed: bool
	:param HasLast:
	:type HasLast: bool
	:param Index:
	:type Index: int
	:param P:
	:type P: IntSurf_PathPoint &
	:rtype: None
") AddStatusFirst;
		void AddStatusFirst (const Standard_Boolean Closed,const Standard_Boolean HasLast,const Standard_Integer Index,const IntSurf_PathPoint & P);
		%feature("compactdefaultargs") AddStatusFirstLast;
		%feature("autodoc", "	:param Closed:
	:type Closed: bool
	:param HasFirst:
	:type HasFirst: bool
	:param HasLast:
	:type HasLast: bool
	:rtype: None
") AddStatusFirstLast;
		void AddStatusFirstLast (const Standard_Boolean Closed,const Standard_Boolean HasFirst,const Standard_Boolean HasLast);
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "	:param HasLast:
	:type HasLast: bool
	:rtype: None
") AddStatusLast;
		void AddStatusLast (const Standard_Boolean HasLast);
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "	:param HasLast:
	:type HasLast: bool
	:param Index:
	:type Index: int
	:param P:
	:type P: IntSurf_PathPoint &
	:rtype: None
") AddStatusLast;
		void AddStatusLast (const Standard_Boolean HasLast,const Standard_Integer Index,const IntSurf_PathPoint & P);
		%feature("compactdefaultargs") AddIndexPassing;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") AddIndexPassing;
		void AddIndexPassing (const Standard_Integer Index);
		%feature("compactdefaultargs") SetTangentVector;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:param Index:
	:type Index: int
	:rtype: None
") SetTangentVector;
		void SetTangentVector (const gp_Vec & V,const Standard_Integer Index);
		%feature("compactdefaultargs") SetTangencyAtBegining;
		%feature("autodoc", "	:param IsTangent:
	:type IsTangent: bool
	:rtype: None
") SetTangencyAtBegining;
		void SetTangencyAtBegining (const Standard_Boolean IsTangent);
		%feature("compactdefaultargs") SetTangencyAtEnd;
		%feature("autodoc", "	:param IsTangent:
	:type IsTangent: bool
	:rtype: None
") SetTangencyAtEnd;
		void SetTangencyAtEnd (const Standard_Boolean IsTangent);
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S
") Value;
		const IntSurf_PntOn2S & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: Handle_IntSurf_LineOn2S
") Line;
		Handle_IntSurf_LineOn2S Line ();
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "	:rtype: bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "	:rtype: bool
") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	:rtype: IntSurf_PathPoint
") FirstPoint;
		const IntSurf_PathPoint & FirstPoint ();
		%feature("compactdefaultargs") FirstPointIndex;
		%feature("autodoc", "	:rtype: int
") FirstPointIndex;
		Standard_Integer FirstPointIndex ();
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "	:rtype: IntSurf_PathPoint
") LastPoint;
		const IntSurf_PathPoint & LastPoint ();
		%feature("compactdefaultargs") LastPointIndex;
		%feature("autodoc", "	:rtype: int
") LastPointIndex;
		Standard_Integer LastPointIndex ();
		%feature("compactdefaultargs") NbPassingPoint;
		%feature("autodoc", "	:rtype: int
") NbPassingPoint;
		Standard_Integer NbPassingPoint ();
		%feature("compactdefaultargs") PassingPoint;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param IndexLine:
	:type IndexLine: int &
	:param IndexPnts:
	:type IndexPnts: int &
	:rtype: None
") PassingPoint;
		void PassingPoint (const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") TangentVector;
		%feature("autodoc", "	:param Index:
	:type Index: int &
	:rtype: gp_Vec
") TangentVector;
		const gp_Vec  TangentVector (Standard_Integer &OutValue);
		%feature("compactdefaultargs") IsTangentAtBegining;
		%feature("autodoc", "	:rtype: bool
") IsTangentAtBegining;
		Standard_Boolean IsTangentAtBegining ();
		%feature("compactdefaultargs") IsTangentAtEnd;
		%feature("autodoc", "	:rtype: bool
") IsTangentAtEnd;
		Standard_Boolean IsTangentAtEnd ();
};


%extend IntPatch_TheIWLineOfTheIWalking {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntPatch_TheIWLineOfTheIWalking(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntPatch_TheIWLineOfTheIWalking::Handle_IntPatch_TheIWLineOfTheIWalking %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntPatch_TheIWLineOfTheIWalking;
class Handle_IntPatch_TheIWLineOfTheIWalking : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IntPatch_TheIWLineOfTheIWalking();
        Handle_IntPatch_TheIWLineOfTheIWalking(const Handle_IntPatch_TheIWLineOfTheIWalking &aHandle);
        Handle_IntPatch_TheIWLineOfTheIWalking(const IntPatch_TheIWLineOfTheIWalking *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntPatch_TheIWLineOfTheIWalking DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntPatch_TheIWLineOfTheIWalking {
    IntPatch_TheIWLineOfTheIWalking* _get_reference() {
    return (IntPatch_TheIWLineOfTheIWalking*)$self->Access();
    }
};

%extend Handle_IntPatch_TheIWLineOfTheIWalking {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntPatch_TheIWLineOfTheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_TheIWalking;
class IntPatch_TheIWalking {
	public:
		%feature("compactdefaultargs") IntPatch_TheIWalking;
		%feature("autodoc", "	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Step:
	:type Step: float
	:rtype: None
") IntPatch_TheIWalking;
		 IntPatch_TheIWalking (const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Step);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Step:
	:type Step: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Step);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Pnts1:
	:type Pnts1: IntSurf_SequenceOfPathPoint &
	:param Pnts2:
	:type Pnts2: IntSurf_SequenceOfInteriorPoint &
	:param Func:
	:type Func: IntPatch_TheSurfFunction &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Reversed: default value is Standard_False
	:type Reversed: bool
	:rtype: None
") Perform;
		void Perform (const IntSurf_SequenceOfPathPoint & Pnts1,const IntSurf_SequenceOfInteriorPoint & Pnts2,IntPatch_TheSurfFunction & Func,const Handle_Adaptor3d_HSurface & S,const Standard_Boolean Reversed = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param Pnts1:
	:type Pnts1: IntSurf_SequenceOfPathPoint &
	:param Func:
	:type Func: IntPatch_TheSurfFunction &
	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param Reversed: default value is Standard_False
	:type Reversed: bool
	:rtype: None
") Perform;
		void Perform (const IntSurf_SequenceOfPathPoint & Pnts1,IntPatch_TheSurfFunction & Func,const Handle_Adaptor3d_HSurface & S,const Standard_Boolean Reversed = Standard_False);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_IntPatch_TheIWLineOfTheIWalking
") Value;
		Handle_IntPatch_TheIWLineOfTheIWalking Value (const Standard_Integer Index);
		%feature("compactdefaultargs") NbSinglePnts;
		%feature("autodoc", "	:rtype: int
") NbSinglePnts;
		Standard_Integer NbSinglePnts ();
		%feature("compactdefaultargs") SinglePnt;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntSurf_PathPoint
") SinglePnt;
		const IntSurf_PathPoint & SinglePnt (const Standard_Integer Index);
};


%extend IntPatch_TheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_ThePathPointOfTheSOnBounds;
class IntPatch_ThePathPointOfTheSOnBounds {
	public:
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", "	:rtype: None
") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds ();
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:param Parameter:
	:type Parameter: float
	:rtype: None
") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds (const gp_Pnt & P,const Standard_Real Tol,const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Parameter);
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:param Parameter:
	:type Parameter: float
	:rtype: None
") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds (const gp_Pnt & P,const Standard_Real Tol,const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Parameter);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param V:
	:type V: Handle_Adaptor3d_HVertex &
	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:param Parameter:
	:type Parameter: float
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real Tol,const Handle_Adaptor3d_HVertex & V,const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Parameter);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:param Parameter:
	:type Parameter: float
	:rtype: None
") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real Tol,const Handle_Adaptor2d_HCurve2d & A,const Standard_Real Parameter);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "	:rtype: bool
") IsNew;
		Standard_Boolean IsNew ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HVertex
") Vertex;
		Handle_Adaptor3d_HVertex Vertex ();
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Arc;
		Handle_Adaptor2d_HCurve2d Arc ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
};


%extend IntPatch_ThePathPointOfTheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_TheSOnBounds;
class IntPatch_TheSOnBounds {
	public:
		%feature("compactdefaultargs") IntPatch_TheSOnBounds;
		%feature("autodoc", "	:rtype: None
") IntPatch_TheSOnBounds;
		 IntPatch_TheSOnBounds ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param F:
	:type F: IntPatch_ArcFunction &
	:param Domain:
	:type Domain: Handle_Adaptor3d_TopolTool &
	:param TolBoundary:
	:type TolBoundary: float
	:param TolTangency:
	:type TolTangency: float
	:param RecheckOnRegularity: default value is Standard_False
	:type RecheckOnRegularity: bool
	:rtype: None
") Perform;
		void Perform (IntPatch_ArcFunction & F,const Handle_Adaptor3d_TopolTool & Domain,const Standard_Real TolBoundary,const Standard_Real TolTangency,const Standard_Boolean RecheckOnRegularity = Standard_False);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") AllArcSolution;
		%feature("autodoc", "	:rtype: bool
") AllArcSolution;
		Standard_Boolean AllArcSolution ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntPatch_ThePathPointOfTheSOnBounds
") Point;
		const IntPatch_ThePathPointOfTheSOnBounds & Point (const Standard_Integer Index);
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntPatch_TheSegmentOfTheSOnBounds
") Segment;
		const IntPatch_TheSegmentOfTheSOnBounds & Segment (const Standard_Integer Index);
};


%extend IntPatch_TheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_TheSearchInside;
class IntPatch_TheSearchInside {
	public:
		%feature("compactdefaultargs") IntPatch_TheSearchInside;
		%feature("autodoc", "	:rtype: None
") IntPatch_TheSearchInside;
		 IntPatch_TheSearchInside ();
		%feature("compactdefaultargs") IntPatch_TheSearchInside;
		%feature("autodoc", "	:param F:
	:type F: IntPatch_TheSurfFunction &
	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param T:
	:type T: Handle_Adaptor3d_TopolTool &
	:param Epsilon:
	:type Epsilon: float
	:rtype: None
") IntPatch_TheSearchInside;
		 IntPatch_TheSearchInside (IntPatch_TheSurfFunction & F,const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & T,const Standard_Real Epsilon);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param F:
	:type F: IntPatch_TheSurfFunction &
	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param T:
	:type T: Handle_Adaptor3d_TopolTool &
	:param Epsilon:
	:type Epsilon: float
	:rtype: None
") Perform;
		void Perform (IntPatch_TheSurfFunction & F,const Handle_Adaptor3d_HSurface & Surf,const Handle_Adaptor3d_TopolTool & T,const Standard_Real Epsilon);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param F:
	:type F: IntPatch_TheSurfFunction &
	:param Surf:
	:type Surf: Handle_Adaptor3d_HSurface &
	:param UStart:
	:type UStart: float
	:param VStart:
	:type VStart: float
	:rtype: None
") Perform;
		void Perform (IntPatch_TheSurfFunction & F,const Handle_Adaptor3d_HSurface & Surf,const Standard_Real UStart,const Standard_Real VStart);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: IntSurf_InteriorPoint
") Value;
		const IntSurf_InteriorPoint & Value (const Standard_Integer Index);
};


%extend IntPatch_TheSearchInside {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_TheSegmentOfTheSOnBounds;
class IntPatch_TheSegmentOfTheSOnBounds {
	public:
		%feature("compactdefaultargs") IntPatch_TheSegmentOfTheSOnBounds;
		%feature("autodoc", "	:rtype: None
") IntPatch_TheSegmentOfTheSOnBounds;
		 IntPatch_TheSegmentOfTheSOnBounds ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") SetValue;
		void SetValue (const Handle_Adaptor2d_HCurve2d & A);
		%feature("compactdefaultargs") SetLimitPoint;
		%feature("autodoc", "	:param V:
	:type V: IntPatch_ThePathPointOfTheSOnBounds &
	:param First:
	:type First: bool
	:rtype: None
") SetLimitPoint;
		void SetLimitPoint (const IntPatch_ThePathPointOfTheSOnBounds & V,const Standard_Boolean First);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") Curve;
		Handle_Adaptor2d_HCurve2d Curve ();
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "	:rtype: bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	:rtype: IntPatch_ThePathPointOfTheSOnBounds
") FirstPoint;
		const IntPatch_ThePathPointOfTheSOnBounds & FirstPoint ();
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "	:rtype: bool
") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "	:rtype: IntPatch_ThePathPointOfTheSOnBounds
") LastPoint;
		const IntPatch_ThePathPointOfTheSOnBounds & LastPoint ();
};


%extend IntPatch_TheSegmentOfTheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_TheSurfFunction;
class IntPatch_TheSurfFunction : public math_FunctionSetWithDerivatives {
	public:
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", "	:rtype: None
") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction ();
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", "	:param PS:
	:type PS: Handle_Adaptor3d_HSurface &
	:param IS:
	:type IS: IntSurf_Quadric &
	:rtype: None
") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction (const Handle_Adaptor3d_HSurface & PS,const IntSurf_Quadric & IS);
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", "	:param IS:
	:type IS: IntSurf_Quadric &
	:rtype: None
") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction (const IntSurf_Quadric & IS);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param PS:
	:type PS: Handle_Adaptor3d_HSurface &
	:rtype: None
") Set;
		void Set (const Handle_Adaptor3d_HSurface & PS);
		%feature("compactdefaultargs") SetImplicitSurface;
		%feature("autodoc", "	:param IS:
	:type IS: IntSurf_Quadric &
	:rtype: None
") SetImplicitSurface;
		void SetImplicitSurface (const IntSurf_Quadric & IS);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Tolerance:
	:type Tolerance: float
	:rtype: None
") Set;
		void Set (const Standard_Real Tolerance);
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
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
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "	:rtype: gp_Vec
") Direction3d;
		const gp_Vec  Direction3d ();
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "	:rtype: gp_Dir2d
") Direction2d;
		const gp_Dir2d  Direction2d ();
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") PSurface;
		Handle_Adaptor3d_HSurface PSurface ();
		%feature("compactdefaultargs") ISurface;
		%feature("autodoc", "	:rtype: IntSurf_Quadric
") ISurface;
		const IntSurf_Quadric & ISurface ();
};


%extend IntPatch_TheSurfFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_ALine;
class IntPatch_ALine : public IntPatch_Line {
	public:
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "	* Creates an analytic intersection line when the transitions are In or Out.

	:param C:
	:type C: IntAna_Curve &
	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None
") IntPatch_ALine;
		 IntPatch_ALine (const IntAna_Curve & C,const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "	* Creates an analytic intersection line when the transitions are Touch.

	:param C:
	:type C: IntAna_Curve &
	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None
") IntPatch_ALine;
		 IntPatch_ALine (const IntAna_Curve & C,const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "	* Creates an analytic intersection line when the transitions are Undecided.

	:param C:
	:type C: IntAna_Curve &
	:param Tang:
	:type Tang: bool
	:rtype: None
") IntPatch_ALine;
		 IntPatch_ALine (const IntAna_Curve & C,const Standard_Boolean Tang);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* To add a vertex in the list.

	:param Pnt:
	:type Pnt: IntPatch_Point &
	:rtype: None
") AddVertex;
		void AddVertex (const IntPatch_Point & Pnt);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces the element of range Index in the list of points.

	:param Index:
	:type Index: int
	:param Pnt:
	:type Pnt: IntPatch_Point &
	:rtype: None
") Replace;
		void Replace (const Standard_Integer Index,const IntPatch_Point & Pnt);
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "	:param IndFirst:
	:type IndFirst: int
	:rtype: None
") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer IndFirst);
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "	:param IndLast:
	:type IndLast: int
	:rtype: None
") SetLastPoint;
		void SetLastPoint (const Standard_Integer IndLast);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	* Returns the first parameter on the intersection line. If IsIncluded returns True, Value and D1 methods can be call with a parameter equal to FirstParamater. Otherwise, the parameter must be greater than FirstParameter.

	:param IsIncluded:
	:type IsIncluded: bool
	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter (Standard_Boolean &OutValue);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	* Returns the last parameter on the intersection line. If IsIncluded returns True, Value and D1 methods can be call with a parameter equal to LastParamater. Otherwise, the parameter must be less than LastParameter.

	:param IsIncluded:
	:type IsIncluded: bool
	:rtype: float
") LastParameter;
		Standard_Real LastParameter (Standard_Boolean &OutValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the point of parameter U on the analytic intersection line.

	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Returns Standard_True when the derivative at parameter U is defined on the analytic intersection line. In that case, Du is the derivative. Returns Standard_False when it is not possible to evaluate the derivative. In both cases, P is the point at parameter U on the intersection.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param Du:
	:type Du: gp_Vec
	:rtype: bool
") D1;
		Standard_Boolean D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & Du);
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "	* Tries to find the parameter of the point P on the curve. If the method returns False, the 'projection' is impossible, and the value of Para is not significant. If the method returns True, Para is the parameter of the nearest intersection between the curve and the iso-theta containing P.

	:param P:
	:type P: gp_Pnt
	:param Para:
	:type Para: float &
	:rtype: bool
") FindParameter;
		Standard_Boolean FindParameter (const gp_Pnt & P,Standard_Real &OutValue);
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "	* Returns True if the line has a known First point. This point is given by the method FirstPoint().

	:rtype: bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "	* Returns True if the line has a known Last point. This point is given by the method LastPoint().

	:rtype: bool
") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	* Returns the IntPoint corresponding to the FirstPoint. An exception is raised when HasFirstPoint returns False.

	:rtype: IntPatch_Point
") FirstPoint;
		const IntPatch_Point & FirstPoint ();
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "	* Returns the IntPoint corresponding to the LastPoint. An exception is raised when HasLastPoint returns False.

	:rtype: IntPatch_Point
") LastPoint;
		const IntPatch_Point & LastPoint ();
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "	:rtype: int
") NbVertex;
		Standard_Integer NbVertex ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Returns the vertex of range Index on the line.

	:param Index:
	:type Index: int
	:rtype: IntPatch_Point
") Vertex;
		const IntPatch_Point & Vertex (const Standard_Integer Index);
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "	* Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.

	:param Tol:
	:type Tol: float
	:rtype: None
") ComputeVertexParameters;
		void ComputeVertexParameters (const Standard_Real Tol);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: IntAna_Curve
") Curve;
		const IntAna_Curve & Curve ();
};


%extend IntPatch_ALine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntPatch_ALine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntPatch_ALine::Handle_IntPatch_ALine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntPatch_ALine;
class Handle_IntPatch_ALine : public Handle_IntPatch_Line {

    public:
        // constructors
        Handle_IntPatch_ALine();
        Handle_IntPatch_ALine(const Handle_IntPatch_ALine &aHandle);
        Handle_IntPatch_ALine(const IntPatch_ALine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntPatch_ALine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntPatch_ALine {
    IntPatch_ALine* _get_reference() {
    return (IntPatch_ALine*)$self->Access();
    }
};

%extend Handle_IntPatch_ALine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntPatch_ALine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_GLine;
class IntPatch_GLine : public IntPatch_Line {
	public:
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "	* Creates a Line as intersection line when the transitions are In or Out.

	:param L:
	:type L: gp_Lin
	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None
") IntPatch_GLine;
		 IntPatch_GLine (const gp_Lin & L,const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "	* Creates a Line as intersection line when the transitions are Touch.

	:param L:
	:type L: gp_Lin
	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None
") IntPatch_GLine;
		 IntPatch_GLine (const gp_Lin & L,const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "	* Creates a Line as intersection line when the transitions are Undecided.

	:param L:
	:type L: gp_Lin
	:param Tang:
	:type Tang: bool
	:rtype: None
") IntPatch_GLine;
		 IntPatch_GLine (const gp_Lin & L,const Standard_Boolean Tang);
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "	* Creates a circle as intersection line when the transitions are In or Out.

	:param C:
	:type C: gp_Circ
	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None
") IntPatch_GLine;
		 IntPatch_GLine (const gp_Circ & C,const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "	* Creates a circle as intersection line when the transitions are Touch.

	:param C:
	:type C: gp_Circ
	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None
") IntPatch_GLine;
		 IntPatch_GLine (const gp_Circ & C,const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "	* Creates a circle as intersection line when the transitions are Undecided.

	:param C:
	:type C: gp_Circ
	:param Tang:
	:type Tang: bool
	:rtype: None
") IntPatch_GLine;
		 IntPatch_GLine (const gp_Circ & C,const Standard_Boolean Tang);
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "	* Creates an ellipse as intersection line when the transitions are In or Out.

	:param E:
	:type E: gp_Elips
	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None
") IntPatch_GLine;
		 IntPatch_GLine (const gp_Elips & E,const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "	* Creates an ellispe as intersection line when the transitions are Touch.

	:param E:
	:type E: gp_Elips
	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None
") IntPatch_GLine;
		 IntPatch_GLine (const gp_Elips & E,const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "	* Creates an ellipse as intersection line when the transitions are Undecided.

	:param E:
	:type E: gp_Elips
	:param Tang:
	:type Tang: bool
	:rtype: None
") IntPatch_GLine;
		 IntPatch_GLine (const gp_Elips & E,const Standard_Boolean Tang);
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "	* Creates a parabola as intersection line when the transitions are In or Out.

	:param P:
	:type P: gp_Parab
	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None
") IntPatch_GLine;
		 IntPatch_GLine (const gp_Parab & P,const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "	* Creates a parabola as intersection line when the transitions are Touch.

	:param P:
	:type P: gp_Parab
	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None
") IntPatch_GLine;
		 IntPatch_GLine (const gp_Parab & P,const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "	* Creates a parabola as intersection line when the transitions are Undecided.

	:param P:
	:type P: gp_Parab
	:param Tang:
	:type Tang: bool
	:rtype: None
") IntPatch_GLine;
		 IntPatch_GLine (const gp_Parab & P,const Standard_Boolean Tang);
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "	* Creates an hyperbola as intersection line when the transitions are In or Out.

	:param H:
	:type H: gp_Hypr
	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None
") IntPatch_GLine;
		 IntPatch_GLine (const gp_Hypr & H,const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "	* Creates an hyperbola as intersection line when the transitions are Touch.

	:param H:
	:type H: gp_Hypr
	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None
") IntPatch_GLine;
		 IntPatch_GLine (const gp_Hypr & H,const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "	* Creates an hyperbola as intersection line when the transitions are Undecided.

	:param H:
	:type H: gp_Hypr
	:param Tang:
	:type Tang: bool
	:rtype: None
") IntPatch_GLine;
		 IntPatch_GLine (const gp_Hypr & H,const Standard_Boolean Tang);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* To add a vertex in the list.

	:param Pnt:
	:type Pnt: IntPatch_Point &
	:rtype: None
") AddVertex;
		void AddVertex (const IntPatch_Point & Pnt);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* To replace the element of range Index in the list of points.

	:param Index:
	:type Index: int
	:param Pnt:
	:type Pnt: IntPatch_Point &
	:rtype: None
") Replace;
		void Replace (const Standard_Integer Index,const IntPatch_Point & Pnt);
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "	:param IndFirst:
	:type IndFirst: int
	:rtype: None
") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer IndFirst);
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "	:param IndLast:
	:type IndLast: int
	:rtype: None
") SetLastPoint;
		void SetLastPoint (const Standard_Integer IndLast);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns the Lin from gp corresponding to the intersection when ArcType returns IntPatch_Line.

	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	* Returns the Circ from gp corrsponding to the intersection when ArcType returns IntPatch_Circle.

	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	* Returns the Elips from gp corrsponding to the intersection when ArcType returns IntPatch_Ellipse.

	:rtype: gp_Elips
") Ellipse;
		gp_Elips Ellipse ();
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	* Returns the Parab from gp corrsponding to the intersection when ArcType returns IntPatch_Parabola.

	:rtype: gp_Parab
") Parabola;
		gp_Parab Parabola ();
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	* Returns the Hypr from gp corrsponding to the intersection when ArcType returns IntPatch_Hyperbola.

	:rtype: gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "	* Returns True if the line has a known First point. This point is given by the method FirstPoint().

	:rtype: bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "	* Returns True if the line has a known Last point. This point is given by the method LastPoint().

	:rtype: bool
") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	* Returns the IntPoint corresponding to the FirstPoint. An exception is raised when HasFirstPoint returns False.

	:rtype: IntPatch_Point
") FirstPoint;
		const IntPatch_Point & FirstPoint ();
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "	* Returns the IntPoint corresponding to the LastPoint. An exception is raised when HasLastPoint returns False.

	:rtype: IntPatch_Point
") LastPoint;
		const IntPatch_Point & LastPoint ();
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "	:rtype: int
") NbVertex;
		Standard_Integer NbVertex ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Returns the vertex of range Index on the line.

	:param Index:
	:type Index: int
	:rtype: IntPatch_Point
") Vertex;
		const IntPatch_Point & Vertex (const Standard_Integer Index);
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "	* Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.

	:param Tol:
	:type Tol: float
	:rtype: None
") ComputeVertexParameters;
		void ComputeVertexParameters (const Standard_Real Tol);
};


%extend IntPatch_GLine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntPatch_GLine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntPatch_GLine::Handle_IntPatch_GLine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntPatch_GLine;
class Handle_IntPatch_GLine : public Handle_IntPatch_Line {

    public:
        // constructors
        Handle_IntPatch_GLine();
        Handle_IntPatch_GLine(const Handle_IntPatch_GLine &aHandle);
        Handle_IntPatch_GLine(const IntPatch_GLine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntPatch_GLine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntPatch_GLine {
    IntPatch_GLine* _get_reference() {
    return (IntPatch_GLine*)$self->Access();
    }
};

%extend Handle_IntPatch_GLine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntPatch_GLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_PointLine;
class IntPatch_PointLine : public IntPatch_Line {
	public:
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "	* Returns the number of intersection points.

	:rtype: int
") NbPnts;
		virtual Standard_Integer NbPnts ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the intersection point of range Index.

	:param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S
") Point;
		virtual const IntSurf_PntOn2S & Point (const Standard_Integer Index);
};


%extend IntPatch_PointLine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntPatch_PointLine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntPatch_PointLine::Handle_IntPatch_PointLine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntPatch_PointLine;
class Handle_IntPatch_PointLine : public Handle_IntPatch_Line {

    public:
        // constructors
        Handle_IntPatch_PointLine();
        Handle_IntPatch_PointLine(const Handle_IntPatch_PointLine &aHandle);
        Handle_IntPatch_PointLine(const IntPatch_PointLine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntPatch_PointLine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntPatch_PointLine {
    IntPatch_PointLine* _get_reference() {
    return (IntPatch_PointLine*)$self->Access();
    }
};

%extend Handle_IntPatch_PointLine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntPatch_PointLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_PolyArc;
class IntPatch_PolyArc : public IntPatch_Polygo {
	public:
		%feature("compactdefaultargs") IntPatch_PolyArc;
		%feature("autodoc", "	* Creates the polygon of the arc A on the surface S. The arc is limited by the parameters Pfirst and Plast. None of these parameters can be infinite.

	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:param NbSample:
	:type NbSample: int
	:param Pfirst:
	:type Pfirst: float
	:param Plast:
	:type Plast: float
	:param BoxOtherPolygon:
	:type BoxOtherPolygon: Bnd_Box2d &
	:rtype: None
") IntPatch_PolyArc;
		 IntPatch_PolyArc (const Handle_Adaptor2d_HCurve2d & A,const Standard_Integer NbSample,const Standard_Real Pfirst,const Standard_Real Plast,const Bnd_Box2d & BoxOtherPolygon);
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	:rtype: bool
") Closed;
		virtual Standard_Boolean Closed ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d
") Point;
		gp_Pnt2d Point (const Standard_Integer Index);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: float
") Parameter;
		Standard_Real Parameter (const Standard_Integer Index);
		%feature("compactdefaultargs") SetOffset;
		%feature("autodoc", "	:param OffsetX:
	:type OffsetX: float
	:param OffsetY:
	:type OffsetY: float
	:rtype: None
") SetOffset;
		void SetOffset (const Standard_Real OffsetX,const Standard_Real OffsetY);
};


%extend IntPatch_PolyArc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_PolyLine;
class IntPatch_PolyLine : public IntPatch_Polygo {
	public:
		%feature("compactdefaultargs") IntPatch_PolyLine;
		%feature("autodoc", "	:rtype: None
") IntPatch_PolyLine;
		 IntPatch_PolyLine ();
		%feature("compactdefaultargs") IntPatch_PolyLine;
		%feature("autodoc", "	:param InitDefle:
	:type InitDefle: float
	:rtype: None
") IntPatch_PolyLine;
		 IntPatch_PolyLine (const Standard_Real InitDefle);
		%feature("compactdefaultargs") SetWLine;
		%feature("autodoc", "	:param OnFirst:
	:type OnFirst: bool
	:param Line:
	:type Line: Handle_IntPatch_WLine &
	:rtype: None
") SetWLine;
		void SetWLine (const Standard_Boolean OnFirst,const Handle_IntPatch_WLine & Line);
		%feature("compactdefaultargs") SetRLine;
		%feature("autodoc", "	:param OnFirst:
	:type OnFirst: bool
	:param Line:
	:type Line: Handle_IntPatch_RLine &
	:rtype: None
") SetRLine;
		void SetRLine (const Standard_Boolean OnFirst,const Handle_IntPatch_RLine & Line);
		%feature("compactdefaultargs") ResetError;
		%feature("autodoc", "	:rtype: None
") ResetError;
		void ResetError ();
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d
") Point;
		gp_Pnt2d Point (const Standard_Integer Index);
};


%extend IntPatch_PolyLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_RLine;
class IntPatch_RLine : public IntPatch_PointLine {
	public:
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "	* Creates a restriction as an intersection line when the transitions are In or Out.

	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None
") IntPatch_RLine;
		 IntPatch_RLine (const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "	* Creates a restriction as an intersection line when the transitions are Touch.

	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None
") IntPatch_RLine;
		 IntPatch_RLine (const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "	* Creates a restriction as an intersection line when the transitions are Undecided.

	:param Tang:
	:type Tang: bool
	:rtype: None
") IntPatch_RLine;
		 IntPatch_RLine (const Standard_Boolean Tang);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* To add a vertex in the list.

	:param Pnt:
	:type Pnt: IntPatch_Point &
	:rtype: None
") AddVertex;
		void AddVertex (const IntPatch_Point & Pnt);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces the element of range Index in the list of points.

	:param Index:
	:type Index: int
	:param Pnt:
	:type Pnt: IntPatch_Point &
	:rtype: None
") Replace;
		void Replace (const Standard_Integer Index,const IntPatch_Point & Pnt);
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "	:param IndFirst:
	:type IndFirst: int
	:rtype: None
") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer IndFirst);
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "	:param IndLast:
	:type IndLast: int
	:rtype: None
") SetLastPoint;
		void SetLastPoint (const Standard_Integer IndLast);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param L:
	:type L: Handle_IntSurf_LineOn2S &
	:rtype: None
") Add;
		void Add (const Handle_IntSurf_LineOn2S & L);
		%feature("compactdefaultargs") IsArcOnS1;
		%feature("autodoc", "	* Returns True if the intersection is on the domain of the first patch. Returns False if the intersection is on the domain of the second patch.

	:rtype: bool
") IsArcOnS1;
		Standard_Boolean IsArcOnS1 ();
		%feature("compactdefaultargs") IsArcOnS2;
		%feature("autodoc", "	* Returns True if the intersection is on the domain of the first patch. Returns False if the intersection is on the domain of the second patch.

	:rtype: bool
") IsArcOnS2;
		Standard_Boolean IsArcOnS2 ();
		%feature("compactdefaultargs") SetArcOnS1;
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") SetArcOnS1;
		void SetArcOnS1 (const Handle_Adaptor2d_HCurve2d & A);
		%feature("compactdefaultargs") SetArcOnS2;
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") SetArcOnS2;
		void SetArcOnS2 (const Handle_Adaptor2d_HCurve2d & A);
		%feature("compactdefaultargs") ArcOnS1;
		%feature("autodoc", "	* Returns the concerned arc.

	:rtype: Handle_Adaptor2d_HCurve2d
") ArcOnS1;
		Handle_Adaptor2d_HCurve2d ArcOnS1 ();
		%feature("compactdefaultargs") ArcOnS2;
		%feature("autodoc", "	* Returns the concerned arc.

	:rtype: Handle_Adaptor2d_HCurve2d
") ArcOnS2;
		Handle_Adaptor2d_HCurve2d ArcOnS2 ();
		%feature("compactdefaultargs") ParamOnS1;
		%feature("autodoc", "	:param p1:
	:type p1: float &
	:param p2:
	:type p2: float &
	:rtype: None
") ParamOnS1;
		void ParamOnS1 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ParamOnS2;
		%feature("autodoc", "	:param p1:
	:type p1: float &
	:param p2:
	:type p2: float &
	:rtype: None
") ParamOnS2;
		void ParamOnS2 (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "	* Returns True if the line has a known First point. This point is given by the method FirstPoint().

	:rtype: bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "	* Returns True if the line has a known Last point. This point is given by the method LastPoint().

	:rtype: bool
") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	* Returns the IntPoint corresponding to the FirstPoint. An exception is raised when HasFirstPoint returns False.

	:rtype: IntPatch_Point
") FirstPoint;
		const IntPatch_Point & FirstPoint ();
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "	* Returns the IntPoint corresponding to the LastPoint. An exception is raised when HasLastPoint returns False.

	:rtype: IntPatch_Point
") LastPoint;
		const IntPatch_Point & LastPoint ();
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "	:rtype: int
") NbVertex;
		Standard_Integer NbVertex ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Returns the vertex of range Index on the line.

	:param Index:
	:type Index: int
	:rtype: IntPatch_Point
") Vertex;
		const IntPatch_Point & Vertex (const Standard_Integer Index);
		%feature("compactdefaultargs") HasPolygon;
		%feature("autodoc", "	:rtype: bool
") HasPolygon;
		Standard_Boolean HasPolygon ();
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "	* Returns the number of intersection points.

	:rtype: int
") NbPnts;
		Standard_Integer NbPnts ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the intersection point of range Index.

	:param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S
") Point;
		const IntSurf_PntOn2S & Point (const Standard_Integer Index);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* Set the Point of index <Index> in the LineOn2S

	:param Index:
	:type Index: int
	:param Pnt:
	:type Pnt: IntPatch_Point &
	:rtype: None
") SetPoint;
		void SetPoint (const Standard_Integer Index,const IntPatch_Point & Pnt);
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "	* Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.

	:param Tol:
	:type Tol: float
	:rtype: None
") ComputeVertexParameters;
		void ComputeVertexParameters (const Standard_Real Tol);
};


%extend IntPatch_RLine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntPatch_RLine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntPatch_RLine::Handle_IntPatch_RLine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntPatch_RLine;
class Handle_IntPatch_RLine : public Handle_IntPatch_PointLine {

    public:
        // constructors
        Handle_IntPatch_RLine();
        Handle_IntPatch_RLine(const Handle_IntPatch_RLine &aHandle);
        Handle_IntPatch_RLine(const IntPatch_RLine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntPatch_RLine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntPatch_RLine {
    IntPatch_RLine* _get_reference() {
    return (IntPatch_RLine*)$self->Access();
    }
};

%extend Handle_IntPatch_RLine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntPatch_RLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IntPatch_WLine;
class IntPatch_WLine : public IntPatch_PointLine {
	public:
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "	* Creates a WLine as an intersection when the transitions are In or Out.

	:param Line:
	:type Line: Handle_IntSurf_LineOn2S &
	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None
") IntPatch_WLine;
		 IntPatch_WLine (const Handle_IntSurf_LineOn2S & Line,const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "	* Creates a WLine as an intersection when the transitions are Touch.

	:param Line:
	:type Line: Handle_IntSurf_LineOn2S &
	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None
") IntPatch_WLine;
		 IntPatch_WLine (const Handle_IntSurf_LineOn2S & Line,const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "	* Creates a WLine as an intersection when the transitions are Undecided.

	:param Line:
	:type Line: Handle_IntSurf_LineOn2S &
	:param Tang:
	:type Tang: bool
	:rtype: None
") IntPatch_WLine;
		 IntPatch_WLine (const Handle_IntSurf_LineOn2S & Line,const Standard_Boolean Tang);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Adds a vertex in the list.

	:param Pnt:
	:type Pnt: IntPatch_Point &
	:rtype: None
") AddVertex;
		void AddVertex (const IntPatch_Point & Pnt);
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "	* Set the Point of index <Index> in the LineOn2S

	:param Index:
	:type Index: int
	:param Pnt:
	:type Pnt: IntPatch_Point &
	:rtype: None
") SetPoint;
		void SetPoint (const Standard_Integer Index,const IntPatch_Point & Pnt);
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "	* Replaces the element of range Index in the list of points. The exception OutOfRange is raised when Index <= 0 or Index > NbVertex.

	:param Index:
	:type Index: int
	:param Pnt:
	:type Pnt: IntPatch_Point &
	:rtype: None
") Replace;
		void Replace (const Standard_Integer Index,const IntPatch_Point & Pnt);
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "	:param IndFirst:
	:type IndFirst: int
	:rtype: None
") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer IndFirst);
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "	:param IndLast:
	:type IndLast: int
	:rtype: None
") SetLastPoint;
		void SetLastPoint (const Standard_Integer IndLast);
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "	* Returns the number of intersection points.

	:rtype: int
") NbPnts;
		Standard_Integer NbPnts ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the intersection point of range Index.

	:param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S
") Point;
		const IntSurf_PntOn2S & Point (const Standard_Integer Index);
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "	* Returns True if the line has a known First point. This point is given by the method FirstPoint().

	:rtype: bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "	* Returns True if the line has a known Last point. This point is given by the method LastPoint().

	:rtype: bool
") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	* Returns the Point corresponding to the FirstPoint.

	:rtype: IntPatch_Point
") FirstPoint;
		const IntPatch_Point & FirstPoint ();
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "	* Returns the Point corresponding to the LastPoint.

	:rtype: IntPatch_Point
") LastPoint;
		const IntPatch_Point & LastPoint ();
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "	* Returns the Point corresponding to the FirstPoint. Indfirst is the index of the first in the list of vertices.

	:param Indfirst:
	:type Indfirst: int &
	:rtype: IntPatch_Point
") FirstPoint;
		const IntPatch_Point & FirstPoint (Standard_Integer &OutValue);
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "	* Returns the Point corresponding to the LastPoint. Indlast is the index of the last in the list of vertices.

	:param Indlast:
	:type Indlast: int &
	:rtype: IntPatch_Point
") LastPoint;
		const IntPatch_Point & LastPoint (Standard_Integer &OutValue);
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "	:rtype: int
") NbVertex;
		Standard_Integer NbVertex ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Returns the vertex of range Index on the line.

	:param Index:
	:type Index: int
	:rtype: IntPatch_Point
") Vertex;
		const IntPatch_Point & Vertex (const Standard_Integer Index);
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "	* Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.

	:param Tol:
	:type Tol: float
	:param hasBeenAdded: default value is Standard_False
	:type hasBeenAdded: bool
	:rtype: None
") ComputeVertexParameters;
		void ComputeVertexParameters (const Standard_Real Tol,const Standard_Boolean hasBeenAdded = Standard_False);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Handle_IntSurf_LineOn2S
") Curve;
		Handle_IntSurf_LineOn2S Curve ();
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:rtype: bool
") IsOutSurf1Box;
		Standard_Boolean IsOutSurf1Box (const gp_Pnt2d & P1);
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:rtype: bool
") IsOutSurf2Box;
		Standard_Boolean IsOutSurf2Box (const gp_Pnt2d & P1);
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: bool
") IsOutBox;
		Standard_Boolean IsOutBox (const gp_Pnt & P);
		%feature("compactdefaultargs") SetPeriod;
		%feature("autodoc", "	:param pu1:
	:type pu1: float
	:param pv1:
	:type pv1: float
	:param pu2:
	:type pu2: float
	:param pv2:
	:type pv2: float
	:rtype: None
") SetPeriod;
		void SetPeriod (const Standard_Real pu1,const Standard_Real pv1,const Standard_Real pu2,const Standard_Real pv2);
		%feature("compactdefaultargs") U1Period;
		%feature("autodoc", "	:rtype: float
") U1Period;
		Standard_Real U1Period ();
		%feature("compactdefaultargs") V1Period;
		%feature("autodoc", "	:rtype: float
") V1Period;
		Standard_Real V1Period ();
		%feature("compactdefaultargs") U2Period;
		%feature("autodoc", "	:rtype: float
") U2Period;
		Standard_Real U2Period ();
		%feature("compactdefaultargs") V2Period;
		%feature("autodoc", "	:rtype: float
") V2Period;
		Standard_Real V2Period ();
		%feature("compactdefaultargs") SetArcOnS1;
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") SetArcOnS1;
		void SetArcOnS1 (const Handle_Adaptor2d_HCurve2d & A);
		%feature("compactdefaultargs") HasArcOnS1;
		%feature("autodoc", "	:rtype: bool
") HasArcOnS1;
		Standard_Boolean HasArcOnS1 ();
		%feature("compactdefaultargs") GetArcOnS1;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") GetArcOnS1;
		Handle_Adaptor2d_HCurve2d GetArcOnS1 ();
		%feature("compactdefaultargs") SetArcOnS2;
		%feature("autodoc", "	:param A:
	:type A: Handle_Adaptor2d_HCurve2d &
	:rtype: None
") SetArcOnS2;
		void SetArcOnS2 (const Handle_Adaptor2d_HCurve2d & A);
		%feature("compactdefaultargs") HasArcOnS2;
		%feature("autodoc", "	:rtype: bool
") HasArcOnS2;
		Standard_Boolean HasArcOnS2 ();
		%feature("compactdefaultargs") GetArcOnS2;
		%feature("autodoc", "	:rtype: Handle_Adaptor2d_HCurve2d
") GetArcOnS2;
		Handle_Adaptor2d_HCurve2d GetArcOnS2 ();
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "	:rtype: None
") ClearVertexes;
		void ClearVertexes ();
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: None
") RemoveVertex;
		void RemoveVertex (const Standard_Integer theIndex);
		%feature("compactdefaultargs") InsertVertexBefore;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:param thePnt:
	:type thePnt: IntPatch_Point &
	:rtype: None
") InsertVertexBefore;
		void InsertVertexBefore (const Standard_Integer theIndex,const IntPatch_Point & thePnt);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%extend IntPatch_WLine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntPatch_WLine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntPatch_WLine::Handle_IntPatch_WLine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntPatch_WLine;
class Handle_IntPatch_WLine : public Handle_IntPatch_PointLine {

    public:
        // constructors
        Handle_IntPatch_WLine();
        Handle_IntPatch_WLine(const Handle_IntPatch_WLine &aHandle);
        Handle_IntPatch_WLine(const IntPatch_WLine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntPatch_WLine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntPatch_WLine {
    IntPatch_WLine* _get_reference() {
    return (IntPatch_WLine*)$self->Access();
    }
};

%extend Handle_IntPatch_WLine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntPatch_WLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
