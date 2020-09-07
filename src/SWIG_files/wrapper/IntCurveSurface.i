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

%extend NCollection_Sequence<IntCurveSurface_IntersectionPoint> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntCurveSurface_SequenceOfSeg) NCollection_Sequence<IntCurveSurface_IntersectionSegment>;

%extend NCollection_Sequence<IntCurveSurface_IntersectionSegment> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump all the fields.

Returns
-------
None
") Dump;
		void Dump();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns the <done> field.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Returns true if curve is parallel or belongs surface this case is recognized only for some pairs of analytical curves and surfaces (plane - line, ...).

Returns
-------
bool
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of intersectionpoint if isdone returns true. else notdone is raised.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Returns the number of intersectionsegment if isdone returns true. else notdone is raised.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** Point ******************/
		/**** md5 signature: d256d65e02c0791f5559745977a1209e ****/
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
		/**** md5 signature: 7447c62bdef950bcde1897b587756423 ****/
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
		/**** md5 signature: 294046f74db31153af5c7b60dec13d71 ****/
		%feature("compactdefaultargs") IntCurveSurface_IntersectionPoint;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint();

		/****************** IntCurveSurface_IntersectionPoint ******************/
		/**** md5 signature: ccaf6da9f784540c7c0813c49dd41e7d ****/
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
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dump all the fields.

Returns
-------
None
") Dump;
		void Dump();

		/****************** Pnt ******************/
		/**** md5 signature: c0bafeed50f4eebb5964e2bf8520bf90 ****/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Returns the geometric point.

Returns
-------
gp_Pnt
") Pnt;
		const gp_Pnt Pnt();

		/****************** SetValues ******************/
		/**** md5 signature: 4484a1960ef186062763f9c263178096 ****/
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
		/**** md5 signature: bd528dc9c78a60a5b26409b8cf4f3afe ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Returns the transition of the point.

Returns
-------
IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition();

		/****************** U ******************/
		/**** md5 signature: dd41b21b6ce05c48c2d8d002663816e1 ****/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Returns the u parameter on the surface.

Returns
-------
float
") U;
		Standard_Real U();

		/****************** V ******************/
		/**** md5 signature: a561db1f9ebb0e926d3862b2e88ce187 ****/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "Returns the v parameter on the surface.

Returns
-------
float
") V;
		Standard_Real V();

		/****************** Values ******************/
		/**** md5 signature: 125307a2c06cc906fe4b9af7cc3b2872 ****/
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
		/**** md5 signature: dde24677dd63b48ccacea2fe8006eed7 ****/
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
		/**** md5 signature: e40b82f2fd1e0d330e1cdaf22bdaaee8 ****/
		%feature("compactdefaultargs") IntCurveSurface_IntersectionSegment;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IntCurveSurface_IntersectionSegment;
		 IntCurveSurface_IntersectionSegment();

		/****************** IntCurveSurface_IntersectionSegment ******************/
		/**** md5 signature: 7d292660fcf1a1c98b903a4392107993 ****/
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
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** FirstPoint ******************/
		/**** md5 signature: 471c212edfeb4d6747a5d44feb57eaf1 ****/
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
		/**** md5 signature: c778c0b569431fdfe6fba1b55c48eac6 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
IntCurveSurface_IntersectionPoint
") FirstPoint;
		const IntCurveSurface_IntersectionPoint & FirstPoint();

		/****************** SecondPoint ******************/
		/**** md5 signature: f9e618a1839283d5ae57e523171f81fd ****/
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
		/**** md5 signature: bd31bb5df88055a35b2946d35b74fd34 ****/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
IntCurveSurface_IntersectionPoint
") SecondPoint;
		const IntCurveSurface_IntersectionPoint & SecondPoint();

		/****************** SetValues ******************/
		/**** md5 signature: 8c4f62db01e7a648d2d3ac4f7be53b7c ****/
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
		/**** md5 signature: fa392a8633b815a88ed6a2a2dc438083 ****/
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
		/**** md5 signature: bb9494029a3168ceca3b199a6ee221ef ****/
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
		/**** md5 signature: 41e45a1a33f5478edc64d6e3d88273fd ****/
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") AuxillarCurve;
		const opencascade::handle<Adaptor3d_HCurve> & AuxillarCurve();

		/****************** AuxillarSurface ******************/
		/**** md5 signature: eebc6d437c971dfbfb481a3fe1861466 ****/
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") AuxillarSurface;
		const opencascade::handle<Adaptor3d_HSurface> & AuxillarSurface();

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
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
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Point ******************/
		/**** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** Root ******************/
		/**** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Root;
		Standard_Real Root();

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
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
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
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
		/**** md5 signature: 223895d0a9dc70600c94ab17c6dc65dd ****/
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
		/**** md5 signature: 1ab676920576692ff41bf3df7e08260c ****/
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
		/**** md5 signature: 87817a81458dd7b55e723924632b4ea1 ****/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return the math function which is used to compute the intersection.

