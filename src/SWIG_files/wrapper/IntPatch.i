/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
#include<Message_module.hxx>
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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class IntPatch_SpecPntType(IntEnum):
	IntPatch_SPntNone = 0
	IntPatch_SPntSeamU = 1
	IntPatch_SPntSeamV = 2
	IntPatch_SPntSeamUV = 3
	IntPatch_SPntPoleSeamU = 4
	IntPatch_SPntPole = 5
IntPatch_SPntNone = IntPatch_SpecPntType.IntPatch_SPntNone
IntPatch_SPntSeamU = IntPatch_SpecPntType.IntPatch_SPntSeamU
IntPatch_SPntSeamV = IntPatch_SpecPntType.IntPatch_SPntSeamV
IntPatch_SPntSeamUV = IntPatch_SpecPntType.IntPatch_SPntSeamUV
IntPatch_SPntPoleSeamU = IntPatch_SpecPntType.IntPatch_SPntPoleSeamU
IntPatch_SPntPole = IntPatch_SpecPntType.IntPatch_SPntPole

class IntPatch_IType(IntEnum):
	IntPatch_Lin = 0
	IntPatch_Circle = 1
	IntPatch_Ellipse = 2
	IntPatch_Parabola = 3
	IntPatch_Hyperbola = 4
	IntPatch_Analytic = 5
	IntPatch_Walking = 6
	IntPatch_Restriction = 7
IntPatch_Lin = IntPatch_IType.IntPatch_Lin
IntPatch_Circle = IntPatch_IType.IntPatch_Circle
IntPatch_Ellipse = IntPatch_IType.IntPatch_Ellipse
IntPatch_Parabola = IntPatch_IType.IntPatch_Parabola
IntPatch_Hyperbola = IntPatch_IType.IntPatch_Hyperbola
IntPatch_Analytic = IntPatch_IType.IntPatch_Analytic
IntPatch_Walking = IntPatch_IType.IntPatch_Walking
IntPatch_Restriction = IntPatch_IType.IntPatch_Restriction
};
/* end python proxy for enums */

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
%template(IntPatch_SequenceOfIWLineOfTheIWalking) NCollection_Sequence<opencascade::handle<IntPatch_TheIWLineOfTheIWalking>>;
%template(IntPatch_SequenceOfLine) NCollection_Sequence<opencascade::handle<IntPatch_Line>>;
%template(IntPatch_SequenceOfPathPointOfTheSOnBounds) NCollection_Sequence<IntPatch_ThePathPointOfTheSOnBounds>;
%template(IntPatch_SequenceOfPoint) NCollection_Sequence<IntPatch_Point>;
%template(IntPatch_SequenceOfSegmentOfTheSOnBounds) NCollection_Sequence<IntPatch_TheSegmentOfTheSOnBounds>;
/* end templates declaration */

/* typedefs */
typedef Intf_InterferencePolygon2d IntPatch_SearchPnt;
typedef NCollection_Sequence<opencascade::handle<IntPatch_TheIWLineOfTheIWalking>> IntPatch_SequenceOfIWLineOfTheIWalking;
typedef NCollection_Sequence<opencascade::handle<IntPatch_Line>> IntPatch_SequenceOfLine;
typedef NCollection_Sequence<IntPatch_ThePathPointOfTheSOnBounds> IntPatch_SequenceOfPathPointOfTheSOnBounds;
typedef NCollection_Sequence<IntPatch_Point> IntPatch_SequenceOfPoint;
typedef NCollection_Sequence<IntPatch_TheSegmentOfTheSOnBounds> IntPatch_SequenceOfSegmentOfTheSOnBounds;
/* end typedefs declaration */

