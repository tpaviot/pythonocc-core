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
%define INTCURVESURFACEDOCSTRING
"IntCurveSurface module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_intcurvesurface.html"
%enddef
%module (package="OCC.Core", docstring=INTCURVESURFACEDOCSTRING) IntCurveSurface


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
#include<IntCurveSurface_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<math_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<Intf_module.hxx>
#include<Bnd_module.hxx>
#include<IntSurf_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import math.i
%import Adaptor3d.i
%import Geom.i
%import GeomAbs.i
%import TColStd.i
%import Intf.i
%import Bnd.i
%import IntSurf.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum IntCurveSurface_TransitionOnCurve {
	IntCurveSurface_Tangent = 0,
	IntCurveSurface_In = 1,
	IntCurveSurface_Out = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class IntCurveSurface_TransitionOnCurve(IntEnum):
	IntCurveSurface_Tangent = 0
	IntCurveSurface_In = 1
	IntCurveSurface_Out = 2
IntCurveSurface_Tangent = IntCurveSurface_TransitionOnCurve.IntCurveSurface_Tangent
IntCurveSurface_In = IntCurveSurface_TransitionOnCurve.IntCurveSurface_In
IntCurveSurface_Out = IntCurveSurface_TransitionOnCurve.IntCurveSurface_Out
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(IntCurveSurface_SequenceOfPnt) NCollection_Sequence<IntCurveSurface_IntersectionPoint>;
%template(IntCurveSurface_SequenceOfSeg) NCollection_Sequence<IntCurveSurface_IntersectionSegment>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<IntCurveSurface_IntersectionPoint> IntCurveSurface_SequenceOfPnt;
typedef NCollection_Sequence<IntCurveSurface_IntersectionSegment> IntCurveSurface_SequenceOfSeg;
/* end typedefs declaration */

/*************************************
* class IntCurveSurface_Intersection *
*************************************/
%nodefaultctor IntCurveSurface_Intersection;
%ignore IntCurveSurface_Intersection::~IntCurveSurface_Intersection();
class IntCurveSurface_Intersection {
	public:
		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump all the fields.

Returns
-------
None
") Dump;
		void Dump();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns the <done> field.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if curve is parallel or belongs surface this case is recognized only for some pairs of analytical curves and surfaces (plane - line, ...).

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of intersectionpoint if isdone returns true. else notdone is raised.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of intersectionsegment if isdone returns true. else notdone is raised.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the intersectionpoint of range <index> raises notdone if the computation has failed or if the computation has not been done raises outofrange if index is not in the range <1..nbpoints>.

Parameters
----------
Index: int

Returns
-------
IntCurveSurface_IntersectionPoint
") Point;
		const IntCurveSurface_IntersectionPoint & Point(const Standard_Integer Index);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Returns the intersectionsegment of range <index> raises notdone if the computation has failed or if the computation has not been done raises outofrange if index is not in the range <1..nbsegment>.

Parameters
----------
Index: int

Returns
-------
IntCurveSurface_IntersectionSegment
") Segment;
		const IntCurveSurface_IntersectionSegment & Segment(const Standard_Integer Index);

};


%extend IntCurveSurface_Intersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class IntCurveSurface_IntersectionPoint *
******************************************/
class IntCurveSurface_IntersectionPoint {
	public:
		/****************** IntCurveSurface_IntersectionPoint ******************/
		%feature("compactdefaultargs") IntCurveSurface_IntersectionPoint;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint();

		/****************** IntCurveSurface_IntersectionPoint ******************/
		%feature("compactdefaultargs") IntCurveSurface_IntersectionPoint;
		%feature("autodoc", "Create an intersectionpoint.

Parameters
----------
P: gp_Pnt
USurf: float
VSurf: float
UCurv: float
TrCurv: IntCurveSurface_TransitionOnCurve

Returns
-------
None
") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint(const gp_Pnt & P, const Standard_Real USurf, const Standard_Real VSurf, const Standard_Real UCurv, const IntCurveSurface_TransitionOnCurve TrCurv);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump all the fields.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Returns the geometric point.

Returns
-------
gp_Pnt
") Pnt;
		const gp_Pnt Pnt();

		/****************** SetValues ******************/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Set the fields of the current intersectionpoint.

Parameters
----------
P: gp_Pnt
USurf: float
VSurf: float
UCurv: float
TrCurv: IntCurveSurface_TransitionOnCurve

Returns
-------
None
") SetValues;
		void SetValues(const gp_Pnt & P, const Standard_Real USurf, const Standard_Real VSurf, const Standard_Real UCurv, const IntCurveSurface_TransitionOnCurve TrCurv);

		/****************** Transition ******************/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Returns the transition of the point.

Returns
-------
IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition();

		/****************** U ******************/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Returns the u parameter on the surface.

Returns
-------
float
") U;
		Standard_Real U();

		/****************** V ******************/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "Returns the v parameter on the surface.

Returns
-------
float
") V;
		Standard_Real V();

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Get the fields of the current intersectionpoint.

Parameters
----------
P: gp_Pnt
TrCurv: IntCurveSurface_TransitionOnCurve

Returns
-------
USurf: float
VSurf: float
UCurv: float
") Values;
		void Values(gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, IntCurveSurface_TransitionOnCurve & TrCurv);

		/****************** W ******************/
		%feature("compactdefaultargs") W;
		%feature("autodoc", "Returns the parameter on the curve.

Returns
-------
float
") W;
		Standard_Real W();

};


%extend IntCurveSurface_IntersectionPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class IntCurveSurface_IntersectionSegment *
********************************************/
class IntCurveSurface_IntersectionSegment {
	public:
		/****************** IntCurveSurface_IntersectionSegment ******************/
		%feature("compactdefaultargs") IntCurveSurface_IntersectionSegment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntCurveSurface_IntersectionSegment;
		 IntCurveSurface_IntersectionSegment();

		/****************** IntCurveSurface_IntersectionSegment ******************/
		%feature("compactdefaultargs") IntCurveSurface_IntersectionSegment;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: IntCurveSurface_IntersectionPoint
P2: IntCurveSurface_IntersectionPoint

Returns
-------
None
") IntCurveSurface_IntersectionSegment;
		 IntCurveSurface_IntersectionSegment(const IntCurveSurface_IntersectionPoint & P1, const IntCurveSurface_IntersectionPoint & P2);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: IntCurveSurface_IntersectionPoint

Returns
-------
None
") FirstPoint;
		void FirstPoint(IntCurveSurface_IntersectionPoint & P1);

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
IntCurveSurface_IntersectionPoint
") FirstPoint;
		const IntCurveSurface_IntersectionPoint & FirstPoint();

		/****************** SecondPoint ******************/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
P2: IntCurveSurface_IntersectionPoint

Returns
-------
None
") SecondPoint;
		void SecondPoint(IntCurveSurface_IntersectionPoint & P2);

		/****************** SecondPoint ******************/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
IntCurveSurface_IntersectionPoint
") SecondPoint;
		const IntCurveSurface_IntersectionPoint & SecondPoint();

		/****************** SetValues ******************/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: IntCurveSurface_IntersectionPoint
P2: IntCurveSurface_IntersectionPoint

Returns
-------
None
") SetValues;
		void SetValues(const IntCurveSurface_IntersectionPoint & P1, const IntCurveSurface_IntersectionPoint & P2);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: IntCurveSurface_IntersectionPoint
P2: IntCurveSurface_IntersectionPoint

Returns
-------
None
") Values;
		void Values(IntCurveSurface_IntersectionPoint & P1, IntCurveSurface_IntersectionPoint & P2);

};


%extend IntCurveSurface_IntersectionSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class IntCurveSurface_TheCSFunctionOfHInter *
**********************************************/
class IntCurveSurface_TheCSFunctionOfHInter : public math_FunctionSetWithDerivatives {
	public:
		/****************** IntCurveSurface_TheCSFunctionOfHInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_TheCSFunctionOfHInter;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") IntCurveSurface_TheCSFunctionOfHInter;
		 IntCurveSurface_TheCSFunctionOfHInter(const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** AuxillarCurve ******************/
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") AuxillarCurve;
		const opencascade::handle<Adaptor3d_HCurve> & AuxillarCurve();

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


%extend IntCurveSurface_TheCSFunctionOfHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class IntCurveSurface_TheExactHInter *
***************************************/
class IntCurveSurface_TheExactHInter {
	public:
		/****************** IntCurveSurface_TheExactHInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_TheExactHInter;
		%feature("autodoc", "Compute the solution point with the close point margincoef is the coefficient for extension of uv bounds. ex., ufirst -= margincoef*(ulast-ufirst).

Parameters
----------
U: float
V: float
W: float
F: IntCurveSurface_TheCSFunctionOfHInter
TolTangency: float
MarginCoef: float,optional
	default value is 0.0

Returns
-------
None
") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter(const Standard_Real U, const Standard_Real V, const Standard_Real W, const IntCurveSurface_TheCSFunctionOfHInter & F, const Standard_Real TolTangency, const Standard_Real MarginCoef = 0.0);

		/****************** IntCurveSurface_TheExactHInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_TheExactHInter;
		%feature("autodoc", "Initialize the parameters to compute the solution.

Parameters
----------
F: IntCurveSurface_TheCSFunctionOfHInter
TolTangency: float

Returns
-------
None
") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter(const IntCurveSurface_TheCSFunctionOfHInter & F, const Standard_Real TolTangency);

		/****************** Function ******************/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return the math function which is used to compute the intersection.

Returns
-------
IntCurveSurface_TheCSFunctionOfHInter
") Function;
		IntCurveSurface_TheCSFunctionOfHInter & Function();

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


%extend IntCurveSurface_TheExactHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class IntCurveSurface_TheHCurveTool *
**************************************/
class IntCurveSurface_TheHCurveTool {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		static opencascade::handle<Geom_BSplineCurve> BSpline(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
opencascade::handle<Geom_BezierCurve>
") Bezier;
		static opencascade::handle<Geom_BezierCurve> Bezier(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
gp_Circ
") Circle;
		static gp_Circ Circle(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Adaptor3d_HCurve
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		static void D0(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
C: Adaptor3d_HCurve
U: float
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		static void D1(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
C: Adaptor3d_HCurve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		static void D2(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
C: Adaptor3d_HCurve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		static void D3(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
C: Adaptor3d_HCurve
U: float
N: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real U, const Standard_Integer N);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
gp_Elips
") Ellipse;
		static gp_Elips Ellipse(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
float
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
gp_Hypr
") Hyperbola;
		static gp_Hypr Hyperbola(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
C: Adaptor3d_HCurve
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor3d_HCurve> & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
float
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
gp_Lin
") Line;
		static gp_Lin Line(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(myclass) >= <s>.

Parameters
----------
C: Adaptor3d_HCurve
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		static Standard_Integer NbIntervals(const opencascade::handle<Adaptor3d_HCurve> & C, const GeomAbs_Shape S);

		/****************** NbSamples ******************/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve
U0: float
U1: float

Returns
-------
int
") NbSamples;
		static Standard_Integer NbSamples(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real U0, const Standard_Real U1);

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
gp_Parab
") Parabola;
		static gp_Parab Parabola(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve

Returns
-------
float
") Period;
		static Standard_Real Period(const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
C: Adaptor3d_HCurve
R3d: float

Returns
-------
float
") Resolution;
		static Standard_Real Resolution(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real R3d);

		/****************** SamplePars ******************/
		%feature("compactdefaultargs") SamplePars;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor3d_HCurve
U0: float
U1: float
Defl: float
NbMin: int
Pars: TColStd_HArray1OfReal

Returns
-------
None
") SamplePars;
		static void SamplePars(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real U0, const Standard_Real U1, const Standard_Real Defl, const Standard_Integer NbMin, opencascade::handle<TColStd_HArray1OfReal> & Pars);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
C: Adaptor3d_HCurve
U: float

Returns
-------
gp_Pnt
") Value;
		static gp_Pnt Value(const opencascade::handle<Adaptor3d_HCurve> & C, const Standard_Real U);

};


%extend IntCurveSurface_TheHCurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class IntCurveSurface_TheInterferenceOfHInter *
************************************************/
class IntCurveSurface_TheInterferenceOfHInter : public Intf_Interference {
	public:
		/****************** IntCurveSurface_TheInterferenceOfHInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "Constructs an empty interference between polygon and polyhedron.

Returns
-------
None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter();

		/****************** IntCurveSurface_TheInterferenceOfHInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "Constructs and computes an interference between the polygon and the polyhedron.

Parameters
----------
thePolyg: IntCurveSurface_ThePolygonOfHInter
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Returns
-------
None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** IntCurveSurface_TheInterferenceOfHInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "Constructs and computes an interference between the straight line and the polyhedron.

Parameters
----------
theLin: gp_Lin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Returns
-------
None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const gp_Lin & theLin, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** IntCurveSurface_TheInterferenceOfHInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "Constructs and computes an interference between the straight lines and the polyhedron.

Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Returns
-------
None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const Intf_Array1OfLin & theLins, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** IntCurveSurface_TheInterferenceOfHInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "Constructs and computes an interference between the polygon and the polyhedron.

Parameters
----------
thePolyg: IntCurveSurface_ThePolygonOfHInter
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Returns
-------
None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** IntCurveSurface_TheInterferenceOfHInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "Constructs and computes an interference between the straight line and the polyhedron.

Parameters
----------
theLin: gp_Lin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Returns
-------
None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const gp_Lin & theLin, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** IntCurveSurface_TheInterferenceOfHInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "Constructs and computes an interference between the straight lines and the polyhedron.

Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Returns
-------
None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const Intf_Array1OfLin & theLins, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** Interference ******************/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "Compares the boundings between the segment of <thepolyg> and the facets of <thepolyh>.

Parameters
----------
thePolyg: IntCurveSurface_ThePolygonOfHInter
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Returns
-------
None
") Interference;
		void Interference(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** Interference ******************/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "Compares the boundings between the segment of <thepolyg> and the facets of <thepolyh>.

Parameters
----------
thePolyg: IntCurveSurface_ThePolygonOfHInter
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Returns
-------
None
") Interference;
		void Interference(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes an interference between the polygon and the polyhedron.

Parameters
----------
thePolyg: IntCurveSurface_ThePolygonOfHInter
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Returns
-------
None
") Perform;
		void Perform(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes an interference between the straight line and the polyhedron.

Parameters
----------
theLin: gp_Lin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & theLin, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes an interference between the straight lines and the polyhedron.

Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Returns
-------
None
") Perform;
		void Perform(const Intf_Array1OfLin & theLins, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes an interference between the polygon and the polyhedron.

Parameters
----------
thePolyg: IntCurveSurface_ThePolygonOfHInter
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Returns
-------
None
") Perform;
		void Perform(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes an interference between the straight line and the polyhedron.

Parameters
----------
theLin: gp_Lin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Returns
-------
None
") Perform;
		void Perform(const gp_Lin & theLin, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes an interference between the straight lines and the polyhedron.

Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Returns
-------
None
") Perform;
		void Perform(const Intf_Array1OfLin & theLins, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

};


%extend IntCurveSurface_TheInterferenceOfHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class IntCurveSurface_ThePolygonOfHInter *
*******************************************/
class IntCurveSurface_ThePolygonOfHInter {
	public:
		/****************** IntCurveSurface_ThePolygonOfHInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_ThePolygonOfHInter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve: Adaptor3d_HCurve
NbPnt: int

Returns
-------
None
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter(const opencascade::handle<Adaptor3d_HCurve> & Curve, const Standard_Integer NbPnt);

		/****************** IntCurveSurface_ThePolygonOfHInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_ThePolygonOfHInter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve: Adaptor3d_HCurve
U1: float
U2: float
NbPnt: int

Returns
-------
None
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter(const opencascade::handle<Adaptor3d_HCurve> & Curve, const Standard_Real U1, const Standard_Real U2, const Standard_Integer NbPnt);

		/****************** IntCurveSurface_ThePolygonOfHInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_ThePolygonOfHInter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve: Adaptor3d_HCurve
Upars: TColStd_Array1OfReal

Returns
-------
None
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter(const opencascade::handle<Adaptor3d_HCurve> & Curve, const TColStd_Array1OfReal & Upars);

		/****************** ApproxParamOnCurve ******************/
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "Give an approximation of the parameter on the curve according to the discretization of the curve.

Parameters
----------
Index: int
ParamOnLine: float

Returns
-------
float
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve(const Standard_Integer Index, const Standard_Real ParamOnLine);

		/****************** BeginOfSeg ******************/
		%feature("compactdefaultargs") BeginOfSeg;
		%feature("autodoc", "Give the point of range index in the polygon.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") BeginOfSeg;
		const gp_Pnt BeginOfSeg(const Standard_Integer Index);

		/****************** Bounding ******************/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "Give the bounding box of the polygon.

Returns
-------
Bnd_Box
") Bounding;
		const Bnd_Box & Bounding();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Parameters
----------
clos: bool

Returns
-------
None
") Closed;
		void Closed(const Standard_Boolean clos);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Closed;
		Standard_Boolean Closed();

		/****************** DeflectionOverEstimation ******************/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** EndOfSeg ******************/
		%feature("compactdefaultargs") EndOfSeg;
		%feature("autodoc", "Give the point of range index in the polygon.

Parameters
----------
Index: int

Returns
-------
gp_Pnt
") EndOfSeg;
		const gp_Pnt EndOfSeg(const Standard_Integer Index);

		/****************** InfParameter ******************/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Returns the parameter (on the curve) of the first point of the polygon.

Returns
-------
float
") InfParameter;
		Standard_Real InfParameter();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Give the number of segments in the polyline.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** SetDeflectionOverEstimation ******************/
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "No available documentation.

Parameters
----------
x: float

Returns
-------
None
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation(const Standard_Real x);

		/****************** SupParameter ******************/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "Returns the parameter (on the curve) of the last point of the polygon.

Returns
-------
float
") SupParameter;
		Standard_Real SupParameter();

};


%extend IntCurveSurface_ThePolygonOfHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class IntCurveSurface_ThePolygonToolOfHInter *
***********************************************/
class IntCurveSurface_ThePolygonToolOfHInter {
	public:
		/****************** BeginOfSeg ******************/
		%feature("compactdefaultargs") BeginOfSeg;
		%feature("autodoc", "Give the point of range index in the polygon.

Parameters
----------
thePolygon: IntCurveSurface_ThePolygonOfHInter
Index: int

Returns
-------
gp_Pnt
") BeginOfSeg;
		static const gp_Pnt BeginOfSeg(const IntCurveSurface_ThePolygonOfHInter & thePolygon, const Standard_Integer Index);

		/****************** Bounding ******************/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "Give the bounding box of the polygon.

Parameters
----------
thePolygon: IntCurveSurface_ThePolygonOfHInter

Returns
-------
Bnd_Box
") Bounding;
		static const Bnd_Box & Bounding(const IntCurveSurface_ThePolygonOfHInter & thePolygon);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePolygon: IntCurveSurface_ThePolygonOfHInter

Returns
-------
bool
") Closed;
		static Standard_Boolean Closed(const IntCurveSurface_ThePolygonOfHInter & thePolygon);

		/****************** DeflectionOverEstimation ******************/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePolygon: IntCurveSurface_ThePolygonOfHInter

Returns
-------
float
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation(const IntCurveSurface_ThePolygonOfHInter & thePolygon);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePolygon: IntCurveSurface_ThePolygonOfHInter

Returns
-------
None
") Dump;
		static void Dump(const IntCurveSurface_ThePolygonOfHInter & thePolygon);

		/****************** EndOfSeg ******************/
		%feature("compactdefaultargs") EndOfSeg;
		%feature("autodoc", "Give the point of range index in the polygon.

Parameters
----------
thePolygon: IntCurveSurface_ThePolygonOfHInter
Index: int

Returns
-------
gp_Pnt
") EndOfSeg;
		static const gp_Pnt EndOfSeg(const IntCurveSurface_ThePolygonOfHInter & thePolygon, const Standard_Integer Index);

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePolygon: IntCurveSurface_ThePolygonOfHInter

Returns
-------
int
") NbSegments;
		static Standard_Integer NbSegments(const IntCurveSurface_ThePolygonOfHInter & thePolygon);

};


%extend IntCurveSurface_ThePolygonToolOfHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class IntCurveSurface_ThePolyhedronOfHInter *
**********************************************/
/**************************************************
* class IntCurveSurface_ThePolyhedronToolOfHInter *
**************************************************/
class IntCurveSurface_ThePolyhedronToolOfHInter {
	public:
		/****************** Bounding ******************/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "Give the bounding box of the polyhedrontool.

Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Returns
-------
Bnd_Box
") Bounding;
		static const Bnd_Box & Bounding(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** ComponentsBounding ******************/
		%feature("compactdefaultargs") ComponentsBounding;
		%feature("autodoc", "Give the array of boxes. the box <n> corresponding to the triangle <n>.

Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Returns
-------
opencascade::handle<Bnd_HArray1OfBox>
") ComponentsBounding;
		static const opencascade::handle<Bnd_HArray1OfBox> & ComponentsBounding(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** DeflectionOverEstimation ******************/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Give the tolerance of the polygon.

Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Returns
-------
float
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Returns
-------
None
") Dump;
		static void Dump(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** GetBorderDeflection ******************/
		%feature("compactdefaultargs") GetBorderDeflection;
		%feature("autodoc", "This method returns a border deflection of the polyhedron.

Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Returns
-------
float
") GetBorderDeflection;
		static Standard_Real GetBorderDeflection(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** IsOnBound ******************/
		%feature("compactdefaultargs") IsOnBound;
		%feature("autodoc", "This method returns true if the edge based on points with indices index1 and index2 represents a boundary edge. it is necessary to take into account the boundary deflection for this edge.

Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
Index1: int
Index2: int

Returns
-------
bool
") IsOnBound;
		static Standard_Boolean IsOnBound(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, const Standard_Integer Index1, const Standard_Integer Index2);

		/****************** NbTriangles ******************/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "Give the number of triangles in this polyedral surface.

Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Returns
-------
int
") NbTriangles;
		static Standard_Integer NbTriangles(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Give the point of index i in the polyedral surface.

Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
Index: int

Returns
-------
gp_Pnt
") Point;
		static const gp_Pnt Point(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, const Standard_Integer Index);

		/****************** TriConnex ******************/
		%feature("compactdefaultargs") TriConnex;
		%feature("autodoc", "Give the addresse tricon of the triangle connexe to the triangle of address triang by the edge pivot pedge and the third point of this connexe triangle. when we are on a free edge tricon==0 but the function return the value of the triangle in the other side of pivot on the free edge. used to turn around a vertex.

Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
Triang: int
Pivot: int
Pedge: int

Returns
-------
TriCon: int
OtherP: int
") TriConnex;
		static Standard_Integer TriConnex(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, const Standard_Integer Triang, const Standard_Integer Pivot, const Standard_Integer Pedge, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Triangle ******************/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "Give the indices of the 3 points of the triangle of address index in the polyhedrontool.

Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
Index: int

Returns
-------
P1: int
P2: int
P3: int
") Triangle;
		static void Triangle(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, const Standard_Integer Index, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

};


%extend IntCurveSurface_ThePolyhedronToolOfHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class IntCurveSurface_TheQuadCurvExactHInter *
***********************************************/
class IntCurveSurface_TheQuadCurvExactHInter {
	public:
		/****************** IntCurveSurface_TheQuadCurvExactHInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_TheQuadCurvExactHInter;
		%feature("autodoc", "Provides the signed distance function : q(w) and its first derivative dq(w)/dw.

Parameters
----------
S: Adaptor3d_HSurface
C: Adaptor3d_HCurve

Returns
-------
None
") IntCurveSurface_TheQuadCurvExactHInter;
		 IntCurveSurface_TheQuadCurvExactHInter(const opencascade::handle<Adaptor3d_HSurface> & S, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "U1 and u2 are the parameters of a segment on the curve.

Parameters
----------
Index: int

Returns
-------
U1: float
U2: float
") Intervals;
		void Intervals(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals();

		/****************** NbRoots ******************/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbRoots;
		Standard_Integer NbRoots();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
float
") Root;
		Standard_Real Root(const Standard_Integer Index);

};


%extend IntCurveSurface_TheQuadCurvExactHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************************
* class IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter *
****************************************************************/
class IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter : public math_FunctionWithDerivative {
	public:
		/****************** IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter;
		%feature("autodoc", "Create the function.

Parameters
----------
Q: IntSurf_Quadric
C: Adaptor3d_HCurve

Returns
-------
None
") IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter;
		 IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter(const IntSurf_Quadric & Q, const opencascade::handle<Adaptor3d_HCurve> & C);

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Computes the derivative of the previous function at parameter param. derivative always returns true.

Parameters
----------
Param: float

Returns
-------
D: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real Param, Standard_Real &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value of the signed distance between the implicit surface and the point at parameter param on the parametrised curve. value always returns true.

Parameters
----------
Param: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real Param, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value and the derivative of the function. returns true.

Parameters
----------
Param: float

Returns
-------
F: float
D: float
") Values;
		Standard_Boolean Values(const Standard_Real Param, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IntCurveSurface_HInter *
*******************************/
class IntCurveSurface_HInter : public IntCurveSurface_Intersection {
	public:
		/****************** IntCurveSurface_HInter ******************/
		%feature("compactdefaultargs") IntCurveSurface_HInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntCurveSurface_HInter;
		 IntCurveSurface_HInter();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the intersection between the curve and the surface.

Parameters
----------
Curve: Adaptor3d_HCurve
Surface: Adaptor3d_HSurface

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HCurve> & Curve, const opencascade::handle<Adaptor3d_HSurface> & Surface);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the intersection between the curve and the surface. the curve is already sampled and its polygon : <polygon> is given.

Parameters
----------
Curve: Adaptor3d_HCurve
Polygon: IntCurveSurface_ThePolygonOfHInter
Surface: Adaptor3d_HSurface

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HCurve> & Curve, const IntCurveSurface_ThePolygonOfHInter & Polygon, const opencascade::handle<Adaptor3d_HSurface> & Surface);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the intersection between the curve and the surface. the curve is already sampled and its polygon : <polygon> is given. the surface is also sampled and <polyhedron> is given.

Parameters
----------
Curve: Adaptor3d_HCurve
ThePolygon: IntCurveSurface_ThePolygonOfHInter
Surface: Adaptor3d_HSurface
Polyhedron: IntCurveSurface_ThePolyhedronOfHInter

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HCurve> & Curve, const IntCurveSurface_ThePolygonOfHInter & ThePolygon, const opencascade::handle<Adaptor3d_HSurface> & Surface, const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the intersection between the curve and the surface. the curve is already sampled and its polygon : <polygon> is given. the surface is also sampled and <polyhedron> is given.

Parameters
----------
Curve: Adaptor3d_HCurve
ThePolygon: IntCurveSurface_ThePolygonOfHInter
Surface: Adaptor3d_HSurface
Polyhedron: IntCurveSurface_ThePolyhedronOfHInter
BndBSB: Bnd_BoundSortBox

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HCurve> & Curve, const IntCurveSurface_ThePolygonOfHInter & ThePolygon, const opencascade::handle<Adaptor3d_HSurface> & Surface, const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron, Bnd_BoundSortBox & BndBSB);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the intersection between the curve and the surface. the surface is already sampled and its polyhedron : <polyhedron> is given.

Parameters
----------
Curve: Adaptor3d_HCurve
Surface: Adaptor3d_HSurface
Polyhedron: IntCurveSurface_ThePolyhedronOfHInter

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_HCurve> & Curve, const opencascade::handle<Adaptor3d_HSurface> & Surface, const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron);

};


%extend IntCurveSurface_HInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class IntCurveSurface_ThePolyhedronOfHInter:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