Returns
-------
IntCurveSurface_TheCSFunctionOfHInter
") Function;
		IntCurveSurface_TheCSFunctionOfHInter & Function();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the creation completed without failure.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** ParameterOnCurve ******************/
		/**** md5 signature: ac81682b4b1f0988f8f73835e37144bf ****/
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") ParameterOnCurve;
		Standard_Real ParameterOnCurve();

		/****************** ParameterOnSurface ******************/
		/**** md5 signature: b1ff2b42bc6096157075c8f0a6c1b6a5 ****/
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
		/**** md5 signature: 193bc13b7dd6d13fbf6a72a44d7ddd7b ****/
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
		/**** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ****/
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
		/**** md5 signature: 829ab2a580dbcac5e37e430438b2e3a7 ****/
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
		/**** md5 signature: 7dadbf2706ceecb890e61fdbe72806b4 ****/
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
		/**** md5 signature: f8c891b76391305d18e301c3c034adf9 ****/
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
		/**** md5 signature: 7f9e892307a7795f16dcc6b84abce2bd ****/
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
		/**** md5 signature: 9f5094d6ae70498582a5165e81ca9e6e ****/
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
		/**** md5 signature: d0091091ced0133822bf8b6cf6ce6fb3 ****/
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
		/**** md5 signature: c09529dc7b635a906884c36fc27e6614 ****/
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
		/**** md5 signature: 3bf35cb48a03694dcf006305239f076f ****/
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
		/**** md5 signature: faf529b7a4e398202afeb95c206b1d06 ****/
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
		/**** md5 signature: 8a5193508ff2cdf78439dc95839d76d9 ****/
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
		/**** md5 signature: d9e1f13e76e33ca8ffa49bead51ff742 ****/
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
		/**** md5 signature: 4b4b91b631e2fc8d7802536a6103d830 ****/
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
		/**** md5 signature: b0275e9cdb1b48ef453344670a938310 ****/
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
		/**** md5 signature: 12982c16469a7e24491d236a45bc85d8 ****/
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
		/**** md5 signature: 4950017a9350a9263e7eefe6eb8ec40b ****/
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
		/**** md5 signature: de88e227da300fb40e0486ce0e589597 ****/
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
		/**** md5 signature: cc67fdec2ebae09fe338337b96bbe757 ****/
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
		/**** md5 signature: 9e6391664ddf5109c0dbbbf44840873b ****/
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
		/**** md5 signature: 2957a79fcb3d607eac96ce31c3e9f14d ****/
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
		/**** md5 signature: c08f3e55e741ae331aa3148539fbf5a7 ****/
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
		/**** md5 signature: eb14d76c937f3e48ee50afa795fe6bbb ****/
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
		/**** md5 signature: 0324f2853e81012c8664c5476a95bc67 ****/
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
		/**** md5 signature: 67e7417a4c79992596773f6c9335ef87 ****/
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
		/**** md5 signature: ed348288a4fbd8e9a9891d7c019adcc3 ****/
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
		/**** md5 signature: eaacb8f389c217805748fab0dfd5885c ****/
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
		/**** md5 signature: 9f269a49154528a7347174a04e76266a ****/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "Constructs an empty interference between polygon and polyhedron.

Returns
-------
None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter();

		/****************** IntCurveSurface_TheInterferenceOfHInter ******************/
		/**** md5 signature: 1fc35f3c529bed831144ad885c8bcd10 ****/
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
		/**** md5 signature: fe32be20e5e982616448cb88defb89b5 ****/
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
		/**** md5 signature: c482c24d732ca7f0ebaa5ccf5267a806 ****/
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
		/**** md5 signature: cb2d29a8a9436369c974bf35e252c9c8 ****/
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
		/**** md5 signature: a02b9243d7dc4d63ca46b7f379fad3ad ****/
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
		/**** md5 signature: 4a140f601a5623b0babeabfacd1f2833 ****/
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
		/**** md5 signature: 6bf066120f0891c84d5b834298c9fef9 ****/
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
		/**** md5 signature: 9ea4eb36ee606512c95071a99b2423ec ****/
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
		/**** md5 signature: e1b28d497c638075aab91ce35fe79a4d ****/
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
		/**** md5 signature: a85b72f95f52030e4e25015fce186d02 ****/
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
		/**** md5 signature: 51d211e4e454f4ac60fa5f4e78cf27c5 ****/
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
		/**** md5 signature: 69eb7cb92ebac1fb15f3a670084d267d ****/
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
		/**** md5 signature: 8563dc0d18a2f310c361109a23301a8f ****/
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
		/**** md5 signature: 4c5038f0fe76add60e56a6105b83d1ea ****/
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
		/**** md5 signature: 2d5bd5ca8f3594eecaf5f5e959e1c5c8 ****/
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
		/**** md5 signature: f506734b482f128bc5a255daf4293bb6 ****/
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
		/**** md5 signature: 7f5853e01b777b8778586ac440b17d0d ****/
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
		/**** md5 signature: ea6b1c4f19abd104ce26cf986e38bc0b ****/
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
		/**** md5 signature: 3d238bbcef54b3e034127352ea83ab27 ****/
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
		/**** md5 signature: 8283e6d7921bb28044a85a5b8e0569c1 ****/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "Give the bounding box of the polygon.