/******************************
* class IntPatch_ALineToWLine *
******************************/
class IntPatch_ALineToWLine {
	public:
		/****************** IntPatch_ALineToWLine ******************/
		%feature("compactdefaultargs") IntPatch_ALineToWLine;
		%feature("autodoc", "Constructor.

Parameters
----------
theS1: Adaptor3d_HSurface
theS2: Adaptor3d_HSurface
theNbPoints: int,optional
	default value is 200

Returns
-------
None
") IntPatch_ALineToWLine;
		 IntPatch_ALineToWLine(const opencascade::handle<Adaptor3d_HSurface> & theS1, const opencascade::handle<Adaptor3d_HSurface> & theS2, const Standard_Integer theNbPoints = 200);

		/****************** MakeWLine ******************/
		%feature("compactdefaultargs") MakeWLine;
		%feature("autodoc", "Converts aline to the set of walking-lines and adds them in thelines.

Parameters
----------
aline: IntPatch_ALine
theLines: IntPatch_SequenceOfLine

Returns
-------
None
") MakeWLine;
		void MakeWLine(const opencascade::handle<IntPatch_ALine> & aline, IntPatch_SequenceOfLine & theLines);

		/****************** MakeWLine ******************/
		%feature("compactdefaultargs") MakeWLine;
		%feature("autodoc", "Converts aline (limitted by paraminf and paramsup) to the set of walking-lines and adds them in thelines.

Parameters
----------
aline: IntPatch_ALine
paraminf: float
paramsup: float
theLines: IntPatch_SequenceOfLine

Returns
-------
None
") MakeWLine;
		void MakeWLine(const opencascade::handle<IntPatch_ALine> & aline, const Standard_Real paraminf, const Standard_Real paramsup, IntPatch_SequenceOfLine & theLines);

		/****************** SetTol3D ******************/
		%feature("compactdefaultargs") SetTol3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
aT: float

Returns
-------
None
") SetTol3D;
		void SetTol3D(const Standard_Real aT);

		/****************** SetTolOpenDomain ******************/
		%feature("compactdefaultargs") SetTolOpenDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
aT: float

Returns
-------
None
") SetTolOpenDomain;
		void SetTolOpenDomain(const Standard_Real aT);

		/****************** SetTolTransition ******************/
		%feature("compactdefaultargs") SetTolTransition;
		%feature("autodoc", "No available documentation.

Parameters
----------
aT: float

Returns
-------
None
") SetTolTransition;
		void SetTolTransition(const Standard_Real aT);

		/****************** Tol3D ******************/
		%feature("compactdefaultargs") Tol3D;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tol3D;
		Standard_Real Tol3D();

		/****************** TolOpenDomain ******************/
		%feature("compactdefaultargs") TolOpenDomain;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TolOpenDomain;
		Standard_Real TolOpenDomain();

		/****************** TolTransition ******************/
		%feature("compactdefaultargs") TolTransition;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") TolTransition;
		Standard_Real TolTransition();

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
		/****************** IntPatch_ArcFunction ******************/
		%feature("compactdefaultargs") IntPatch_ArcFunction;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_ArcFunction;
		 IntPatch_ArcFunction();

		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc();

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
D: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** LastComputedPoint ******************/
		%feature("compactdefaultargs") LastComputedPoint;
		%feature("autodoc", "Returns the point, which has been computed while the last calling value() method.

Returns
-------
gp_Pnt
") LastComputedPoint;
		const gp_Pnt LastComputedPoint();

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSamples;
		Standard_Integer NbSamples();

		/****************** Quadric ******************/
		%feature("compactdefaultargs") Quadric;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Quadric
") Quadric;
		const IntSurf_Quadric & Quadric();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** SetQuadric ******************/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "No available documentation.

Parameters
----------
Q: IntSurf_Quadric

Returns
-------
None
") SetQuadric;
		void SetQuadric(const IntSurf_Quadric & Q);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") Surface;
		const opencascade::handle<Adaptor3d_HSurface> & Surface();

		/****************** Valpoint ******************/
		%feature("compactdefaultargs") Valpoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") Valpoint;
		const gp_Pnt Valpoint(const Standard_Integer Index);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: float

Returns
-------
F: float
D: float
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****************** IntPatch_CSFunction ******************/
		%feature("compactdefaultargs") IntPatch_CSFunction;
		%feature("autodoc", "S1 is the surface on which the intersection is searched. c is a curve on the surface s2.

Parameters
----------
S1: Adaptor3d_HSurface
C: Adaptor2d_HCurve2d
S2: Adaptor3d_HSurface

Returns
-------
None
") IntPatch_CSFunction;
		 IntPatch_CSFunction(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor2d_HCurve2d> & C, const opencascade::handle<Adaptor3d_HSurface> & S2);

		/****************** AuxillarCurve ******************/
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") AuxillarCurve;
		const opencascade::handle<Adaptor2d_HCurve2d> & AuxillarCurve();

		/****************** AuxillarSurface ******************/
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") AuxillarSurface;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface();

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****************** IntPatch_CurvIntSurf ******************/
		%feature("compactdefaultargs") IntPatch_CurvIntSurf;
		%feature("autodoc", "Compute the solution point with the close point margincoef is the coefficient for extension of uv bounds. ex., ufirst -= margincoef*(ulast-ufirst).

Parameters
----------
U: float
V: float
W: float
F: IntPatch_CSFunction
TolTangency: float
MarginCoef: float,optional
	default value is 0.0

Returns
-------
None
") IntPatch_CurvIntSurf;
		 IntPatch_CurvIntSurf(const Standard_Real U, const Standard_Real V, const Standard_Real W, const IntPatch_CSFunction & F, const Standard_Real TolTangency, const Standard_Real MarginCoef = 0.0);

		/****************** IntPatch_CurvIntSurf ******************/
		%feature("compactdefaultargs") IntPatch_CurvIntSurf;
		%feature("autodoc", "Initialize the parameters to compute the solution.

Parameters
----------
F: IntPatch_CSFunction
TolTangency: float

Returns
-------
None
") IntPatch_CurvIntSurf;
		 IntPatch_CurvIntSurf(const IntPatch_CSFunction & F, const Standard_Real TolTangency);

		/****************** Function ******************/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return the math function which is used to compute the intersection.

Returns
-------
IntPatch_CSFunction
") Function;
		IntPatch_CSFunction & Function();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the creation completed without failure.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** ParameterOnCurve ******************/
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnCurve;
		Standard_Real ParameterOnCurve();

		/****************** ParameterOnSurface ******************/
		%feature("compactdefaultargs") ParameterOnSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
U: float
V: float
") ParameterOnSurface;
		void ParameterOnSurface(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the solution it's possible to write to optimize: intimp_intcs inter(s1,c1,toltangency) math_functionsetroot rsnld(inter.function()) while ...{ u=... v=... w=... inter.perform(u,v,w,rsnld) } or intimp_intcs inter(toltangency) inter.setsurface(s); math_functionsetroot rsnld(inter.function()) while ...{ c=... inter.setcurve(c); u=... v=... w=... inter.perform(u,v,w,rsnld) }.

Parameters
----------
U: float
V: float
W: float
Rsnld: math_FunctionSetRoot
u0: float
v0: float
u1: float
v1: float
w0: float
w1: float

Returns
-------
None
") Perform;
		void Perform(const Standard_Real U, const Standard_Real V, const Standard_Real W, math_FunctionSetRoot & Rsnld, const Standard_Real u0, const Standard_Real v0, const Standard_Real u1, const Standard_Real v1, const Standard_Real w0, const Standard_Real w1);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point the exception notdone is raised if isdone is false. the exception domainerror is raised if isempty is true.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
opencascade::handle<Geom2d_BezierCurve>
") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Circ2d
") Circle;
		static gp_Circ2d Circle(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d

Returns
-------
None
") D0;
		static void D0(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d
V: gp_Vec2d

Returns
-------
None
") D1;
		static void D1(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Returns
-------
None
") D2;
		static void D2(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Returns
-------
None
") D3;
		static void D3(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float
N: int

Returns
-------
gp_Vec2d
") DN;
		static gp_Vec2d DN(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U, const Standard_Integer N);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Elips2d
") Ellipse;
		static gp_Elips2d Ellipse(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Hypr2d
") Hyperbola;
		static gp_Hypr2d Hyperbola(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
C: Adaptor2d_HCurve2d
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor2d_HCurve2d> & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Lin2d
") Line;
		static gp_Lin2d Line(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(myclass) >= <s>.

Parameters
----------
C: Adaptor2d_HCurve2d
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		static Standard_Integer NbIntervals(const opencascade::handle<Adaptor2d_HCurve2d> & C, const GeomAbs_Shape S);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d
U0: float
U1: float

Returns
-------
int
") NbSamples;
		static Standard_Integer NbSamples(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U0, const Standard_Real U1);

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
gp_Parab2d
") Parabola;
		static gp_Parab2d Parabola(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
float
") Period;
		static Standard_Real Period(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
C: Adaptor2d_HCurve2d
R3d: float

Returns
-------
float
") Resolution;
		static Standard_Real Resolution(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real R3d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Adaptor2d_HCurve2d
U: float

Returns
-------
gp_Pnt2d
") Value;
		static gp_Pnt2d Value(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Real U);

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
		/****************** IntPatch_HInterTool ******************/
		%feature("compactdefaultargs") IntPatch_HInterTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_HInterTool;
		 IntPatch_HInterTool();

		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the parametric limits on the arc c. these limits must be finite : they are either the real limits of the arc, for a finite arc, or a bounding box for an infinite arc.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
Ufirst: float
Ulast: float
") Bounds;
		static void Bounds(const opencascade::handle<Adaptor2d_HCurve2d> & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** HasBeenSeen ******************/
		%feature("compactdefaultargs") HasBeenSeen;
		%feature("autodoc", "Returns true if all the intersection point and edges are known on the arc. the intersection point are given as vertices. the intersection edges are given as intervals between two vertices.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") HasBeenSeen;
		static Standard_Boolean HasBeenSeen(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true when the segment of range index is not open at the left side. in that case, indfirst is the range in the list intersection points (see nbpoints) of the one which defines the left bound of the segment. otherwise, the method has to return false, and indfirst has no meaning.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int

Returns
-------
IndFirst: int
") HasFirstPoint;
		static Standard_Boolean HasFirstPoint(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, Standard_Integer &OutValue);

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true when the segment of range index is not open at the right side. in that case, indlast is the range in the list intersection points (see nbpoints) of the one which defines the right bound of the segment. otherwise, the method has to return false, and indlast has no meaning.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int

Returns
-------
IndLast: int
") HasLastPoint;
		static Standard_Boolean HasLastPoint(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, Standard_Integer &OutValue);

		/****************** IsAllSolution ******************/
		%feature("compactdefaultargs") IsAllSolution;
		%feature("autodoc", "Returns true when the whole restriction is solution of the intersection problem.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
bool
") IsAllSolution;
		static Standard_Boolean IsAllSolution(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Returns true if the intersection point of range index corresponds with a vertex on the arc a.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int

Returns
-------
bool
") IsVertex;
		static Standard_Boolean IsVertex(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of intersection points on the arc a.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
int
") NbPoints;
		static Standard_Integer NbPoints(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** NbSamplePoints ******************/
		%feature("compactdefaultargs") NbSamplePoints;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
int
") NbSamplePoints;
		Standard_Integer NbSamplePoints(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** NbSamplesOnArc ******************/
		%feature("compactdefaultargs") NbSamplesOnArc;
		%feature("autodoc", "Returns the number of points which is used to make a sample on the arc. this number is a function of the surface and the curveonsurface complexity.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
int
") NbSamplesOnArc;
		static Standard_Integer NbSamplesOnArc(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** NbSamplesU ******************/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
u1: float
u2: float

Returns
-------
int
") NbSamplesU;
		static Standard_Integer NbSamplesU(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real u1, const Standard_Real u2);

		/****************** NbSamplesV ******************/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
v1: float
v2: float

Returns
-------
int
") NbSamplesV;
		static Standard_Integer NbSamplesV(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Real v1, const Standard_Real v2);

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of part of a solution of the of intersection problem.

Parameters
----------
C: Adaptor2d_HCurve2d

Returns
-------
int
") NbSegments;
		static Standard_Integer NbSegments(const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter of the vertex v on the arc a.

Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_HCurve2d

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Project ******************/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "Projects the point p on the arc c. if the methods returns standard_true, the projection is successful, and paramproj is the parameter on the arc of the projected point, ptproj is the projected point. if the method returns standard_false, param proj and ptproj are not significant.

Parameters
----------
C: Adaptor2d_HCurve2d
P: gp_Pnt2d
Ptproj: gp_Pnt2d

Returns
-------
Paramproj: float
") Project;
		static Standard_Boolean Project(const opencascade::handle<Adaptor2d_HCurve2d> & C, const gp_Pnt2d & P, Standard_Real &OutValue, gp_Pnt2d & Ptproj);

		/****************** SamplePoint ******************/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
Index: int

Returns
-------
U: float
V: float
") SamplePoint;
		void SamplePoint(const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SingularOnUMax ******************/
		%feature("compactdefaultargs") SingularOnUMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
bool
") SingularOnUMax;
		static Standard_Boolean SingularOnUMax(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** SingularOnUMin ******************/
		%feature("compactdefaultargs") SingularOnUMin;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
bool
") SingularOnUMin;
		static Standard_Boolean SingularOnUMin(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** SingularOnVMax ******************/
		%feature("compactdefaultargs") SingularOnVMax;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
bool
") SingularOnVMax;
		static Standard_Boolean SingularOnVMax(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** SingularOnVMin ******************/
		%feature("compactdefaultargs") SingularOnVMin;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface

Returns
-------
bool
") SingularOnVMin;
		static Standard_Boolean SingularOnVMin(const opencascade::handle<Adaptor3d_HSurface> & S);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the parametric tolerance used to consider that the vertex and another point meet, i-e if abs(parameter(vertex) - parameter(otherpnt))<= tolerance, the points are 'merged'.

Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_HCurve2d

Returns
-------
float
") Tolerance;
		static Standard_Real Tolerance(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & C);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value (pt), the tolerance (tol), and the parameter (u) on the arc a , of the intersection point of range index.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int
Pt: gp_Pnt

Returns
-------
Tol: float
U: float
") Value;
		static void Value(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, gp_Pnt & Pt, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "When isvertex returns true, this method returns the vertex on the arc a.

Parameters
----------
C: Adaptor2d_HCurve2d
Index: int
V: Adaptor3d_HVertex

Returns
-------
None
") Vertex;
		static void Vertex(const opencascade::handle<Adaptor2d_HCurve2d> & C, const Standard_Integer Index, opencascade::handle<Adaptor3d_HVertex> & V);

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
/* public enums */
enum IntStatus {
	IntStatus_OK = 0,
	IntStatus_InfiniteSectionCurve = 1,
	IntStatus_Fail = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class IntStatus(IntEnum):
	IntStatus_OK = 0
	IntStatus_InfiniteSectionCurve = 1
	IntStatus_Fail = 2
IntStatus_OK = IntStatus.IntStatus_OK
IntStatus_InfiniteSectionCurve = IntStatus.IntStatus_InfiniteSectionCurve
IntStatus_Fail = IntStatus.IntStatus_Fail
};
/* end python proxy for enums */

		/****************** IntPatch_ImpImpIntersection ******************/
		%feature("compactdefaultargs") IntPatch_ImpImpIntersection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_ImpImpIntersection;
		 IntPatch_ImpImpIntersection();

		/****************** IntPatch_ImpImpIntersection ******************/
		%feature("compactdefaultargs") IntPatch_ImpImpIntersection;
		%feature("autodoc", "Flag theisreqtokeeprline has been entered only for compatibility with topopebrep package. it shall be deleted after deleting topopebrep. when intersection result returns intpatch_rline and another intpatch_line (not restriction) we (in case of theisreqtokeeprline==true) will always keep both lines even if they are coincided.

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
theIsReqToKeepRLine: bool,optional
	default value is Standard_False

Returns
-------
None
") IntPatch_ImpImpIntersection;
		 IntPatch_ImpImpIntersection(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Boolean theIsReqToKeepRLine = Standard_False);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the is no intersection.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the line of range index. an exception is raised if index<=0 or index>nbline.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IntPatch_Line>
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const Standard_Integer Index);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of intersection lines.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NbPnts ******************/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Returns the number of 'single' points.

Returns
-------
int
") NbPnts;
		Standard_Integer NbPnts();

		/****************** OppositeFaces ******************/
		%feature("compactdefaultargs") OppositeFaces;
		%feature("autodoc", "Returns true when the tangentfaces returns true and the normal vectors evaluated at a point on the first and the second surface are opposite. the exception domainerror is raised if tangentfaces returns false.

Returns
-------
bool
") OppositeFaces;
		Standard_Boolean OppositeFaces();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Flag theisreqtokeeprline has been entered only for compatibility with topopebrep package. it shall be deleted after deleting topopebrep. when intersection result returns intpatch_rline and another intpatch_line (not restriction) we (in case of theisreqtokeeprline==true) will always keep both lines even if they are coincided.

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
theIsReqToKeepRLine: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Boolean theIsReqToKeepRLine = Standard_False);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of range index. an exception is raised if index<=0 or index>nbpnt.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Point;
		const IntPatch_Point & Point(const Standard_Integer Index);

		/****************** TangentFaces ******************/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "Returns true if the two patches are considered as entirely tangent, i.e every restriction arc of one patch is inside the geometric base of the other patch.

Returns
-------
bool
") TangentFaces;
		Standard_Boolean TangentFaces();

};


%extend IntPatch_ImpImpIntersection {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def GetStatus(self):
		pass
	}
};

/************************************
* class IntPatch_ImpPrmIntersection *
************************************/
class IntPatch_ImpPrmIntersection {
	public:
		/****************** IntPatch_ImpPrmIntersection ******************/
		%feature("compactdefaultargs") IntPatch_ImpPrmIntersection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_ImpPrmIntersection;
		 IntPatch_ImpPrmIntersection();

		/****************** IntPatch_ImpPrmIntersection ******************/
		%feature("compactdefaultargs") IntPatch_ImpPrmIntersection;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
Surf2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
Fleche: float
Pas: float

Returns
-------
None
") IntPatch_ImpPrmIntersection;
		 IntPatch_ImpPrmIntersection(const opencascade::handle<Adaptor3d_HSurface> & Surf1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & Surf2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Real Fleche, const Standard_Real Pas);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was succesfull.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the is no intersection.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the line of range index. an exception is raised if index<=0 or index>nbline.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IntPatch_Line>
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const Standard_Integer Index);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of intersection lines.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NbPnts ******************/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Returns the number of 'single' points.

Returns
-------
int
") NbPnts;
		Standard_Integer NbPnts();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surf1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
Surf2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
Fleche: float
Pas: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Surf1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & Surf2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Real Fleche, const Standard_Real Pas);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of range index. an exception is raised if index<=0 or index>nbpnt.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Point;
		const IntPatch_Point & Point(const Standard_Integer Index);

		/****************** SetStartPoint ******************/
		%feature("compactdefaultargs") SetStartPoint;
		%feature("autodoc", "To search for solution from the given point.

Parameters
----------
U: float
V: float

Returns
-------
None
") SetStartPoint;
		void SetStartPoint(const Standard_Real U, const Standard_Real V);

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
		%feature("autodoc", "Constructs an empty interference of polyhedron.

Returns
-------
None
") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron();

		/****************** IntPatch_InterferencePolyhedron ******************/
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "Constructs and computes an interference between the two polyhedra.

Parameters
----------
Obje1: IntPatch_Polyhedron
Obje2: IntPatch_Polyhedron

Returns
-------
None
") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron(const IntPatch_Polyhedron & Obje1, const IntPatch_Polyhedron & Obje2);

		/****************** IntPatch_InterferencePolyhedron ******************/
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "Constructs and computes the self interference of a polyhedron.

Parameters
----------
Obje: IntPatch_Polyhedron

Returns
-------
None
") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron(const IntPatch_Polyhedron & Obje);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the interference between the two polyhedra.

Parameters
----------
Obje1: IntPatch_Polyhedron
Obje2: IntPatch_Polyhedron

Returns
-------
None
") Perform;
		void Perform(const IntPatch_Polyhedron & Obje1, const IntPatch_Polyhedron & Obje2);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes the self interference of a polyhedron.

Parameters
----------
Obje: IntPatch_Polyhedron

Returns
-------
None
") Perform;
		void Perform(const IntPatch_Polyhedron & Obje);

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
		/****************** IntPatch_Intersection ******************/
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_Intersection;
		 IntPatch_Intersection();

		/****************** IntPatch_Intersection ******************/
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float

Returns
-------
None
") IntPatch_Intersection;
		 IntPatch_Intersection(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang);

		/****************** IntPatch_Intersection ******************/
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
TolArc: float
TolTang: float

Returns
-------
None
") IntPatch_Intersection;
		 IntPatch_Intersection(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const Standard_Real TolArc, const Standard_Real TolTang);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump of each result line. mode for more accurate dumps.

Parameters
----------
Mode: int
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer Mode, const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the is no intersection.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the line of range index. an exception is raised if index<=0 or index>nbline.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IntPatch_Line>
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const Standard_Integer Index);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of intersection lines.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NbPnts ******************/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Returns the number of 'single' points.

Returns
-------
int
") NbPnts;
		Standard_Integer NbPnts();

		/****************** OppositeFaces ******************/
		%feature("compactdefaultargs") OppositeFaces;
		%feature("autodoc", "Returns true when the tangentfaces returns true and the normal vectors evaluated at a point on the first and the second surface are opposite. the exception domainerror is raised if tangentfaces returns false.

Returns
-------
bool
") OppositeFaces;
		Standard_Boolean OppositeFaces();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Flag theisreqtokeeprline has been entered only for compatibility with topopebrep package. it shall be deleted after deleting topopebrep. when intersection result returns intpatch_rline and another intpatch_line (not restriction) we (in case of theisreqtokeeprline==true) will always keep both lines even if they are coincided. flag theisreqtopostwlproc has been entered only for compatibility with topopebrep package. it shall be deleted after deleting topopebrep. if theisreqtopostwlproc == false, then we will work with walking-line obtained after intersection algorithm directly (wothout any post-processing). .

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
isGeomInt: bool,optional
	default value is Standard_True
theIsReqToKeepRLine: bool,optional
	default value is Standard_False
theIsReqToPostWLProc: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Boolean isGeomInt = Standard_True, const Standard_Boolean theIsReqToKeepRLine = Standard_False, const Standard_Boolean theIsReqToPostWLProc = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "If isgeomint == standard_false, then method param-param intersection will be used. flag theisreqtokeeprline has been entered only for compatibility with topopebrep package. it shall be deleted after deleting topopebrep. when intersection result returns intpatch_rline and another intpatch_line (not restriction) we (in case of theisreqtokeeprline==true) will always keep both lines even if they are coincided. flag theisreqtopostwlproc has been entered only for compatibility with topopebrep package. it shall be deleted after deleting topopebrep. if theisreqtopostwlproc == false, then we will work with walking-line obtained after intersection algorithm directly (without any post-processing). .

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
TolArc: float
TolTang: float
LOfPnts: IntSurf_ListOfPntOn2S
isGeomInt: bool,optional
	default value is Standard_True
theIsReqToKeepRLine: bool,optional
	default value is Standard_False
theIsReqToPostWLProc: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real TolArc, const Standard_Real TolTang, IntSurf_ListOfPntOn2S & LOfPnts, const Standard_Boolean isGeomInt = Standard_True, const Standard_Boolean theIsReqToKeepRLine = Standard_False, const Standard_Boolean theIsReqToPostWLProc = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Perform with start point.

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
U1: float
V1: float
U2: float
V2: float
TolArc: float
TolTang: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real TolArc, const Standard_Real TolTang);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Uses for finding self-intersected surfaces.

Parameters
----------
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
TolArc: float
TolTang: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const Standard_Real TolArc, const Standard_Real TolTang);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of range index. an exception is raised if index<=0 or index>nbpnt.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Point;
		const IntPatch_Point & Point(const Standard_Integer Index);

		/****************** SequenceOfLine ******************/
		%feature("compactdefaultargs") SequenceOfLine;
		%feature("autodoc", "No available documentation.

Returns
-------
IntPatch_SequenceOfLine
") SequenceOfLine;
		const IntPatch_SequenceOfLine & SequenceOfLine();

		/****************** SetTolerances ******************/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "Set the tolerances used by the algorithms: --- implicit - parametric --- parametric - parametric --- implicit - implicit //! tolarc is used to compute the intersections between the restrictions of a surface and a walking line. //! toltang is used to compute the points on a walking line, and in geometric algorithms. //! fleche is a parameter used in the walking algorithms to provide small curvatures on a line. //! uvmaxstep is a parameter used in the walking algorithms to compute the distance between to points in their respective parametric spaces.

Parameters
----------
TolArc: float
TolTang: float
UVMaxStep: float
Fleche: float

Returns
-------
None
") SetTolerances;
		void SetTolerances(const Standard_Real TolArc, const Standard_Real TolTang, const Standard_Real UVMaxStep, const Standard_Real Fleche);

		/****************** TangentFaces ******************/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "Returns true if the two patches are considered as entirely tangent, i-e every restriction arc of one patch is inside the geometric base of the other patch.

Returns
-------
bool
") TangentFaces;
		Standard_Boolean TangentFaces();

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
		%feature("autodoc", "Returns the type of geometry 3d (line, circle, parabola, hyperbola, ellipse, analytic, walking, restriction).

Returns
-------
IntPatch_IType
") ArcType;
		IntPatch_IType ArcType();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Returns true if the intersection is a line of tangency between the 2 patches.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** IsUIsoOnS1 ******************/
		%feature("compactdefaultargs") IsUIsoOnS1;
		%feature("autodoc", "Returns true if the intersection is a u isoparametric curve on the first patch.

Returns
-------
bool
") IsUIsoOnS1;
		Standard_Boolean IsUIsoOnS1();

		/****************** IsUIsoOnS2 ******************/
		%feature("compactdefaultargs") IsUIsoOnS2;
		%feature("autodoc", "Returns true if the intersection is a u isoparametric curve on the second patch.

Returns
-------
bool
") IsUIsoOnS2;
		Standard_Boolean IsUIsoOnS2();

		/****************** IsVIsoOnS1 ******************/
		%feature("compactdefaultargs") IsVIsoOnS1;
		%feature("autodoc", "Returns true if the intersection is a v isoparametric curve on the first patch.

Returns
-------
bool
") IsVIsoOnS1;
		Standard_Boolean IsVIsoOnS1();

		/****************** IsVIsoOnS2 ******************/
		%feature("compactdefaultargs") IsVIsoOnS2;
		%feature("autodoc", "Returns true if the intersection is a v isoparametric curve on the second patch.

Returns
-------
bool
") IsVIsoOnS2;
		Standard_Boolean IsVIsoOnS2();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "To set the values returned by isuisos1,.... the default values are false.

Parameters
----------
Uiso1: bool
Viso1: bool
Uiso2: bool
Viso2: bool

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Boolean Uiso1, const Standard_Boolean Viso1, const Standard_Boolean Uiso2, const Standard_Boolean Viso2);

		/****************** SituationS1 ******************/
		%feature("compactdefaultargs") SituationS1;
		%feature("autodoc", "Returns the situation (inside/outside/unknown) of the first patch compared to the second one, when transitionons1 or transitionons2 returns touch. otherwise, an exception is raised.

Returns
-------
IntSurf_Situation
") SituationS1;
		IntSurf_Situation SituationS1();

		/****************** SituationS2 ******************/
		%feature("compactdefaultargs") SituationS2;
		%feature("autodoc", "Returns the situation (inside/outside/unknown) of the second patch compared to the first one, when transitionons1 or transitionons2 returns touch. otherwise, an exception is raised.

Returns
-------
IntSurf_Situation
") SituationS2;
		IntSurf_Situation SituationS2();

		/****************** TransitionOnS1 ******************/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "Returns the type of the transition of the line for the first surface. the transition is 'constant' along the line. the transition is in if the line is oriented in such a way that the system of vector (n1,n2,t) is right-handed, where n1 is the normal to the first surface at a point p, n2 is the normal to the second surface at a point p, t is the tangent to the intersection line at p. if the system of vector is left-handed, the transition is out. when n1 and n2 are colinear all along the intersection line, the transition will be - touch, if it is possible to use the 2nd derivatives to determine the position of one surafce compared to the other (see situation) - undecided otherwise. //! if one of the transition is touch or undecided, the other one has got the same value.

Returns
-------
IntSurf_TypeTrans
") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1();

		/****************** TransitionOnS2 ******************/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "Returns the type of the transition of the line for the second surface. the transition is 'constant' along the line.

Returns
-------
IntSurf_TypeTrans
") TransitionOnS2;
		IntSurf_TypeTrans TransitionOnS2();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
mode: int

Returns
-------
None
") IntPatch_LineConstructor;
		 IntPatch_LineConstructor(const Standard_Integer mode);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
index: int

Returns
-------
opencascade::handle<IntPatch_Line>
") Line;
		opencascade::handle<IntPatch_Line> Line(const Standard_Integer index);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
SL: IntPatch_SequenceOfLine
L: IntPatch_Line
S1: Adaptor3d_HSurface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_HSurface
D2: Adaptor3d_TopolTool
Tol: float

Returns
-------
None
") Perform;
		void Perform(const IntPatch_SequenceOfLine & SL, const opencascade::handle<IntPatch_Line> & L, const opencascade::handle<Adaptor3d_HSurface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_HSurface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const Standard_Real Tol);

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
		/****************** IntPatch_Point ******************/
		%feature("compactdefaultargs") IntPatch_Point;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntPatch_Point;
		 IntPatch_Point();

		/****************** ArcOnS1 ******************/
		%feature("compactdefaultargs") ArcOnS1;
		%feature("autodoc", "Returns the arc of restriction containing the vertex. the exception domainerror is raised if isondoms1 returns false.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") ArcOnS1;
		const opencascade::handle<Adaptor2d_HCurve2d> & ArcOnS1();

		/****************** ArcOnS2 ******************/
		%feature("compactdefaultargs") ArcOnS2;
		%feature("autodoc", "Returns the arc of restriction containing the vertex. the exception domainerror is raised if isondoms2 returns false.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") ArcOnS2;
		const opencascade::handle<Adaptor2d_HCurve2d> & ArcOnS2();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** IsMultiple ******************/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Returns true if the point belongs to several intersection lines.

Returns
-------
bool
") IsMultiple;
		Standard_Boolean IsMultiple();

		/****************** IsOnDomS1 ******************/
		%feature("compactdefaultargs") IsOnDomS1;
		%feature("autodoc", "Returns true if the point is on a boundary of the domain of the first patch.

Returns
-------
bool
") IsOnDomS1;
		Standard_Boolean IsOnDomS1();

		/****************** IsOnDomS2 ******************/
		%feature("compactdefaultargs") IsOnDomS2;
		%feature("autodoc", "Returns true if the point is on a boundary of the domain of the second patch.

Returns
-------
bool
") IsOnDomS2;
		Standard_Boolean IsOnDomS2();

		/****************** IsTangencyPoint ******************/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Returns true if the point is a tangency point between the surfaces. if the point is on one of the domain (isondoms1 returns true or isondoms2 returns true), an exception is raised.

Returns
-------
bool
") IsTangencyPoint;
		Standard_Boolean IsTangencyPoint();

		/****************** IsVertexOnS1 ******************/
		%feature("compactdefaultargs") IsVertexOnS1;
		%feature("autodoc", "Returns true if the point is a vertex on the initial restriction facet of the first surface.

Returns
-------
bool
") IsVertexOnS1;
		Standard_Boolean IsVertexOnS1();

		/****************** IsVertexOnS2 ******************/
		%feature("compactdefaultargs") IsVertexOnS2;
		%feature("autodoc", "Returns true if the point is a vertex on the initial restriction facet of the first surface.

Returns
-------
bool
") IsVertexOnS2;
		Standard_Boolean IsVertexOnS2();

		/****************** ParameterOnArc1 ******************/
		%feature("compactdefaultargs") ParameterOnArc1;
		%feature("autodoc", "Returns the parameter of the point on the arc returned by the method arcons2. the exception domainerror is raised if isondoms1 returns false.

Returns
-------
float
") ParameterOnArc1;
		Standard_Real ParameterOnArc1();

		/****************** ParameterOnArc2 ******************/
		%feature("compactdefaultargs") ParameterOnArc2;
		%feature("autodoc", "Returns the parameter of the point on the arc returned by the method arcons2. the exception domainerror is raised if isondoms2 returns false.

Returns
-------
float
") ParameterOnArc2;
		Standard_Real ParameterOnArc2();

		/****************** ParameterOnLine ******************/
		%feature("compactdefaultargs") ParameterOnLine;
		%feature("autodoc", "This method returns the parameter of the point on the intersection line. if the points does not belong to an intersection line, the value returned does not have any sens.

Returns
-------
float
") ParameterOnLine;
		Standard_Real ParameterOnLine();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters on the first and on the second surface of the point.

Parameters
----------

Returns
-------
U1: float
V1: float
U2: float
V2: float
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParametersOnS1 ******************/
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "Returns the parameters on the first surface of the point.

Parameters
----------

Returns
-------
U1: float
V1: float
") ParametersOnS1;
		void ParametersOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParametersOnS2 ******************/
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "Returns the parameters on the second surface of the point.

Parameters
----------

Returns
-------
U2: float
V2: float
") ParametersOnS2;
		void ParametersOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** PntOn2S ******************/
		%feature("compactdefaultargs") PntOn2S;
		%feature("autodoc", "Returns the pnton2s (geometric point and the parameters).

Returns
-------
IntSurf_PntOn2S
") PntOn2S;
		const IntSurf_PntOn2S & PntOn2S();

		/****************** ReverseTransition ******************/
		%feature("compactdefaultargs") ReverseTransition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ReverseTransition;
		void ReverseTransition();

		/****************** SetArc ******************/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "Sets the values of a point which is on one of the domain, when both surfaces are implicit ones. if onfirst is true, the point is on the domain of the first patch, otherwise the point is on the domain of the second surface.

Parameters
----------
OnFirst: bool
A: Adaptor2d_HCurve2d
Param: float
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Returns
-------
None
") SetArc;
		void SetArc(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****************** SetMultiple ******************/
		%feature("compactdefaultargs") SetMultiple;
		%feature("autodoc", "Sets (or unsets) the point as a point on several intersection line.

Parameters
----------
IsMult: bool

Returns
-------
None
") SetMultiple;
		void SetMultiple(const Standard_Boolean IsMult);

		/****************** SetParameter ******************/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "Set the value of the parameter on the intersection line.

Parameters
----------
Para: float

Returns
-------
None
") SetParameter;
		void SetParameter(const Standard_Real Para);

		/****************** SetParameters ******************/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "Sets the values of the parameters of the point on each surface.

Parameters
----------
U1: float
V1: float
U2: float
V2: float

Returns
-------
None
") SetParameters;
		void SetParameters(const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the values of a point which is on no domain, when both surfaces are implicit ones. if tangent is true, the point is a point of tangency between the surfaces.

Parameters
----------
Pt: gp_Pnt
Tol: float
Tangent: bool

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt, const Standard_Real Tol, const Standard_Boolean Tangent);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
Pt: gp_Pnt

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & Pt);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the value of <pt> member.

Parameters
----------
thePOn2S: IntSurf_PntOn2S

Returns
-------
None
") SetValue;
		void SetValue(const IntSurf_PntOn2S & thePOn2S);

		/****************** SetVertex ******************/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface. if onfirst is true, the point is on the domain of the first patch, otherwise the point is on the domain of the second surface.

Parameters
----------
OnFirst: bool
V: Adaptor3d_HVertex

Returns
-------
None
") SetVertex;
		void SetVertex(const Standard_Boolean OnFirst, const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "This method returns the fuzziness on the point.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** TransitionLineArc1 ******************/
		%feature("compactdefaultargs") TransitionLineArc1;
		%feature("autodoc", "Returns the transition of the point on the intersection line with the arc on s1. the exception domainerror is raised if isondoms1 returns false.

Returns
-------
IntSurf_Transition
") TransitionLineArc1;
		const IntSurf_Transition & TransitionLineArc1();

		/****************** TransitionLineArc2 ******************/
		%feature("compactdefaultargs") TransitionLineArc2;
		%feature("autodoc", "Returns the transition of the point on the intersection line with the arc on s2. the exception domainerror is raised if isondoms2 returns false.

Returns
-------
IntSurf_Transition
") TransitionLineArc2;
		const IntSurf_Transition & TransitionLineArc2();

		/****************** TransitionOnS1 ******************/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "Returns the transition between the intersection line returned by the method line and the arc on s1 returned by arcons1(). the exception domainerror is raised if isondoms1 returns false.

Returns
-------
IntSurf_Transition
") TransitionOnS1;
		const IntSurf_Transition & TransitionOnS1();

		/****************** TransitionOnS2 ******************/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "Returns the transition between the intersection line returned by the method line and the arc on s2 returned by arcons2. the exception domainerror is raised if isondoms2 returns false.

Returns
-------
IntSurf_Transition
") TransitionOnS2;
		const IntSurf_Transition & TransitionOnS2();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the intersection point (geometric information).

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** VertexOnS1 ******************/
		%feature("compactdefaultargs") VertexOnS1;
		%feature("autodoc", "Returns the information about the point when it is on the domain of the first patch, i-e when the function isvertexons1 returns true. otherwise, an exception is raised.

Returns
-------
opencascade::handle<Adaptor3d_HVertex>
") VertexOnS1;
		const opencascade::handle<Adaptor3d_HVertex> & VertexOnS1();

		/****************** VertexOnS2 ******************/
		%feature("compactdefaultargs") VertexOnS2;
		%feature("autodoc", "Returns the information about the point when it is on the domain of the second patch, i-e when the function isvertexons2 returns true. otherwise, an exception is raised.

Returns
-------
opencascade::handle<Adaptor3d_HVertex>
") VertexOnS2;
		const opencascade::handle<Adaptor3d_HVertex> & VertexOnS2();

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
		%feature("autodoc", "Returns the tolerance of the polygon.

Returns
-------
float
") DeflectionOverEstimation;
		virtual Standard_Real DeflectionOverEstimation();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Error;
		Standard_Real Error();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		virtual Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of segments in the polyline.

Returns
-------
int
") NbSegments;
		virtual Standard_Integer NbSegments();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
gp_Pnt2d
") Point;
		virtual gp_Pnt2d Point(const Standard_Integer Index);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns the points of the segment <index> in the polygon.

Parameters
----------
theIndex: int
theBegin: gp_Pnt2d
theEnd: gp_Pnt2d

Returns
-------
None
") Segment;
		virtual void Segment(const Standard_Integer theIndex, gp_Pnt2d & theBegin, gp_Pnt2d & theEnd);

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
		%feature("autodoc", "Give the bounding box of the polyhedron.

Parameters
----------
thePolyh: IntPatch_Polyhedron

Returns
-------
Bnd_Box
") Bounding;
		static const Bnd_Box & Bounding(const IntPatch_Polyhedron & thePolyh);

		/****************** ComponentsBounding ******************/
		%feature("compactdefaultargs") ComponentsBounding;
		%feature("autodoc", "Give the array of boxes. the box <n> corresponding to the triangle <n>.

Parameters
----------
thePolyh: IntPatch_Polyhedron

Returns
-------
opencascade::handle<Bnd_HArray1OfBox>
") ComponentsBounding;
		static const opencascade::handle<Bnd_HArray1OfBox> & ComponentsBounding(const IntPatch_Polyhedron & thePolyh);

		/****************** DeflectionOverEstimation ******************/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Give the tolerance of the polygon.

Parameters
----------
thePolyh: IntPatch_Polyhedron

Returns
-------
float
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation(const IntPatch_Polyhedron & thePolyh);

		/****************** NbTriangles ******************/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "Give the number of triangles in this polyedral surface.

Parameters
----------
thePolyh: IntPatch_Polyhedron

Returns
-------
int
") NbTriangles;
		static Standard_Integer NbTriangles(const IntPatch_Polyhedron & thePolyh);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Give the point of index i in the polyedral surface.

Parameters
----------
thePolyh: IntPatch_Polyhedron
Index: int

Returns
-------
gp_Pnt
") Point;
		static const gp_Pnt Point(const IntPatch_Polyhedron & thePolyh, const Standard_Integer Index);

		/****************** TriConnex ******************/
		%feature("compactdefaultargs") TriConnex;
		%feature("autodoc", "Gives the addresse tricon of the triangle connexe to the triangle of address triang by the edge pivot pedge and the third point of this connexe triangle. when we are on a free edge tricon==0 but the function return the value of the triangle in the other side of pivot on the free edge. used to turn around a vertex.

Parameters
----------
thePolyh: IntPatch_Polyhedron
Triang: int
Pivot: int
Pedge: int

Returns
-------
TriCon: int
OtherP: int
") TriConnex;
		static Standard_Integer TriConnex(const IntPatch_Polyhedron & thePolyh, const Standard_Integer Triang, const Standard_Integer Pivot, const Standard_Integer Pedge, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Triangle ******************/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "Give the indices of the 3 points of the triangle of address index in the polyhedron.

Parameters
----------
thePolyh: IntPatch_Polyhedron
Index: int

Returns
-------
P1: int
P2: int
P3: int
") Triangle;
		static void Triangle(const IntPatch_Polyhedron & thePolyh, const Standard_Integer Index, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

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
		/****************** IntPatch_PrmPrmIntersection ******************/
		%feature("compactdefaultargs") IntPatch_PrmPrmIntersection;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntPatch_PrmPrmIntersection;
		 IntPatch_PrmPrmIntersection();

		/****************** CodeReject ******************/
		%feature("compactdefaultargs") CodeReject;
		%feature("autodoc", "No available documentation.

Parameters
----------
x1: float
y1: float
z1: float
x2: float
y2: float
z2: float
x3: float
y3: float
z3: float

Returns
-------
int
") CodeReject;
		Standard_Integer CodeReject(const Standard_Real x1, const Standard_Real y1, const Standard_Real z1, const Standard_Real x2, const Standard_Real y2, const Standard_Real z2, const Standard_Real x3, const Standard_Real y3, const Standard_Real z3);

		/****************** DansGrille ******************/
		%feature("compactdefaultargs") DansGrille;
		%feature("autodoc", "No available documentation.

Parameters
----------
t: int

Returns
-------
int
") DansGrille;
		Standard_Integer DansGrille(const Standard_Integer t);

		/****************** GrilleInteger ******************/
		%feature("compactdefaultargs") GrilleInteger;
		%feature("autodoc", "No available documentation.

Parameters
----------
ix: int
iy: int
iz: int

Returns
-------
int
") GrilleInteger;
		Standard_Integer GrilleInteger(const Standard_Integer ix, const Standard_Integer iy, const Standard_Integer iz);

		/****************** IntegerGrille ******************/
		%feature("compactdefaultargs") IntegerGrille;
		%feature("autodoc", "No available documentation.

Parameters
----------
t: int

Returns
-------
ix: int
iy: int
iz: int
") IntegerGrille;
		void IntegerGrille(const Standard_Integer t, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was succesfull.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if the is no intersection.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the line of range index. an exception is raised if index<=0 or index>nbline.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IntPatch_Line>
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const Standard_Integer Index);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of intersection lines.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NbPointsGrille ******************/
		%feature("compactdefaultargs") NbPointsGrille;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPointsGrille;
		Standard_Integer NbPointsGrille();

		/****************** NewLine ******************/
		%feature("compactdefaultargs") NewLine;
		%feature("autodoc", "Computes about <nbpoints> intersection points on the line <indexline> between the points of index <lowpoint> and <highpoint>. //! all the points of the line of index <indexline> with an index between <lowpoint> and <highpoint> are in the returned line. new points are inserted between existing points if those points are not too closed. //! an exception is raised if index<=0 or index>nbline. or if isdone returns false.

Parameters
----------
Caro1: Adaptor3d_HSurface
Caro2: Adaptor3d_HSurface
IndexLine: int
LowPoint: int
HighPoint: int
NbPoints: int

Returns
-------
opencascade::handle<IntPatch_Line>
") NewLine;
		opencascade::handle<IntPatch_Line> NewLine(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const opencascade::handle<Adaptor3d_HSurface> & Caro2, const Standard_Integer IndexLine, const Standard_Integer LowPoint, const Standard_Integer HighPoint, const Standard_Integer NbPoints);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between <caro1> and <caro2>. associated polyhedrons <polyhedron1> and <polyhedron2> are given.

Parameters
----------
Caro1: Adaptor3d_HSurface
Polyhedron1: IntPatch_Polyhedron
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_HSurface
Polyhedron2: IntPatch_Polyhedron
Domain2: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const IntPatch_Polyhedron & Polyhedron1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_HSurface> & Caro2, const IntPatch_Polyhedron & Polyhedron2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
Caro1: Adaptor3d_HSurface
Polyhedron1: IntPatch_Polyhedron
Domain1: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const IntPatch_Polyhedron & Polyhedron1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between <caro1> and <caro2>. the method computes the polyhedron on each surface.

Parameters
----------
Caro1: Adaptor3d_HSurface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_HSurface
Domain2: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float
ClearFlag: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_HSurface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment, const Standard_Boolean ClearFlag = Standard_True);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between <caro1> and <caro2>. the method computes the polyhedron on each surface.

Parameters
----------
Caro1: Adaptor3d_HSurface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_HSurface
Domain2: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float
ListOfPnts: IntSurf_ListOfPntOn2S

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_HSurface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment, IntSurf_ListOfPntOn2S & ListOfPnts);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between <caro1> and <caro2>. the method computes the polyhedron on each surface.

Parameters
----------
Caro1: Adaptor3d_HSurface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_HSurface
Domain2: Adaptor3d_TopolTool
U1: float
V1: float
U2: float
V2: float
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_HSurface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real U1, const Standard_Real V1, const Standard_Real U2, const Standard_Real V2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between <caro1> and <caro2>. the method computes the polyhedron on each surface.

Parameters
----------
Caro1: Adaptor3d_HSurface
Domain1: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between <caro1> and <caro2>. //! the polyhedron which approximates <caro2>, <polyhedron2> is given. the other one is computed.

Parameters
----------
Caro1: Adaptor3d_HSurface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_HSurface
Polyhedron2: IntPatch_Polyhedron
Domain2: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_HSurface> & Caro2, const IntPatch_Polyhedron & Polyhedron2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the intersection between <caro1> and <caro2>. //! the polyhedron which approximates <caro1>, <polyhedron1> is given. the other one is computed.

Parameters
----------
Caro1: Adaptor3d_HSurface
Polyhedron1: IntPatch_Polyhedron
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_HSurface
Domain2: Adaptor3d_TopolTool
TolTangency: float
Epsilon: float
Deflection: float
Increment: float

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HSurface> & Caro1, const IntPatch_Polyhedron & Polyhedron1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_HSurface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const Standard_Real TolTangency, const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Increment);

		/****************** PointDepart ******************/
		%feature("compactdefaultargs") PointDepart;
		%feature("autodoc", "No available documentation.

Parameters
----------
LineOn2S: IntSurf_LineOn2S
S1: Adaptor3d_HSurface
SU1: int
SV1: int
S2: Adaptor3d_HSurface
SU2: int
SV2: int

Returns
-------
None
") PointDepart;
		void PointDepart(opencascade::handle<IntSurf_LineOn2S> & LineOn2S, const opencascade::handle<Adaptor3d_HSurface> & S1, const Standard_Integer SU1, const Standard_Integer SV1, const opencascade::handle<Adaptor3d_HSurface> & S2, const Standard_Integer SU2, const Standard_Integer SV2);

		/****************** Remplit ******************/
		%feature("compactdefaultargs") Remplit;
		%feature("autodoc", "No available documentation.

Parameters
----------
a: int
b: int
c: int
Map: IntPatch_PrmPrmIntersection_T3Bits

Returns
-------
None
") Remplit;
		void Remplit(const Standard_Integer a, const Standard_Integer b, const Standard_Integer c, IntPatch_PrmPrmIntersection_T3Bits & Map);

		/****************** RemplitLin ******************/
		%feature("compactdefaultargs") RemplitLin;
		%feature("autodoc", "No available documentation.

Parameters
----------
x1: int
y1: int
z1: int
x2: int
y2: int
z2: int
Map: IntPatch_PrmPrmIntersection_T3Bits

Returns
-------
None
") RemplitLin;
		void RemplitLin(const Standard_Integer x1, const Standard_Integer y1, const Standard_Integer z1, const Standard_Integer x2, const Standard_Integer y2, const Standard_Integer z2, IntPatch_PrmPrmIntersection_T3Bits & Map);

		/****************** RemplitTri ******************/
		%feature("compactdefaultargs") RemplitTri;
		%feature("autodoc", "No available documentation.

Parameters
----------
x1: int
y1: int
z1: int
x2: int
y2: int
z2: int
x3: int
y3: int
z3: int
Map: IntPatch_PrmPrmIntersection_T3Bits

Returns
-------
None
") RemplitTri;
		void RemplitTri(const Standard_Integer x1, const Standard_Integer y1, const Standard_Integer z1, const Standard_Integer x2, const Standard_Integer y2, const Standard_Integer z2, const Standard_Integer x3, const Standard_Integer y3, const Standard_Integer z3, IntPatch_PrmPrmIntersection_T3Bits & Map);

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
		/****************** IntPatch_PrmPrmIntersection_T3Bits ******************/
		%feature("compactdefaultargs") IntPatch_PrmPrmIntersection_T3Bits;
		%feature("autodoc", "No available documentation.

Parameters
----------
size: int

Returns
-------
None
") IntPatch_PrmPrmIntersection_T3Bits;
		 IntPatch_PrmPrmIntersection_T3Bits(const Standard_Integer size);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
t: int

Returns
-------
None
") Add;
		void Add(const Standard_Integer t);

		/****************** And ******************/
		%feature("compactdefaultargs") And;
		%feature("autodoc", "No available documentation.

Parameters
----------
Oth: IntPatch_PrmPrmIntersection_T3Bits

Returns
-------
indiceprecedent: int
") And;
		Standard_Integer And(IntPatch_PrmPrmIntersection_T3Bits & Oth, Standard_Integer &OutValue);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Raz ******************/
		%feature("compactdefaultargs") Raz;
		%feature("autodoc", "No available documentation.

Parameters
----------
t: int

Returns
-------
None
") Raz;
		void Raz(const Standard_Integer t);

		/****************** ResetAnd ******************/
		%feature("compactdefaultargs") ResetAnd;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ResetAnd;
		void ResetAnd();

		/****************** Val ******************/
		%feature("compactdefaultargs") Val;
		%feature("autodoc", "No available documentation.

Parameters
----------
t: int

Returns
-------
int
") Val;
		Standard_Integer Val(const Standard_Integer t);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
L: IntPatch_Line
Surf: Adaptor3d_HSurface
Domain: Adaptor3d_TopolTool
OtherSurf: Adaptor3d_HSurface
OnFirst: bool
Tol: float

Returns
-------
None
") PutVertexOnLine;
		static void PutVertexOnLine(const opencascade::handle<IntPatch_Line> & L, const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const opencascade::handle<Adaptor3d_HSurface> & OtherSurf, const Standard_Boolean OnFirst, const Standard_Real Tol);

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
		%feature("autodoc", "Adds the point defined as intersection of two isolines (u = 0 and v = 0) on theqsurf in theline. therefpt is used to correct adjusting parameters. if theisreversed is true then theqsurf correspond to the second (otherwise, the first) surface while forming intersection point intsurf_pnton2s.

Parameters
----------
theQSurf: Adaptor3d_HSurface
thePSurf: Adaptor3d_HSurface
theRefPt: IntSurf_PntOn2S
theTol3d: float
theAddedPoint: IntSurf_PntOn2S
theIsReversed: bool,optional
	default value is Standard_False

Returns
-------
bool
") AddCrossUVIsoPoint;
		static Standard_Boolean AddCrossUVIsoPoint(const opencascade::handle<Adaptor3d_HSurface> & theQSurf, const opencascade::handle<Adaptor3d_HSurface> & thePSurf, const IntSurf_PntOn2S & theRefPt, const Standard_Real theTol3d, IntSurf_PntOn2S & theAddedPoint, const Standard_Boolean theIsReversed = Standard_False);

		/****************** AddPointOnUorVIso ******************/
		%feature("compactdefaultargs") AddPointOnUorVIso;
		%feature("autodoc", "Adds the point lain strictly in the isoline u = 0 or v = 0 of theqsurf, in theline. therefpt is used to correct adjusting parameters. if theisreversed is true then theqsurf corresponds to the second (otherwise, the first) surface while forming intersection point intsurf_pnton2s. all math_vector-objects must be filled as follows: [1] - u-parameter of thepsurf; [2] - v-parameter of thepsurf; [3] - u- (if v-isoline is considered) or v-parameter (if u-isoline is considered) of theqsurf.

Parameters
----------
theQSurf: Adaptor3d_HSurface
thePSurf: Adaptor3d_HSurface
theRefPt: IntSurf_PntOn2S
theIsU: bool
theIsoParameter: float
theToler: math_Vector
theInitPoint: math_Vector
theInfBound: math_Vector
theSupBound: math_Vector
theAddedPoint: IntSurf_PntOn2S
theIsReversed: bool,optional
	default value is Standard_False

Returns
-------
bool
") AddPointOnUorVIso;
		static Standard_Boolean AddPointOnUorVIso(const opencascade::handle<Adaptor3d_HSurface> & theQSurf, const opencascade::handle<Adaptor3d_HSurface> & thePSurf, const IntSurf_PntOn2S & theRefPt, const Standard_Boolean theIsU, const Standard_Real theIsoParameter, const math_Vector & theToler, const math_Vector & theInitPoint, const math_Vector & theInfBound, const math_Vector & theSupBound, IntSurf_PntOn2S & theAddedPoint, const Standard_Boolean theIsReversed = Standard_False);

		/****************** AddSingularPole ******************/
		%feature("compactdefaultargs") AddSingularPole;
		%feature("autodoc", "Computes the pole of sphere to add it in the intersection line. stores the result in theaddedpoint variable (does not add in the line). at that, cone and sphere (with singularity) must be set in theqsurf parameter. by default (if theisreversed == false), theqsurf is the first surface of the walking line. if it is not, theisreversed parameter must be set to true. theisreqrefcheck is true if and only if 3d-point of therefpt must be pole or apex for check (e.g. if it is vertex). theptiso is the reference point for obtaining isoline where must be placed the apex/pole. //! attention!!! thevertex must be initialized before calling the method .

Parameters
----------
theQSurf: Adaptor3d_HSurface
thePSurf: Adaptor3d_HSurface
thePtIso: IntSurf_PntOn2S
theVertex: IntPatch_Point
theAddedPoint: IntSurf_PntOn2S
theIsReversed: bool,optional
	default value is Standard_False
theIsReqRefCheck: bool,optional
	default value is Standard_False

Returns
-------
bool
") AddSingularPole;
		static Standard_Boolean AddSingularPole(const opencascade::handle<Adaptor3d_HSurface> & theQSurf, const opencascade::handle<Adaptor3d_HSurface> & thePSurf, const IntSurf_PntOn2S & thePtIso, IntPatch_Point & theVertex, IntSurf_PntOn2S & theAddedPoint, const Standard_Boolean theIsReversed = Standard_False, const Standard_Boolean theIsReqRefCheck = Standard_False);

		/****************** AdjustPointAndVertex ******************/
		%feature("compactdefaultargs") AdjustPointAndVertex;
		%feature("autodoc", "Sets thenewpoint parameters in 2d-space the closest to therefpoint with help of adding/subtracting corresponding periods. thearrperiods must be filled as follows: {<u-period of 1st surface>, <v-period of 1st surface>, <u-period of 2nd surface>, <v-period of 2nd surface>}. if thevertex != 0 then its parameters will be filled as corresponding parameters of thenewpoint. //! attention!!! thenewpoint is not only output parameter. it is input/output one. i.e. thenewpoint is reference point together with therefpt.

Parameters
----------
theRefPoint: IntSurf_PntOn2S
theArrPeriods: float
theNewPoint: IntSurf_PntOn2S
theVertex: IntPatch_Point *,optional
	default value is 0

Returns
-------
None
") AdjustPointAndVertex;
		static void AdjustPointAndVertex(const IntSurf_PntOn2S & theRefPoint, const Standard_Real theArrPeriods[4], IntSurf_PntOn2S & theNewPoint, IntPatch_Point * const theVertex = 0);

		/****************** ContinueAfterSpecialPoint ******************/
		%feature("compactdefaultargs") ContinueAfterSpecialPoint;
		%feature("autodoc", "Special point has already been added in the line. now, we need in correct prolongation of the line or in start new line. this function returns new point. //! attention!!! thenewpoint is not only output parameter. it is input/output one. i.e. thenewpoint is reference point together with therefpt.

Parameters
----------
theQSurf: Adaptor3d_HSurface
thePSurf: Adaptor3d_HSurface
theRefPt: IntSurf_PntOn2S
theSPType: IntPatch_SpecPntType
theTol2D: float
theNewPoint: IntSurf_PntOn2S
theIsReversed: bool,optional
	default value is Standard_False

Returns
-------
bool
") ContinueAfterSpecialPoint;
		static Standard_Boolean ContinueAfterSpecialPoint(const opencascade::handle<Adaptor3d_HSurface> & theQSurf, const opencascade::handle<Adaptor3d_HSurface> & thePSurf, const IntSurf_PntOn2S & theRefPt, const IntPatch_SpecPntType theSPType, const Standard_Real theTol2D, IntSurf_PntOn2S & theNewPoint, const Standard_Boolean theIsReversed = Standard_False);

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
		/****************** IntPatch_TheIWLineOfTheIWalking ******************/
		%feature("compactdefaultargs") IntPatch_TheIWLineOfTheIWalking;
		%feature("autodoc", "No available documentation.

Parameters
----------
theAllocator: IntSurf_Allocator,optional
	default value is 0

Returns
-------
None
") IntPatch_TheIWLineOfTheIWalking;
		 IntPatch_TheIWLineOfTheIWalking(const IntSurf_Allocator & theAllocator = 0);

		/****************** AddIndexPassing ******************/
		%feature("compactdefaultargs") AddIndexPassing;
		%feature("autodoc", "Associer a l 'indice du point sur la ligne l'indice du point passant dans l'iterateur de depart.

Parameters
----------
Index: int

Returns
-------
None
") AddIndexPassing;
		void AddIndexPassing(const Standard_Integer Index);

		/****************** AddPoint ******************/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Add a point in the line.

Parameters
----------
P: IntSurf_PntOn2S

Returns
-------
None
") AddPoint;
		void AddPoint(const IntSurf_PntOn2S & P);

		/****************** AddStatusFirst ******************/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "No available documentation.

Parameters
----------
Closed: bool
HasFirst: bool

Returns
-------
None
") AddStatusFirst;
		void AddStatusFirst(const Standard_Boolean Closed, const Standard_Boolean HasFirst);

		/****************** AddStatusFirst ******************/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "No available documentation.

Parameters
----------
Closed: bool
HasLast: bool
Index: int
P: IntSurf_PathPoint

Returns
-------
None
") AddStatusFirst;
		void AddStatusFirst(const Standard_Boolean Closed, const Standard_Boolean HasLast, const Standard_Integer Index, const IntSurf_PathPoint & P);

		/****************** AddStatusFirstLast ******************/
		%feature("compactdefaultargs") AddStatusFirstLast;
		%feature("autodoc", "No available documentation.

Parameters
----------
Closed: bool
HasFirst: bool
HasLast: bool

Returns
-------
None
") AddStatusFirstLast;
		void AddStatusFirstLast(const Standard_Boolean Closed, const Standard_Boolean HasFirst, const Standard_Boolean HasLast);

		/****************** AddStatusLast ******************/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "No available documentation.

Parameters
----------
HasLast: bool

Returns
-------
None
") AddStatusLast;
		void AddStatusLast(const Standard_Boolean HasLast);

		/****************** AddStatusLast ******************/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "No available documentation.

Parameters
----------
HasLast: bool
Index: int
P: IntSurf_PathPoint

Returns
-------
None
") AddStatusLast;
		void AddStatusLast(const Standard_Boolean HasLast, const Standard_Integer Index, const IntSurf_PathPoint & P);

		/****************** Cut ******************/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "Cut the line at the point of rank index.

Parameters
----------
Index: int

Returns
-------
None
") Cut;
		void Cut(const Standard_Integer Index);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point of the line when it is a marching point. an exception is raised if hasfirstpoint returns false.

Returns
-------
IntSurf_PathPoint
") FirstPoint;
		const IntSurf_PathPoint & FirstPoint();

		/****************** FirstPointIndex ******************/
		%feature("compactdefaultargs") FirstPointIndex;
		%feature("autodoc", "Returns the index of first point of the line when it is a marching point.this index is the index in the pointstartiterator. an exception is raised if hasfirstpoint returns false.

Returns
-------
int
") FirstPointIndex;
		Standard_Integer FirstPointIndex();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the first point of the line is a marching point . when is hasfirstpoint==false ,the line begins on the natural bound of the surface.the line can be too long.

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if the end point of the line is a marching point (point from intws). when is hasfirstpoint==false ,the line ends on the natural bound of the surface.the line can be too long.

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the line is closed.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsTangentAtBegining ******************/
		%feature("compactdefaultargs") IsTangentAtBegining;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangentAtBegining;
		Standard_Boolean IsTangentAtBegining();

		/****************** IsTangentAtEnd ******************/
		%feature("compactdefaultargs") IsTangentAtEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangentAtEnd;
		Standard_Boolean IsTangentAtEnd();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the last point of the line when it is a marching point. an exception is raised if haslastpoint returns false.

Returns
-------
IntSurf_PathPoint
") LastPoint;
		const IntSurf_PathPoint & LastPoint();

		/****************** LastPointIndex ******************/
		%feature("compactdefaultargs") LastPointIndex;
		%feature("autodoc", "Returns the index of last point of the line when it is a marching point.this index is the index in the pointstartiterator. an exception is raised if haslastpoint returns false.

Returns
-------
int
") LastPointIndex;
		Standard_Integer LastPointIndex();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the lineon2s contained in the walking line.

Returns
-------
opencascade::handle<IntSurf_LineOn2S>
") Line;
		const opencascade::handle<IntSurf_LineOn2S> & Line();

		/****************** NbPassingPoint ******************/
		%feature("compactdefaultargs") NbPassingPoint;
		%feature("autodoc", "Returns the number of points belonging to pnts1 which are passing point.

Returns
-------
int
") NbPassingPoint;
		Standard_Integer NbPassingPoint();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points of the line (including first point and end point : see haslastpoint and hasfirstpoint).

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** PassingPoint ******************/
		%feature("compactdefaultargs") PassingPoint;
		%feature("autodoc", "Returns the index of the point belonging to the line which is associated to the passing point belonging to pnts1 an exception is raised if index > nbpassingpoint().

Parameters
----------
Index: int

Returns
-------
IndexLine: int
IndexPnts: int
") PassingPoint;
		void PassingPoint(const Standard_Integer Index, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverse the points in the line. hasfirst, haslast are kept.

Returns
-------
None
") Reverse;
		void Reverse();

		/****************** SetTangencyAtBegining ******************/
		%feature("compactdefaultargs") SetTangencyAtBegining;
		%feature("autodoc", "No available documentation.

Parameters
----------
IsTangent: bool

Returns
-------
None
") SetTangencyAtBegining;
		void SetTangencyAtBegining(const Standard_Boolean IsTangent);

		/****************** SetTangencyAtEnd ******************/
		%feature("compactdefaultargs") SetTangencyAtEnd;
		%feature("autodoc", "No available documentation.

Parameters
----------
IsTangent: bool

Returns
-------
None
") SetTangencyAtEnd;
		void SetTangencyAtEnd(const Standard_Boolean IsTangent);

		/****************** SetTangentVector ******************/
		%feature("compactdefaultargs") SetTangentVector;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: gp_Vec
Index: int

Returns
-------
None
") SetTangentVector;
		void SetTangentVector(const gp_Vec & V, const Standard_Integer Index);

		/****************** TangentVector ******************/
		%feature("compactdefaultargs") TangentVector;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
Index: int
") TangentVector;
		const gp_Vec TangentVector(Standard_Integer &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point of range index. if index <= 0 or index > nbpoints, an exception is raised.

Parameters
----------
Index: int

Returns
-------
IntSurf_PntOn2S
") Value;
		const IntSurf_PntOn2S & Value(const Standard_Integer Index);

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
		%feature("autodoc", "Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. step is the maximum increment admitted between two consecutive points (in 2d space). epsilon is the tolerance beyond which 2 points are confused. thetofillholes is the flag defining whether possible holes between resulting curves are filled or not in case of intpatch walking thetofillholes is false.

Parameters
----------
Epsilon: float
Deflection: float
Step: float
theToFillHoles: bool,optional
	default value is Standard_False

Returns
-------
None
") IntPatch_TheIWalking;
		 IntPatch_TheIWalking(const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Step, const Standard_Boolean theToFillHoles = Standard_False);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of resulting polylines. an exception is raised if isdone returns false.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NbSinglePnts ******************/
		%feature("compactdefaultargs") NbSinglePnts;
		%feature("autodoc", "Returns the number of points belonging to pnts on which no line starts or ends. an exception is raised if isdone returns false.

Returns
-------
int
") NbSinglePnts;
		Standard_Integer NbSinglePnts();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Searches a set of polylines starting on a point of pnts1 or pnts2. each point on a resulting polyline verifies f(u,v)=0.

Parameters
----------
Pnts1: IntSurf_SequenceOfPathPoint
Pnts2: IntSurf_SequenceOfInteriorPoint
Func: IntPatch_TheSurfFunction
S: Adaptor3d_HSurface
Reversed: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const IntSurf_SequenceOfPathPoint & Pnts1, const IntSurf_SequenceOfInteriorPoint & Pnts2, IntPatch_TheSurfFunction & Func, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Boolean Reversed = Standard_False);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Searches a set of polylines starting on a point of pnts1. each point on a resulting polyline verifies f(u,v)=0.

Parameters
----------
Pnts1: IntSurf_SequenceOfPathPoint
Func: IntPatch_TheSurfFunction
S: Adaptor3d_HSurface
Reversed: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(const IntSurf_SequenceOfPathPoint & Pnts1, IntPatch_TheSurfFunction & Func, const opencascade::handle<Adaptor3d_HSurface> & S, const Standard_Boolean Reversed = Standard_False);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. step is the maximum increment admitted between two consecutive points (in 2d space). epsilon is the tolerance beyond which 2 points are confused.

Parameters
----------
Epsilon: float
Deflection: float
Step: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Epsilon, const Standard_Real Deflection, const Standard_Real Step);

		/****************** SinglePnt ******************/
		%feature("compactdefaultargs") SinglePnt;
		%feature("autodoc", "Returns the point of range index . an exception is raised if isdone returns false. an exception is raised if index<=0 or index > nbsinglepnts.

Parameters
----------
Index: int

Returns
-------
IntSurf_PathPoint
") SinglePnt;
		const IntSurf_PathPoint & SinglePnt(const Standard_Integer Index);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the polyline of range index. an exception is raised if isdone is false. an exception is raised if index<=0 or index>nblines.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<IntPatch_TheIWLineOfTheIWalking>
") Value;
		const opencascade::handle<IntPatch_TheIWLineOfTheIWalking> & Value(const Standard_Integer Index);

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
		/****************** IntPatch_ThePathPointOfTheSOnBounds ******************/
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds();

		/****************** IntPatch_ThePathPointOfTheSOnBounds ******************/
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
V: Adaptor3d_HVertex
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** IntPatch_ThePathPointOfTheSOnBounds ******************/
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Arc;
		const opencascade::handle<Adaptor2d_HCurve2d> & Arc();

		/****************** IsNew ******************/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsNew;
		Standard_Boolean IsNew();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
V: Adaptor3d_HVertex
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
Tol: float
A: Adaptor2d_HCurve2d
Parameter: float

Returns
-------
None
") SetValue;
		void SetValue(const gp_Pnt & P, const Standard_Real Tol, const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Real Parameter);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Value;
		const gp_Pnt Value();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HVertex>
") Vertex;
		const opencascade::handle<Adaptor3d_HVertex> & Vertex();

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
		/****************** IntPatch_TheSOnBounds ******************/
		%feature("compactdefaultargs") IntPatch_TheSOnBounds;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntPatch_TheSOnBounds;
		 IntPatch_TheSOnBounds();

		/****************** AllArcSolution ******************/
		%feature("compactdefaultargs") AllArcSolution;
		%feature("autodoc", "Returns true if all arc of the arcs are solution (inside the surface). an exception is raised if isdone returns false.

Returns
-------
bool
") AllArcSolution;
		Standard_Boolean AllArcSolution();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the calculus was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of resulting points. an exception is raised if isdone returns false (notdone).

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of the resulting segments. an exception is raised if isdone returns false (notdone).

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Algorithm to find the points and parts of curves of domain (domain of of restriction of a surface) which verify f = 0. tolboundary defines if a curve is on q. toltangency defines if a point is on q.

Parameters
----------
F: IntPatch_ArcFunction
Domain: Adaptor3d_TopolTool
TolBoundary: float
TolTangency: float
RecheckOnRegularity: bool,optional
	default value is Standard_False

Returns
-------
None
") Perform;
		void Perform(IntPatch_ArcFunction & F, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const Standard_Real TolBoundary, const Standard_Real TolTangency, const Standard_Boolean RecheckOnRegularity = Standard_False);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the resulting point of range index. the exception notdone is raised if isdone() returns false. the exception outofrange is raised if index <= 0 or index > nbpoints.

Parameters
----------
Index: int

Returns
-------
IntPatch_ThePathPointOfTheSOnBounds
") Point;
		const IntPatch_ThePathPointOfTheSOnBounds & Point(const Standard_Integer Index);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns the resulting segment of range index. the exception notdone is raised if isdone() returns false. the exception outofrange is raised if index <= 0 or index > nbpoints.

Parameters
----------
Index: int

Returns
-------
IntPatch_TheSegmentOfTheSOnBounds
") Segment;
		const IntPatch_TheSegmentOfTheSOnBounds & Segment(const Standard_Integer Index);

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_TheSearchInside;
		 IntPatch_TheSearchInside();

		/****************** IntPatch_TheSearchInside ******************/
		%feature("compactdefaultargs") IntPatch_TheSearchInside;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: IntPatch_TheSurfFunction
Surf: Adaptor3d_HSurface
T: Adaptor3d_TopolTool
Epsilon: float

Returns
-------
None
") IntPatch_TheSearchInside;
		 IntPatch_TheSearchInside(IntPatch_TheSurfFunction & F, const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const Standard_Real Epsilon);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points. the exception notdone if raised if isdone returns false.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: IntPatch_TheSurfFunction
Surf: Adaptor3d_HSurface
T: Adaptor3d_TopolTool
Epsilon: float

Returns
-------
None
") Perform;
		void Perform(IntPatch_TheSurfFunction & F, const opencascade::handle<Adaptor3d_HSurface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const Standard_Real Epsilon);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: IntPatch_TheSurfFunction
Surf: Adaptor3d_HSurface
UStart: float
VStart: float

Returns
-------
None
") Perform;
		void Perform(IntPatch_TheSurfFunction & F, const opencascade::handle<Adaptor3d_HSurface> & Surf, const Standard_Real UStart, const Standard_Real VStart);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point of range index. the exception notdone if raised if isdone returns false. the exception outofrange if raised if index <= 0 or index > nbpoints.

Parameters
----------
Index: int

Returns
-------
IntSurf_InteriorPoint
") Value;
		const IntSurf_InteriorPoint & Value(const Standard_Integer Index);

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
		/****************** IntPatch_TheSegmentOfTheSOnBounds ******************/
		%feature("compactdefaultargs") IntPatch_TheSegmentOfTheSOnBounds;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntPatch_TheSegmentOfTheSOnBounds;
		 IntPatch_TheSegmentOfTheSOnBounds();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the geometric curve on the surface 's domain which is solution.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") Curve;
		const opencascade::handle<Adaptor2d_HCurve2d> & Curve();

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point.

Returns
-------
IntPatch_ThePathPointOfTheSOnBounds
") FirstPoint;
		const IntPatch_ThePathPointOfTheSOnBounds & FirstPoint();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if there is a vertex (thepathpoint) defining the lowest valid parameter on the arc.

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if there is a vertex (thepathpoint) defining the greatest valid parameter on the arc.

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the last point.

Returns
-------
IntPatch_ThePathPointOfTheSOnBounds
") LastPoint;
		const IntPatch_ThePathPointOfTheSOnBounds & LastPoint();

		/****************** SetLimitPoint ******************/
		%feature("compactdefaultargs") SetLimitPoint;
		%feature("autodoc", "Defines the first point or the last point, depending on the value of the boolean first.

Parameters
----------
V: IntPatch_ThePathPointOfTheSOnBounds
First: bool

Returns
-------
None
") SetLimitPoint;
		void SetLimitPoint(const IntPatch_ThePathPointOfTheSOnBounds & V, const Standard_Boolean First);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Defines the concerned arc.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") SetValue;
		void SetValue(const opencascade::handle<Adaptor2d_HCurve2d> & A);

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
		/****************** IntPatch_TheSurfFunction ******************/
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction();

		/****************** IntPatch_TheSurfFunction ******************/
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", "No available documentation.

Parameters
----------
PS: Adaptor3d_HSurface
IS: IntSurf_Quadric

Returns
-------
None
") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction(const opencascade::handle<Adaptor3d_HSurface> & PS, const IntSurf_Quadric & IS);

		/****************** IntPatch_TheSurfFunction ******************/
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", "No available documentation.

Parameters
----------
IS: IntSurf_Quadric

Returns
-------
None
") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction(const IntSurf_Quadric & IS);

		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
D: math_Matrix

Returns
-------
bool
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** Direction2d ******************/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir2d
") Direction2d;
		const gp_Dir2d Direction2d();

		/****************** Direction3d ******************/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Vec
") Direction3d;
		const gp_Vec Direction3d();

		/****************** ISurface ******************/
		%feature("compactdefaultargs") ISurface;
		%feature("autodoc", "No available documentation.

Returns
-------
IntSurf_Quadric
") ISurface;
		const IntSurf_Quadric & ISurface();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** PSurface ******************/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") PSurface;
		const opencascade::handle<Adaptor3d_HSurface> & PSurface();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
PS: Adaptor3d_HSurface

Returns
-------
None
") Set;
		void Set(const opencascade::handle<Adaptor3d_HSurface> & PS);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tolerance: float

Returns
-------
None
") Set;
		void Set(const Standard_Real Tolerance);

		/****************** SetImplicitSurface ******************/
		%feature("compactdefaultargs") SetImplicitSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
IS: IntSurf_Quadric

Returns
-------
None
") SetImplicitSurface;
		void SetImplicitSurface(const IntSurf_Quadric & IS);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the value tol so that if abs(func.root())<tol the function is considered null.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
F: math_Vector

Returns
-------
bool
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Returns
-------
bool
") Values;
		Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		%feature("autodoc", "I removes equal points (leave one of equal points) from thewline and recompute vertex parameters. //! ii removes point out of borders in case of non periodic surfaces. //! iii removes exceed points using tube criteria: delete 7d point if it lies near to expected lines in 2d and 3d. each task (2d, 2d, 3d) have its own tolerance and checked separately. //! returns new wline or null wline if the number of the points is less than 2.

Parameters
----------
theWLine: IntPatch_WLine
theS1: Adaptor3d_HSurface
theS2: Adaptor3d_HSurface
theDom1: Adaptor3d_TopolTool
theDom2: Adaptor3d_TopolTool

Returns
-------
opencascade::handle<IntPatch_WLine>
") ComputePurgedWLine;
		static opencascade::handle<IntPatch_WLine> ComputePurgedWLine(const opencascade::handle<IntPatch_WLine> & theWLine, const opencascade::handle<Adaptor3d_HSurface> & theS1, const opencascade::handle<Adaptor3d_HSurface> & theS2, const opencascade::handle<Adaptor3d_TopolTool> & theDom1, const opencascade::handle<Adaptor3d_TopolTool> & theDom2);

		/****************** ExtendTwoWLines ******************/
		%feature("compactdefaultargs") ExtendTwoWLines;
		%feature("autodoc", "Extends every line from theslin (if it is possible) to be started/finished in strictly determined point (in the place of joint of two lines). as result, some gaps between two lines will vanish. the walking lines are supposed (algorithm will do nothing for not-walking line) to be computed as a result of intersection. both thes1 and thes2 must be quadrics. other cases are not supported. thearrperiods must be filled as follows (every value must not be negative; if the surface is not periodic the period must be equal to 0.0 strictly): {<u-period of 1st surface>, <v-period of 1st surface>, <u-period of 2nd surface>, <v-period of 2nd surface>}. thelistofcriticalpoints must contain 3d-points where joining is disabled.

Parameters
----------
theSlin: IntPatch_SequenceOfLine
theS1: Adaptor3d_HSurface
theS2: Adaptor3d_HSurface
theToler3D: float
theArrPeriods: float *
theBoxS1: Bnd_Box2d
theBoxS2: Bnd_Box2d
theListOfCriticalPoints: NCollection_List<gp_Pnt>

Returns
-------
None
") ExtendTwoWLines;
		static void ExtendTwoWLines(IntPatch_SequenceOfLine & theSlin, const opencascade::handle<Adaptor3d_HSurface> & theS1, const opencascade::handle<Adaptor3d_HSurface> & theS2, const Standard_Real theToler3D, const Standard_Real * const theArrPeriods, const Bnd_Box2d & theBoxS1, const Bnd_Box2d & theBoxS2, const NCollection_List<gp_Pnt> & theListOfCriticalPoints);

		/****************** JoinWLines ******************/
		%feature("compactdefaultargs") JoinWLines;
		%feature("autodoc", "Joins all wlines from theslin to one if it is possible and records the result into theslin again. lines will be kept to be split if: a) they are separated (has no common points); b) resulted line (after joining) go through seam-edges or surface boundaries. //! in addition, if points in thespnt lies at least in one of the line in theslin, this point will be deleted.

Parameters
----------
theSlin: IntPatch_SequenceOfLine
theSPnt: IntPatch_SequenceOfPoint
theS1: Adaptor3d_HSurface
theS2: Adaptor3d_HSurface
theTol3D: float

Returns
-------
None
") JoinWLines;
		static void JoinWLines(IntPatch_SequenceOfLine & theSlin, IntPatch_SequenceOfPoint & theSPnt, opencascade::handle<Adaptor3d_HSurface > theS1, opencascade::handle<Adaptor3d_HSurface > theS2, const Standard_Real theTol3D);

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
		/****************** IntPatch_ALine ******************/
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "Creates an analytic intersection line when the transitions are in or out.

Parameters
----------
C: IntAna_Curve
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_ALine;
		 IntPatch_ALine(const IntAna_Curve & C, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_ALine ******************/
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "Creates an analytic intersection line when the transitions are touch.

Parameters
----------
C: IntAna_Curve
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_ALine;
		 IntPatch_ALine(const IntAna_Curve & C, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_ALine ******************/
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "Creates an analytic intersection line when the transitions are undecided.

Parameters
----------
C: IntAna_Curve
Tang: bool

Returns
-------
None
") IntPatch_ALine;
		 IntPatch_ALine(const IntAna_Curve & C, const Standard_Boolean Tang);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "To add a vertex in the list.

Parameters
----------
Pnt: IntPatch_Point

Returns
-------
None
") AddVertex;
		void AddVertex(const IntPatch_Point & Pnt);

		/****************** ChangeVertex ******************/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "Allows modifying the vertex with index theindex on the line.

Parameters
----------
theIndex: int

Returns
-------
IntPatch_Point
") ChangeVertex;
		IntPatch_Point & ChangeVertex(const Standard_Integer theIndex);

		/****************** ComputeVertexParameters ******************/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.

Parameters
----------
Tol: float

Returns
-------
None
") ComputeVertexParameters;
		void ComputeVertexParameters(const Standard_Real Tol);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
IntAna_Curve
") Curve;
		const IntAna_Curve & Curve();

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns standard_true when the derivative at parameter u is defined on the analytic intersection line. in that case, du is the derivative. returns standard_false when it is not possible to evaluate the derivative. in both cases, p is the point at parameter u on the intersection.

Parameters
----------
U: float
P: gp_Pnt
Du: gp_Vec

Returns
-------
bool
") D1;
		Standard_Boolean D1(const Standard_Real U, gp_Pnt & P, gp_Vec & Du);

		/****************** FindParameter ******************/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "Tries to find the parameters of the point p on the curve. if the method returns false, the 'projection' is impossible. if the method returns true at least one parameter has been found. theparams is always sorted in ascending order.

Parameters
----------
P: gp_Pnt
theParams: TColStd_ListOfReal

Returns
-------
None
") FindParameter;
		void FindParameter(const gp_Pnt & P, TColStd_ListOfReal & theParams);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the first parameter on the intersection line. if isincluded returns true, value and d1 methods can be call with a parameter equal to firstparamater. otherwise, the parameter must be greater than firstparameter.

Parameters
----------

Returns
-------
IsIncluded: bool
") FirstParameter;
		Standard_Real FirstParameter(Standard_Boolean &OutValue);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the intpoint corresponding to the firstpoint. an exception is raised when hasfirstpoint returns false.

Returns
-------
IntPatch_Point
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the line has a known first point. this point is given by the method firstpoint().

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if the line has a known last point. this point is given by the method lastpoint().

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the last parameter on the intersection line. if isincluded returns true, value and d1 methods can be call with a parameter equal to lastparamater. otherwise, the parameter must be less than lastparameter.

Parameters
----------

Returns
-------
IsIncluded: bool
") LastParameter;
		Standard_Real LastParameter(Standard_Boolean &OutValue);

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the intpoint corresponding to the lastpoint. an exception is raised when haslastpoint returns false.

Returns
-------
IntPatch_Point
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****************** NbVertex ******************/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVertex;
		Standard_Integer NbVertex();

		/****************** Replace ******************/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces the element of range index in the list of points.

Parameters
----------
Index: int
Pnt: IntPatch_Point

Returns
-------
None
") Replace;
		void Replace(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndFirst: int

Returns
-------
None
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer IndFirst);

		/****************** SetLastPoint ******************/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndLast: int

Returns
-------
None
") SetLastPoint;
		void SetLastPoint(const Standard_Integer IndLast);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the point of parameter u on the analytic intersection line.

Parameters
----------
U: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Vertex;
		const IntPatch_Point & Vertex(const Standard_Integer Index);

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
		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a line as intersection line when the transitions are in or out.

Parameters
----------
L: gp_Lin
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Lin & L, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a line as intersection line when the transitions are touch.

Parameters
----------
L: gp_Lin
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Lin & L, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a line as intersection line when the transitions are undecided.

Parameters
----------
L: gp_Lin
Tang: bool

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Lin & L, const Standard_Boolean Tang);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a circle as intersection line when the transitions are in or out.

Parameters
----------
C: gp_Circ
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Circ & C, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a circle as intersection line when the transitions are touch.

Parameters
----------
C: gp_Circ
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Circ & C, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a circle as intersection line when the transitions are undecided.

Parameters
----------
C: gp_Circ
Tang: bool

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Circ & C, const Standard_Boolean Tang);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates an ellipse as intersection line when the transitions are in or out.

Parameters
----------
E: gp_Elips
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Elips & E, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates an ellispe as intersection line when the transitions are touch.

Parameters
----------
E: gp_Elips
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Elips & E, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates an ellipse as intersection line when the transitions are undecided.

Parameters
----------
E: gp_Elips
Tang: bool

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Elips & E, const Standard_Boolean Tang);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a parabola as intersection line when the transitions are in or out.

Parameters
----------
P: gp_Parab
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Parab & P, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a parabola as intersection line when the transitions are touch.

Parameters
----------
P: gp_Parab
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Parab & P, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates a parabola as intersection line when the transitions are undecided.

Parameters
----------
P: gp_Parab
Tang: bool

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Parab & P, const Standard_Boolean Tang);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates an hyperbola as intersection line when the transitions are in or out.

Parameters
----------
H: gp_Hypr
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Hypr & H, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates an hyperbola as intersection line when the transitions are touch.

Parameters
----------
H: gp_Hypr
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Hypr & H, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_GLine ******************/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "Creates an hyperbola as intersection line when the transitions are undecided.

Parameters
----------
H: gp_Hypr
Tang: bool

Returns
-------
None
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Hypr & H, const Standard_Boolean Tang);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "To add a vertex in the list.

Parameters
----------
Pnt: IntPatch_Point

Returns
-------
None
") AddVertex;
		void AddVertex(const IntPatch_Point & Pnt);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Returns the circ from gp corrsponding to the intersection when arctype returns intpatch_circle.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** ComputeVertexParameters ******************/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.

Parameters
----------
Tol: float

Returns
-------
None
") ComputeVertexParameters;
		void ComputeVertexParameters(const Standard_Real Tol);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Returns the elips from gp corrsponding to the intersection when arctype returns intpatch_ellipse.

Returns
-------
gp_Elips
") Ellipse;
		gp_Elips Ellipse();

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the intpoint corresponding to the firstpoint. an exception is raised when hasfirstpoint returns false.

Returns
-------
IntPatch_Point
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the line has a known first point. this point is given by the method firstpoint().

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if the line has a known last point. this point is given by the method lastpoint().

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Returns the hypr from gp corrsponding to the intersection when arctype returns intpatch_hyperbola.

Returns
-------
gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the intpoint corresponding to the lastpoint. an exception is raised when haslastpoint returns false.

Returns
-------
IntPatch_Point
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the lin from gp corresponding to the intersection when arctype returns intpatch_line.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** NbVertex ******************/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVertex;
		Standard_Integer NbVertex();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Returns the parab from gp corrsponding to the intersection when arctype returns intpatch_parabola.

Returns
-------
gp_Parab
") Parabola;
		gp_Parab Parabola();

		/****************** Replace ******************/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "To replace the element of range index in the list of points.

Parameters
----------
Index: int
Pnt: IntPatch_Point

Returns
-------
None
") Replace;
		void Replace(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndFirst: int

Returns
-------
None
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer IndFirst);

		/****************** SetLastPoint ******************/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndLast: int

Returns
-------
None
") SetLastPoint;
		void SetLastPoint(const Standard_Integer IndLast);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Vertex;
		const IntPatch_Point & Vertex(const Standard_Integer Index);

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
		%feature("autodoc", "Adds a vertex in the list. if theisprepend == true the new vertex will be added before the first element of vertices sequence. otherwise, to the end of the sequence.

Parameters
----------
Pnt: IntPatch_Point
theIsPrepend: bool,optional
	default value is Standard_False

Returns
-------
None
") AddVertex;
		virtual void AddVertex(const IntPatch_Point & Pnt, const Standard_Boolean theIsPrepend = Standard_False);

		/****************** ChangeVertex ******************/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") ChangeVertex;
		virtual IntPatch_Point & ChangeVertex(const Standard_Integer Index);

		/****************** ClearVertexes ******************/
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "Removes vertices from the line.

Returns
-------
None
") ClearVertexes;
		virtual void ClearVertexes();

		/****************** CurvatureRadiusOfIntersLine ******************/
		%feature("compactdefaultargs") CurvatureRadiusOfIntersLine;
		%feature("autodoc", "Returns the radius of curvature of the intersection line in given point. returns negative value if computation is not possible.

Parameters
----------
theS1: Adaptor3d_HSurface
theS2: Adaptor3d_HSurface
theUVPoint: IntSurf_PntOn2S

Returns
-------
float
") CurvatureRadiusOfIntersLine;
		static Standard_Real CurvatureRadiusOfIntersLine(const opencascade::handle<Adaptor3d_HSurface> & theS1, const opencascade::handle<Adaptor3d_HSurface> & theS2, const IntSurf_PntOn2S & theUVPoint);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns set of intersection points.

Returns
-------
opencascade::handle<IntSurf_LineOn2S>
") Curve;
		virtual opencascade::handle<IntSurf_LineOn2S> Curve();

		/****************** IsOutBox ******************/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "Returns true if p is out of the box built from 3d-points.

Parameters
----------
P: gp_Pnt

Returns
-------
bool
") IsOutBox;
		virtual Standard_Boolean IsOutBox(const gp_Pnt & P);

		/****************** IsOutSurf1Box ******************/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "Returns true if p1 is out of the box built from the points on 1st surface.

Parameters
----------
P1: gp_Pnt2d

Returns
-------
bool
") IsOutSurf1Box;
		virtual Standard_Boolean IsOutSurf1Box(const gp_Pnt2d & P1);

		/****************** IsOutSurf2Box ******************/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "Returns true if p2 is out of the box built from the points on 2nd surface.

Parameters
----------
P2: gp_Pnt2d

Returns
-------
bool
") IsOutSurf2Box;
		virtual Standard_Boolean IsOutSurf2Box(const gp_Pnt2d & P2);

		/****************** NbPnts ******************/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Returns the number of intersection points.

Returns
-------
int
") NbPnts;
		virtual Standard_Integer NbPnts();

		/****************** NbVertex ******************/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Returns number of vertices (intpatch_point) of the line.

Returns
-------
int
") NbVertex;
		virtual Standard_Integer NbVertex();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point of range index.

Parameters
----------
Index: int

Returns
-------
IntSurf_PntOn2S
") Point;
		virtual const IntSurf_PntOn2S & Point(const Standard_Integer Index);

		/****************** RemoveVertex ******************/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "Removes single vertex from the line.

Parameters
----------
theIndex: int

Returns
-------
None
") RemoveVertex;
		virtual void RemoveVertex(const Standard_Integer theIndex);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Vertex;
		virtual const IntPatch_Point & Vertex(const Standard_Integer Index);

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
		/****************** IntPatch_PolyArc ******************/
		%feature("compactdefaultargs") IntPatch_PolyArc;
		%feature("autodoc", "Creates the polygon of the arc a on the surface s. the arc is limited by the parameters pfirst and plast. none of these parameters can be infinite.

Parameters
----------
A: Adaptor2d_HCurve2d
NbSample: int
Pfirst: float
Plast: float
BoxOtherPolygon: Bnd_Box2d

Returns
-------
None
") IntPatch_PolyArc;
		 IntPatch_PolyArc(const opencascade::handle<Adaptor2d_HCurve2d> & A, const Standard_Integer NbSample, const Standard_Real Pfirst, const Standard_Real Plast, const Bnd_Box2d & BoxOtherPolygon);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Closed;
		virtual Standard_Boolean Closed();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const Standard_Integer Index);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
gp_Pnt2d
") Point;
		gp_Pnt2d Point(const Standard_Integer Index);

		/****************** SetOffset ******************/
		%feature("compactdefaultargs") SetOffset;
		%feature("autodoc", "No available documentation.

Parameters
----------
OffsetX: float
OffsetY: float

Returns
-------
None
") SetOffset;
		void SetOffset(const Standard_Real OffsetX, const Standard_Real OffsetY);

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntPatch_PolyLine;
		 IntPatch_PolyLine();

		/****************** IntPatch_PolyLine ******************/
		%feature("compactdefaultargs") IntPatch_PolyLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
InitDefle: float

Returns
-------
None
") IntPatch_PolyLine;
		 IntPatch_PolyLine(const Standard_Real InitDefle);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
gp_Pnt2d
") Point;
		gp_Pnt2d Point(const Standard_Integer Index);

		/****************** ResetError ******************/
		%feature("compactdefaultargs") ResetError;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ResetError;
		void ResetError();

		/****************** SetRLine ******************/
		%feature("compactdefaultargs") SetRLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
OnFirst: bool
Line: IntPatch_RLine

Returns
-------
None
") SetRLine;
		void SetRLine(const Standard_Boolean OnFirst, const opencascade::handle<IntPatch_RLine> & Line);

		/****************** SetWLine ******************/
		%feature("compactdefaultargs") SetWLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
OnFirst: bool
Line: IntPatch_WLine

Returns
-------
None
") SetWLine;
		void SetWLine(const Standard_Boolean OnFirst, const opencascade::handle<IntPatch_WLine> & Line);

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
		/****************** IntPatch_RLine ******************/
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "Creates a restriction as an intersection line when the transitions are in or out.

Parameters
----------
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_RLine;
		 IntPatch_RLine(const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_RLine ******************/
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "Creates a restriction as an intersection line when the transitions are touch.

Parameters
----------
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_RLine;
		 IntPatch_RLine(const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_RLine ******************/
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "Creates a restriction as an intersection line when the transitions are undecided.

Parameters
----------
Tang: bool

Returns
-------
None
") IntPatch_RLine;
		 IntPatch_RLine(const Standard_Boolean Tang);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: IntSurf_LineOn2S

Returns
-------
None
") Add;
		void Add(const opencascade::handle<IntSurf_LineOn2S> & L);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertex in the list. if theisprepend == true the new vertex will be added before the first element of vertices sequence. otherwise, to the end of the sequence.

Parameters
----------
Pnt: IntPatch_Point
theIsPrepend: bool,optional
	default value is Standard_False

Returns
-------
None
") AddVertex;
		virtual void AddVertex(const IntPatch_Point & Pnt, const Standard_Boolean theIsPrepend = Standard_False);

		/****************** ArcOnS1 ******************/
		%feature("compactdefaultargs") ArcOnS1;
		%feature("autodoc", "Returns the concerned arc.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") ArcOnS1;
		const opencascade::handle<Adaptor2d_HCurve2d> & ArcOnS1();

		/****************** ArcOnS2 ******************/
		%feature("compactdefaultargs") ArcOnS2;
		%feature("autodoc", "Returns the concerned arc.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") ArcOnS2;
		const opencascade::handle<Adaptor2d_HCurve2d> & ArcOnS2();

		/****************** ChangeVertex ******************/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") ChangeVertex;
		virtual IntPatch_Point & ChangeVertex(const Standard_Integer Index);

		/****************** ClearVertexes ******************/
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "Removes vertices from the line (i.e. cleans svtx member).

Returns
-------
None
") ClearVertexes;
		virtual void ClearVertexes();

		/****************** ComputeVertexParameters ******************/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.

Parameters
----------
Tol: float

Returns
-------
None
") ComputeVertexParameters;
		void ComputeVertexParameters(const Standard_Real Tol);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns set of intersection points.

Returns
-------
opencascade::handle<IntSurf_LineOn2S>
") Curve;
		virtual opencascade::handle<IntSurf_LineOn2S> Curve();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "If (themode == 0) then prints the information about wline if (themode == 1) then prints the list of 3d-points if (themode == 2) then prints the list of 2d-points on the 1st surface otherwise, prints list of 2d-points on the 2nd surface.

Parameters
----------
theMode: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer theMode);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the intpoint corresponding to the firstpoint. an exception is raised when hasfirstpoint returns false.

Returns
-------
IntPatch_Point
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the line has a known first point. this point is given by the method firstpoint().

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if the line has a known last point. this point is given by the method lastpoint().

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** HasPolygon ******************/
		%feature("compactdefaultargs") HasPolygon;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasPolygon;
		Standard_Boolean HasPolygon();

		/****************** IsArcOnS1 ******************/
		%feature("compactdefaultargs") IsArcOnS1;
		%feature("autodoc", "Returns true if the intersection is on the domain of the first patch. returns false if the intersection is on the domain of the second patch.

Returns
-------
bool
") IsArcOnS1;
		Standard_Boolean IsArcOnS1();

		/****************** IsArcOnS2 ******************/
		%feature("compactdefaultargs") IsArcOnS2;
		%feature("autodoc", "Returns true if the intersection is on the domain of the first patch. returns false if the intersection is on the domain of the second patch.

Returns
-------
bool
") IsArcOnS2;
		Standard_Boolean IsArcOnS2();

		/****************** IsOutBox ******************/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "Returns true if thep is out of the box built from 3d-points.

Parameters
----------
theP: gp_Pnt

Returns
-------
bool
") IsOutBox;
		virtual Standard_Boolean IsOutBox(const gp_Pnt & theP);

		/****************** IsOutSurf1Box ******************/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "Returns true if thep is out of the box built from the points on 1st surface.

Parameters
----------
theP: gp_Pnt2d

Returns
-------
bool
") IsOutSurf1Box;
		virtual Standard_Boolean IsOutSurf1Box(const gp_Pnt2d & theP);

		/****************** IsOutSurf2Box ******************/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "Returns true if thep is out of the box built from the points on 2nd surface.

Parameters
----------
theP: gp_Pnt2d

Returns
-------
bool
") IsOutSurf2Box;
		virtual Standard_Boolean IsOutSurf2Box(const gp_Pnt2d & theP);

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the intpoint corresponding to the lastpoint. an exception is raised when haslastpoint returns false.

Returns
-------
IntPatch_Point
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****************** NbPnts ******************/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Returns the number of intersection points.

Returns
-------
int
") NbPnts;
		virtual Standard_Integer NbPnts();

		/****************** NbVertex ******************/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Returns number of vertices (intpatch_point) of the line.

Returns
-------
int
") NbVertex;
		virtual Standard_Integer NbVertex();

		/****************** ParamOnS1 ******************/
		%feature("compactdefaultargs") ParamOnS1;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
p1: float
p2: float
") ParamOnS1;
		void ParamOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ParamOnS2 ******************/
		%feature("compactdefaultargs") ParamOnS2;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
p1: float
p2: float
") ParamOnS2;
		void ParamOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point of range index.

Parameters
----------
Index: int

Returns
-------
IntSurf_PntOn2S
") Point;
		virtual const IntSurf_PntOn2S & Point(const Standard_Integer Index);

		/****************** RemoveVertex ******************/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "Removes single vertex from the line.

Parameters
----------
theIndex: int

Returns
-------
None
") RemoveVertex;
		virtual void RemoveVertex(const Standard_Integer theIndex);

		/****************** Replace ******************/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces the element of range index in the list of points.

Parameters
----------
Index: int
Pnt: IntPatch_Point

Returns
-------
None
") Replace;
		void Replace(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****************** SetArcOnS1 ******************/
		%feature("compactdefaultargs") SetArcOnS1;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") SetArcOnS1;
		void SetArcOnS1(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** SetArcOnS2 ******************/
		%feature("compactdefaultargs") SetArcOnS2;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") SetArcOnS2;
		void SetArcOnS2(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** SetCurve ******************/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
theNewCurve: IntSurf_LineOn2S

Returns
-------
None
") SetCurve;
		void SetCurve(const opencascade::handle<IntSurf_LineOn2S> & theNewCurve);

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndFirst: int

Returns
-------
None
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer IndFirst);

		/****************** SetLastPoint ******************/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndLast: int

Returns
-------
None
") SetLastPoint;
		void SetLastPoint(const Standard_Integer IndLast);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Set the point of index <index> in the lineon2s.

Parameters
----------
Index: int
Pnt: IntPatch_Point

Returns
-------
None
") SetPoint;
		void SetPoint(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Vertex;
		virtual const IntPatch_Point & Vertex(const Standard_Integer Index);

};


%make_alias(IntPatch_RLine)

%extend IntPatch_RLine {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def SetParamOnS1(self):
		pass

	@methodnotwrapped
	def SetParamOnS2(self):
		pass
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

/* python proy classes for enums */
%pythoncode {

class IntPatch_WLType(IntEnum):
	IntPatch_WLUnknown = 0
	IntPatch_WLImpImp = 1
	IntPatch_WLImpPrm = 2
	IntPatch_WLPrmPrm = 3
IntPatch_WLUnknown = IntPatch_WLType.IntPatch_WLUnknown
IntPatch_WLImpImp = IntPatch_WLType.IntPatch_WLImpImp
IntPatch_WLImpPrm = IntPatch_WLType.IntPatch_WLImpPrm
IntPatch_WLPrmPrm = IntPatch_WLType.IntPatch_WLPrmPrm
};
/* end python proxy for enums */

		/****************** IntPatch_WLine ******************/
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "Creates a wline as an intersection when the transitions are in or out.

Parameters
----------
Line: IntSurf_LineOn2S
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Returns
-------
None
") IntPatch_WLine;
		 IntPatch_WLine(const opencascade::handle<IntSurf_LineOn2S> & Line, const Standard_Boolean Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****************** IntPatch_WLine ******************/
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "Creates a wline as an intersection when the transitions are touch.

Parameters
----------
Line: IntSurf_LineOn2S
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Returns
-------
None
") IntPatch_WLine;
		 IntPatch_WLine(const opencascade::handle<IntSurf_LineOn2S> & Line, const Standard_Boolean Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****************** IntPatch_WLine ******************/
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "Creates a wline as an intersection when the transitions are undecided.

Parameters
----------
Line: IntSurf_LineOn2S
Tang: bool

Returns
-------
None
") IntPatch_WLine;
		 IntPatch_WLine(const opencascade::handle<IntSurf_LineOn2S> & Line, const Standard_Boolean Tang);

		/****************** AddVertex ******************/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "Adds a vertex in the list. if theisprepend == true the new vertex will be added before the first element of vertices sequence. otherwise, to the end of the sequence.

Parameters
----------
Pnt: IntPatch_Point
theIsPrepend: bool,optional
	default value is Standard_False

Returns
-------
None
") AddVertex;
		virtual void AddVertex(const IntPatch_Point & Pnt, const Standard_Boolean theIsPrepend = Standard_False);

		/****************** ChangeVertex ******************/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") ChangeVertex;
		virtual IntPatch_Point & ChangeVertex(const Standard_Integer Index);

		/****************** ClearVertexes ******************/
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "Removes vertices from the line (i.e. cleans svtx member).

Returns
-------
None
") ClearVertexes;
		virtual void ClearVertexes();

		/****************** ComputeVertexParameters ******************/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.

Parameters
----------
Tol: float

Returns
-------
None
") ComputeVertexParameters;
		void ComputeVertexParameters(const Standard_Real Tol);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns set of intersection points.

Returns
-------
opencascade::handle<IntSurf_LineOn2S>
") Curve;
		virtual opencascade::handle<IntSurf_LineOn2S> Curve();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "If (themode == 0) then prints the information about wline if (themode == 1) then prints the list of 3d-points if (themode == 2) then prints the list of 2d-points on the 1st surface otherwise, prints list of 2d-points on the 2nd surface.

Parameters
----------
theMode: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer theMode);

		/****************** EnablePurging ******************/
		%feature("compactdefaultargs") EnablePurging;
		%feature("autodoc", "Allows or forbids purging of existing wline.

Parameters
----------
theIsEnabled: bool

Returns
-------
None
") EnablePurging;
		void EnablePurging(const Standard_Boolean theIsEnabled);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the point corresponding to the firstpoint.

Returns
-------
IntPatch_Point
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the point corresponding to the firstpoint. indfirst is the index of the first in the list of vertices.

Parameters
----------

Returns
-------
Indfirst: int
") FirstPoint;
		const IntPatch_Point & FirstPoint(Standard_Integer &OutValue);

		/****************** GetArcOnS1 ******************/
		%feature("compactdefaultargs") GetArcOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") GetArcOnS1;
		const opencascade::handle<Adaptor2d_HCurve2d> & GetArcOnS1();

		/****************** GetArcOnS2 ******************/
		%feature("compactdefaultargs") GetArcOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_HCurve2d>
") GetArcOnS2;
		const opencascade::handle<Adaptor2d_HCurve2d> & GetArcOnS2();

		/****************** GetCreatingWay ******************/
		%feature("compactdefaultargs") GetCreatingWay;
		%feature("autodoc", "Returns the way of <*this> creation.

Returns
-------
IntPatch_WLine::IntPatch_WLType
") GetCreatingWay;
		IntPatch_WLine::IntPatch_WLType GetCreatingWay();

		/****************** HasArcOnS1 ******************/
		%feature("compactdefaultargs") HasArcOnS1;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasArcOnS1;
		Standard_Boolean HasArcOnS1();

		/****************** HasArcOnS2 ******************/
		%feature("compactdefaultargs") HasArcOnS2;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasArcOnS2;
		Standard_Boolean HasArcOnS2();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the line has a known first point. this point is given by the method firstpoint().

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if the line has a known last point. this point is given by the method lastpoint().

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** InsertVertexBefore ******************/
		%feature("compactdefaultargs") InsertVertexBefore;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex: int
thePnt: IntPatch_Point

Returns
-------
None
") InsertVertexBefore;
		void InsertVertexBefore(const Standard_Integer theIndex, const IntPatch_Point & thePnt);

		/****************** IsOutBox ******************/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "Returns true if thep is out of the box built from 3d-points.

Parameters
----------
theP: gp_Pnt

Returns
-------
bool
") IsOutBox;
		Standard_Boolean IsOutBox(const gp_Pnt & theP);

		/****************** IsOutSurf1Box ******************/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "Returns true if thep is out of the box built from the points on 1st surface.

Parameters
----------
theP: gp_Pnt2d

Returns
-------
bool
") IsOutSurf1Box;
		Standard_Boolean IsOutSurf1Box(const gp_Pnt2d & theP);

		/****************** IsOutSurf2Box ******************/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "Returns true if thep is out of the box built from the points on 2nd surface.

Parameters
----------
theP: gp_Pnt2d

Returns
-------
bool
") IsOutSurf2Box;
		Standard_Boolean IsOutSurf2Box(const gp_Pnt2d & theP);

		/****************** IsPurgingAllowed ******************/
		%feature("compactdefaultargs") IsPurgingAllowed;
		%feature("autodoc", "Returns true if purging is allowed or forbidden for existing wline.

Returns
-------
bool
") IsPurgingAllowed;
		Standard_Boolean IsPurgingAllowed();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the point corresponding to the lastpoint.

Returns
-------
IntPatch_Point
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the point corresponding to the lastpoint. indlast is the index of the last in the list of vertices.

Parameters
----------

Returns
-------
Indlast: int
") LastPoint;
		const IntPatch_Point & LastPoint(Standard_Integer &OutValue);

		/****************** NbPnts ******************/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Returns the number of intersection points.

Returns
-------
int
") NbPnts;
		virtual Standard_Integer NbPnts();

		/****************** NbVertex ******************/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Returns number of vertices (intpatch_point) of the line.

Returns
-------
int
") NbVertex;
		virtual Standard_Integer NbVertex();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersection point of range index.

Parameters
----------
Index: int

Returns
-------
IntSurf_PntOn2S
") Point;
		virtual const IntSurf_PntOn2S & Point(const Standard_Integer Index);

		/****************** RemoveVertex ******************/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "Removes single vertex from the line.

Parameters
----------
theIndex: int

Returns
-------
None
") RemoveVertex;
		virtual void RemoveVertex(const Standard_Integer theIndex);

		/****************** Replace ******************/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "Replaces the element of range index in the list of points. the exception outofrange is raised when index <= 0 or index > nbvertex.

Parameters
----------
Index: int
Pnt: IntPatch_Point

Returns
-------
None
") Replace;
		void Replace(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****************** SetArcOnS1 ******************/
		%feature("compactdefaultargs") SetArcOnS1;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") SetArcOnS1;
		void SetArcOnS1(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** SetArcOnS2 ******************/
		%feature("compactdefaultargs") SetArcOnS2;
		%feature("autodoc", "No available documentation.

Parameters
----------
A: Adaptor2d_HCurve2d

Returns
-------
None
") SetArcOnS2;
		void SetArcOnS2(const opencascade::handle<Adaptor2d_HCurve2d> & A);

		/****************** SetCreatingWayInfo ******************/
		%feature("compactdefaultargs") SetCreatingWayInfo;
		%feature("autodoc", "Sets the info about the way of <*this> creation.

Parameters
----------
theAlgo: IntPatch_WLType

Returns
-------
None
") SetCreatingWayInfo;
		void SetCreatingWayInfo(IntPatch_WLType theAlgo);

		/****************** SetFirstPoint ******************/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndFirst: int

Returns
-------
None
") SetFirstPoint;
		void SetFirstPoint(const Standard_Integer IndFirst);

		/****************** SetLastPoint ******************/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndLast: int

Returns
-------
None
") SetLastPoint;
		void SetLastPoint(const Standard_Integer IndLast);

		/****************** SetPeriod ******************/
		%feature("compactdefaultargs") SetPeriod;
		%feature("autodoc", "No available documentation.

Parameters
----------
pu1: float
pv1: float
pu2: float
pv2: float

Returns
-------
None
") SetPeriod;
		void SetPeriod(const Standard_Real pu1, const Standard_Real pv1, const Standard_Real pu2, const Standard_Real pv2);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "Set the point of index <index> in the lineon2s.

Parameters
----------
Index: int
Pnt: IntPatch_Point

Returns
-------
None
") SetPoint;
		void SetPoint(const Standard_Integer Index, const IntPatch_Point & Pnt);

		/****************** U1Period ******************/
		%feature("compactdefaultargs") U1Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") U1Period;
		Standard_Real U1Period();

		/****************** U2Period ******************/
		%feature("compactdefaultargs") U2Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") U2Period;
		Standard_Real U2Period();

		/****************** V1Period ******************/
		%feature("compactdefaultargs") V1Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") V1Period;
		Standard_Real V1Period();

		/****************** V2Period ******************/
		%feature("compactdefaultargs") V2Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") V2Period;
		Standard_Real V2Period();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Returns the vertex of range index on the line.

Parameters
----------
Index: int

Returns
-------
IntPatch_Point
") Vertex;
		virtual const IntPatch_Point & Vertex(const Standard_Integer Index);

};


%make_alias(IntPatch_WLine)

%extend IntPatch_WLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class IntPatch_Polyhedron:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
