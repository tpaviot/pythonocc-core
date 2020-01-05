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
%define INTPATCHDOCSTRING
"IntPatch module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_intpatch.html"
%enddef
%module (package="OCC.Core", docstring=INTPATCHDOCSTRING) IntPatch


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


%{
#include<IntPatch_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Intf_module.hxx>
#include<Adaptor3d_module.hxx>
#include<math_module.hxx>
#include<Adaptor2d_module.hxx>
#include<gp_module.hxx>
#include<IntSurf_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<IntAna_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Intf.i
%import Adaptor3d.i
%import math.i
%import Adaptor2d.i
%import gp.i
%import IntSurf.i
%import Geom2d.i
%import GeomAbs.i
%import TColStd.i
%import Bnd.i
%import IntAna.i
/* public enums */
enum IntPatch_SpecPntType {
	IntPatch_SPntNone = 0,
	IntPatch_SPntSeamU = 1,
	IntPatch_SPntSeamV = 2,
	IntPatch_SPntSeamUV = 3,
	IntPatch_SPntPoleSeamU = 4,
	IntPatch_SPntPole = 5,
};

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

/* handles */
%wrap_handle(IntPatch_Line)
%wrap_handle(IntPatch_TheIWLineOfTheIWalking)
%wrap_handle(IntPatch_ALine)
%wrap_handle(IntPatch_GLine)
%wrap_handle(IntPatch_PointLine)
%wrap_handle(IntPatch_RLine)
%wrap_handle(IntPatch_WLine)
/* end handles declaration */

/* templates */
%template(IntPatch_SequenceOfPoint) NCollection_Sequence <IntPatch_Point>;
%template(IntPatch_SequenceOfPathPointOfTheSOnBounds) NCollection_Sequence <IntPatch_ThePathPointOfTheSOnBounds>;
%template(IntPatch_SequenceOfSegmentOfTheSOnBounds) NCollection_Sequence <IntPatch_TheSegmentOfTheSOnBounds>;
%template(IntPatch_SequenceOfLine) NCollection_Sequence <opencascade::handle <IntPatch_Line>>;
%template(IntPatch_SequenceOfIWLineOfTheIWalking) NCollection_Sequence <opencascade::handle <IntPatch_TheIWLineOfTheIWalking>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <IntPatch_Point> IntPatch_SequenceOfPoint;
typedef NCollection_Sequence <IntPatch_ThePathPointOfTheSOnBounds> IntPatch_SequenceOfPathPointOfTheSOnBounds;
typedef Intf_InterferencePolygon2d IntPatch_SearchPnt;
typedef NCollection_Sequence <IntPatch_TheSegmentOfTheSOnBounds> IntPatch_SequenceOfSegmentOfTheSOnBounds;
typedef NCollection_Sequence <opencascade::handle <IntPatch_Line>> IntPatch_SequenceOfLine;
typedef NCollection_Sequence <opencascade::handle <IntPatch_TheIWLineOfTheIWalking>> IntPatch_SequenceOfIWLineOfTheIWalking;
/* end typedefs declaration */

/******************************
* class IntPatch_ALineToWLine *
******************************/
class IntPatch_ALineToWLine {
	public:
		/****************** IntPatch_ALineToWLine ******************/
		%feature("compactdefaultargs") IntPatch_ALineToWLine;
		%feature("autodoc", "* Constructor
	:param theS1:
	:type theS1: Adaptor3d_HSurface
	:param theS2:
	:type theS2: Adaptor3d_HSurface
	:param theNbPoints: default value is 200
	:type theNbPoints: int
	:rtype: None") IntPatch_ALineToWLine;
		 IntPatch_ALineToWLine (const opencascade::handle<Adaptor3d_HSurface> & theS1,const opencascade::handle<Adaptor3d_HSurface> & theS2,const Standard_Integer theNbPoints = 200);

		/****************** MakeWLine ******************/
		%feature("compactdefaultargs") MakeWLine;
		%feature("autodoc", "* Converts aline to the set of Walking-lines and adds them in theLines.
	:param aline:
	:type aline: IntPatch_ALine
	:param theLines:
	:type theLines: IntPatch_SequenceOfLine
	:rtype: None") MakeWLine;
		void MakeWLine (const opencascade::handle<IntPatch_ALine> & aline,IntPatch_SequenceOfLine & theLines);

		/****************** MakeWLine ******************/
		%feature("compactdefaultargs") MakeWLine;
		%feature("autodoc", "* Converts aline (limitted by paraminf and paramsup) to the set of Walking-lines and adds them in theLines.
	:param aline:
	:type aline: IntPatch_ALine
	:param paraminf:
	:type paraminf: float
	:param paramsup:
	:type paramsup: float
	:param theLines:
	:type theLines: IntPatch_SequenceOfLine
	:rtype: None") MakeWLine;
		void MakeWLine (const opencascade::handle<IntPatch_ALine> & aline,const Standard_Real paraminf,const Standard_Real paramsup,IntPatch_SequenceOfLine & theLines);

		/****************** SetTol3D ******************/
		%feature("compactdefaultargs") SetTol3D;
		%feature("autodoc", ":param aT:
	:type aT: float
	:rtype: None") SetTol3D;
		void SetTol3D (const Standard_Real aT);

		/****************** SetTolOpenDomain ******************/
		%feature("compactdefaultargs") SetTolOpenDomain;
		%feature("autodoc", ":param aT:
	:type aT: float
	:rtype: None") SetTolOpenDomain;
		void SetTolOpenDomain (const Standard_Real aT);

		/****************** SetTolTransition ******************/
		%feature("compactdefaultargs") SetTolTransition;
		%feature("autodoc", ":param aT:
	:type aT: float
	:rtype: None") SetTolTransition;
		void SetTolTransition (const Standard_Real aT);

		/****************** Tol3D ******************/
		%feature("compactdefaultargs") Tol3D;
		%feature("autodoc", ":rtype: float") Tol3D;
		Standard_Real Tol3D ();

		/****************** TolOpenDomain ******************/
		%feature("compactdefaultargs") TolOpenDomain;
		%feature("autodoc", ":rtype: float") TolOpenDomain;
		Standard_Real TolOpenDomain ();

		/****************** TolTransition ******************/
		%feature("compactdefaultargs") TolTransition;
		%feature("autodoc", ":rtype: float") TolTransition;
		Standard_Real TolTransition ();

};


%extend IntPatch_ALineToWLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntPatch_ArcFunction *
*****************************/
class IntPatch_ArcFunction : public math_FunctionWithDerivative {
	public:
		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor2d_HCurve2d>") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc ();

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", ":param X:
	:type X: float
	:param D:
	:type D: float
	:rtype: bool") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", ":rtype: int") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();

		/****************** IntPatch_ArcFunction ******************/
		%feature("compactdefaultargs") IntPatch_ArcFunction;
		%feature("autodoc", ":rtype: None") IntPatch_ArcFunction;
		 IntPatch_ArcFunction ();

		/****************** LastComputedPoint ******************/
		%feature("compactdefaultargs") LastComputedPoint;
		%feature("autodoc", "* Returns the point, which has been computed while the last calling Value() method
	:rtype: gp_Pnt") LastComputedPoint;
		const gp_Pnt  LastComputedPoint ();

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", ":rtype: int") NbSamples;
		Standard_Integer NbSamples ();

		/****************** Quadric ******************/
		%feature("compactdefaultargs") Quadric;
		%feature("autodoc", ":rtype: IntSurf_Quadric") Quadric;
		const IntSurf_Quadric & Quadric ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param A:
	:type A: Adaptor2d_HCurve2d
	:rtype: None") Set;
		void Set (const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: None") Set;
		void Set (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** SetQuadric ******************/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", ":param Q:
	:type Q: IntSurf_Quadric
	:rtype: None") SetQuadric;
		void SetQuadric (const IntSurf_Quadric & Q);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") Surface;
		const opencascade::handle<Adaptor3d_HSurface> & Surface ();

		/****************** Valpoint ******************/
		%feature("compactdefaultargs") Valpoint;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: gp_Pnt") Valpoint;
		const gp_Pnt  Valpoint (const Standard_Integer Index);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param X:
	:type X: float
	:param F:
	:type F: float
	:rtype: bool") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", ":param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: bool") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);

};


%extend IntPatch_ArcFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntPatch_CSFunction *
****************************/
class IntPatch_CSFunction : public math_FunctionSetWithDerivatives {
	public:
		/****************** AuxillarCurve ******************/
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor2d_HCurve2d>") AuxillarCurve;
		const opencascade::handle<Adaptor2d_HCurve2d> & AuxillarCurve ();

		/****************** AuxillarSurface ******************/
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") AuxillarSurface;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface ();

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);

		/****************** IntPatch_CSFunction ******************/
		%feature("compactdefaultargs") IntPatch_CSFunction;
		%feature("autodoc", "* S1 is the surface on which the intersection is searched. C is a curve on the surface S2.
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param S2:
	:type S2: Adaptor3d_HSurface
	:rtype: None") IntPatch_CSFunction;
		 IntPatch_CSFunction (const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor2d_HCurve2d> & C,const opencascade::handle<Adaptor3d_HSurface> & S2);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", ":rtype: int") NbEquations;
		Standard_Integer NbEquations ();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", ":rtype: int") NbVariables;
		Standard_Integer NbVariables ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":rtype: gp_Pnt") Point;
		const gp_Pnt  Point ();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", ":rtype: float") Root;
		Standard_Real Root ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:rtype: bool") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);

};


%extend IntPatch_CSFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntPatch_CurvIntSurf *
*****************************/
class IntPatch_CurvIntSurf {
	public:
		/****************** Function ******************/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "* return the math function which is used to compute the intersection
	:rtype: IntPatch_CSFunction") Function;
		IntPatch_CSFunction & Function ();

		/****************** IntPatch_CurvIntSurf ******************/
		%feature("compactdefaultargs") IntPatch_CurvIntSurf;
		%feature("autodoc", "* compute the solution point with the close point MarginCoef is the coefficient for extension of UV bounds. Ex., UFirst -= MarginCoef*(ULast-UFirst)
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param F:
	:type F: IntPatch_CSFunction
	:param TolTangency:
	:type TolTangency: float
	:param MarginCoef: default value is 0.0
	:type MarginCoef: float
	:rtype: None") IntPatch_CurvIntSurf;
		 IntPatch_CurvIntSurf (const Standard_Real U,const Standard_Real V,const Standard_Real W,const IntPatch_CSFunction & F,const Standard_Real TolTangency,const Standard_Real MarginCoef = 0.0);

		/****************** IntPatch_CurvIntSurf ******************/
		%feature("compactdefaultargs") IntPatch_CurvIntSurf;
		%feature("autodoc", "* initialize the parameters to compute the solution
	:param F:
	:type F: IntPatch_CSFunction
	:param TolTangency:
	:type TolTangency: float
	:rtype: None") IntPatch_CurvIntSurf;
		 IntPatch_CurvIntSurf (const IntPatch_CSFunction & F,const Standard_Real TolTangency);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the creation completed without failure.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", ":rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** ParameterOnCurve ******************/
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", ":rtype: float") ParameterOnCurve;
		Standard_Real ParameterOnCurve ();

		/****************** ParameterOnSurface ******************/
		%feature("compactdefaultargs") ParameterOnSurface;
		%feature("autodoc", ":param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") ParameterOnSurface;
		void ParameterOnSurface (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* compute the solution it's possible to write to optimize: IntImp_IntCS inter(S1,C1,Toltangency) math_FunctionSetRoot rsnld(Inter.function()) while ...{ u=... v=... w=... inter.Perform(u,v,w,rsnld) } or IntImp_IntCS inter(Toltangency) inter.SetSurface(S); math_FunctionSetRoot rsnld(Inter.function()) while ...{ C=... inter.SetCurve(C); u=... v=... w=... inter.Perform(u,v,w,rsnld) }
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot
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
	:rtype: None") Perform;
		void Perform (const Standard_Real U,const Standard_Real V,const Standard_Real W,math_FunctionSetRoot & Rsnld,const Standard_Real u0,const Standard_Real v0,const Standard_Real u1,const Standard_Real v1,const Standard_Real w0,const Standard_Real w1);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* returns the intersection point The exception NotDone is raised if IsDone is false. The exception DomainError is raised if IsEmpty is true.
	:rtype: gp_Pnt") Point;
		const gp_Pnt  Point ();

};


%extend IntPatch_CurvIntSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IntPatch_HCurve2dTool *
******************************/
class IntPatch_HCurve2dTool {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: opencascade::handle<Geom2d_BezierCurve>") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: gp_Circ2d") Circle;
		static gp_Circ2d Circle (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: GeomAbs_Shape") Continuity;
		static GeomAbs_Shape Continuity (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None") D0;
		static void D0 (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real U,gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None") D1;
		static void D1 (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None") D2;
		static void D2 (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
	:param C:
	:type C: Adaptor2d_HCurve2d
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
	:rtype: None") D3;
		static void D3 (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d") DN;
		static gp_Vec2d DN (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real U,const Standard_Integer N);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: gp_Elips2d") Ellipse;
		static gp_Elips2d Ellipse (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") FirstParameter;
		static Standard_Real FirstParameter (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: GeomAbs_CurveType") GetType;
		static GeomAbs_CurveType GetType (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: gp_Hypr2d") Hyperbola;
		static gp_Hypr2d Hyperbola (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") Intervals;
		static void Intervals (const opencascade::handle<Adaptor2d_HCurve2d> & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: bool") IsClosed;
		static Standard_Boolean IsClosed (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: bool") IsPeriodic;
		static Standard_Boolean IsPeriodic (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") LastParameter;
		static Standard_Real LastParameter (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: gp_Lin2d") Line;
		static gp_Lin2d Line (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbIntervals;
		static Standard_Integer NbIntervals (const opencascade::handle<Adaptor2d_HCurve2d> & C,const GeomAbs_Shape S);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int") NbSamples;
		static Standard_Integer NbSamples (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real U0,const Standard_Real U1);

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: gp_Parab2d") Parabola;
		static gp_Parab2d Parabola (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") Period;
		static Standard_Real Period (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* Returns the parametric resolution corresponding to the real space resolution <R3d>.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		static Standard_Real Resolution (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real R3d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param U:
	:type U: float
	:rtype: gp_Pnt2d") Value;
		static gp_Pnt2d Value (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Real U);

};


%extend IntPatch_HCurve2dTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntPatch_HInterTool *
****************************/
class IntPatch_HInterTool {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "* Returns the parametric limits on the arc C. These limits must be finite : they are either the real limits of the arc, for a finite arc, or a bounding box for an infinite arc.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param Ufirst:
	:type Ufirst: float
	:param Ulast:
	:type Ulast: float
	:rtype: void") Bounds;
		static void Bounds (const opencascade::handle<Adaptor2d_HCurve2d> & C,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** HasBeenSeen ******************/
		%feature("compactdefaultargs") HasBeenSeen;
		%feature("autodoc", "* Returns True if all the intersection point and edges are known on the Arc. The intersection point are given as vertices. The intersection edges are given as intervals between two vertices.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: bool") HasBeenSeen;
		static Standard_Boolean HasBeenSeen (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "* Returns True when the segment of range Index is not open at the left side. In that case, IndFirst is the range in the list intersection points (see NbPoints) of the one which defines the left bound of the segment. Otherwise, the method has to return False, and IndFirst has no meaning.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param Index:
	:type Index: int
	:param IndFirst:
	:type IndFirst: int
	:rtype: bool") HasFirstPoint;
		static Standard_Boolean HasFirstPoint (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Integer Index,Standard_Integer &OutValue);

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "* Returns True when the segment of range Index is not open at the right side. In that case, IndLast is the range in the list intersection points (see NbPoints) of the one which defines the right bound of the segment. Otherwise, the method has to return False, and IndLast has no meaning.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param Index:
	:type Index: int
	:param IndLast:
	:type IndLast: int
	:rtype: bool") HasLastPoint;
		static Standard_Boolean HasLastPoint (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Integer Index,Standard_Integer &OutValue);

		/****************** IntPatch_HInterTool ******************/
		%feature("compactdefaultargs") IntPatch_HInterTool;
		%feature("autodoc", ":rtype: None") IntPatch_HInterTool;
		 IntPatch_HInterTool ();

		/****************** IsAllSolution ******************/
		%feature("compactdefaultargs") IsAllSolution;
		%feature("autodoc", "* Returns True when the whole restriction is solution of the intersection problem.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: bool") IsAllSolution;
		static Standard_Boolean IsAllSolution (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "* Returns True if the intersection point of range Index corresponds with a vertex on the arc A.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param Index:
	:type Index: int
	:rtype: bool") IsVertex;
		static Standard_Boolean IsVertex (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Integer Index);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of intersection points on the arc A.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: int") NbPoints;
		static Standard_Integer NbPoints (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** NbSamplePoints ******************/
		%feature("compactdefaultargs") NbSamplePoints;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: int") NbSamplePoints;
		Standard_Integer NbSamplePoints (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** NbSamplesOnArc ******************/
		%feature("compactdefaultargs") NbSamplesOnArc;
		%feature("autodoc", "* returns the number of points which is used to make a sample on the arc. this number is a function of the Surface and the CurveOnSurface complexity.
	:param A:
	:type A: Adaptor2d_HCurve2d
	:rtype: int") NbSamplesOnArc;
		static Standard_Integer NbSamplesOnArc (const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** NbSamplesU ******************/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param u1:
	:type u1: float
	:param u2:
	:type u2: float
	:rtype: int") NbSamplesU;
		static Standard_Integer NbSamplesU (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real u1,const Standard_Real u2);

		/****************** NbSamplesV ******************/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param v1:
	:type v1: float
	:param v2:
	:type v2: float
	:rtype: int") NbSamplesV;
		static Standard_Integer NbSamplesV (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real v1,const Standard_Real v2);

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "* returns the number of part of A solution of the of intersection problem.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: int") NbSegments;
		static Standard_Integer NbSegments (const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns the parameter of the vertex V on the arc A.
	:param V:
	:type V: Adaptor3d_HVertex
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") Parameter;
		static Standard_Real Parameter (const opencascade::handle<Adaptor3d_HVertex> & V,const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "* Projects the point P on the arc C. If the methods returns Standard_True, the projection is successful, and Paramproj is the parameter on the arc of the projected point, Ptproj is the projected Point. If the method returns Standard_False, Param proj and Ptproj are not significant.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param P:
	:type P: gp_Pnt2d
	:param Paramproj:
	:type Paramproj: float
	:param Ptproj:
	:type Ptproj: gp_Pnt2d
	:rtype: bool") Project;
		static Standard_Boolean Project (const opencascade::handle<Adaptor2d_HCurve2d> & C,const gp_Pnt2d & P,Standard_Real &OutValue,gp_Pnt2d & Ptproj);

		/****************** SamplePoint ******************/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:param Index:
	:type Index: int
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") SamplePoint;
		void SamplePoint (const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SingularOnUMax ******************/
		%feature("compactdefaultargs") SingularOnUMax;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: bool") SingularOnUMax;
		static Standard_Boolean SingularOnUMax (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** SingularOnUMin ******************/
		%feature("compactdefaultargs") SingularOnUMin;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: bool") SingularOnUMin;
		static Standard_Boolean SingularOnUMin (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** SingularOnVMax ******************/
		%feature("compactdefaultargs") SingularOnVMax;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: bool") SingularOnVMax;
		static Standard_Boolean SingularOnVMax (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** SingularOnVMin ******************/
		%feature("compactdefaultargs") SingularOnVMin;
		%feature("autodoc", ":param S:
	:type S: Adaptor3d_HSurface
	:rtype: bool") SingularOnVMin;
		static Standard_Boolean SingularOnVMin (const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Returns the parametric tolerance used to consider that the vertex and another point meet, i-e if Abs(parameter(Vertex) - parameter(OtherPnt))<= Tolerance, the points are 'merged'.
	:param V:
	:type V: Adaptor3d_HVertex
	:param C:
	:type C: Adaptor2d_HCurve2d
	:rtype: float") Tolerance;
		static Standard_Real Tolerance (const opencascade::handle<Adaptor3d_HVertex> & V,const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the value (Pt), the tolerance (Tol), and the parameter (U) on the arc A , of the intersection point of range Index.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param Index:
	:type Index: int
	:param Pt:
	:type Pt: gp_Pnt
	:param Tol:
	:type Tol: float
	:param U:
	:type U: float
	:rtype: void") Value;
		static void Value (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Integer Index,gp_Pnt & Pt,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "* When IsVertex returns True, this method returns the vertex on the arc A.
	:param C:
	:type C: Adaptor2d_HCurve2d
	:param Index:
	:type Index: int
	:param V:
	:type V: Adaptor3d_HVertex
	:rtype: void") Vertex;
		static void Vertex (const opencascade::handle<Adaptor2d_HCurve2d> & C,const Standard_Integer Index,opencascade::handle<Adaptor3d_HVertex> & V);

};


%extend IntPatch_HInterTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IntPatch_ImpImpIntersection *
************************************/
class IntPatch_ImpImpIntersection {
	public:
		/****************** IntPatch_ImpImpIntersection ******************/
		%feature("compactdefaultargs") IntPatch_ImpImpIntersection;
		%feature("autodoc", ":rtype: None") IntPatch_ImpImpIntersection;
		 IntPatch_ImpImpIntersection ();

		/****************** IntPatch_ImpImpIntersection ******************/
		%feature("compactdefaultargs") IntPatch_ImpImpIntersection;
		%feature("autodoc", "* Flag theIsReqToKeepRLine has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. When intersection result returns IntPatch_RLine and another IntPatch_Line (not restriction) we (in case of theIsReqToKeepRLine==True) will always keep both lines even if they are coincided.
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param D1:
	:type D1: Adaptor3d_TopolTool
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param D2:
	:type D2: Adaptor3d_TopolTool
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:param theIsReqToKeepRLine: default value is Standard_False
	:type theIsReqToKeepRLine: bool
	:rtype: None") IntPatch_ImpImpIntersection;
		 IntPatch_ImpImpIntersection (const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & D1,const opencascade::handle<Adaptor3d_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & D2,const Standard_Real TolArc,const Standard_Real TolTang,const Standard_Boolean theIsReqToKeepRLine = Standard_False);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the calculus was successful.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns true if the is no intersection.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "* Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<IntPatch_Line>") Line;
		const opencascade::handle<IntPatch_Line> & Line (const Standard_Integer Index);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "* Returns the number of intersection lines.
	:rtype: int") NbLines;
		Standard_Integer NbLines ();

		/****************** NbPnts ******************/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "* Returns the number of 'single' points.
	:rtype: int") NbPnts;
		Standard_Integer NbPnts ();

		/****************** OppositeFaces ******************/
		%feature("compactdefaultargs") OppositeFaces;
		%feature("autodoc", "* Returns True when the TangentFaces returns True and the normal vectors evaluated at a point on the first and the second surface are opposite. The exception DomainError is raised if TangentFaces returns False.
	:rtype: bool") OppositeFaces;
		Standard_Boolean OppositeFaces ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Flag theIsReqToKeepRLine has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. When intersection result returns IntPatch_RLine and another IntPatch_Line (not restriction) we (in case of theIsReqToKeepRLine==True) will always keep both lines even if they are coincided.
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param D1:
	:type D1: Adaptor3d_TopolTool
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param D2:
	:type D2: Adaptor3d_TopolTool
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:param theIsReqToKeepRLine: default value is Standard_False
	:type theIsReqToKeepRLine: bool
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & D1,const opencascade::handle<Adaptor3d_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & D2,const Standard_Real TolArc,const Standard_Real TolTang,const Standard_Boolean theIsReqToKeepRLine = Standard_False);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the point of range Index. An exception is raised if Index<=0 or Index>NbPnt.
	:param Index:
	:type Index: int
	:rtype: IntPatch_Point") Point;
		const IntPatch_Point & Point (const Standard_Integer Index);

		/****************** TangentFaces ******************/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "* Returns True if the two patches are considered as entirely tangent, i.e every restriction arc of one patch is inside the geometric base of the other patch.
	:rtype: bool") TangentFaces;
		Standard_Boolean TangentFaces ();

};


%extend IntPatch_ImpImpIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IntPatch_ImpPrmIntersection *
************************************/
class IntPatch_ImpPrmIntersection {
	public:
		/****************** IntPatch_ImpPrmIntersection ******************/
		%feature("compactdefaultargs") IntPatch_ImpPrmIntersection;
		%feature("autodoc", ":rtype: None") IntPatch_ImpPrmIntersection;
		 IntPatch_ImpPrmIntersection ();

		/****************** IntPatch_ImpPrmIntersection ******************/
		%feature("compactdefaultargs") IntPatch_ImpPrmIntersection;
		%feature("autodoc", ":param Surf1:
	:type Surf1: Adaptor3d_HSurface
	:param D1:
	:type D1: Adaptor3d_TopolTool
	:param Surf2:
	:type Surf2: Adaptor3d_HSurface
	:param D2:
	:type D2: Adaptor3d_TopolTool
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:param Fleche:
	:type Fleche: float
	:param Pas:
	:type Pas: float
	:rtype: None") IntPatch_ImpPrmIntersection;
		 IntPatch_ImpPrmIntersection (const opencascade::handle<Adaptor3d_HSurface> & Surf1,const opencascade::handle<Adaptor3d_TopolTool> & D1,const opencascade::handle<Adaptor3d_HSurface> & Surf2,const opencascade::handle<Adaptor3d_TopolTool> & D2,const Standard_Real TolArc,const Standard_Real TolTang,const Standard_Real Fleche,const Standard_Real Pas);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns true if the calculus was succesfull.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns true if the is no intersection.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "* Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<IntPatch_Line>") Line;
		const opencascade::handle<IntPatch_Line> & Line (const Standard_Integer Index);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "* Returns the number of intersection lines.
	:rtype: int") NbLines;
		Standard_Integer NbLines ();

		/****************** NbPnts ******************/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "* Returns the number of 'single' points.
	:rtype: int") NbPnts;
		Standard_Integer NbPnts ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Surf1:
	:type Surf1: Adaptor3d_HSurface
	:param D1:
	:type D1: Adaptor3d_TopolTool
	:param Surf2:
	:type Surf2: Adaptor3d_HSurface
	:param D2:
	:type D2: Adaptor3d_TopolTool
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:param Fleche:
	:type Fleche: float
	:param Pas:
	:type Pas: float
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & Surf1,const opencascade::handle<Adaptor3d_TopolTool> & D1,const opencascade::handle<Adaptor3d_HSurface> & Surf2,const opencascade::handle<Adaptor3d_TopolTool> & D2,const Standard_Real TolArc,const Standard_Real TolTang,const Standard_Real Fleche,const Standard_Real Pas);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the point of range Index. An exception is raised if Index<=0 or Index>NbPnt.
	:param Index:
	:type Index: int
	:rtype: IntPatch_Point") Point;
		const IntPatch_Point & Point (const Standard_Integer Index);

		/****************** SetStartPoint ******************/
		%feature("compactdefaultargs") SetStartPoint;
		%feature("autodoc", "* to search for solution from the given point
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None") SetStartPoint;
		void SetStartPoint (const Standard_Real U,const Standard_Real V);

};


%extend IntPatch_ImpPrmIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IntPatch_InterferencePolyhedron *
****************************************/
class IntPatch_InterferencePolyhedron : public Intf_Interference {
	public:
		/****************** IntPatch_InterferencePolyhedron ******************/
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "* Constructs an empty interference of Polyhedron.
	:rtype: None") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron ();

		/****************** IntPatch_InterferencePolyhedron ******************/
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "* Constructs and computes an interference between the two Polyhedra.
	:param Obje1:
	:type Obje1: IntPatch_Polyhedron
	:param Obje2:
	:type Obje2: IntPatch_Polyhedron
	:rtype: None") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron (const IntPatch_Polyhedron & Obje1,const IntPatch_Polyhedron & Obje2);

		/****************** IntPatch_InterferencePolyhedron ******************/
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "* Constructs and computes the self interference of a Polyhedron.
	:param Obje:
	:type Obje: IntPatch_Polyhedron
	:rtype: None") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron (const IntPatch_Polyhedron & Obje);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes the interference between the two Polyhedra.
	:param Obje1:
	:type Obje1: IntPatch_Polyhedron
	:param Obje2:
	:type Obje2: IntPatch_Polyhedron
	:rtype: None") Perform;
		void Perform (const IntPatch_Polyhedron & Obje1,const IntPatch_Polyhedron & Obje2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Computes the self interference of a Polyhedron.
	:param Obje:
	:type Obje: IntPatch_Polyhedron
	:rtype: None") Perform;
		void Perform (const IntPatch_Polyhedron & Obje);

};


%extend IntPatch_InterferencePolyhedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IntPatch_Intersection *
******************************/
class IntPatch_Intersection {
	public:
		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* Dump of each result line. Mode for more accurate dumps.
	:param Mode:
	:type Mode: int
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param D1:
	:type D1: Adaptor3d_TopolTool
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param D2:
	:type D2: Adaptor3d_TopolTool
	:rtype: None") Dump;
		void Dump (const Standard_Integer Mode,const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & D1,const opencascade::handle<Adaptor3d_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & D2);

		/****************** IntPatch_Intersection ******************/
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", ":rtype: None") IntPatch_Intersection;
		 IntPatch_Intersection ();

		/****************** IntPatch_Intersection ******************/
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", ":param S1:
	:type S1: Adaptor3d_HSurface
	:param D1:
	:type D1: Adaptor3d_TopolTool
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param D2:
	:type D2: Adaptor3d_TopolTool
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:rtype: None") IntPatch_Intersection;
		 IntPatch_Intersection (const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & D1,const opencascade::handle<Adaptor3d_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & D2,const Standard_Real TolArc,const Standard_Real TolTang);

		/****************** IntPatch_Intersection ******************/
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", ":param S1:
	:type S1: Adaptor3d_HSurface
	:param D1:
	:type D1: Adaptor3d_TopolTool
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:rtype: None") IntPatch_Intersection;
		 IntPatch_Intersection (const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & D1,const Standard_Real TolArc,const Standard_Real TolTang);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the calculus was successful.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns true if the is no intersection.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "* Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<IntPatch_Line>") Line;
		const opencascade::handle<IntPatch_Line> & Line (const Standard_Integer Index);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "* Returns the number of intersection lines.
	:rtype: int") NbLines;
		Standard_Integer NbLines ();

		/****************** NbPnts ******************/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "* Returns the number of 'single' points.
	:rtype: int") NbPnts;
		Standard_Integer NbPnts ();

		/****************** OppositeFaces ******************/
		%feature("compactdefaultargs") OppositeFaces;
		%feature("autodoc", "* Returns True when the TangentFaces returns True and the normal vectors evaluated at a point on the first and the second surface are opposite. The exception DomainError is raised if TangentFaces returns False.
	:rtype: bool") OppositeFaces;
		Standard_Boolean OppositeFaces ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Flag theIsReqToKeepRLine has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. When intersection result returns IntPatch_RLine and another IntPatch_Line (not restriction) we (in case of theIsReqToKeepRLine==True) will always keep both lines even if they are coincided. Flag theIsReqToPostWLProc has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. If theIsReqToPostWLProc == False, then we will work with Walking-line obtained after intersection algorithm directly (wothout any post-processing).
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param D1:
	:type D1: Adaptor3d_TopolTool
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param D2:
	:type D2: Adaptor3d_TopolTool
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:param isGeomInt: default value is Standard_True
	:type isGeomInt: bool
	:param theIsReqToKeepRLine: default value is Standard_False
	:type theIsReqToKeepRLine: bool
	:param theIsReqToPostWLProc: default value is Standard_True
	:type theIsReqToPostWLProc: bool
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & D1,const opencascade::handle<Adaptor3d_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & D2,const Standard_Real TolArc,const Standard_Real TolTang,const Standard_Boolean isGeomInt = Standard_True,const Standard_Boolean theIsReqToKeepRLine = Standard_False,const Standard_Boolean theIsReqToPostWLProc = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* If isGeomInt == Standard_False, then method Param-Param intersection will be used. Flag theIsReqToKeepRLine has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. When intersection result returns IntPatch_RLine and another IntPatch_Line (not restriction) we (in case of theIsReqToKeepRLine==True) will always keep both lines even if they are coincided. Flag theIsReqToPostWLProc has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. If theIsReqToPostWLProc == False, then we will work with Walking-line obtained after intersection algorithm directly (without any post-processing).
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param D1:
	:type D1: Adaptor3d_TopolTool
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param D2:
	:type D2: Adaptor3d_TopolTool
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:param LOfPnts:
	:type LOfPnts: IntSurf_ListOfPntOn2S
	:param isGeomInt: default value is Standard_True
	:type isGeomInt: bool
	:param theIsReqToKeepRLine: default value is Standard_False
	:type theIsReqToKeepRLine: bool
	:param theIsReqToPostWLProc: default value is Standard_True
	:type theIsReqToPostWLProc: bool
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & D1,const opencascade::handle<Adaptor3d_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & D2,const Standard_Real TolArc,const Standard_Real TolTang,IntSurf_ListOfPntOn2S & LOfPnts,const Standard_Boolean isGeomInt = Standard_True,const Standard_Boolean theIsReqToKeepRLine = Standard_False,const Standard_Boolean theIsReqToPostWLProc = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Perform with start point
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param D1:
	:type D1: Adaptor3d_TopolTool
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param D2:
	:type D2: Adaptor3d_TopolTool
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
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & D1,const opencascade::handle<Adaptor3d_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & D2,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real TolArc,const Standard_Real TolTang);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Uses for finding self-intersected surfaces.
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param D1:
	:type D1: Adaptor3d_TopolTool
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & D1,const Standard_Real TolArc,const Standard_Real TolTang);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the point of range Index. An exception is raised if Index<=0 or Index>NbPnt.
	:param Index:
	:type Index: int
	:rtype: IntPatch_Point") Point;
		const IntPatch_Point & Point (const Standard_Integer Index);

		/****************** SequenceOfLine ******************/
		%feature("compactdefaultargs") SequenceOfLine;
		%feature("autodoc", ":rtype: IntPatch_SequenceOfLine") SequenceOfLine;
		const IntPatch_SequenceOfLine & SequenceOfLine ();

		/****************** SetTolerances ******************/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "* Set the tolerances used by the algorithms: --- Implicit - Parametric --- Parametric - Parametric --- Implicit - Implicit //! TolArc is used to compute the intersections between the restrictions of a surface and a walking line. //! TolTang is used to compute the points on a walking line, and in geometric algorithms. //! Fleche is a parameter used in the walking algorithms to provide small curvatures on a line. //! UVMaxStep is a parameter used in the walking algorithms to compute the distance between to points in their respective parametric spaces.
	:param TolArc:
	:type TolArc: float
	:param TolTang:
	:type TolTang: float
	:param UVMaxStep:
	:type UVMaxStep: float
	:param Fleche:
	:type Fleche: float
	:rtype: None") SetTolerances;
		void SetTolerances (const Standard_Real TolArc,const Standard_Real TolTang,const Standard_Real UVMaxStep,const Standard_Real Fleche);

		/****************** TangentFaces ******************/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "* Returns True if the two patches are considered as entirely tangent, i-e every restriction arc of one patch is inside the geometric base of the other patch.
	:rtype: bool") TangentFaces;
		Standard_Boolean TangentFaces ();

};


%extend IntPatch_Intersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class IntPatch_Line *
**********************/
%nodefaultctor IntPatch_Line;
class IntPatch_Line : public Standard_Transient {
	public:
		/****************** ArcType ******************/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "* Returns the type of geometry 3d (Line, Circle, Parabola, Hyperbola, Ellipse, Analytic, Walking, Restriction)
	:rtype: IntPatch_IType") ArcType;
		IntPatch_IType ArcType ();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "* Returns True if the intersection is a line of tangency between the 2 patches.
	:rtype: bool") IsTangent;
		Standard_Boolean IsTangent ();

		/****************** IsUIsoOnS1 ******************/
		%feature("compactdefaultargs") IsUIsoOnS1;
		%feature("autodoc", "* Returns True if the intersection is a U isoparametric curve on the first patch.
	:rtype: bool") IsUIsoOnS1;
		Standard_Boolean IsUIsoOnS1 ();

		/****************** IsUIsoOnS2 ******************/
		%feature("compactdefaultargs") IsUIsoOnS2;
		%feature("autodoc", "* Returns True if the intersection is a U isoparametric curve on the second patch.
	:rtype: bool") IsUIsoOnS2;
		Standard_Boolean IsUIsoOnS2 ();

		/****************** IsVIsoOnS1 ******************/
		%feature("compactdefaultargs") IsVIsoOnS1;
		%feature("autodoc", "* Returns True if the intersection is a V isoparametric curve on the first patch.
	:rtype: bool") IsVIsoOnS1;
		Standard_Boolean IsVIsoOnS1 ();

		/****************** IsVIsoOnS2 ******************/
		%feature("compactdefaultargs") IsVIsoOnS2;
		%feature("autodoc", "* Returns True if the intersection is a V isoparametric curve on the second patch.
	:rtype: bool") IsVIsoOnS2;
		Standard_Boolean IsVIsoOnS2 ();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* To set the values returned by IsUIsoS1,.... The default values are False.
	:param Uiso1:
	:type Uiso1: bool
	:param Viso1:
	:type Viso1: bool
	:param Uiso2:
	:type Uiso2: bool
	:param Viso2:
	:type Viso2: bool
	:rtype: None") SetValue;
		void SetValue (const Standard_Boolean Uiso1,const Standard_Boolean Viso1,const Standard_Boolean Uiso2,const Standard_Boolean Viso2);

		/****************** SituationS1 ******************/
		%feature("compactdefaultargs") SituationS1;
		%feature("autodoc", "* Returns the situation (INSIDE/OUTSIDE/UNKNOWN) of the first patch compared to the second one, when TransitionOnS1 or TransitionOnS2 returns TOUCH. Otherwise, an exception is raised.
	:rtype: IntSurf_Situation") SituationS1;
		IntSurf_Situation SituationS1 ();

		/****************** SituationS2 ******************/
		%feature("compactdefaultargs") SituationS2;
		%feature("autodoc", "* Returns the situation (INSIDE/OUTSIDE/UNKNOWN) of the second patch compared to the first one, when TransitionOnS1 or TransitionOnS2 returns TOUCH. Otherwise, an exception is raised.
	:rtype: IntSurf_Situation") SituationS2;
		IntSurf_Situation SituationS2 ();

		/****************** TransitionOnS1 ******************/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "* Returns the type of the transition of the line for the first surface. The transition is 'constant' along the line. The transition is IN if the line is oriented in such a way that the system of vector (N1,N2,T) is right-handed, where N1 is the normal to the first surface at a point P, N2 is the normal to the second surface at a point P, T is the tangent to the intersection line at P. If the system of vector is left-handed, the transition is OUT. When N1 and N2 are colinear all along the intersection line, the transition will be - TOUCH, if it is possible to use the 2nd derivatives to determine the position of one surafce compared to the other (see Situation) - UNDECIDED otherwise. //! If one of the transition is TOUCH or UNDECIDED, the other one has got the same value.
	:rtype: IntSurf_TypeTrans") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1 ();

		/****************** TransitionOnS2 ******************/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "* Returns the type of the transition of the line for the second surface. The transition is 'constant' along the line.
	:rtype: IntSurf_TypeTrans") TransitionOnS2;
		IntSurf_TypeTrans TransitionOnS2 ();

};


%make_alias(IntPatch_Line)

%extend IntPatch_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IntPatch_LineConstructor *
*********************************/
class IntPatch_LineConstructor {
	public:
		/****************** IntPatch_LineConstructor ******************/
		%feature("compactdefaultargs") IntPatch_LineConstructor;
		%feature("autodoc", ":param mode:
	:type mode: int
	:rtype: None") IntPatch_LineConstructor;
		 IntPatch_LineConstructor (const Standard_Integer mode);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":param index:
	:type index: int
	:rtype: opencascade::handle<IntPatch_Line>") Line;
		opencascade::handle<IntPatch_Line> Line (const Standard_Integer index);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", ":rtype: int") NbLines;
		Standard_Integer NbLines ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param SL:
	:type SL: IntPatch_SequenceOfLine
	:param L:
	:type L: IntPatch_Line
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param D1:
	:type D1: Adaptor3d_TopolTool
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param D2:
	:type D2: Adaptor3d_TopolTool
	:param Tol:
	:type Tol: float
	:rtype: None") Perform;
		void Perform (const IntPatch_SequenceOfLine & SL,const opencascade::handle<IntPatch_Line> & L,const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_TopolTool> & D1,const opencascade::handle<Adaptor3d_HSurface> & S2,const opencascade::handle<Adaptor3d_TopolTool> & D2,const Standard_Real Tol);

};


%extend IntPatch_LineConstructor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntPatch_Point *
***********************/
class IntPatch_Point {
	public:
		/****************** ArcOnS1 ******************/
		%feature("compactdefaultargs") ArcOnS1;
		%feature("autodoc", "* Returns the arc of restriction containing the vertex. The exception DomainError is raised if IsOnDomS1 returns False.
	:rtype: opencascade::handle<Adaptor2d_HCurve2d>") ArcOnS1;
		const opencascade::handle<Adaptor2d_HCurve2d> & ArcOnS1 ();

		/****************** ArcOnS2 ******************/
		%feature("compactdefaultargs") ArcOnS2;
		%feature("autodoc", "* Returns the arc of restriction containing the vertex. The exception DomainError is raised if IsOnDomS2 returns False.
	:rtype: opencascade::handle<Adaptor2d_HCurve2d>") ArcOnS2;
		const opencascade::handle<Adaptor2d_HCurve2d> & ArcOnS2 ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: None") Dump;
		void Dump ();

		/****************** IntPatch_Point ******************/
		%feature("compactdefaultargs") IntPatch_Point;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") IntPatch_Point;
		 IntPatch_Point ();

		/****************** IsMultiple ******************/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "* Returns True if the point belongs to several intersection lines.
	:rtype: bool") IsMultiple;
		Standard_Boolean IsMultiple ();

		/****************** IsOnDomS1 ******************/
		%feature("compactdefaultargs") IsOnDomS1;
		%feature("autodoc", "* Returns True if the point is on a boundary of the domain of the first patch.
	:rtype: bool") IsOnDomS1;
		Standard_Boolean IsOnDomS1 ();

		/****************** IsOnDomS2 ******************/
		%feature("compactdefaultargs") IsOnDomS2;
		%feature("autodoc", "* Returns True if the point is on a boundary of the domain of the second patch.
	:rtype: bool") IsOnDomS2;
		Standard_Boolean IsOnDomS2 ();

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "* Returns True if the Point is a tangency point between the surfaces. If the Point is on one of the domain (IsOnDomS1 returns True or IsOnDomS2 returns True), an exception is raised.
	:rtype: bool") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint ();

		/****************** IsVertexOnS1 ******************/
		%feature("compactdefaultargs") IsVertexOnS1;
		%feature("autodoc", "* Returns True if the point is a vertex on the initial restriction facet of the first surface.
	:rtype: bool") IsVertexOnS1;
		Standard_Boolean IsVertexOnS1 ();

		/****************** IsVertexOnS2 ******************/
		%feature("compactdefaultargs") IsVertexOnS2;
		%feature("autodoc", "* Returns True if the point is a vertex on the initial restriction facet of the first surface.
	:rtype: bool") IsVertexOnS2;
		Standard_Boolean IsVertexOnS2 ();

		/****************** ParameterOnArc1 ******************/
		%feature("compactdefaultargs") ParameterOnArc1;
		%feature("autodoc", "* Returns the parameter of the point on the arc returned by the method ArcOnS2. The exception DomainError is raised if IsOnDomS1 returns False.
	:rtype: float") ParameterOnArc1;
		Standard_Real ParameterOnArc1 ();

		/****************** ParameterOnArc2 ******************/
		%feature("compactdefaultargs") ParameterOnArc2;
		%feature("autodoc", "* Returns the parameter of the point on the arc returned by the method ArcOnS2. The exception DomainError is raised if IsOnDomS2 returns False.
	:rtype: float") ParameterOnArc2;
		Standard_Real ParameterOnArc2 ();

		/****************** ParameterOnLine ******************/
		%feature("compactdefaultargs") ParameterOnLine;
		%feature("autodoc", "* This method returns the parameter of the point on the intersection line. If the points does not belong to an intersection line, the value returned does not have any sens.
	:rtype: float") ParameterOnLine;
		Standard_Real ParameterOnLine ();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "* Returns the parameters on the first and on the second surface of the point.
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: None") Parameters;
		void Parameters (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ParametersOnS1 ******************/
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "* Returns the parameters on the first surface of the point.
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:rtype: None") ParametersOnS1;
		void ParametersOnS1 (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ParametersOnS2 ******************/
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "* Returns the parameters on the second surface of the point.
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: None") ParametersOnS2;
		void ParametersOnS2 (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** PntOn2S ******************/
		%feature("compactdefaultargs") PntOn2S;
		%feature("autodoc", "* Returns the PntOn2S (geometric Point and the parameters)
	:rtype: IntSurf_PntOn2S") PntOn2S;
		const IntSurf_PntOn2S & PntOn2S ();

		/****************** ReverseTransition ******************/
		%feature("compactdefaultargs") ReverseTransition;
		%feature("autodoc", ":rtype: None") ReverseTransition;
		void ReverseTransition ();

		/****************** SetArc ******************/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "* Sets the values of a point which is on one of the domain, when both surfaces are implicit ones. If OnFirst is True, the point is on the domain of the first patch, otherwise the point is on the domain of the second surface.
	:param OnFirst:
	:type OnFirst: bool
	:param A:
	:type A: Adaptor2d_HCurve2d
	:param Param:
	:type Param: float
	:param TLine:
	:type TLine: IntSurf_Transition
	:param TArc:
	:type TArc: IntSurf_Transition
	:rtype: None") SetArc;
		void SetArc (const Standard_Boolean OnFirst,const opencascade::handle<Adaptor2d_HCurve2d> & A,const Standard_Real Param,const IntSurf_Transition & TLine,const IntSurf_Transition & TArc);

		/****************** SetMultiple ******************/
		%feature("compactdefaultargs") SetMultiple;
		%feature("autodoc", "* Sets (or unsets) the point as a point on several intersection line.
	:param IsMult:
	:type IsMult: bool
	:rtype: None") SetMultiple;
		void SetMultiple (const Standard_Boolean IsMult);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "* Set the value of the parameter on the intersection line.
	:param Para:
	:type Para: float
	:rtype: None") SetParameter;
		void SetParameter (const Standard_Real Para);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "* Sets the values of the parameters of the point on each surface.
	:param U1:
	:type U1: float
	:param V1:
	:type V1: float
	:param U2:
	:type U2: float
	:param V2:
	:type V2: float
	:rtype: None") SetParameters;
		void SetParameters (const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", ":param Tol:
	:type Tol: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real Tol);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Sets the values of a point which is on no domain, when both surfaces are implicit ones. If Tangent is True, the point is a point of tangency between the surfaces.
	:param Pt:
	:type Pt: gp_Pnt
	:param Tol:
	:type Tol: float
	:param Tangent:
	:type Tangent: bool
	:rtype: None") SetValue;
		void SetValue (const gp_Pnt & Pt,const Standard_Real Tol,const Standard_Boolean Tangent);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param Pt:
	:type Pt: gp_Pnt
	:rtype: None") SetValue;
		void SetValue (const gp_Pnt & Pt);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Sets the value of <pt> member
	:param thePOn2S:
	:type thePOn2S: IntSurf_PntOn2S
	:rtype: None") SetValue;
		void SetValue (const IntSurf_PntOn2S & thePOn2S);

		/****************** SetVertex ******************/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "* Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface. If OnFirst is True, the point is on the domain of the first patch, otherwise the point is on the domain of the second surface.
	:param OnFirst:
	:type OnFirst: bool
	:param V:
	:type V: Adaptor3d_HVertex
	:rtype: None") SetVertex;
		void SetVertex (const Standard_Boolean OnFirst,const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* This method returns the fuzziness on the point.
	:rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** TransitionLineArc1 ******************/
		%feature("compactdefaultargs") TransitionLineArc1;
		%feature("autodoc", "* Returns the transition of the point on the intersection line with the arc on S1. The exception DomainError is raised if IsOnDomS1 returns False.
	:rtype: IntSurf_Transition") TransitionLineArc1;
		const IntSurf_Transition & TransitionLineArc1 ();

		/****************** TransitionLineArc2 ******************/
		%feature("compactdefaultargs") TransitionLineArc2;
		%feature("autodoc", "* Returns the transition of the point on the intersection line with the arc on S2. The exception DomainError is raised if IsOnDomS2 returns False.
	:rtype: IntSurf_Transition") TransitionLineArc2;
		const IntSurf_Transition & TransitionLineArc2 ();

		/****************** TransitionOnS1 ******************/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "* Returns the transition between the intersection line returned by the method Line and the arc on S1 returned by ArcOnS1(). The exception DomainError is raised if IsOnDomS1 returns False.
	:rtype: IntSurf_Transition") TransitionOnS1;
		const IntSurf_Transition & TransitionOnS1 ();

		/****************** TransitionOnS2 ******************/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "* Returns the transition between the intersection line returned by the method Line and the arc on S2 returned by ArcOnS2. The exception DomainError is raised if IsOnDomS2 returns False.
	:rtype: IntSurf_Transition") TransitionOnS2;
		const IntSurf_Transition & TransitionOnS2 ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the intersection point (geometric information).
	:rtype: gp_Pnt") Value;
		const gp_Pnt  Value ();

		/****************** VertexOnS1 ******************/
		%feature("compactdefaultargs") VertexOnS1;
		%feature("autodoc", "* Returns the information about the point when it is on the domain of the first patch, i-e when the function IsVertexOnS1 returns True. Otherwise, an exception is raised.
	:rtype: opencascade::handle<Adaptor3d_HVertex>") VertexOnS1;
		const opencascade::handle<Adaptor3d_HVertex> & VertexOnS1 ();

		/****************** VertexOnS2 ******************/
		%feature("compactdefaultargs") VertexOnS2;
		%feature("autodoc", "* Returns the information about the point when it is on the domain of the second patch, i-e when the function IsVertexOnS2 returns True. Otherwise, an exception is raised.
	:rtype: opencascade::handle<Adaptor3d_HVertex>") VertexOnS2;
		const opencascade::handle<Adaptor3d_HVertex> & VertexOnS2 ();

};


%extend IntPatch_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IntPatch_Polygo *
************************/
%nodefaultctor IntPatch_Polygo;
class IntPatch_Polygo : public Intf_Polygon2d {
	public:
		/****************** DeflectionOverEstimation ******************/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "* Returns the tolerance of the polygon.
	:rtype: float") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", ":rtype: None") Dump;
		void Dump ();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", ":rtype: float") Error;
		Standard_Real Error ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", ":rtype: int") NbPoints;
		virtual Standard_Integer NbPoints ();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "* Returns the number of Segments in the polyline.
	:rtype: int") NbSegments;
		Standard_Integer NbSegments ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: gp_Pnt2d") Point;
		virtual gp_Pnt2d Point (const Standard_Integer Index);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "* Returns the points of the segment <Index> in the Polygon.
	:param theIndex:
	:type theIndex: int
	:param theBegin:
	:type theBegin: gp_Pnt2d
	:param theEnd:
	:type theEnd: gp_Pnt2d
	:rtype: None") Segment;
		void Segment (const Standard_Integer theIndex,gp_Pnt2d & theBegin,gp_Pnt2d & theEnd);

};


%extend IntPatch_Polygo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntPatch_Polyhedron *
****************************/
/********************************
* class IntPatch_PolyhedronTool *
********************************/
class IntPatch_PolyhedronTool {
	public:
		/****************** Bounding ******************/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "* Give the bounding box of the Polyhedron.
	:param thePolyh:
	:type thePolyh: IntPatch_Polyhedron
	:rtype: Bnd_Box") Bounding;
		static const Bnd_Box & Bounding (const IntPatch_Polyhedron & thePolyh);

		/****************** ComponentsBounding ******************/
		%feature("compactdefaultargs") ComponentsBounding;
		%feature("autodoc", "* Give the array of boxes. The box <n> corresponding to the triangle <n>.
	:param thePolyh:
	:type thePolyh: IntPatch_Polyhedron
	:rtype: opencascade::handle<Bnd_HArray1OfBox>") ComponentsBounding;
		static const opencascade::handle<Bnd_HArray1OfBox> & ComponentsBounding (const IntPatch_Polyhedron & thePolyh);

		/****************** DeflectionOverEstimation ******************/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "* Give the tolerance of the polygon.
	:param thePolyh:
	:type thePolyh: IntPatch_Polyhedron
	:rtype: float") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation (const IntPatch_Polyhedron & thePolyh);

		/****************** NbTriangles ******************/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "* Give the number of triangles in this polyedral surface.
	:param thePolyh:
	:type thePolyh: IntPatch_Polyhedron
	:rtype: int") NbTriangles;
		static Standard_Integer NbTriangles (const IntPatch_Polyhedron & thePolyh);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Give the point of index i in the polyedral surface.
	:param thePolyh:
	:type thePolyh: IntPatch_Polyhedron
	:param Index:
	:type Index: int
	:rtype: gp_Pnt") Point;
		static const gp_Pnt  Point (const IntPatch_Polyhedron & thePolyh,const Standard_Integer Index);

		/****************** TriConnex ******************/
		%feature("compactdefaultargs") TriConnex;
		%feature("autodoc", "* Gives the addresse Tricon of the triangle connexe to the triangle of address Triang by the edge Pivot Pedge and the third point of this connexe triangle. When we are on a free edge TriCon==0 but the function return the value of the triangle in the other side of Pivot on the free edge. Used to turn around a vertex.
	:param thePolyh:
	:type thePolyh: IntPatch_Polyhedron
	:param Triang:
	:type Triang: int
	:param Pivot:
	:type Pivot: int
	:param Pedge:
	:type Pedge: int
	:param TriCon:
	:type TriCon: int
	:param OtherP:
	:type OtherP: int
	:rtype: int") TriConnex;
		static Standard_Integer TriConnex (const IntPatch_Polyhedron & thePolyh,const Standard_Integer Triang,const Standard_Integer Pivot,const Standard_Integer Pedge,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** Triangle ******************/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "* Give the indices of the 3 points of the triangle of address Index in the Polyhedron.
	:param thePolyh:
	:type thePolyh: IntPatch_Polyhedron
	:param Index:
	:type Index: int
	:param P1:
	:type P1: int
	:param P2:
	:type P2: int
	:param P3:
	:type P3: int
	:rtype: None") Triangle;
		static void Triangle (const IntPatch_Polyhedron & thePolyh,const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);

};


%extend IntPatch_PolyhedronTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IntPatch_PrmPrmIntersection *
************************************/
class IntPatch_PrmPrmIntersection {
	public:
		/****************** CodeReject ******************/
		%feature("compactdefaultargs") CodeReject;
		%feature("autodoc", ":param x1:
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
	:rtype: int") CodeReject;
		Standard_Integer CodeReject (const Standard_Real x1,const Standard_Real y1,const Standard_Real z1,const Standard_Real x2,const Standard_Real y2,const Standard_Real z2,const Standard_Real x3,const Standard_Real y3,const Standard_Real z3);

		/****************** DansGrille ******************/
		%feature("compactdefaultargs") DansGrille;
		%feature("autodoc", ":param t:
	:type t: int
	:rtype: int") DansGrille;
		Standard_Integer DansGrille (const Standard_Integer t);

		/****************** GrilleInteger ******************/
		%feature("compactdefaultargs") GrilleInteger;
		%feature("autodoc", ":param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:rtype: int") GrilleInteger;
		Standard_Integer GrilleInteger (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz);

		/****************** IntPatch_PrmPrmIntersection ******************/
		%feature("compactdefaultargs") IntPatch_PrmPrmIntersection;
		%feature("autodoc", "* Empty Constructor
	:rtype: None") IntPatch_PrmPrmIntersection;
		 IntPatch_PrmPrmIntersection ();

		/****************** IntegerGrille ******************/
		%feature("compactdefaultargs") IntegerGrille;
		%feature("autodoc", ":param t:
	:type t: int
	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:rtype: None") IntegerGrille;
		void IntegerGrille (const Standard_Integer t,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns true if the calculus was succesfull.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns true if the is no intersection.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "* Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<IntPatch_Line>") Line;
		const opencascade::handle<IntPatch_Line> & Line (const Standard_Integer Index);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "* Returns the number of intersection lines.
	:rtype: int") NbLines;
		Standard_Integer NbLines ();

		/****************** NbPointsGrille ******************/
		%feature("compactdefaultargs") NbPointsGrille;
		%feature("autodoc", ":rtype: int") NbPointsGrille;
		Standard_Integer NbPointsGrille ();

		/****************** NewLine ******************/
		%feature("compactdefaultargs") NewLine;
		%feature("autodoc", "* Computes about <NbPoints> Intersection Points on the Line <IndexLine> between the Points of Index <LowPoint> and <HighPoint>. //! All the points of the line of index <IndexLine> with an index between <LowPoint> and <HighPoint> are in the returned line. New Points are inserted between existing points if those points are not too closed. //! An exception is raised if Index<=0 or Index>NbLine. or if IsDone returns False
	:param Caro1:
	:type Caro1: Adaptor3d_HSurface
	:param Caro2:
	:type Caro2: Adaptor3d_HSurface
	:param IndexLine:
	:type IndexLine: int
	:param LowPoint:
	:type LowPoint: int
	:param HighPoint:
	:type HighPoint: int
	:param NbPoints:
	:type NbPoints: int
	:rtype: opencascade::handle<IntPatch_Line>") NewLine;
		opencascade::handle<IntPatch_Line> NewLine (const opencascade::handle<Adaptor3d_HSurface> & Caro1,const opencascade::handle<Adaptor3d_HSurface> & Caro2,const Standard_Integer IndexLine,const Standard_Integer LowPoint,const Standard_Integer HighPoint,const Standard_Integer NbPoints);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the intersection between <Caro1> and <Caro2>. Associated Polyhedrons <Polyhedron1> and <Polyhedron2> are given.
	:param Caro1:
	:type Caro1: Adaptor3d_HSurface
	:param Polyhedron1:
	:type Polyhedron1: IntPatch_Polyhedron
	:param Domain1:
	:type Domain1: Adaptor3d_TopolTool
	:param Caro2:
	:type Caro2: Adaptor3d_HSurface
	:param Polyhedron2:
	:type Polyhedron2: IntPatch_Polyhedron
	:param Domain2:
	:type Domain2: Adaptor3d_TopolTool
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & Caro1,const IntPatch_Polyhedron & Polyhedron1,const opencascade::handle<Adaptor3d_TopolTool> & Domain1,const opencascade::handle<Adaptor3d_HSurface> & Caro2,const IntPatch_Polyhedron & Polyhedron2,const opencascade::handle<Adaptor3d_TopolTool> & Domain2,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param Caro1:
	:type Caro1: Adaptor3d_HSurface
	:param Polyhedron1:
	:type Polyhedron1: IntPatch_Polyhedron
	:param Domain1:
	:type Domain1: Adaptor3d_TopolTool
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & Caro1,const IntPatch_Polyhedron & Polyhedron1,const opencascade::handle<Adaptor3d_TopolTool> & Domain1,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.
	:param Caro1:
	:type Caro1: Adaptor3d_HSurface
	:param Domain1:
	:type Domain1: Adaptor3d_TopolTool
	:param Caro2:
	:type Caro2: Adaptor3d_HSurface
	:param Domain2:
	:type Domain2: Adaptor3d_TopolTool
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
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & Caro1,const opencascade::handle<Adaptor3d_TopolTool> & Domain1,const opencascade::handle<Adaptor3d_HSurface> & Caro2,const opencascade::handle<Adaptor3d_TopolTool> & Domain2,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment,const Standard_Boolean ClearFlag = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.
	:param Caro1:
	:type Caro1: Adaptor3d_HSurface
	:param Domain1:
	:type Domain1: Adaptor3d_TopolTool
	:param Caro2:
	:type Caro2: Adaptor3d_HSurface
	:param Domain2:
	:type Domain2: Adaptor3d_TopolTool
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:param ListOfPnts:
	:type ListOfPnts: IntSurf_ListOfPntOn2S
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & Caro1,const opencascade::handle<Adaptor3d_TopolTool> & Domain1,const opencascade::handle<Adaptor3d_HSurface> & Caro2,const opencascade::handle<Adaptor3d_TopolTool> & Domain2,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment,IntSurf_ListOfPntOn2S & ListOfPnts);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.
	:param Caro1:
	:type Caro1: Adaptor3d_HSurface
	:param Domain1:
	:type Domain1: Adaptor3d_TopolTool
	:param Caro2:
	:type Caro2: Adaptor3d_HSurface
	:param Domain2:
	:type Domain2: Adaptor3d_TopolTool
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
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & Caro1,const opencascade::handle<Adaptor3d_TopolTool> & Domain1,const opencascade::handle<Adaptor3d_HSurface> & Caro2,const opencascade::handle<Adaptor3d_TopolTool> & Domain2,const Standard_Real U1,const Standard_Real V1,const Standard_Real U2,const Standard_Real V2,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.
	:param Caro1:
	:type Caro1: Adaptor3d_HSurface
	:param Domain1:
	:type Domain1: Adaptor3d_TopolTool
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & Caro1,const opencascade::handle<Adaptor3d_TopolTool> & Domain1,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the intersection between <Caro1> and <Caro2>. //! The polyhedron which approximates <Caro2>, <Polyhedron2> is given. The other one is computed.
	:param Caro1:
	:type Caro1: Adaptor3d_HSurface
	:param Domain1:
	:type Domain1: Adaptor3d_TopolTool
	:param Caro2:
	:type Caro2: Adaptor3d_HSurface
	:param Polyhedron2:
	:type Polyhedron2: IntPatch_Polyhedron
	:param Domain2:
	:type Domain2: Adaptor3d_TopolTool
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & Caro1,const opencascade::handle<Adaptor3d_TopolTool> & Domain1,const opencascade::handle<Adaptor3d_HSurface> & Caro2,const IntPatch_Polyhedron & Polyhedron2,const opencascade::handle<Adaptor3d_TopolTool> & Domain2,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the intersection between <Caro1> and <Caro2>. //! The polyhedron which approximates <Caro1>, <Polyhedron1> is given. The other one is computed.
	:param Caro1:
	:type Caro1: Adaptor3d_HSurface
	:param Polyhedron1:
	:type Polyhedron1: IntPatch_Polyhedron
	:param Domain1:
	:type Domain1: Adaptor3d_TopolTool
	:param Caro2:
	:type Caro2: Adaptor3d_HSurface
	:param Domain2:
	:type Domain2: Adaptor3d_TopolTool
	:param TolTangency:
	:type TolTangency: float
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Increment:
	:type Increment: float
	:rtype: None") Perform;
		void Perform (const opencascade::handle<Adaptor3d_HSurface> & Caro1,const IntPatch_Polyhedron & Polyhedron1,const opencascade::handle<Adaptor3d_TopolTool> & Domain1,const opencascade::handle<Adaptor3d_HSurface> & Caro2,const opencascade::handle<Adaptor3d_TopolTool> & Domain2,const Standard_Real TolTangency,const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Increment);

		/****************** PointDepart ******************/
		%feature("compactdefaultargs") PointDepart;
		%feature("autodoc", ":param LineOn2S:
	:type LineOn2S: IntSurf_LineOn2S
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param SU1:
	:type SU1: int
	:param SV1:
	:type SV1: int
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param SU2:
	:type SU2: int
	:param SV2:
	:type SV2: int
	:rtype: None") PointDepart;
		void PointDepart (opencascade::handle<IntSurf_LineOn2S> & LineOn2S,const opencascade::handle<Adaptor3d_HSurface> & S1,const Standard_Integer SU1,const Standard_Integer SV1,const opencascade::handle<Adaptor3d_HSurface> & S2,const Standard_Integer SU2,const Standard_Integer SV2);

		/****************** Remplit ******************/
		%feature("compactdefaultargs") Remplit;
		%feature("autodoc", ":param a:
	:type a: int
	:param b:
	:type b: int
	:param c:
	:type c: int
	:param Map:
	:type Map: IntPatch_PrmPrmIntersection_T3Bits
	:rtype: None") Remplit;
		void Remplit (const Standard_Integer a,const Standard_Integer b,const Standard_Integer c,IntPatch_PrmPrmIntersection_T3Bits & Map);

		/****************** RemplitLin ******************/
		%feature("compactdefaultargs") RemplitLin;
		%feature("autodoc", ":param x1:
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
	:type Map: IntPatch_PrmPrmIntersection_T3Bits
	:rtype: None") RemplitLin;
		void RemplitLin (const Standard_Integer x1,const Standard_Integer y1,const Standard_Integer z1,const Standard_Integer x2,const Standard_Integer y2,const Standard_Integer z2,IntPatch_PrmPrmIntersection_T3Bits & Map);

		/****************** RemplitTri ******************/
		%feature("compactdefaultargs") RemplitTri;
		%feature("autodoc", ":param x1:
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
	:type Map: IntPatch_PrmPrmIntersection_T3Bits
	:rtype: None") RemplitTri;
		void RemplitTri (const Standard_Integer x1,const Standard_Integer y1,const Standard_Integer z1,const Standard_Integer x2,const Standard_Integer y2,const Standard_Integer z2,const Standard_Integer x3,const Standard_Integer y3,const Standard_Integer z3,IntPatch_PrmPrmIntersection_T3Bits & Map);

};


%extend IntPatch_PrmPrmIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class IntPatch_PrmPrmIntersection_T3Bits *
*******************************************/
class IntPatch_PrmPrmIntersection_T3Bits {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param t:
	:type t: int
	:rtype: None") Add;
		void Add (const Standard_Integer t);

		/****************** And ******************/
		%feature("compactdefaultargs") And;
		%feature("autodoc", ":param Oth:
	:type Oth: IntPatch_PrmPrmIntersection_T3Bits
	:param indiceprecedent:
	:type indiceprecedent: int
	:rtype: int") And;
		Standard_Integer And (IntPatch_PrmPrmIntersection_T3Bits & Oth,Standard_Integer &OutValue);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", ":rtype: None") Destroy;
		void Destroy ();

		/****************** IntPatch_PrmPrmIntersection_T3Bits ******************/
		%feature("compactdefaultargs") IntPatch_PrmPrmIntersection_T3Bits;
		%feature("autodoc", ":param size:
	:type size: int
	:rtype: None") IntPatch_PrmPrmIntersection_T3Bits;
		 IntPatch_PrmPrmIntersection_T3Bits (const Standard_Integer size);

		/****************** Raz ******************/
		%feature("compactdefaultargs") Raz;
		%feature("autodoc", ":param t:
	:type t: int
	:rtype: None") Raz;
		void Raz (const Standard_Integer t);

		/****************** ResetAnd ******************/
		%feature("compactdefaultargs") ResetAnd;
		%feature("autodoc", ":rtype: None") ResetAnd;
		void ResetAnd ();

		/****************** Val ******************/
		%feature("compactdefaultargs") Val;
		%feature("autodoc", ":param t:
	:type t: int
	:rtype: int") Val;
		Standard_Integer Val (const Standard_Integer t);

};


%extend IntPatch_PrmPrmIntersection_T3Bits {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IntPatch_RstInt *
************************/
class IntPatch_RstInt {
	public:
		/****************** PutVertexOnLine ******************/
		%feature("compactdefaultargs") PutVertexOnLine;
		%feature("autodoc", ":param L:
	:type L: IntPatch_Line
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param Domain:
	:type Domain: Adaptor3d_TopolTool
	:param OtherSurf:
	:type OtherSurf: Adaptor3d_HSurface
	:param OnFirst:
	:type OnFirst: bool
	:param Tol:
	:type Tol: float
	:rtype: void") PutVertexOnLine;
		static void PutVertexOnLine (const opencascade::handle<IntPatch_Line> & L,const opencascade::handle<Adaptor3d_HSurface> & Surf,const opencascade::handle<Adaptor3d_TopolTool> & Domain,const opencascade::handle<Adaptor3d_HSurface> & OtherSurf,const Standard_Boolean OnFirst,const Standard_Real Tol);

};


%extend IntPatch_RstInt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IntPatch_SpecialPoints *
*******************************/
class IntPatch_SpecialPoints {
	public:
		/****************** AddCrossUVIsoPoint ******************/
		%feature("compactdefaultargs") AddCrossUVIsoPoint;
		%feature("autodoc", "* Adds the point defined as intersection of two isolines (U = 0 and V = 0) on theQSurf in theLine. theRefPt is used to correct adjusting parameters. If theIsReversed is True then theQSurf correspond to the second (otherwise, the first) surface while forming intersection point IntSurf_PntOn2S.
	:param theQSurf:
	:type theQSurf: Adaptor3d_HSurface
	:param thePSurf:
	:type thePSurf: Adaptor3d_HSurface
	:param theRefPt:
	:type theRefPt: IntSurf_PntOn2S
	:param theTol3d:
	:type theTol3d: float
	:param theAddedPoint:
	:type theAddedPoint: IntSurf_PntOn2S
	:param theIsReversed: default value is Standard_False
	:type theIsReversed: bool
	:rtype: bool") AddCrossUVIsoPoint;
		static Standard_Boolean AddCrossUVIsoPoint (const opencascade::handle<Adaptor3d_HSurface> & theQSurf,const opencascade::handle<Adaptor3d_HSurface> & thePSurf,const IntSurf_PntOn2S & theRefPt,const Standard_Real theTol3d,IntSurf_PntOn2S & theAddedPoint,const Standard_Boolean theIsReversed = Standard_False);

		/****************** AddPointOnUorVIso ******************/
		%feature("compactdefaultargs") AddPointOnUorVIso;
		%feature("autodoc", "* Adds the point lain strictly in the isoline U = 0 or V = 0 of theQSurf, in theLine. theRefPt is used to correct adjusting parameters. If theIsReversed is True then theQSurf corresponds to the second (otherwise, the first) surface while forming intersection point IntSurf_PntOn2S. All math_Vector-objects must be filled as follows: [1] - U-parameter of thePSurf; [2] - V-parameter of thePSurf; [3] - U- (if V-isoline is considered) or V-parameter (if U-isoline is considered) of theQSurf.
	:param theQSurf:
	:type theQSurf: Adaptor3d_HSurface
	:param thePSurf:
	:type thePSurf: Adaptor3d_HSurface
	:param theRefPt:
	:type theRefPt: IntSurf_PntOn2S
	:param theIsU:
	:type theIsU: bool
	:param theIsoParameter:
	:type theIsoParameter: float
	:param theToler:
	:type theToler: math_Vector
	:param theInitPoint:
	:type theInitPoint: math_Vector
	:param theInfBound:
	:type theInfBound: math_Vector
	:param theSupBound:
	:type theSupBound: math_Vector
	:param theAddedPoint:
	:type theAddedPoint: IntSurf_PntOn2S
	:param theIsReversed: default value is Standard_False
	:type theIsReversed: bool
	:rtype: bool") AddPointOnUorVIso;
		static Standard_Boolean AddPointOnUorVIso (const opencascade::handle<Adaptor3d_HSurface> & theQSurf,const opencascade::handle<Adaptor3d_HSurface> & thePSurf,const IntSurf_PntOn2S & theRefPt,const Standard_Boolean theIsU,const Standard_Real theIsoParameter,const math_Vector & theToler,const math_Vector & theInitPoint,const math_Vector & theInfBound,const math_Vector & theSupBound,IntSurf_PntOn2S & theAddedPoint,const Standard_Boolean theIsReversed = Standard_False);

		/****************** AddSingularPole ******************/
		%feature("compactdefaultargs") AddSingularPole;
		%feature("autodoc", "* Computes the pole of sphere to add it in the intersection line. Stores the result in theAddedPoint variable (does not add in the line). At that, cone and sphere (with singularity) must be set in theQSurf parameter. By default (if theIsReversed == False), theQSurf is the first surface of the Walking line. If it is not, theIsReversed parameter must be set to True. theIsReqRefCheck is True if and only if 3D-point of theRefPt must be pole or apex for check (e.g. if it is vertex). thePtIso is the reference point for obtaining isoline where must be placed the Apex/Pole. //! ATTENTION!!! theVertex must be initialized before calling the method .
	:param theQSurf:
	:type theQSurf: Adaptor3d_HSurface
	:param thePSurf:
	:type thePSurf: Adaptor3d_HSurface
	:param thePtIso:
	:type thePtIso: IntSurf_PntOn2S
	:param theVertex:
	:type theVertex: IntPatch_Point
	:param theAddedPoint:
	:type theAddedPoint: IntSurf_PntOn2S
	:param theIsReversed: default value is Standard_False
	:type theIsReversed: bool
	:param theIsReqRefCheck: default value is Standard_False
	:type theIsReqRefCheck: bool
	:rtype: bool") AddSingularPole;
		static Standard_Boolean AddSingularPole (const opencascade::handle<Adaptor3d_HSurface> & theQSurf,const opencascade::handle<Adaptor3d_HSurface> & thePSurf,const IntSurf_PntOn2S & thePtIso,IntPatch_Point & theVertex,IntSurf_PntOn2S & theAddedPoint,const Standard_Boolean theIsReversed = Standard_False,const Standard_Boolean theIsReqRefCheck = Standard_False);

		/****************** AdjustPointAndVertex ******************/
		%feature("compactdefaultargs") AdjustPointAndVertex;
		%feature("autodoc", "* Sets theNewPoint parameters in 2D-space the closest to theRefPoint with help of adding/subtracting corresponding periods. theArrPeriods must be filled as follows: {<U-period of 1st surface>, <V-period of 1st surface>, <U-period of 2nd surface>, <V-period of 2nd surface>}. If theVertex != 0 then its parameters will be filled as corresponding parameters of theNewPoint. //! ATTENTION!!! theNewPoint is not only Output parameter. It is Input/Output one. I.e. theNewPoint is reference point together with theRefPt.
	:param theRefPoint:
	:type theRefPoint: IntSurf_PntOn2S
	:param theArrPeriods:
	:type theArrPeriods: float
	:param theNewPoint:
	:type theNewPoint: IntSurf_PntOn2S
	:param theVertex: default value is 0
	:type theVertex: IntPatch_Point *
	:rtype: void") AdjustPointAndVertex;
		static void AdjustPointAndVertex (const IntSurf_PntOn2S & theRefPoint,const Standard_Real theArrPeriods[4],IntSurf_PntOn2S & theNewPoint,IntPatch_Point * const theVertex = 0);

		/****************** ContinueAfterSpecialPoint ******************/
		%feature("compactdefaultargs") ContinueAfterSpecialPoint;
		%feature("autodoc", "* Special point has already been added in the line. Now, we need in correct prolongation of the line or in start new line. This function returns new point. //! ATTENTION!!! theNewPoint is not only Output parameter. It is Input/Output one. I.e. theNewPoint is reference point together with theRefPt.
	:param theQSurf:
	:type theQSurf: Adaptor3d_HSurface
	:param thePSurf:
	:type thePSurf: Adaptor3d_HSurface
	:param theRefPt:
	:type theRefPt: IntSurf_PntOn2S
	:param theSPType:
	:type theSPType: IntPatch_SpecPntType
	:param theTol2D:
	:type theTol2D: float
	:param theNewPoint:
	:type theNewPoint: IntSurf_PntOn2S
	:param theIsReversed: default value is Standard_False
	:type theIsReversed: bool
	:rtype: bool") ContinueAfterSpecialPoint;
		static Standard_Boolean ContinueAfterSpecialPoint (const opencascade::handle<Adaptor3d_HSurface> & theQSurf,const opencascade::handle<Adaptor3d_HSurface> & thePSurf,const IntSurf_PntOn2S & theRefPt,const IntPatch_SpecPntType theSPType,const Standard_Real theTol2D,IntSurf_PntOn2S & theNewPoint,const Standard_Boolean theIsReversed = Standard_False);

};


%extend IntPatch_SpecialPoints {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IntPatch_TheIWLineOfTheIWalking *
****************************************/
class IntPatch_TheIWLineOfTheIWalking : public Standard_Transient {
	public:
		/****************** AddIndexPassing ******************/
		%feature("compactdefaultargs") AddIndexPassing;
		%feature("autodoc", "* associer a l 'indice du point sur la ligne l'indice du point passant dans l'iterateur de depart
	:param Index:
	:type Index: int
	:rtype: None") AddIndexPassing;
		void AddIndexPassing (const Standard_Integer Index);

		/****************** AddPoint ******************/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "* Add a point in the line.
	:param P:
	:type P: IntSurf_PntOn2S
	:rtype: None") AddPoint;
		void AddPoint (const IntSurf_PntOn2S & P);

		/****************** AddStatusFirst ******************/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", ":param Closed:
	:type Closed: bool
	:param HasFirst:
	:type HasFirst: bool
	:rtype: None") AddStatusFirst;
		void AddStatusFirst (const Standard_Boolean Closed,const Standard_Boolean HasFirst);

		/****************** AddStatusFirst ******************/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", ":param Closed:
	:type Closed: bool
	:param HasLast:
	:type HasLast: bool
	:param Index:
	:type Index: int
	:param P:
	:type P: IntSurf_PathPoint
	:rtype: None") AddStatusFirst;
		void AddStatusFirst (const Standard_Boolean Closed,const Standard_Boolean HasLast,const Standard_Integer Index,const IntSurf_PathPoint & P);

		/****************** AddStatusFirstLast ******************/
		%feature("compactdefaultargs") AddStatusFirstLast;
		%feature("autodoc", ":param Closed:
	:type Closed: bool
	:param HasFirst:
	:type HasFirst: bool
	:param HasLast:
	:type HasLast: bool
	:rtype: None") AddStatusFirstLast;
		void AddStatusFirstLast (const Standard_Boolean Closed,const Standard_Boolean HasFirst,const Standard_Boolean HasLast);

		/****************** AddStatusLast ******************/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", ":param HasLast:
	:type HasLast: bool
	:rtype: None") AddStatusLast;
		void AddStatusLast (const Standard_Boolean HasLast);

		/****************** AddStatusLast ******************/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", ":param HasLast:
	:type HasLast: bool
	:param Index:
	:type Index: int
	:param P:
	:type P: IntSurf_PathPoint
	:rtype: None") AddStatusLast;
		void AddStatusLast (const Standard_Boolean HasLast,const Standard_Integer Index,const IntSurf_PathPoint & P);

		/****************** Cut ******************/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "* Cut the line at the point of rank Index.
	:param Index:
	:type Index: int
	:rtype: None") Cut;
		void Cut (const Standard_Integer Index);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the first point of the line when it is a marching point. An exception is raised if HasFirstPoint returns False.
	:rtype: IntSurf_PathPoint") FirstPoint;
		const IntSurf_PathPoint & FirstPoint ();

		/****************** FirstPointIndex ******************/
		%feature("compactdefaultargs") FirstPointIndex;
		%feature("autodoc", "* Returns the Index of first point of the line when it is a marching point.This index is the index in the PointStartIterator. An exception is raised if HasFirstPoint returns False.
	:rtype: int") FirstPointIndex;
		Standard_Integer FirstPointIndex ();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "* Returns True if the first point of the line is a marching point . when is HasFirstPoint==False ,the line begins on the natural bound of the surface.the line can be too long
	:rtype: bool") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "* Returns True if the end point of the line is a marching point (Point from IntWS). when is HasFirstPoint==False ,the line ends on the natural bound of the surface.the line can be too long.
	:rtype: bool") HasLastPoint;
		Standard_Boolean HasLastPoint ();

		/****************** IntPatch_TheIWLineOfTheIWalking ******************/
		%feature("compactdefaultargs") IntPatch_TheIWLineOfTheIWalking;
		%feature("autodoc", ":param theAllocator: default value is 0
	:type theAllocator: IntSurf_Allocator
	:rtype: None") IntPatch_TheIWLineOfTheIWalking;
		 IntPatch_TheIWLineOfTheIWalking (const IntSurf_Allocator & theAllocator = 0);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "* Returns True if the line is closed.
	:rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** IsTangentAtBegining ******************/
		%feature("compactdefaultargs") IsTangentAtBegining;
		%feature("autodoc", ":rtype: bool") IsTangentAtBegining;
		Standard_Boolean IsTangentAtBegining ();

		/****************** IsTangentAtEnd ******************/
		%feature("compactdefaultargs") IsTangentAtEnd;
		%feature("autodoc", ":rtype: bool") IsTangentAtEnd;
		Standard_Boolean IsTangentAtEnd ();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "* Returns the last point of the line when it is a marching point. An exception is raised if HasLastPoint returns False.
	:rtype: IntSurf_PathPoint") LastPoint;
		const IntSurf_PathPoint & LastPoint ();

		/****************** LastPointIndex ******************/
		%feature("compactdefaultargs") LastPointIndex;
		%feature("autodoc", "* Returns the index of last point of the line when it is a marching point.This index is the index in the PointStartIterator. An exception is raised if HasLastPoint returns False.
	:rtype: int") LastPointIndex;
		Standard_Integer LastPointIndex ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "* Returns the LineOn2S contained in the walking line.
	:rtype: opencascade::handle<IntSurf_LineOn2S>") Line;
		const opencascade::handle<IntSurf_LineOn2S> & Line ();

		/****************** NbPassingPoint ******************/
		%feature("compactdefaultargs") NbPassingPoint;
		%feature("autodoc", "* returns the number of points belonging to Pnts1 which are passing point.
	:rtype: int") NbPassingPoint;
		Standard_Integer NbPassingPoint ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of points of the line (including first point and end point : see HasLastPoint and HasFirstPoint).
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** PassingPoint ******************/
		%feature("compactdefaultargs") PassingPoint;
		%feature("autodoc", "* returns the index of the point belonging to the line which is associated to the passing point belonging to Pnts1 an exception is raised if Index > NbPassingPoint()
	:param Index:
	:type Index: int
	:param IndexLine:
	:type IndexLine: int
	:param IndexPnts:
	:type IndexPnts: int
	:rtype: None") PassingPoint;
		void PassingPoint (const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "* reverse the points in the line. Hasfirst, HasLast are kept.
	:rtype: None") Reverse;
		void Reverse ();

		/****************** SetTangencyAtBegining ******************/
		%feature("compactdefaultargs") SetTangencyAtBegining;
		%feature("autodoc", ":param IsTangent:
	:type IsTangent: bool
	:rtype: None") SetTangencyAtBegining;
		void SetTangencyAtBegining (const Standard_Boolean IsTangent);

		/****************** SetTangencyAtEnd ******************/
		%feature("compactdefaultargs") SetTangencyAtEnd;
		%feature("autodoc", ":param IsTangent:
	:type IsTangent: bool
	:rtype: None") SetTangencyAtEnd;
		void SetTangencyAtEnd (const Standard_Boolean IsTangent);

		/****************** SetTangentVector ******************/
		%feature("compactdefaultargs") SetTangentVector;
		%feature("autodoc", ":param V:
	:type V: gp_Vec
	:param Index:
	:type Index: int
	:rtype: None") SetTangentVector;
		void SetTangentVector (const gp_Vec & V,const Standard_Integer Index);

		/****************** TangentVector ******************/
		%feature("compactdefaultargs") TangentVector;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: gp_Vec") TangentVector;
		const gp_Vec  TangentVector (Standard_Integer &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the point of range Index. If index <= 0 or Index > NbPoints, an exception is raised.
	:param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S") Value;
		const IntSurf_PntOn2S & Value (const Standard_Integer Index);

};


%make_alias(IntPatch_TheIWLineOfTheIWalking)

%extend IntPatch_TheIWLineOfTheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntPatch_TheIWalking *
*****************************/
class IntPatch_TheIWalking {
	public:
		/****************** IntPatch_TheIWalking ******************/
		%feature("compactdefaultargs") IntPatch_TheIWalking;
		%feature("autodoc", "* Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. Step is the maximum increment admitted between two consecutive points (in 2d space). Epsilon is the tolerance beyond which 2 points are confused. theToFillHoles is the flag defining whether possible holes between resulting curves are filled or not in case of IntPatch walking theToFillHoles is False
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Step:
	:type Step: float
	:param theToFillHoles: default value is Standard_False
	:type theToFillHoles: bool
	:rtype: None") IntPatch_TheIWalking;
		 IntPatch_TheIWalking (const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Step,const Standard_Boolean theToFillHoles = Standard_False);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns true if the calculus was successful.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "* Returns the number of resulting polylines. An exception is raised if IsDone returns False.
	:rtype: int") NbLines;
		Standard_Integer NbLines ();

		/****************** NbSinglePnts ******************/
		%feature("compactdefaultargs") NbSinglePnts;
		%feature("autodoc", "* Returns the number of points belonging to Pnts on which no line starts or ends. An exception is raised if IsDone returns False.
	:rtype: int") NbSinglePnts;
		Standard_Integer NbSinglePnts ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Searches a set of polylines starting on a point of Pnts1 or Pnts2. Each point on a resulting polyline verifies F(u,v)=0
	:param Pnts1:
	:type Pnts1: IntSurf_SequenceOfPathPoint
	:param Pnts2:
	:type Pnts2: IntSurf_SequenceOfInteriorPoint
	:param Func:
	:type Func: IntPatch_TheSurfFunction
	:param S:
	:type S: Adaptor3d_HSurface
	:param Reversed: default value is Standard_False
	:type Reversed: bool
	:rtype: None") Perform;
		void Perform (const IntSurf_SequenceOfPathPoint & Pnts1,const IntSurf_SequenceOfInteriorPoint & Pnts2,IntPatch_TheSurfFunction & Func,const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Boolean Reversed = Standard_False);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Searches a set of polylines starting on a point of Pnts1. Each point on a resulting polyline verifies F(u,v)=0
	:param Pnts1:
	:type Pnts1: IntSurf_SequenceOfPathPoint
	:param Func:
	:type Func: IntPatch_TheSurfFunction
	:param S:
	:type S: Adaptor3d_HSurface
	:param Reversed: default value is Standard_False
	:type Reversed: bool
	:rtype: None") Perform;
		void Perform (const IntSurf_SequenceOfPathPoint & Pnts1,IntPatch_TheSurfFunction & Func,const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Boolean Reversed = Standard_False);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. Step is the maximum increment admitted between two consecutive points (in 2d space). Epsilon is the tolerance beyond which 2 points are confused
	:param Epsilon:
	:type Epsilon: float
	:param Deflection:
	:type Deflection: float
	:param Step:
	:type Step: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real Epsilon,const Standard_Real Deflection,const Standard_Real Step);

		/****************** SinglePnt ******************/
		%feature("compactdefaultargs") SinglePnt;
		%feature("autodoc", "* Returns the point of range Index . An exception is raised if IsDone returns False. An exception is raised if Index<=0 or Index > NbSinglePnts.
	:param Index:
	:type Index: int
	:rtype: IntSurf_PathPoint") SinglePnt;
		const IntSurf_PathPoint & SinglePnt (const Standard_Integer Index);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the polyline of range Index. An exception is raised if IsDone is False. An exception is raised if Index<=0 or Index>NbLines.
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<IntPatch_TheIWLineOfTheIWalking>") Value;
		const opencascade::handle<IntPatch_TheIWLineOfTheIWalking> & Value (const Standard_Integer Index);

};


%extend IntPatch_TheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class IntPatch_ThePathPointOfTheSOnBounds *
********************************************/
class IntPatch_ThePathPointOfTheSOnBounds {
	public:
		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor2d_HCurve2d>") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc ();

		/****************** IntPatch_ThePathPointOfTheSOnBounds ******************/
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", ":rtype: None") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds ();

		/****************** IntPatch_ThePathPointOfTheSOnBounds ******************/
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param V:
	:type V: Adaptor3d_HVertex
	:param A:
	:type A: Adaptor2d_HCurve2d
	:param Parameter:
	:type Parameter: float
	:rtype: None") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds (const gp_Pnt & P,const Standard_Real Tol,const opencascade::handle<Adaptor3d_HVertex> & V,const opencascade::handle<Adaptor2d_HCurve2d> & A,const Standard_Real Parameter);

		/****************** IntPatch_ThePathPointOfTheSOnBounds ******************/
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param A:
	:type A: Adaptor2d_HCurve2d
	:param Parameter:
	:type Parameter: float
	:rtype: None") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds (const gp_Pnt & P,const Standard_Real Tol,const opencascade::handle<Adaptor2d_HCurve2d> & A,const Standard_Real Parameter);

		/****************** IsNew ******************/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", ":rtype: bool") IsNew;
		Standard_Boolean IsNew ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param V:
	:type V: Adaptor3d_HVertex
	:param A:
	:type A: Adaptor2d_HCurve2d
	:param Parameter:
	:type Parameter: float
	:rtype: None") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real Tol,const opencascade::handle<Adaptor3d_HVertex> & V,const opencascade::handle<Adaptor2d_HCurve2d> & A,const Standard_Real Parameter);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:param A:
	:type A: Adaptor2d_HCurve2d
	:param Parameter:
	:type Parameter: float
	:rtype: None") SetValue;
		void SetValue (const gp_Pnt & P,const Standard_Real Tol,const opencascade::handle<Adaptor2d_HCurve2d> & A,const Standard_Real Parameter);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: gp_Pnt") Value;
		const gp_Pnt  Value ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HVertex>") Vertex;
		const opencascade::handle<Adaptor3d_HVertex> & Vertex ();

};


%extend IntPatch_ThePathPointOfTheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IntPatch_TheSOnBounds *
******************************/
class IntPatch_TheSOnBounds {
	public:
		/****************** AllArcSolution ******************/
		%feature("compactdefaultargs") AllArcSolution;
		%feature("autodoc", "* Returns true if all arc of the Arcs are solution (inside the surface). An exception is raised if IsDone returns False.
	:rtype: bool") AllArcSolution;
		Standard_Boolean AllArcSolution ();

		/****************** IntPatch_TheSOnBounds ******************/
		%feature("compactdefaultargs") IntPatch_TheSOnBounds;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") IntPatch_TheSOnBounds;
		 IntPatch_TheSOnBounds ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the calculus was successful.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of resulting points. An exception is raised if IsDone returns False (NotDone).
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "* Returns the number of the resulting segments. An exception is raised if IsDone returns False (NotDone).
	:rtype: int") NbSegments;
		Standard_Integer NbSegments ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Algorithm to find the points and parts of curves of Domain (domain of of restriction of a surface) which verify F = 0. TolBoundary defines if a curve is on Q. TolTangency defines if a point is on Q.
	:param F:
	:type F: IntPatch_ArcFunction
	:param Domain:
	:type Domain: Adaptor3d_TopolTool
	:param TolBoundary:
	:type TolBoundary: float
	:param TolTangency:
	:type TolTangency: float
	:param RecheckOnRegularity: default value is Standard_False
	:type RecheckOnRegularity: bool
	:rtype: None") Perform;
		void Perform (IntPatch_ArcFunction & F,const opencascade::handle<Adaptor3d_TopolTool> & Domain,const Standard_Real TolBoundary,const Standard_Real TolTangency,const Standard_Boolean RecheckOnRegularity = Standard_False);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the resulting point of range Index. The exception NotDone is raised if IsDone() returns False. The exception OutOfRange is raised if Index <= 0 or Index > NbPoints.
	:param Index:
	:type Index: int
	:rtype: IntPatch_ThePathPointOfTheSOnBounds") Point;
		const IntPatch_ThePathPointOfTheSOnBounds & Point (const Standard_Integer Index);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "* Returns the resulting segment of range Index. The exception NotDone is raised if IsDone() returns False. The exception OutOfRange is raised if Index <= 0 or Index > NbPoints.
	:param Index:
	:type Index: int
	:rtype: IntPatch_TheSegmentOfTheSOnBounds") Segment;
		const IntPatch_TheSegmentOfTheSOnBounds & Segment (const Standard_Integer Index);

};


%extend IntPatch_TheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IntPatch_TheSearchInside *
*********************************/
class IntPatch_TheSearchInside {
	public:
		/****************** IntPatch_TheSearchInside ******************/
		%feature("compactdefaultargs") IntPatch_TheSearchInside;
		%feature("autodoc", ":rtype: None") IntPatch_TheSearchInside;
		 IntPatch_TheSearchInside ();

		/****************** IntPatch_TheSearchInside ******************/
		%feature("compactdefaultargs") IntPatch_TheSearchInside;
		%feature("autodoc", ":param F:
	:type F: IntPatch_TheSurfFunction
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param T:
	:type T: Adaptor3d_TopolTool
	:param Epsilon:
	:type Epsilon: float
	:rtype: None") IntPatch_TheSearchInside;
		 IntPatch_TheSearchInside (IntPatch_TheSurfFunction & F,const opencascade::handle<Adaptor3d_HSurface> & Surf,const opencascade::handle<Adaptor3d_TopolTool> & T,const Standard_Real Epsilon);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* Returns the number of points. The exception NotDone if raised if IsDone returns False.
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param F:
	:type F: IntPatch_TheSurfFunction
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param T:
	:type T: Adaptor3d_TopolTool
	:param Epsilon:
	:type Epsilon: float
	:rtype: None") Perform;
		void Perform (IntPatch_TheSurfFunction & F,const opencascade::handle<Adaptor3d_HSurface> & Surf,const opencascade::handle<Adaptor3d_TopolTool> & T,const Standard_Real Epsilon);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param F:
	:type F: IntPatch_TheSurfFunction
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param UStart:
	:type UStart: float
	:param VStart:
	:type VStart: float
	:rtype: None") Perform;
		void Perform (IntPatch_TheSurfFunction & F,const opencascade::handle<Adaptor3d_HSurface> & Surf,const Standard_Real UStart,const Standard_Real VStart);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the point of range Index. The exception NotDone if raised if IsDone returns False. The exception OutOfRange if raised if Index <= 0 or Index > NbPoints.
	:param Index:
	:type Index: int
	:rtype: IntSurf_InteriorPoint") Value;
		const IntSurf_InteriorPoint & Value (const Standard_Integer Index);

};


%extend IntPatch_TheSearchInside {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class IntPatch_TheSegmentOfTheSOnBounds *
******************************************/
class IntPatch_TheSegmentOfTheSOnBounds {
	public:
		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the geometric curve on the surface 's domain which is solution.
	:rtype: opencascade::handle<Adaptor2d_HCurve2d>") Curve;
		const opencascade::handle<Adaptor2d_HCurve2d> & Curve ();

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the first point.
	:rtype: IntPatch_ThePathPointOfTheSOnBounds") FirstPoint;
		const IntPatch_ThePathPointOfTheSOnBounds & FirstPoint ();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "* Returns True if there is a vertex (ThePathPoint) defining the lowest valid parameter on the arc.
	:rtype: bool") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "* Returns True if there is a vertex (ThePathPoint) defining the greatest valid parameter on the arc.
	:rtype: bool") HasLastPoint;
		Standard_Boolean HasLastPoint ();

		/****************** IntPatch_TheSegmentOfTheSOnBounds ******************/
		%feature("compactdefaultargs") IntPatch_TheSegmentOfTheSOnBounds;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") IntPatch_TheSegmentOfTheSOnBounds;
		 IntPatch_TheSegmentOfTheSOnBounds ();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "* Returns the last point.
	:rtype: IntPatch_ThePathPointOfTheSOnBounds") LastPoint;
		const IntPatch_ThePathPointOfTheSOnBounds & LastPoint ();

		/****************** SetLimitPoint ******************/
		%feature("compactdefaultargs") SetLimitPoint;
		%feature("autodoc", "* Defines the first point or the last point, depending on the value of the boolean First.
	:param V:
	:type V: IntPatch_ThePathPointOfTheSOnBounds
	:param First:
	:type First: bool
	:rtype: None") SetLimitPoint;
		void SetLimitPoint (const IntPatch_ThePathPointOfTheSOnBounds & V,const Standard_Boolean First);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Defines the concerned arc.
	:param A:
	:type A: Adaptor2d_HCurve2d
	:rtype: None") SetValue;
		void SetValue (const opencascade::handle<Adaptor2d_HCurve2d> & A);

};


%extend IntPatch_TheSegmentOfTheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IntPatch_TheSurfFunction *
*********************************/
class IntPatch_TheSurfFunction : public math_FunctionSetWithDerivatives {
	public:
		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);

		/****************** Direction2d ******************/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", ":rtype: gp_Dir2d") Direction2d;
		const gp_Dir2d  Direction2d ();

		/****************** Direction3d ******************/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", ":rtype: gp_Vec") Direction3d;
		const gp_Vec  Direction3d ();

		/****************** ISurface ******************/
		%feature("compactdefaultargs") ISurface;
		%feature("autodoc", ":rtype: IntSurf_Quadric") ISurface;
		const IntSurf_Quadric & ISurface ();

		/****************** IntPatch_TheSurfFunction ******************/
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", ":rtype: None") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction ();

		/****************** IntPatch_TheSurfFunction ******************/
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", ":param PS:
	:type PS: Adaptor3d_HSurface
	:param IS:
	:type IS: IntSurf_Quadric
	:rtype: None") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction (const opencascade::handle<Adaptor3d_HSurface> & PS,const IntSurf_Quadric & IS);

		/****************** IntPatch_TheSurfFunction ******************/
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", ":param IS:
	:type IS: IntSurf_Quadric
	:rtype: None") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction (const IntSurf_Quadric & IS);

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", ":rtype: bool") IsTangent;
		Standard_Boolean IsTangent ();

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", ":rtype: int") NbEquations;
		Standard_Integer NbEquations ();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", ":rtype: int") NbVariables;
		Standard_Integer NbVariables ();

		/****************** PSurface ******************/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") PSurface;
		const opencascade::handle<Adaptor3d_HSurface> & PSurface ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":rtype: gp_Pnt") Point;
		const gp_Pnt  Point ();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", ":rtype: float") Root;
		Standard_Real Root ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param PS:
	:type PS: Adaptor3d_HSurface
	:rtype: None") Set;
		void Set (const opencascade::handle<Adaptor3d_HSurface> & PS);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", ":param Tolerance:
	:type Tolerance: float
	:rtype: None") Set;
		void Set (const Standard_Real Tolerance);

		/****************** SetImplicitSurface ******************/
		%feature("compactdefaultargs") SetImplicitSurface;
		%feature("autodoc", ":param IS:
	:type IS: IntSurf_Quadric
	:rtype: None") SetImplicitSurface;
		void SetImplicitSurface (const IntSurf_Quadric & IS);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Returns the value Tol so that if Abs(Func.Root())<Tol the function is considered null.
	:rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:rtype: bool") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", ":param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);

};


%extend IntPatch_TheSurfFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntPatch_WLineTool *
***************************/
class IntPatch_WLineTool {
	public:
		/****************** ComputePurgedWLine ******************/
		%feature("compactdefaultargs") ComputePurgedWLine;
		%feature("autodoc", "* I Removes equal points (leave one of equal points) from theWLine and recompute vertex parameters. //! II Removes point out of borders in case of non periodic surfaces. //! III Removes exceed points using tube criteria: delete 7D point if it lies near to expected lines in 2d and 3d. Each task (2d, 2d, 3d) have its own tolerance and checked separately. //! Returns new WLine or null WLine if the number of the points is less than 2.
	:param theWLine:
	:type theWLine: IntPatch_WLine
	:param theS1:
	:type theS1: Adaptor3d_HSurface
	:param theS2:
	:type theS2: Adaptor3d_HSurface
	:param theDom1:
	:type theDom1: Adaptor3d_TopolTool
	:param theDom2:
	:type theDom2: Adaptor3d_TopolTool
	:rtype: opencascade::handle<IntPatch_WLine>") ComputePurgedWLine;
		static opencascade::handle<IntPatch_WLine> ComputePurgedWLine (const opencascade::handle<IntPatch_WLine> & theWLine,const opencascade::handle<Adaptor3d_HSurface> & theS1,const opencascade::handle<Adaptor3d_HSurface> & theS2,const opencascade::handle<Adaptor3d_TopolTool> & theDom1,const opencascade::handle<Adaptor3d_TopolTool> & theDom2);

		/****************** ExtendTwoWLines ******************/
		%feature("compactdefaultargs") ExtendTwoWLines;
		%feature("autodoc", "* Extends every line from theSlin (if it is possible) to be started/finished in strictly determined point (in the place of joint of two lines). As result, some gaps between two lines will vanish. The Walking lines are supposed (algorithm will do nothing for not-Walking line) to be computed as a result of intersection. Both theS1 and theS2 must be quadrics. Other cases are not supported. theArrPeriods must be filled as follows (every value must not be negative; if the surface is not periodic the period must be equal to 0.0 strictly): {<U-period of 1st surface>, <V-period of 1st surface>, <U-period of 2nd surface>, <V-period of 2nd surface>}. theListOfCriticalPoints must contain 3D-points where joining is disabled.
	:param theSlin:
	:type theSlin: IntPatch_SequenceOfLine
	:param theS1:
	:type theS1: Adaptor3d_HSurface
	:param theS2:
	:type theS2: Adaptor3d_HSurface
	:param theToler3D:
	:type theToler3D: float
	:param theArrPeriods:
	:type theArrPeriods: float *
	:param theBoxS1:
	:type theBoxS1: Bnd_Box2d
	:param theBoxS2:
	:type theBoxS2: Bnd_Box2d
	:param theListOfCriticalPoints:
	:type theListOfCriticalPoints: NCollection_List<gp_Pnt>
	:rtype: void") ExtendTwoWLines;
		static void ExtendTwoWLines (IntPatch_SequenceOfLine & theSlin,const opencascade::handle<Adaptor3d_HSurface> & theS1,const opencascade::handle<Adaptor3d_HSurface> & theS2,const Standard_Real theToler3D,const Standard_Real * const theArrPeriods,const Bnd_Box2d & theBoxS1,const Bnd_Box2d & theBoxS2,const NCollection_List<gp_Pnt> & theListOfCriticalPoints);

		/****************** JoinWLines ******************/
		%feature("compactdefaultargs") JoinWLines;
		%feature("autodoc", "* Joins all WLines from theSlin to one if it is possible and records the result into theSlin again. Lines will be kept to be split if: a) they are separated (has no common points); b) resulted line (after joining) go through seam-edges or surface boundaries. //! In addition, if points in theSPnt lies at least in one of the line in theSlin, this point will be deleted.
	:param theSlin:
	:type theSlin: IntPatch_SequenceOfLine
	:param theSPnt:
	:type theSPnt: IntPatch_SequenceOfPoint
	:param theS1:
	:type theS1: Adaptor3d_HSurface
	:param theS2:
	:type theS2: Adaptor3d_HSurface
	:param theTol3D:
	:type theTol3D: float
	:rtype: void") JoinWLines;
		static void JoinWLines (IntPatch_SequenceOfLine & theSlin,IntPatch_SequenceOfPoint & theSPnt,opencascade::handle<Adaptor3d_HSurface> theS1,opencascade::handle<Adaptor3d_HSurface> theS2,const Standard_Real theTol3D);

};


%extend IntPatch_WLineTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntPatch_ALine *
***********************/
class IntPatch_ALine : public IntPatch_Line {
	public:
		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* To add a vertex in the list.
	:param Pnt:
	:type Pnt: IntPatch_Point
	:rtype: None") AddVertex;
		void AddVertex (const IntPatch_Point & Pnt);

		/****************** ChangeVertex ******************/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "* Allows modifying the vertex with index theIndex on the line.
	:param theIndex:
	:type theIndex: int
	:rtype: IntPatch_Point") ChangeVertex;
		IntPatch_Point & ChangeVertex (const Standard_Integer theIndex);

		/****************** ComputeVertexParameters ******************/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "* Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.
	:param Tol:
	:type Tol: float
	:rtype: None") ComputeVertexParameters;
		void ComputeVertexParameters (const Standard_Real Tol);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":rtype: IntAna_Curve") Curve;
		const IntAna_Curve & Curve ();

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Returns Standard_True when the derivative at parameter U is defined on the analytic intersection line. In that case, Du is the derivative. Returns Standard_False when it is not possible to evaluate the derivative. In both cases, P is the point at parameter U on the intersection.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param Du:
	:type Du: gp_Vec
	:rtype: bool") D1;
		Standard_Boolean D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & Du);

		/****************** FindParameter ******************/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "* Tries to find the parameters of the point P on the curve. If the method returns False, the 'projection' is impossible. If the method returns True at least one parameter has been found. theParams is always sorted in ascending order.
	:param P:
	:type P: gp_Pnt
	:param theParams:
	:type theParams: TColStd_ListOfReal
	:rtype: None") FindParameter;
		void FindParameter (const gp_Pnt & P,TColStd_ListOfReal & theParams);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "* Returns the first parameter on the intersection line. If IsIncluded returns True, Value and D1 methods can be call with a parameter equal to FirstParamater. Otherwise, the parameter must be greater than FirstParameter.
	:param IsIncluded:
	:type IsIncluded: bool
	:rtype: float") FirstParameter;
		Standard_Real FirstParameter (Standard_Boolean &OutValue);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the IntPoint corresponding to the FirstPoint. An exception is raised when HasFirstPoint returns False.
	:rtype: IntPatch_Point") FirstPoint;
		const IntPatch_Point & FirstPoint ();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "* Returns True if the line has a known First point. This point is given by the method FirstPoint().
	:rtype: bool") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "* Returns True if the line has a known Last point. This point is given by the method LastPoint().
	:rtype: bool") HasLastPoint;
		Standard_Boolean HasLastPoint ();

		/****************** IntPatch_ALine ******************/
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "* Creates an analytic intersection line when the transitions are In or Out.
	:param C:
	:type C: IntAna_Curve
	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None") IntPatch_ALine;
		 IntPatch_ALine (const IntAna_Curve & C,const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_ALine ******************/
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "* Creates an analytic intersection line when the transitions are Touch.
	:param C:
	:type C: IntAna_Curve
	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None") IntPatch_ALine;
		 IntPatch_ALine (const IntAna_Curve & C,const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);

		/****************** IntPatch_ALine ******************/
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "* Creates an analytic intersection line when the transitions are Undecided.
	:param C:
	:type C: IntAna_Curve
	:param Tang:
	:type Tang: bool
	:rtype: None") IntPatch_ALine;
		 IntPatch_ALine (const IntAna_Curve & C,const Standard_Boolean Tang);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "* Returns the last parameter on the intersection line. If IsIncluded returns True, Value and D1 methods can be call with a parameter equal to LastParamater. Otherwise, the parameter must be less than LastParameter.
	:param IsIncluded:
	:type IsIncluded: bool
	:rtype: float") LastParameter;
		Standard_Real LastParameter (Standard_Boolean &OutValue);

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "* Returns the IntPoint corresponding to the LastPoint. An exception is raised when HasLastPoint returns False.
	:rtype: IntPatch_Point") LastPoint;
		const IntPatch_Point & LastPoint ();

		/****************** NbVertex ******************/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", ":rtype: int") NbVertex;
		Standard_Integer NbVertex ();

		/****************** Replace ******************/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "* Replaces the element of range Index in the list of points.
	:param Index:
	:type Index: int
	:param Pnt:
	:type Pnt: IntPatch_Point
	:rtype: None") Replace;
		void Replace (const Standard_Integer Index,const IntPatch_Point & Pnt);

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", ":param IndFirst:
	:type IndFirst: int
	:rtype: None") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer IndFirst);

		/****************** SetLastPoint ******************/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", ":param IndLast:
	:type IndLast: int
	:rtype: None") SetLastPoint;
		void SetLastPoint (const Standard_Integer IndLast);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the point of parameter U on the analytic intersection line.
	:param U:
	:type U: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real U);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "* Returns the vertex of range Index on the line.
	:param Index:
	:type Index: int
	:rtype: IntPatch_Point") Vertex;
		const IntPatch_Point & Vertex (const Standard_Integer Index);

};


%make_alias(IntPatch_ALine)

%extend IntPatch_ALine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntPatch_GLine *
***********************/
class IntPatch_GLine : public IntPatch_Line {
	public:
		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* To add a vertex in the list.
	:param Pnt:
	:type Pnt: IntPatch_Point
	:rtype: None") AddVertex;
		void AddVertex (const IntPatch_Point & Pnt);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "* Returns the Circ from gp corrsponding to the intersection when ArcType returns IntPatch_Circle.
	:rtype: gp_Circ") Circle;
		gp_Circ Circle ();

		/****************** ComputeVertexParameters ******************/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "* Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.
	:param Tol:
	:type Tol: float
	:rtype: None") ComputeVertexParameters;
		void ComputeVertexParameters (const Standard_Real Tol);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "* Returns the Elips from gp corrsponding to the intersection when ArcType returns IntPatch_Ellipse.
	:rtype: gp_Elips") Ellipse;
		gp_Elips Ellipse ();

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the IntPoint corresponding to the FirstPoint. An exception is raised when HasFirstPoint returns False.
	:rtype: IntPatch_Point") FirstPoint;
		const IntPatch_Point & FirstPoint ();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "* Returns True if the line has a known First point. This point is given by the method FirstPoint().
	:rtype: bool") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "* Returns True if the line has a known Last point. This point is given by the method LastPoint().
	:rtype: bool") HasLastPoint;
		Standard_Boolean HasLastPoint ();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "* Returns the Hypr from gp corrsponding to the intersection when ArcType returns IntPatch_Hyperbola.
	:rtype: gp_Hypr") Hyperbola;
		gp_Hypr Hyperbola ();

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "* Creates a Line as intersection line when the transitions are In or Out.
	:param L:
	:type L: gp_Lin
	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None") IntPatch_GLine;
		 IntPatch_GLine (const gp_Lin & L,const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "* Creates a Line as intersection line when the transitions are Touch.
	:param L:
	:type L: gp_Lin
	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None") IntPatch_GLine;
		 IntPatch_GLine (const gp_Lin & L,const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "* Creates a Line as intersection line when the transitions are Undecided.
	:param L:
	:type L: gp_Lin
	:param Tang:
	:type Tang: bool
	:rtype: None") IntPatch_GLine;
		 IntPatch_GLine (const gp_Lin & L,const Standard_Boolean Tang);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "* Creates a circle as intersection line when the transitions are In or Out.
	:param C:
	:type C: gp_Circ
	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None") IntPatch_GLine;
		 IntPatch_GLine (const gp_Circ & C,const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "* Creates a circle as intersection line when the transitions are Touch.
	:param C:
	:type C: gp_Circ
	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None") IntPatch_GLine;
		 IntPatch_GLine (const gp_Circ & C,const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "* Creates a circle as intersection line when the transitions are Undecided.
	:param C:
	:type C: gp_Circ
	:param Tang:
	:type Tang: bool
	:rtype: None") IntPatch_GLine;
		 IntPatch_GLine (const gp_Circ & C,const Standard_Boolean Tang);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "* Creates an ellipse as intersection line when the transitions are In or Out.
	:param E:
	:type E: gp_Elips
	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None") IntPatch_GLine;
		 IntPatch_GLine (const gp_Elips & E,const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "* Creates an ellispe as intersection line when the transitions are Touch.
	:param E:
	:type E: gp_Elips
	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None") IntPatch_GLine;
		 IntPatch_GLine (const gp_Elips & E,const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "* Creates an ellipse as intersection line when the transitions are Undecided.
	:param E:
	:type E: gp_Elips
	:param Tang:
	:type Tang: bool
	:rtype: None") IntPatch_GLine;
		 IntPatch_GLine (const gp_Elips & E,const Standard_Boolean Tang);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "* Creates a parabola as intersection line when the transitions are In or Out.
	:param P:
	:type P: gp_Parab
	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None") IntPatch_GLine;
		 IntPatch_GLine (const gp_Parab & P,const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "* Creates a parabola as intersection line when the transitions are Touch.
	:param P:
	:type P: gp_Parab
	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None") IntPatch_GLine;
		 IntPatch_GLine (const gp_Parab & P,const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "* Creates a parabola as intersection line when the transitions are Undecided.
	:param P:
	:type P: gp_Parab
	:param Tang:
	:type Tang: bool
	:rtype: None") IntPatch_GLine;
		 IntPatch_GLine (const gp_Parab & P,const Standard_Boolean Tang);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "* Creates an hyperbola as intersection line when the transitions are In or Out.
	:param H:
	:type H: gp_Hypr
	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None") IntPatch_GLine;
		 IntPatch_GLine (const gp_Hypr & H,const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "* Creates an hyperbola as intersection line when the transitions are Touch.
	:param H:
	:type H: gp_Hypr
	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None") IntPatch_GLine;
		 IntPatch_GLine (const gp_Hypr & H,const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "* Creates an hyperbola as intersection line when the transitions are Undecided.
	:param H:
	:type H: gp_Hypr
	:param Tang:
	:type Tang: bool
	:rtype: None") IntPatch_GLine;
		 IntPatch_GLine (const gp_Hypr & H,const Standard_Boolean Tang);

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "* Returns the IntPoint corresponding to the LastPoint. An exception is raised when HasLastPoint returns False.
	:rtype: IntPatch_Point") LastPoint;
		const IntPatch_Point & LastPoint ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "* Returns the Lin from gp corresponding to the intersection when ArcType returns IntPatch_Line.
	:rtype: gp_Lin") Line;
		gp_Lin Line ();

		/****************** NbVertex ******************/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", ":rtype: int") NbVertex;
		Standard_Integer NbVertex ();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "* Returns the Parab from gp corrsponding to the intersection when ArcType returns IntPatch_Parabola.
	:rtype: gp_Parab") Parabola;
		gp_Parab Parabola ();

		/****************** Replace ******************/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "* To replace the element of range Index in the list of points.
	:param Index:
	:type Index: int
	:param Pnt:
	:type Pnt: IntPatch_Point
	:rtype: None") Replace;
		void Replace (const Standard_Integer Index,const IntPatch_Point & Pnt);

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", ":param IndFirst:
	:type IndFirst: int
	:rtype: None") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer IndFirst);

		/****************** SetLastPoint ******************/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", ":param IndLast:
	:type IndLast: int
	:rtype: None") SetLastPoint;
		void SetLastPoint (const Standard_Integer IndLast);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "* Returns the vertex of range Index on the line.
	:param Index:
	:type Index: int
	:rtype: IntPatch_Point") Vertex;
		const IntPatch_Point & Vertex (const Standard_Integer Index);

};


%make_alias(IntPatch_GLine)

%extend IntPatch_GLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntPatch_PointLine *
***************************/
%nodefaultctor IntPatch_PointLine;
class IntPatch_PointLine : public IntPatch_Line {
	public:
		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertex in the list. If theIsPrepend == True the new vertex will be added before the first element of vertices sequence. Otherwise, to the end of the sequence
	:param Pnt:
	:type Pnt: IntPatch_Point
	:param theIsPrepend: default value is Standard_False
	:type theIsPrepend: bool
	:rtype: void") AddVertex;
		virtual void AddVertex (const IntPatch_Point & Pnt,const Standard_Boolean theIsPrepend = Standard_False);

		/****************** ChangeVertex ******************/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "* Returns the vertex of range Index on the line.
	:param Index:
	:type Index: int
	:rtype: IntPatch_Point") ChangeVertex;
		IntPatch_Point & ChangeVertex (const Standard_Integer Index);

		/****************** ClearVertexes ******************/
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "* Removes vertices from the line
	:rtype: void") ClearVertexes;
		virtual void ClearVertexes ();

		/****************** CurvatureRadiusOfIntersLine ******************/
		%feature("compactdefaultargs") CurvatureRadiusOfIntersLine;
		%feature("autodoc", "* Returns the radius of curvature of the intersection line in given point. Returns negative value if computation is not possible.
	:param theS1:
	:type theS1: Adaptor3d_HSurface
	:param theS2:
	:type theS2: Adaptor3d_HSurface
	:param theUVPoint:
	:type theUVPoint: IntSurf_PntOn2S
	:rtype: float") CurvatureRadiusOfIntersLine;
		static Standard_Real CurvatureRadiusOfIntersLine (const opencascade::handle<Adaptor3d_HSurface> & theS1,const opencascade::handle<Adaptor3d_HSurface> & theS2,const IntSurf_PntOn2S & theUVPoint);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns set of intersection points
	:rtype: opencascade::handle<IntSurf_LineOn2S>") Curve;
		virtual opencascade::handle<IntSurf_LineOn2S> Curve ();

		/****************** IsOutBox ******************/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "* Returns True if P is out of the box built from 3D-points.
	:param P:
	:type P: gp_Pnt
	:rtype: bool") IsOutBox;
		virtual Standard_Boolean IsOutBox (const gp_Pnt & P);

		/****************** IsOutSurf1Box ******************/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "* Returns True if P1 is out of the box built from the points on 1st surface
	:param P1:
	:type P1: gp_Pnt2d
	:rtype: bool") IsOutSurf1Box;
		virtual Standard_Boolean IsOutSurf1Box (const gp_Pnt2d & P1);

		/****************** IsOutSurf2Box ******************/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "* Returns True if P2 is out of the box built from the points on 2nd surface
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: bool") IsOutSurf2Box;
		virtual Standard_Boolean IsOutSurf2Box (const gp_Pnt2d & P2);

		/****************** NbPnts ******************/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "* Returns the number of intersection points.
	:rtype: int") NbPnts;
		virtual Standard_Integer NbPnts ();

		/****************** NbVertex ******************/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "* Returns number of vertices (IntPatch_Point) of the line
	:rtype: int") NbVertex;
		virtual Standard_Integer NbVertex ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the intersection point of range Index.
	:param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S") Point;
		virtual const IntSurf_PntOn2S & Point (const Standard_Integer Index);

		/****************** RemoveVertex ******************/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "* Removes single vertex from the line
	:param theIndex:
	:type theIndex: int
	:rtype: void") RemoveVertex;
		virtual void RemoveVertex (const Standard_Integer theIndex);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "* Returns the vertex of range Index on the line.
	:param Index:
	:type Index: int
	:rtype: IntPatch_Point") Vertex;
		virtual const IntPatch_Point & Vertex (const Standard_Integer Index);

};


%make_alias(IntPatch_PointLine)

%extend IntPatch_PointLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class IntPatch_PolyArc *
*************************/
class IntPatch_PolyArc : public IntPatch_Polygo {
	public:
		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", ":rtype: bool") Closed;
		virtual Standard_Boolean Closed ();

		/****************** IntPatch_PolyArc ******************/
		%feature("compactdefaultargs") IntPatch_PolyArc;
		%feature("autodoc", "* Creates the polygon of the arc A on the surface S. The arc is limited by the parameters Pfirst and Plast. None of these parameters can be infinite.
	:param A:
	:type A: Adaptor2d_HCurve2d
	:param NbSample:
	:type NbSample: int
	:param Pfirst:
	:type Pfirst: float
	:param Plast:
	:type Plast: float
	:param BoxOtherPolygon:
	:type BoxOtherPolygon: Bnd_Box2d
	:rtype: None") IntPatch_PolyArc;
		 IntPatch_PolyArc (const opencascade::handle<Adaptor2d_HCurve2d> & A,const Standard_Integer NbSample,const Standard_Real Pfirst,const Standard_Real Plast,const Bnd_Box2d & BoxOtherPolygon);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", ":rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: float") Parameter;
		Standard_Real Parameter (const Standard_Integer Index);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: gp_Pnt2d") Point;
		gp_Pnt2d Point (const Standard_Integer Index);

		/****************** SetOffset ******************/
		%feature("compactdefaultargs") SetOffset;
		%feature("autodoc", ":param OffsetX:
	:type OffsetX: float
	:param OffsetY:
	:type OffsetY: float
	:rtype: None") SetOffset;
		void SetOffset (const Standard_Real OffsetX,const Standard_Real OffsetY);

};


%extend IntPatch_PolyArc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntPatch_PolyLine *
**************************/
class IntPatch_PolyLine : public IntPatch_Polygo {
	public:
		/****************** IntPatch_PolyLine ******************/
		%feature("compactdefaultargs") IntPatch_PolyLine;
		%feature("autodoc", ":rtype: None") IntPatch_PolyLine;
		 IntPatch_PolyLine ();

		/****************** IntPatch_PolyLine ******************/
		%feature("compactdefaultargs") IntPatch_PolyLine;
		%feature("autodoc", ":param InitDefle:
	:type InitDefle: float
	:rtype: None") IntPatch_PolyLine;
		 IntPatch_PolyLine (const Standard_Real InitDefle);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", ":rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: gp_Pnt2d") Point;
		gp_Pnt2d Point (const Standard_Integer Index);

		/****************** ResetError ******************/
		%feature("compactdefaultargs") ResetError;
		%feature("autodoc", ":rtype: None") ResetError;
		void ResetError ();

		/****************** SetRLine ******************/
		%feature("compactdefaultargs") SetRLine;
		%feature("autodoc", ":param OnFirst:
	:type OnFirst: bool
	:param Line:
	:type Line: IntPatch_RLine
	:rtype: None") SetRLine;
		void SetRLine (const Standard_Boolean OnFirst,const opencascade::handle<IntPatch_RLine> & Line);

		/****************** SetWLine ******************/
		%feature("compactdefaultargs") SetWLine;
		%feature("autodoc", ":param OnFirst:
	:type OnFirst: bool
	:param Line:
	:type Line: IntPatch_WLine
	:rtype: None") SetWLine;
		void SetWLine (const Standard_Boolean OnFirst,const opencascade::handle<IntPatch_WLine> & Line);

};


%extend IntPatch_PolyLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntPatch_RLine *
***********************/
class IntPatch_RLine : public IntPatch_PointLine {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param L:
	:type L: IntSurf_LineOn2S
	:rtype: None") Add;
		void Add (const opencascade::handle<IntSurf_LineOn2S> & L);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertex in the list. If theIsPrepend == True the new vertex will be added before the first element of vertices sequence. Otherwise, to the end of the sequence
	:param Pnt:
	:type Pnt: IntPatch_Point
	:param theIsPrepend: default value is Standard_False
	:type theIsPrepend: bool
	:rtype: None") AddVertex;
		void AddVertex (const IntPatch_Point & Pnt,const Standard_Boolean theIsPrepend = Standard_False);

		/****************** ArcOnS1 ******************/
		%feature("compactdefaultargs") ArcOnS1;
		%feature("autodoc", "* Returns the concerned arc.
	:rtype: opencascade::handle<Adaptor2d_HCurve2d>") ArcOnS1;
		const opencascade::handle<Adaptor2d_HCurve2d> & ArcOnS1 ();

		/****************** ArcOnS2 ******************/
		%feature("compactdefaultargs") ArcOnS2;
		%feature("autodoc", "* Returns the concerned arc.
	:rtype: opencascade::handle<Adaptor2d_HCurve2d>") ArcOnS2;
		const opencascade::handle<Adaptor2d_HCurve2d> & ArcOnS2 ();

		/****************** ChangeVertex ******************/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "* Returns the vertex of range Index on the line.
	:param Index:
	:type Index: int
	:rtype: IntPatch_Point") ChangeVertex;
		IntPatch_Point & ChangeVertex (const Standard_Integer Index);

		/****************** ClearVertexes ******************/
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "* Removes vertices from the line (i.e. cleans svtx member)
	:rtype: None") ClearVertexes;
		void ClearVertexes ();

		/****************** ComputeVertexParameters ******************/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "* Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.
	:param Tol:
	:type Tol: float
	:rtype: None") ComputeVertexParameters;
		void ComputeVertexParameters (const Standard_Real Tol);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns set of intersection points
	:rtype: opencascade::handle<IntSurf_LineOn2S>") Curve;
		opencascade::handle<IntSurf_LineOn2S> Curve ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* if (theMode == 0) then prints the information about WLine if (theMode == 1) then prints the list of 3d-points if (theMode == 2) then prints the list of 2d-points on the 1st surface Otherwise, prints list of 2d-points on the 2nd surface
	:param theMode:
	:type theMode: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer theMode);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the IntPoint corresponding to the FirstPoint. An exception is raised when HasFirstPoint returns False.
	:rtype: IntPatch_Point") FirstPoint;
		const IntPatch_Point & FirstPoint ();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "* Returns True if the line has a known First point. This point is given by the method FirstPoint().
	:rtype: bool") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "* Returns True if the line has a known Last point. This point is given by the method LastPoint().
	:rtype: bool") HasLastPoint;
		Standard_Boolean HasLastPoint ();

		/****************** HasPolygon ******************/
		%feature("compactdefaultargs") HasPolygon;
		%feature("autodoc", ":rtype: bool") HasPolygon;
		Standard_Boolean HasPolygon ();

		/****************** IntPatch_RLine ******************/
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "* Creates a restriction as an intersection line when the transitions are In or Out.
	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None") IntPatch_RLine;
		 IntPatch_RLine (const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_RLine ******************/
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "* Creates a restriction as an intersection line when the transitions are Touch.
	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None") IntPatch_RLine;
		 IntPatch_RLine (const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);

		/****************** IntPatch_RLine ******************/
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "* Creates a restriction as an intersection line when the transitions are Undecided.
	:param Tang:
	:type Tang: bool
	:rtype: None") IntPatch_RLine;
		 IntPatch_RLine (const Standard_Boolean Tang);

		/****************** IsArcOnS1 ******************/
		%feature("compactdefaultargs") IsArcOnS1;
		%feature("autodoc", "* Returns True if the intersection is on the domain of the first patch. Returns False if the intersection is on the domain of the second patch.
	:rtype: bool") IsArcOnS1;
		Standard_Boolean IsArcOnS1 ();

		/****************** IsArcOnS2 ******************/
		%feature("compactdefaultargs") IsArcOnS2;
		%feature("autodoc", "* Returns True if the intersection is on the domain of the first patch. Returns False if the intersection is on the domain of the second patch.
	:rtype: bool") IsArcOnS2;
		Standard_Boolean IsArcOnS2 ();

		/****************** IsOutBox ******************/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "* Returns True if theP is out of the box built from 3D-points.
	:param theP:
	:type theP: gp_Pnt
	:rtype: bool") IsOutBox;
		Standard_Boolean IsOutBox (const gp_Pnt & theP);

		/****************** IsOutSurf1Box ******************/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "* Returns True if theP is out of the box built from the points on 1st surface
	:param theP:
	:type theP: gp_Pnt2d
	:rtype: bool") IsOutSurf1Box;
		Standard_Boolean IsOutSurf1Box (const gp_Pnt2d & theP);

		/****************** IsOutSurf2Box ******************/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "* Returns True if theP is out of the box built from the points on 2nd surface
	:param theP:
	:type theP: gp_Pnt2d
	:rtype: bool") IsOutSurf2Box;
		Standard_Boolean IsOutSurf2Box (const gp_Pnt2d & theP);

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "* Returns the IntPoint corresponding to the LastPoint. An exception is raised when HasLastPoint returns False.
	:rtype: IntPatch_Point") LastPoint;
		const IntPatch_Point & LastPoint ();

		/****************** NbPnts ******************/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "* Returns the number of intersection points.
	:rtype: int") NbPnts;
		Standard_Integer NbPnts ();

		/****************** NbVertex ******************/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "* Returns number of vertices (IntPatch_Point) of the line
	:rtype: int") NbVertex;
		Standard_Integer NbVertex ();

		/****************** ParamOnS1 ******************/
		%feature("compactdefaultargs") ParamOnS1;
		%feature("autodoc", ":param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None") ParamOnS1;
		void ParamOnS1 (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ParamOnS2 ******************/
		%feature("compactdefaultargs") ParamOnS2;
		%feature("autodoc", ":param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None") ParamOnS2;
		void ParamOnS2 (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the intersection point of range Index.
	:param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S") Point;
		const IntSurf_PntOn2S & Point (const Standard_Integer Index);

		/****************** RemoveVertex ******************/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "* Removes single vertex from the line
	:param theIndex:
	:type theIndex: int
	:rtype: None") RemoveVertex;
		void RemoveVertex (const Standard_Integer theIndex);

		/****************** Replace ******************/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "* Replaces the element of range Index in the list of points.
	:param Index:
	:type Index: int
	:param Pnt:
	:type Pnt: IntPatch_Point
	:rtype: None") Replace;
		void Replace (const Standard_Integer Index,const IntPatch_Point & Pnt);

		/****************** SetArcOnS1 ******************/
		%feature("compactdefaultargs") SetArcOnS1;
		%feature("autodoc", ":param A:
	:type A: Adaptor2d_HCurve2d
	:rtype: None") SetArcOnS1;
		void SetArcOnS1 (const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** SetArcOnS2 ******************/
		%feature("compactdefaultargs") SetArcOnS2;
		%feature("autodoc", ":param A:
	:type A: Adaptor2d_HCurve2d
	:rtype: None") SetArcOnS2;
		void SetArcOnS2 (const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", ":param theNewCurve:
	:type theNewCurve: IntSurf_LineOn2S
	:rtype: None") SetCurve;
		void SetCurve (const opencascade::handle<IntSurf_LineOn2S> & theNewCurve);

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", ":param IndFirst:
	:type IndFirst: int
	:rtype: None") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer IndFirst);

		/****************** SetLastPoint ******************/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", ":param IndLast:
	:type IndLast: int
	:rtype: None") SetLastPoint;
		void SetLastPoint (const Standard_Integer IndLast);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "* Set the Point of index <Index> in the LineOn2S
	:param Index:
	:type Index: int
	:param Pnt:
	:type Pnt: IntPatch_Point
	:rtype: None") SetPoint;
		void SetPoint (const Standard_Integer Index,const IntPatch_Point & Pnt);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "* Returns the vertex of range Index on the line.
	:param Index:
	:type Index: int
	:rtype: IntPatch_Point") Vertex;
		const IntPatch_Point & Vertex (const Standard_Integer Index);

};


%make_alias(IntPatch_RLine)

%extend IntPatch_RLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntPatch_WLine *
***********************/
class IntPatch_WLine : public IntPatch_PointLine {
	public:
/* public enums */
enum IntPatch_WLType {
	IntPatch_WLUnknown = 0,
	IntPatch_WLImpImp = 1,
	IntPatch_WLImpPrm = 2,
	IntPatch_WLPrmPrm = 3,
};

/* end public enums declaration */

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "* Adds a vertex in the list. If theIsPrepend == True the new vertex will be added before the first element of vertices sequence. Otherwise, to the end of the sequence
	:param Pnt:
	:type Pnt: IntPatch_Point
	:param theIsPrepend: default value is Standard_False
	:type theIsPrepend: bool
	:rtype: None") AddVertex;
		void AddVertex (const IntPatch_Point & Pnt,const Standard_Boolean theIsPrepend = Standard_False);

		/****************** ChangeVertex ******************/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "* Returns the vertex of range Index on the line.
	:param Index:
	:type Index: int
	:rtype: IntPatch_Point") ChangeVertex;
		IntPatch_Point & ChangeVertex (const Standard_Integer Index);

		/****************** ClearVertexes ******************/
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "* Removes vertices from the line (i.e. cleans svtx member)
	:rtype: None") ClearVertexes;
		void ClearVertexes ();

		/****************** ComputeVertexParameters ******************/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "* Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.
	:param Tol:
	:type Tol: float
	:rtype: None") ComputeVertexParameters;
		void ComputeVertexParameters (const Standard_Real Tol);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns set of intersection points
	:rtype: opencascade::handle<IntSurf_LineOn2S>") Curve;
		virtual opencascade::handle<IntSurf_LineOn2S> Curve ();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "* if (theMode == 0) then prints the information about WLine if (theMode == 1) then prints the list of 3d-points if (theMode == 2) then prints the list of 2d-points on the 1st surface Otherwise, prints list of 2d-points on the 2nd surface
	:param theMode:
	:type theMode: int
	:rtype: None") Dump;
		void Dump (const Standard_Integer theMode);

		/****************** EnablePurging ******************/
		%feature("compactdefaultargs") EnablePurging;
		%feature("autodoc", "* Allows or forbids purging of existing WLine
	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: None") EnablePurging;
		void EnablePurging (const Standard_Boolean theIsEnabled);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the Point corresponding to the FirstPoint.
	:rtype: IntPatch_Point") FirstPoint;
		const IntPatch_Point & FirstPoint ();

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the Point corresponding to the FirstPoint. Indfirst is the index of the first in the list of vertices.
	:param Indfirst:
	:type Indfirst: int
	:rtype: IntPatch_Point") FirstPoint;
		const IntPatch_Point & FirstPoint (Standard_Integer &OutValue);

		/****************** GetArcOnS1 ******************/
		%feature("compactdefaultargs") GetArcOnS1;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor2d_HCurve2d>") GetArcOnS1;
		const opencascade::handle<Adaptor2d_HCurve2d> & GetArcOnS1 ();

		/****************** GetArcOnS2 ******************/
		%feature("compactdefaultargs") GetArcOnS2;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor2d_HCurve2d>") GetArcOnS2;
		const opencascade::handle<Adaptor2d_HCurve2d> & GetArcOnS2 ();

		/****************** GetCreatingWay ******************/
		%feature("compactdefaultargs") GetCreatingWay;
		%feature("autodoc", "* Returns the way of <*this> creation.
	:rtype: IntPatch_WLType") GetCreatingWay;
		IntPatch_WLType GetCreatingWay ();

		/****************** HasArcOnS1 ******************/
		%feature("compactdefaultargs") HasArcOnS1;
		%feature("autodoc", ":rtype: bool") HasArcOnS1;
		Standard_Boolean HasArcOnS1 ();

		/****************** HasArcOnS2 ******************/
		%feature("compactdefaultargs") HasArcOnS2;
		%feature("autodoc", ":rtype: bool") HasArcOnS2;
		Standard_Boolean HasArcOnS2 ();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "* Returns True if the line has a known First point. This point is given by the method FirstPoint().
	:rtype: bool") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "* Returns True if the line has a known Last point. This point is given by the method LastPoint().
	:rtype: bool") HasLastPoint;
		Standard_Boolean HasLastPoint ();

		/****************** InsertVertexBefore ******************/
		%feature("compactdefaultargs") InsertVertexBefore;
		%feature("autodoc", ":param theIndex:
	:type theIndex: int
	:param thePnt:
	:type thePnt: IntPatch_Point
	:rtype: None") InsertVertexBefore;
		void InsertVertexBefore (const Standard_Integer theIndex,const IntPatch_Point & thePnt);

		/****************** IntPatch_WLine ******************/
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "* Creates a WLine as an intersection when the transitions are In or Out.
	:param Line:
	:type Line: IntSurf_LineOn2S
	:param Tang:
	:type Tang: bool
	:param Trans1:
	:type Trans1: IntSurf_TypeTrans
	:param Trans2:
	:type Trans2: IntSurf_TypeTrans
	:rtype: None") IntPatch_WLine;
		 IntPatch_WLine (const opencascade::handle<IntSurf_LineOn2S> & Line,const Standard_Boolean Tang,const IntSurf_TypeTrans Trans1,const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_WLine ******************/
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "* Creates a WLine as an intersection when the transitions are Touch.
	:param Line:
	:type Line: IntSurf_LineOn2S
	:param Tang:
	:type Tang: bool
	:param Situ1:
	:type Situ1: IntSurf_Situation
	:param Situ2:
	:type Situ2: IntSurf_Situation
	:rtype: None") IntPatch_WLine;
		 IntPatch_WLine (const opencascade::handle<IntSurf_LineOn2S> & Line,const Standard_Boolean Tang,const IntSurf_Situation Situ1,const IntSurf_Situation Situ2);

		/****************** IntPatch_WLine ******************/
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "* Creates a WLine as an intersection when the transitions are Undecided.
	:param Line:
	:type Line: IntSurf_LineOn2S
	:param Tang:
	:type Tang: bool
	:rtype: None") IntPatch_WLine;
		 IntPatch_WLine (const opencascade::handle<IntSurf_LineOn2S> & Line,const Standard_Boolean Tang);

		/****************** IsOutBox ******************/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "* Returns True if theP is out of the box built from 3D-points.
	:param theP:
	:type theP: gp_Pnt
	:rtype: bool") IsOutBox;
		Standard_Boolean IsOutBox (const gp_Pnt & theP);

		/****************** IsOutSurf1Box ******************/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "* Returns True if theP is out of the box built from the points on 1st surface
	:param theP:
	:type theP: gp_Pnt2d
	:rtype: bool") IsOutSurf1Box;
		Standard_Boolean IsOutSurf1Box (const gp_Pnt2d & theP);

		/****************** IsOutSurf2Box ******************/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "* Returns True if theP is out of the box built from the points on 2nd surface
	:param theP:
	:type theP: gp_Pnt2d
	:rtype: bool") IsOutSurf2Box;
		Standard_Boolean IsOutSurf2Box (const gp_Pnt2d & theP);

		/****************** IsPurgingAllowed ******************/
		%feature("compactdefaultargs") IsPurgingAllowed;
		%feature("autodoc", "* Returns True if purging is allowed or forbidden for existing WLine
	:rtype: bool") IsPurgingAllowed;
		Standard_Boolean IsPurgingAllowed ();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "* Returns the Point corresponding to the LastPoint.
	:rtype: IntPatch_Point") LastPoint;
		const IntPatch_Point & LastPoint ();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "* Returns the Point corresponding to the LastPoint. Indlast is the index of the last in the list of vertices.
	:param Indlast:
	:type Indlast: int
	:rtype: IntPatch_Point") LastPoint;
		const IntPatch_Point & LastPoint (Standard_Integer &OutValue);

		/****************** NbPnts ******************/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "* Returns the number of intersection points.
	:rtype: int") NbPnts;
		Standard_Integer NbPnts ();

		/****************** NbVertex ******************/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "* Returns number of vertices (IntPatch_Point) of the line
	:rtype: int") NbVertex;
		Standard_Integer NbVertex ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the intersection point of range Index.
	:param Index:
	:type Index: int
	:rtype: IntSurf_PntOn2S") Point;
		const IntSurf_PntOn2S & Point (const Standard_Integer Index);

		/****************** RemoveVertex ******************/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "* Removes single vertex from the line
	:param theIndex:
	:type theIndex: int
	:rtype: None") RemoveVertex;
		void RemoveVertex (const Standard_Integer theIndex);

		/****************** Replace ******************/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "* Replaces the element of range Index in the list of points. The exception OutOfRange is raised when Index <= 0 or Index > NbVertex.
	:param Index:
	:type Index: int
	:param Pnt:
	:type Pnt: IntPatch_Point
	:rtype: None") Replace;
		void Replace (const Standard_Integer Index,const IntPatch_Point & Pnt);

		/****************** SetArcOnS1 ******************/
		%feature("compactdefaultargs") SetArcOnS1;
		%feature("autodoc", ":param A:
	:type A: Adaptor2d_HCurve2d
	:rtype: None") SetArcOnS1;
		void SetArcOnS1 (const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** SetArcOnS2 ******************/
		%feature("compactdefaultargs") SetArcOnS2;
		%feature("autodoc", ":param A:
	:type A: Adaptor2d_HCurve2d
	:rtype: None") SetArcOnS2;
		void SetArcOnS2 (const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** SetCreatingWayInfo ******************/
		%feature("compactdefaultargs") SetCreatingWayInfo;
		%feature("autodoc", "* Sets the info about the way of <*this> creation.
	:param theAlgo:
	:type theAlgo: IntPatch_WLType
	:rtype: None") SetCreatingWayInfo;
		void SetCreatingWayInfo (IntPatch_WLType theAlgo);

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", ":param IndFirst:
	:type IndFirst: int
	:rtype: None") SetFirstPoint;
		void SetFirstPoint (const Standard_Integer IndFirst);

		/****************** SetLastPoint ******************/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", ":param IndLast:
	:type IndLast: int
	:rtype: None") SetLastPoint;
		void SetLastPoint (const Standard_Integer IndLast);

		/****************** SetPeriod ******************/
		%feature("compactdefaultargs") SetPeriod;
		%feature("autodoc", ":param pu1:
	:type pu1: float
	:param pv1:
	:type pv1: float
	:param pu2:
	:type pu2: float
	:param pv2:
	:type pv2: float
	:rtype: None") SetPeriod;
		void SetPeriod (const Standard_Real pu1,const Standard_Real pv1,const Standard_Real pu2,const Standard_Real pv2);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "* Set the Point of index <Index> in the LineOn2S
	:param Index:
	:type Index: int
	:param Pnt:
	:type Pnt: IntPatch_Point
	:rtype: None") SetPoint;
		void SetPoint (const Standard_Integer Index,const IntPatch_Point & Pnt);

		/****************** U1Period ******************/
		%feature("compactdefaultargs") U1Period;
		%feature("autodoc", ":rtype: float") U1Period;
		Standard_Real U1Period ();

		/****************** U2Period ******************/
		%feature("compactdefaultargs") U2Period;
		%feature("autodoc", ":rtype: float") U2Period;
		Standard_Real U2Period ();

		/****************** V1Period ******************/
		%feature("compactdefaultargs") V1Period;
		%feature("autodoc", ":rtype: float") V1Period;
		Standard_Real V1Period ();

		/****************** V2Period ******************/
		%feature("compactdefaultargs") V2Period;
		%feature("autodoc", ":rtype: float") V2Period;
		Standard_Real V2Period ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "* Returns the vertex of range Index on the line.
	:param Index:
	:type Index: int
	:rtype: IntPatch_Point") Vertex;
		const IntPatch_Point & Vertex (const Standard_Integer Index);

};


%make_alias(IntPatch_WLine)

%extend IntPatch_WLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