Returns
-------
Bnd_Box
") Bounding;
		const Bnd_Box & Bounding();

		/****************** Closed ******************/
		/**** md5 signature: c5b0bafd47da29606481588a971270ce ****/
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
		/**** md5 signature: 6964da666f9b5a80bedb32cfb1fdc0ba ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Closed;
		Standard_Boolean Closed();

		/****************** DeflectionOverEstimation ******************/
		/**** md5 signature: 0e10e8a0297f14d67919e7ee30d4f816 ****/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation();

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dump;
		void Dump();

		/****************** EndOfSeg ******************/
		/**** md5 signature: 926c5cd8e4c3aff42af21c0c8b794c75 ****/
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
		/**** md5 signature: 8559659cfaf88d25c04ace5dcdcbde32 ****/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Returns the parameter (on the curve) of the first point of the polygon.

Returns
-------
float
") InfParameter;
		Standard_Real InfParameter();

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Give the number of segments in the polyline.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** SetDeflectionOverEstimation ******************/
		/**** md5 signature: 310446258d4443a660c9cfe280519b05 ****/
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
		/**** md5 signature: 67f72e7357fa61911c23a764d72614ea ****/
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
		/**** md5 signature: c3ce8d71b99130386b371f37d249b1c2 ****/
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
		/**** md5 signature: 2d8a88eea83f895f9a0709d892b00faa ****/
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
		/**** md5 signature: fa65dc78037adcd44ed4a44d893cab0a ****/
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
		/**** md5 signature: 1c23357db2c1501e81a046c3c9b6eb3d ****/
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
		/**** md5 signature: 9966370870a318adeb703c8d631ca2b8 ****/
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
		/**** md5 signature: a659f74ed9f2eaed8ffda44c22ad74da ****/
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
		/**** md5 signature: 69db76ba53411856428bd7f75b3c1833 ****/
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
		/**** md5 signature: b831938a9c6064b113ea9dcbbaacd0d7 ****/
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
		/**** md5 signature: 761297bd30540845381cd002f5cd3092 ****/
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
		/**** md5 signature: 12ee30a0552628992c8694e5e537d220 ****/
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
		/**** md5 signature: a04645c47ddce194e67fff3da32e9074 ****/
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
		/**** md5 signature: 6e6e6b15c436ca7e936bf316e36c39b8 ****/
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
		/**** md5 signature: cbbd7a99516fc080c7522ed924cf9a8b ****/
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
		/**** md5 signature: bdd670f00f0a5edcddc9ab980b962494 ****/
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
		/**** md5 signature: 52a78c4f8cd34c4673e1816fe02109c7 ****/
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
		/**** md5 signature: a3ad5c2542c00278319177801a1d1337 ****/
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
		/**** md5 signature: 18708030ea56c11d997b59c6e831ccb4 ****/
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
		/**** md5 signature: fdb8c698375f30b27d8f28a8093fbd36 ****/
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
		/**** md5 signature: a19f8bd23050233003b16b9179a07a15 ****/
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
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbIntervals ******************/
		/**** md5 signature: 64f54fde4d9752772b52d73d27261bcb ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals();

		/****************** NbRoots ******************/
		/**** md5 signature: d23dc5b5f7fe61d6b998e72ba9eb27b3 ****/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbRoots;
		Standard_Integer NbRoots();

		/****************** Root ******************/
		/**** md5 signature: 2e5be20bda2ce764c489750fb301f80e ****/
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
		/**** md5 signature: b9bb3cdf9ec9fee1d303ddc0535be0df ****/
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
		/**** md5 signature: f61c873331fa555e182f1973e95f59da ****/
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
		/**** md5 signature: 96999dda9fe43560f6ec0c3dc2a0f930 ****/
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
		/**** md5 signature: 30b6c9e0ecc359e02c44e042b54e6b7c ****/
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
		/**** md5 signature: 61b0224e89e874efcc8cd5e2b7e1420a ****/
		%feature("compactdefaultargs") IntCurveSurface_HInter;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntCurveSurface_HInter;
		 IntCurveSurface_HInter();

		/****************** Perform ******************/
		/**** md5 signature: e1d3afff50fd4470f42509fa855cb3a1 ****/
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
		/**** md5 signature: fa244c903bba4a06b58a3124ab5284c4 ****/
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
		/**** md5 signature: 2812665f1a192d96091c1732b10415b4 ****/
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
		/**** md5 signature: 6544460b13c70b74d5abbf0918ccf3c0 ****/
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
		/**** md5 signature: b41b39999d7c05e8768db2abc04402a1 ****/
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
