/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_intcurvesurface.html"
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
%include ../common/EnumTemplates.i
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

/* python proxy classes for enums */
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
		%feature("autodoc", "Return
-------
None

Description
-----------
Dump all the fields.
") Dump;
		void Dump();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the <done> field.
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsParallel ******************/
		/**** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if curve is parallel or belongs surface this case is recognized only for some pairs of analytical curves and surfaces (plane - line, ...).
") IsParallel;
		Standard_Boolean IsParallel();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersectionpoint if isdone returns true. else notdone is raised.
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersectionsegment if isdone returns true. else notdone is raised.
") NbSegments;
		Standard_Integer NbSegments();

		/****************** Point ******************/
		/**** md5 signature: d256d65e02c0791f5559745977a1209e ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntCurveSurface_IntersectionPoint

Description
-----------
Returns the intersectionpoint of range <index> raises notdone if the computation has failed or if the computation has not been done raises outofrange if index is not in the range <1..nbpoints>.
") Point;
		const IntCurveSurface_IntersectionPoint & Point(const Standard_Integer Index);

		/****************** Segment ******************/
		/**** md5 signature: 7447c62bdef950bcde1897b587756423 ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntCurveSurface_IntersectionSegment

Description
-----------
Returns the intersectionsegment of range <index> raises notdone if the computation has failed or if the computation has not been done raises outofrange if index is not in the range <1..nbsegment>.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint();

		/****************** IntCurveSurface_IntersectionPoint ******************/
		/**** md5 signature: ccaf6da9f784540c7c0813c49dd41e7d ****/
		%feature("compactdefaultargs") IntCurveSurface_IntersectionPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
USurf: float
VSurf: float
UCurv: float
TrCurv: IntCurveSurface_TransitionOnCurve

Return
-------
None

Description
-----------
Create an intersectionpoint.
") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint(const gp_Pnt & P, const Standard_Real USurf, const Standard_Real VSurf, const Standard_Real UCurv, const IntCurveSurface_TransitionOnCurve TrCurv);

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
Dump all the fields.
") Dump;
		void Dump();

		/****************** Pnt ******************/
		/**** md5 signature: c0bafeed50f4eebb5964e2bf8520bf90 ****/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the geometric point.
") Pnt;
		const gp_Pnt Pnt();

		/****************** SetValues ******************/
		/**** md5 signature: 4484a1960ef186062763f9c263178096 ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
USurf: float
VSurf: float
UCurv: float
TrCurv: IntCurveSurface_TransitionOnCurve

Return
-------
None

Description
-----------
Set the fields of the current intersectionpoint.
") SetValues;
		void SetValues(const gp_Pnt & P, const Standard_Real USurf, const Standard_Real VSurf, const Standard_Real UCurv, const IntCurveSurface_TransitionOnCurve TrCurv);

		/****************** Transition ******************/
		/**** md5 signature: bd528dc9c78a60a5b26409b8cf4f3afe ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Return
-------
IntCurveSurface_TransitionOnCurve

Description
-----------
Returns the transition of the point.
") Transition;
		IntCurveSurface_TransitionOnCurve Transition();

		/****************** U ******************/
		/**** md5 signature: dd41b21b6ce05c48c2d8d002663816e1 ****/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the u parameter on the surface.
") U;
		Standard_Real U();

		/****************** V ******************/
		/**** md5 signature: a561db1f9ebb0e926d3862b2e88ce187 ****/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the v parameter on the surface.
") V;
		Standard_Real V();

		/****************** Values ******************/
		/**** md5 signature: 125307a2c06cc906fe4b9af7cc3b2872 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
USurf: float
VSurf: float
UCurv: float
TrCurv: IntCurveSurface_TransitionOnCurve

Description
-----------
Get the fields of the current intersectionpoint.
") Values;
		void Values(gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, IntCurveSurface_TransitionOnCurve &OutValue);

		/****************** W ******************/
		/**** md5 signature: dde24677dd63b48ccacea2fe8006eed7 ****/
		%feature("compactdefaultargs") W;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter on the curve.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntCurveSurface_IntersectionSegment;
		 IntCurveSurface_IntersectionSegment();

		/****************** IntCurveSurface_IntersectionSegment ******************/
		/**** md5 signature: 7d292660fcf1a1c98b903a4392107993 ****/
		%feature("compactdefaultargs") IntCurveSurface_IntersectionSegment;
		%feature("autodoc", "
Parameters
----------
P1: IntCurveSurface_IntersectionPoint
P2: IntCurveSurface_IntersectionPoint

Return
-------
None

Description
-----------
No available documentation.
") IntCurveSurface_IntersectionSegment;
		 IntCurveSurface_IntersectionSegment(const IntCurveSurface_IntersectionPoint & P1, const IntCurveSurface_IntersectionPoint & P2);

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****************** FirstPoint ******************/
		/**** md5 signature: 471c212edfeb4d6747a5d44feb57eaf1 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "
Parameters
----------
P1: IntCurveSurface_IntersectionPoint

Return
-------
None

Description
-----------
No available documentation.
") FirstPoint;
		void FirstPoint(IntCurveSurface_IntersectionPoint & P1);

		/****************** FirstPoint ******************/
		/**** md5 signature: c778c0b569431fdfe6fba1b55c48eac6 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntCurveSurface_IntersectionPoint

Description
-----------
No available documentation.
") FirstPoint;
		const IntCurveSurface_IntersectionPoint & FirstPoint();

		/****************** SecondPoint ******************/
		/**** md5 signature: f9e618a1839283d5ae57e523171f81fd ****/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "
Parameters
----------
P2: IntCurveSurface_IntersectionPoint

Return
-------
None

Description
-----------
No available documentation.
") SecondPoint;
		void SecondPoint(IntCurveSurface_IntersectionPoint & P2);

		/****************** SecondPoint ******************/
		/**** md5 signature: bd31bb5df88055a35b2946d35b74fd34 ****/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Return
-------
IntCurveSurface_IntersectionPoint

Description
-----------
No available documentation.
") SecondPoint;
		const IntCurveSurface_IntersectionPoint & SecondPoint();

		/****************** SetValues ******************/
		/**** md5 signature: 8c4f62db01e7a648d2d3ac4f7be53b7c ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
P1: IntCurveSurface_IntersectionPoint
P2: IntCurveSurface_IntersectionPoint

Return
-------
None

Description
-----------
No available documentation.
") SetValues;
		void SetValues(const IntCurveSurface_IntersectionPoint & P1, const IntCurveSurface_IntersectionPoint & P2);

		/****************** Values ******************/
		/**** md5 signature: fa392a8633b815a88ed6a2a2dc438083 ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
P1: IntCurveSurface_IntersectionPoint
P2: IntCurveSurface_IntersectionPoint

Return
-------
None

Description
-----------
No available documentation.
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
		/**** md5 signature: 78b033c5aa81abd59886b6aa2483bbd6 ****/
		%feature("compactdefaultargs") IntCurveSurface_TheCSFunctionOfHInter;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") IntCurveSurface_TheCSFunctionOfHInter;
		 IntCurveSurface_TheCSFunctionOfHInter(const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** AuxillarCurve ******************/
		/**** md5 signature: 1f51289ad95c1360f777c3a993b735bb ****/
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") AuxillarCurve;
		const opencascade::handle<Adaptor3d_Curve> & AuxillarCurve();

		/****************** AuxillarSurface ******************/
		/**** md5 signature: b291a5935dc6f37ed5922990c14f0acd ****/
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") AuxillarSurface;
		const opencascade::handle<Adaptor3d_Surface> & AuxillarSurface();

		/****************** Derivatives ******************/
		/**** md5 signature: 80ee5f16e62731c095910ad60228848b ****/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
") Derivatives;
		Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** NbEquations ******************/
		/**** md5 signature: 42be0dc2e32c8e563393e8490171707e ****/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		/**** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ****/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		Standard_Integer NbVariables();

		/****************** Point ******************/
		/**** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Point;
		const gp_Pnt Point();

		/****************** Root ******************/
		/**** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Root;
		Standard_Real Root();

		/****************** Value ******************/
		/**** md5 signature: 31f6ba581b8fae503400d98976418349 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
No available documentation.
") Value;
		Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		/**** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
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
		%feature("autodoc", "
Parameters
----------
U: float
V: float
W: float
F: IntCurveSurface_TheCSFunctionOfHInter
TolTangency: float
MarginCoef: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Compute the solution point with the close point margincoef is the coefficient for extension of uv bounds. ex., ufirst -= margincoef*(ulast-ufirst).
") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter(const Standard_Real U, const Standard_Real V, const Standard_Real W, const IntCurveSurface_TheCSFunctionOfHInter & F, const Standard_Real TolTangency, const Standard_Real MarginCoef = 0.0);

		/****************** IntCurveSurface_TheExactHInter ******************/
		/**** md5 signature: 1ab676920576692ff41bf3df7e08260c ****/
		%feature("compactdefaultargs") IntCurveSurface_TheExactHInter;
		%feature("autodoc", "
Parameters
----------
F: IntCurveSurface_TheCSFunctionOfHInter
TolTangency: float

Return
-------
None

Description
-----------
Initialize the parameters to compute the solution.
") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter(const IntCurveSurface_TheCSFunctionOfHInter & F, const Standard_Real TolTangency);

		/****************** Function ******************/
		/**** md5 signature: 87817a81458dd7b55e723924632b4ea1 ****/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return
-------
IntCurveSurface_TheCSFunctionOfHInter

Description
-----------
Return the math function which is used to compute the intersection.
") Function;
		IntCurveSurface_TheCSFunctionOfHInter & Function();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the creation completed without failure.
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** ParameterOnCurve ******************/
		/**** md5 signature: ac81682b4b1f0988f8f73835e37144bf ****/
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParameterOnCurve;
		Standard_Real ParameterOnCurve();

		/****************** ParameterOnSurface ******************/
		/**** md5 signature: b1ff2b42bc6096157075c8f0a6c1b6a5 ****/
		%feature("compactdefaultargs") ParameterOnSurface;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: float
V: float

Description
-----------
No available documentation.
") ParameterOnSurface;
		void ParameterOnSurface(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Perform ******************/
		/**** md5 signature: 193bc13b7dd6d13fbf6a72a44d7ddd7b ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Compute the solution it's possible to write to optimize: intimp_intcs inter(s1,c1,toltangency) math_functionsetroot rsnld(inter.function()) while ...{ u=... v=... w=... inter.perform(u,v,w,rsnld) } or intimp_intcs inter(toltangency) inter.setsurface(s); math_functionsetroot rsnld(inter.function()) while ...{ c=... inter.setcurve(c); u=... v=... w=... inter.perform(u,v,w,rsnld) }.
") Perform;
		void Perform(const Standard_Real U, const Standard_Real V, const Standard_Real W, math_FunctionSetRoot & Rsnld, const Standard_Real u0, const Standard_Real v0, const Standard_Real u1, const Standard_Real v1, const Standard_Real w0, const Standard_Real w1);

		/****************** Point ******************/
		/**** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the intersection point the exception notdone is raised if isdone is false. the exception domainerror is raised if isempty is true.
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
		/**** md5 signature: 73295d8773f31004aa0bf55b549ab48f ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom_BSplineCurve> BSpline(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Bezier ******************/
		/**** md5 signature: f306f8462315905af8e276236266123d ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom_BezierCurve> Bezier(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Circle ******************/
		/**** md5 signature: 7b6731a5a54fc11dc51059ac04fa7d96 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		static gp_Circ Circle(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Continuity ******************/
		/**** md5 signature: 36a22861c63402bce70a44cade7cd4e2 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		static GeomAbs_Shape Continuity(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** D0 ******************/
		/**** md5 signature: 8132d18251425c9a08facd1890d4dc14 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameter u on the curve.
") D0;
		static void D0(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: e2eff93238cd61643a22155760ca87e7 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.
") D1;
		static void D1(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** D2 ******************/
		/**** md5 signature: a03fec54dc9fb384b49128be1eeb6ab5 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.
") D2;
		static void D2(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		/**** md5 signature: daf7fd27ce53952002a95005add4c7db ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.
") D3;
		static void D3(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		/**** md5 signature: 19abd9a6442d6a3469d8f9590507387e ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.
") DN;
		static gp_Vec DN(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, const Standard_Integer N);

		/****************** Ellipse ******************/
		/**** md5 signature: c32c615877d264a7d9a959c38c10dac5 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		static gp_Elips Ellipse(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** FirstParameter ******************/
		/**** md5 signature: 25c42492a02c6ff0b57c4cf91fb40f86 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		static Standard_Real FirstParameter(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** GetType ******************/
		/**** md5 signature: a686bd836352e7b0b82151881246c5a7 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.
") GetType;
		static GeomAbs_CurveType GetType(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Hyperbola ******************/
		/**** md5 signature: d833c49b900f354e019cfd82c1b21d0e ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		static gp_Hypr Hyperbola(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Intervals ******************/
		/**** md5 signature: ba9ef7becad6f3e6ee434061971db40d ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accommodate for the parameters. i.e. t.length() > nbintervals().
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor3d_Curve> & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: 178cf2cfae4002c04a5499797f8bd656 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		static Standard_Boolean IsClosed(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** IsPeriodic ******************/
		/**** md5 signature: d48777dd4aacf834a3350873acc52ff6 ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		static Standard_Boolean IsPeriodic(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** LastParameter ******************/
		/**** md5 signature: c00409255c9efae31d007ea0f35327b6 ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		static Standard_Real LastParameter(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Line ******************/
		/**** md5 signature: 5d669526ea2c83636bcd5abea25c7993 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		static gp_Lin Line(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** NbIntervals ******************/
		/**** md5 signature: 14a07173bd3c33d26deeb9707ee34cb3 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <s>. may be one if continuity(myclass) >= <s>.
") NbIntervals;
		static Standard_Integer NbIntervals(const opencascade::handle<Adaptor3d_Curve> & C, const GeomAbs_Shape S);

		/****************** NbSamples ******************/
		/**** md5 signature: b050222a5e2dbdd07a79f2aec3a93db5 ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U0: float
U1: float

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static Standard_Integer NbSamples(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U0, const Standard_Real U1);

		/****************** Parabola ******************/
		/**** md5 signature: cc30b6b7d2e5eb272de9d92bc65e5ba5 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		static gp_Parab Parabola(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Period ******************/
		/**** md5 signature: f7986452fbb7b824f9223306a3748bb0 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
float

Description
-----------
No available documentation.
") Period;
		static Standard_Real Period(const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Resolution ******************/
		/**** md5 signature: 5b1954ce6b6bbeec3732ad23161bfe7f ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
R3d: float

Return
-------
float

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <r3d>.
") Resolution;
		static Standard_Real Resolution(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real R3d);

		/****************** SamplePars ******************/
		/**** md5 signature: 687011ec6271e681eb1f024a48e6210e ****/
		%feature("compactdefaultargs") SamplePars;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U0: float
U1: float
Defl: float
NbMin: int
Pars: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SamplePars;
		static void SamplePars(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U0, const Standard_Real U1, const Standard_Real Defl, const Standard_Integer NbMin, opencascade::handle<TColStd_HArray1OfReal> & Pars);

		/****************** Value ******************/
		/**** md5 signature: 2a733041fbe29fa56e33746589b73c76 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: float

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter u on the curve.
") Value;
		static gp_Pnt Value(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U);

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
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty interference between polygon and polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter();

		/****************** IntCurveSurface_TheInterferenceOfHInter ******************/
		/**** md5 signature: 1fc35f3c529bed831144ad885c8bcd10 ****/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "
Parameters
----------
thePolyg: IntCurveSurface_ThePolygonOfHInter
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
None

Description
-----------
Constructs and computes an interference between the polygon and the polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** IntCurveSurface_TheInterferenceOfHInter ******************/
		/**** md5 signature: fe32be20e5e982616448cb88defb89b5 ****/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "
Parameters
----------
theLin: gp_Lin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
None

Description
-----------
Constructs and computes an interference between the straight line and the polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const gp_Lin & theLin, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** IntCurveSurface_TheInterferenceOfHInter ******************/
		/**** md5 signature: c482c24d732ca7f0ebaa5ccf5267a806 ****/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "
Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
None

Description
-----------
Constructs and computes an interference between the straight lines and the polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const Intf_Array1OfLin & theLins, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** IntCurveSurface_TheInterferenceOfHInter ******************/
		/**** md5 signature: cb2d29a8a9436369c974bf35e252c9c8 ****/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "
Parameters
----------
thePolyg: IntCurveSurface_ThePolygonOfHInter
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Constructs and computes an interference between the polygon and the polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** IntCurveSurface_TheInterferenceOfHInter ******************/
		/**** md5 signature: a02b9243d7dc4d63ca46b7f379fad3ad ****/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "
Parameters
----------
theLin: gp_Lin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Constructs and computes an interference between the straight line and the polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const gp_Lin & theLin, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** IntCurveSurface_TheInterferenceOfHInter ******************/
		/**** md5 signature: 4a140f601a5623b0babeabfacd1f2833 ****/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "
Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Constructs and computes an interference between the straight lines and the polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const Intf_Array1OfLin & theLins, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** Interference ******************/
		/**** md5 signature: 6bf066120f0891c84d5b834298c9fef9 ****/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "
Parameters
----------
thePolyg: IntCurveSurface_ThePolygonOfHInter
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Compares the boundings between the segment of <thepolyg> and the facets of <thepolyh>.
") Interference;
		void Interference(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** Interference ******************/
		/**** md5 signature: 9ea4eb36ee606512c95071a99b2423ec ****/
		%feature("compactdefaultargs") Interference;
		%feature("autodoc", "
Parameters
----------
thePolyg: IntCurveSurface_ThePolygonOfHInter
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
None

Description
-----------
Compares the boundings between the segment of <thepolyg> and the facets of <thepolyh>.
") Interference;
		void Interference(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** Perform ******************/
		/**** md5 signature: e1b28d497c638075aab91ce35fe79a4d ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
thePolyg: IntCurveSurface_ThePolygonOfHInter
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
None

Description
-----------
Computes an interference between the polygon and the polyhedron.
") Perform;
		void Perform(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** Perform ******************/
		/**** md5 signature: a85b72f95f52030e4e25015fce186d02 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theLin: gp_Lin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
None

Description
-----------
Computes an interference between the straight line and the polyhedron.
") Perform;
		void Perform(const gp_Lin & theLin, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** Perform ******************/
		/**** md5 signature: 51d211e4e454f4ac60fa5f4e78cf27c5 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
None

Description
-----------
Computes an interference between the straight lines and the polyhedron.
") Perform;
		void Perform(const Intf_Array1OfLin & theLins, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** Perform ******************/
		/**** md5 signature: 69eb7cb92ebac1fb15f3a670084d267d ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
thePolyg: IntCurveSurface_ThePolygonOfHInter
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Computes an interference between the polygon and the polyhedron.
") Perform;
		void Perform(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** Perform ******************/
		/**** md5 signature: 8563dc0d18a2f310c361109a23301a8f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theLin: gp_Lin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Computes an interference between the straight line and the polyhedron.
") Perform;
		void Perform(const gp_Lin & theLin, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****************** Perform ******************/
		/**** md5 signature: 4c5038f0fe76add60e56a6105b83d1ea ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theLins: Intf_Array1OfLin
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Computes an interference between the straight lines and the polyhedron.
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
		/**** md5 signature: 8607fc4d81bccabc25390ed85263028a ****/
		%feature("compactdefaultargs") IntCurveSurface_ThePolygonOfHInter;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
NbPnt: int

Return
-------
None

Description
-----------
No available documentation.
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter(const opencascade::handle<Adaptor3d_Curve> & Curve, const Standard_Integer NbPnt);

		/****************** IntCurveSurface_ThePolygonOfHInter ******************/
		/**** md5 signature: cfc389022764ab206816e49acf0b9b59 ****/
		%feature("compactdefaultargs") IntCurveSurface_ThePolygonOfHInter;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
U1: float
U2: float
NbPnt: int

Return
-------
None

Description
-----------
No available documentation.
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter(const opencascade::handle<Adaptor3d_Curve> & Curve, const Standard_Real U1, const Standard_Real U2, const Standard_Integer NbPnt);

		/****************** IntCurveSurface_ThePolygonOfHInter ******************/
		/**** md5 signature: 4b3c71047f9b5f23656b10d928f193be ****/
		%feature("compactdefaultargs") IntCurveSurface_ThePolygonOfHInter;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
Upars: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter(const opencascade::handle<Adaptor3d_Curve> & Curve, const TColStd_Array1OfReal & Upars);

		/****************** ApproxParamOnCurve ******************/
		/**** md5 signature: ea6b1c4f19abd104ce26cf986e38bc0b ****/
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "
Parameters
----------
Index: int
ParamOnLine: float

Return
-------
float

Description
-----------
Give an approximation of the parameter on the curve according to the discretization of the curve.
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve(const Standard_Integer Index, const Standard_Real ParamOnLine);

		/****************** BeginOfSeg ******************/
		/**** md5 signature: d9c773bc099d0d92cc222653e8226d5e ****/
		%feature("compactdefaultargs") BeginOfSeg;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt

Description
-----------
Give the point of range index in the polygon.
") BeginOfSeg;
		const gp_Pnt BeginOfSeg(const Standard_Integer theIndex);

		/****************** Bounding ******************/
		/**** md5 signature: 54ccbf8f63f02bb43c2fc9c718922d78 ****/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
Give the bounding box of the polygon.
") Bounding;
		const Bnd_Box & Bounding();

		/****************** Closed ******************/
		/**** md5 signature: e853f3a0de69f6e7f92ebd8ac1362e0c ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
flag: bool

Return
-------
None

Description
-----------
No available documentation.
") Closed;
		void Closed(const Standard_Boolean flag);

		/****************** Closed ******************/
		/**** md5 signature: f94551c898fe323903f1d14861bbe901 ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Closed;
		Standard_Boolean Closed();

		/****************** DeflectionOverEstimation ******************/
		/**** md5 signature: b4c80a54735f171bb52e56c083257109 ****/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation();

		/****************** Dump ******************/
		/**** md5 signature: 15b4b2e195645aebb43170ff7f15952a ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****************** EndOfSeg ******************/
		/**** md5 signature: fa65a7dd84749b3192eff93d48f5b1d6 ****/
		%feature("compactdefaultargs") EndOfSeg;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt

Description
-----------
Give the point of range index in the polygon.
") EndOfSeg;
		const gp_Pnt EndOfSeg(const Standard_Integer theIndex);

		/****************** InfParameter ******************/
		/**** md5 signature: f596238a0398d517210e4fad0d4b84b2 ****/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter (on the curve) of the first point of the polygon.
") InfParameter;
		Standard_Real InfParameter();

		/****************** NbSegments ******************/
		/**** md5 signature: 9f8199ef0d5690074e4037e7feba62da ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of segments in the polyline.
") NbSegments;
		Standard_Integer NbSegments();

		/****************** SetDeflectionOverEstimation ******************/
		/**** md5 signature: 872cf63726ece2c3b812a597bb60fe29 ****/
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
x: float

Return
-------
None

Description
-----------
No available documentation.
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation(const Standard_Real x);

		/****************** SupParameter ******************/
		/**** md5 signature: 688f110f02a5711ae550904ec8e3220d ****/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter (on the curve) of the last point of the polygon.
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
		%feature("autodoc", "
Parameters
----------
thePolygon: IntCurveSurface_ThePolygonOfHInter
Index: int

Return
-------
gp_Pnt

Description
-----------
Give the point of range index in the polygon.
") BeginOfSeg;
		static const gp_Pnt BeginOfSeg(const IntCurveSurface_ThePolygonOfHInter & thePolygon, const Standard_Integer Index);

		/****************** Bounding ******************/
		/**** md5 signature: 2d8a88eea83f895f9a0709d892b00faa ****/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "
Parameters
----------
thePolygon: IntCurveSurface_ThePolygonOfHInter

Return
-------
Bnd_Box

Description
-----------
Give the bounding box of the polygon.
") Bounding;
		static const Bnd_Box & Bounding(const IntCurveSurface_ThePolygonOfHInter & thePolygon);

		/****************** Closed ******************/
		/**** md5 signature: fa65dc78037adcd44ed4a44d893cab0a ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
thePolygon: IntCurveSurface_ThePolygonOfHInter

Return
-------
bool

Description
-----------
No available documentation.
") Closed;
		static Standard_Boolean Closed(const IntCurveSurface_ThePolygonOfHInter & thePolygon);

		/****************** DeflectionOverEstimation ******************/
		/**** md5 signature: 1c23357db2c1501e81a046c3c9b6eb3d ****/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
thePolygon: IntCurveSurface_ThePolygonOfHInter

Return
-------
float

Description
-----------
No available documentation.
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation(const IntCurveSurface_ThePolygonOfHInter & thePolygon);

		/****************** Dump ******************/
		/**** md5 signature: 9966370870a318adeb703c8d631ca2b8 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
thePolygon: IntCurveSurface_ThePolygonOfHInter

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		static void Dump(const IntCurveSurface_ThePolygonOfHInter & thePolygon);

		/****************** EndOfSeg ******************/
		/**** md5 signature: a659f74ed9f2eaed8ffda44c22ad74da ****/
		%feature("compactdefaultargs") EndOfSeg;
		%feature("autodoc", "
Parameters
----------
thePolygon: IntCurveSurface_ThePolygonOfHInter
Index: int

Return
-------
gp_Pnt

Description
-----------
Give the point of range index in the polygon.
") EndOfSeg;
		static const gp_Pnt EndOfSeg(const IntCurveSurface_ThePolygonOfHInter & thePolygon, const Standard_Integer Index);

		/****************** NbSegments ******************/
		/**** md5 signature: 69db76ba53411856428bd7f75b3c1833 ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "
Parameters
----------
thePolygon: IntCurveSurface_ThePolygonOfHInter

Return
-------
int

Description
-----------
No available documentation.
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
		%feature("autodoc", "
Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
Bnd_Box

Description
-----------
Give the bounding box of the polyhedrontool.
") Bounding;
		static const Bnd_Box & Bounding(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** ComponentsBounding ******************/
		/**** md5 signature: 761297bd30540845381cd002f5cd3092 ****/
		%feature("compactdefaultargs") ComponentsBounding;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
opencascade::handle<Bnd_HArray1OfBox>

Description
-----------
Give the array of boxes. the box <n> corresponding to the triangle <n>.
") ComponentsBounding;
		static const opencascade::handle<Bnd_HArray1OfBox> & ComponentsBounding(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** DeflectionOverEstimation ******************/
		/**** md5 signature: 12ee30a0552628992c8694e5e537d220 ****/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
float

Description
-----------
Give the tolerance of the polygon.
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** Dump ******************/
		/**** md5 signature: a04645c47ddce194e67fff3da32e9074 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		static void Dump(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** GetBorderDeflection ******************/
		/**** md5 signature: 6e6e6b15c436ca7e936bf316e36c39b8 ****/
		%feature("compactdefaultargs") GetBorderDeflection;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
float

Description
-----------
This method returns a border deflection of the polyhedron.
") GetBorderDeflection;
		static Standard_Real GetBorderDeflection(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** IsOnBound ******************/
		/**** md5 signature: cbbd7a99516fc080c7522ed924cf9a8b ****/
		%feature("compactdefaultargs") IsOnBound;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
Index1: int
Index2: int

Return
-------
bool

Description
-----------
This method returns true if the edge based on points with indices index1 and index2 represents a boundary edge. it is necessary to take into account the boundary deflection for this edge.
") IsOnBound;
		static Standard_Boolean IsOnBound(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, const Standard_Integer Index1, const Standard_Integer Index2);

		/****************** NbTriangles ******************/
		/**** md5 signature: bdd670f00f0a5edcddc9ab980b962494 ****/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
int

Description
-----------
Give the number of triangles in this polyhedral surface.
") NbTriangles;
		static Standard_Integer NbTriangles(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****************** Point ******************/
		/**** md5 signature: 52a78c4f8cd34c4673e1816fe02109c7 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
Index: int

Return
-------
gp_Pnt

Description
-----------
Give the point of index i in the polyhedral surface.
") Point;
		static const gp_Pnt Point(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, const Standard_Integer Index);

		/****************** TriConnex ******************/
		/**** md5 signature: a3ad5c2542c00278319177801a1d1337 ****/
		%feature("compactdefaultargs") TriConnex;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
Triang: int
Pivot: int
Pedge: int

Return
-------
TriCon: int
OtherP: int

Description
-----------
Give the address tricon of the triangle connexe to the triangle of address triang by the edge pivot pedge and the third point of this connexe triangle. when we are on a free edge tricon==0 but the function return the value of the triangle in the other side of pivot on the free edge. used to turn around a vertex.
") TriConnex;
		static Standard_Integer TriConnex(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, const Standard_Integer Triang, const Standard_Integer Pivot, const Standard_Integer Pedge, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Triangle ******************/
		/**** md5 signature: 18708030ea56c11d997b59c6e831ccb4 ****/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
Index: int

Return
-------
P1: int
P2: int
P3: int

Description
-----------
Give the indices of the 3 points of the triangle of address index in the polyhedrontool.
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
		/**** md5 signature: ac7dcc5c45368df4f5d35e48176ea6f2 ****/
		%feature("compactdefaultargs") IntCurveSurface_TheQuadCurvExactHInter;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
Provides the signed distance function: q(w) and its first derivative dq(w)/dw.
") IntCurveSurface_TheQuadCurvExactHInter;
		 IntCurveSurface_TheQuadCurvExactHInter(const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Intervals ******************/
		/**** md5 signature: a19f8bd23050233003b16b9179a07a15 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U1: float
U2: float

Description
-----------
U1 and u2 are the parameters of a segment on the curve.
") Intervals;
		void Intervals(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbIntervals ******************/
		/**** md5 signature: 64f54fde4d9752772b52d73d27261bcb ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbIntervals;
		Standard_Integer NbIntervals();

		/****************** NbRoots ******************/
		/**** md5 signature: d23dc5b5f7fe61d6b998e72ba9eb27b3 ****/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbRoots;
		Standard_Integer NbRoots();

		/****************** Root ******************/
		/**** md5 signature: 2e5be20bda2ce764c489750fb301f80e ****/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
No available documentation.
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
		/**** md5 signature: e819d921f7ec4605895d1bc1c29e38ff ****/
		%feature("compactdefaultargs") IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter;
		%feature("autodoc", "
Parameters
----------
Q: IntSurf_Quadric
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
Create the function.
") IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter;
		 IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter(const IntSurf_Quadric & Q, const opencascade::handle<Adaptor3d_Curve> & C);

		/****************** Derivative ******************/
		/**** md5 signature: f61c873331fa555e182f1973e95f59da ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
D: float

Description
-----------
Computes the derivative of the previous function at parameter param. derivative always returns true.
") Derivative;
		Standard_Boolean Derivative(const Standard_Real Param, Standard_Real &OutValue);

		/****************** Value ******************/
		/**** md5 signature: 96999dda9fe43560f6ec0c3dc2a0f930 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
F: float

Description
-----------
Computes the value of the signed distance between the implicit surface and the point at parameter param on the parametrised curve. value always returns true.
") Value;
		Standard_Boolean Value(const Standard_Real Param, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: 30b6c9e0ecc359e02c44e042b54e6b7c ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
F: float
D: float

Description
-----------
Computes the value and the derivative of the function. returns true.
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
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntCurveSurface_HInter;
		 IntCurveSurface_HInter();

		/****************** Perform ******************/
		/**** md5 signature: 91c228b2481819fc2df45ad4cfb0ffe0 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
Surface: Adaptor3d_Surface

Return
-------
None

Description
-----------
Compute the intersection between the curve and the surface.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & Curve, const opencascade::handle<Adaptor3d_Surface> & Surface);

		/****************** Perform ******************/
		/**** md5 signature: 5c682ee95377c875d30f6e459fdd7a63 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
Polygon: IntCurveSurface_ThePolygonOfHInter
Surface: Adaptor3d_Surface

Return
-------
None

Description
-----------
Compute the intersection between the curve and the surface. the curve is already sampled and its polygon: <polygon> is given.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & Curve, const IntCurveSurface_ThePolygonOfHInter & Polygon, const opencascade::handle<Adaptor3d_Surface> & Surface);

		/****************** Perform ******************/
		/**** md5 signature: e7d1708684046cf89a0658d9b54e4548 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
ThePolygon: IntCurveSurface_ThePolygonOfHInter
Surface: Adaptor3d_Surface
Polyhedron: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
None

Description
-----------
Compute the intersection between the curve and the surface. the curve is already sampled and its polygon: <polygon> is given. the surface is also sampled and <polyhedron> is given.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & Curve, const IntCurveSurface_ThePolygonOfHInter & ThePolygon, const opencascade::handle<Adaptor3d_Surface> & Surface, const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron);

		/****************** Perform ******************/
		/**** md5 signature: 5b00a27700d57fa276f88e27a3f76726 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
ThePolygon: IntCurveSurface_ThePolygonOfHInter
Surface: Adaptor3d_Surface
Polyhedron: IntCurveSurface_ThePolyhedronOfHInter
BndBSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Compute the intersection between the curve and the surface. the curve is already sampled and its polygon: <polygon> is given. the surface is also sampled and <polyhedron> is given.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & Curve, const IntCurveSurface_ThePolygonOfHInter & ThePolygon, const opencascade::handle<Adaptor3d_Surface> & Surface, const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron, Bnd_BoundSortBox & BndBSB);

		/****************** Perform ******************/
		/**** md5 signature: e29fe9ea101d6584c14df774972d4b0d ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
Surface: Adaptor3d_Surface
Polyhedron: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
None

Description
-----------
Compute the intersection between the curve and the surface. the surface is already sampled and its polyhedron: <polyhedron> is given.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & Curve, const opencascade::handle<Adaptor3d_Surface> & Surface, const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron);

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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def IntCurveSurface_TheHCurveTool_BSpline(*args):
	return IntCurveSurface_TheHCurveTool.BSpline(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_Bezier(*args):
	return IntCurveSurface_TheHCurveTool.Bezier(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_Circle(*args):
	return IntCurveSurface_TheHCurveTool.Circle(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_Continuity(*args):
	return IntCurveSurface_TheHCurveTool.Continuity(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_D0(*args):
	return IntCurveSurface_TheHCurveTool.D0(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_D1(*args):
	return IntCurveSurface_TheHCurveTool.D1(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_D2(*args):
	return IntCurveSurface_TheHCurveTool.D2(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_D3(*args):
	return IntCurveSurface_TheHCurveTool.D3(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_DN(*args):
	return IntCurveSurface_TheHCurveTool.DN(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_Ellipse(*args):
	return IntCurveSurface_TheHCurveTool.Ellipse(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_FirstParameter(*args):
	return IntCurveSurface_TheHCurveTool.FirstParameter(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_GetType(*args):
	return IntCurveSurface_TheHCurveTool.GetType(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_Hyperbola(*args):
	return IntCurveSurface_TheHCurveTool.Hyperbola(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_Intervals(*args):
	return IntCurveSurface_TheHCurveTool.Intervals(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_IsClosed(*args):
	return IntCurveSurface_TheHCurveTool.IsClosed(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_IsPeriodic(*args):
	return IntCurveSurface_TheHCurveTool.IsPeriodic(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_LastParameter(*args):
	return IntCurveSurface_TheHCurveTool.LastParameter(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_Line(*args):
	return IntCurveSurface_TheHCurveTool.Line(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_NbIntervals(*args):
	return IntCurveSurface_TheHCurveTool.NbIntervals(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_NbSamples(*args):
	return IntCurveSurface_TheHCurveTool.NbSamples(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_Parabola(*args):
	return IntCurveSurface_TheHCurveTool.Parabola(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_Period(*args):
	return IntCurveSurface_TheHCurveTool.Period(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_Resolution(*args):
	return IntCurveSurface_TheHCurveTool.Resolution(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_SamplePars(*args):
	return IntCurveSurface_TheHCurveTool.SamplePars(*args)

@deprecated
def IntCurveSurface_TheHCurveTool_Value(*args):
	return IntCurveSurface_TheHCurveTool.Value(*args)

@deprecated
def IntCurveSurface_ThePolygonToolOfHInter_BeginOfSeg(*args):
	return IntCurveSurface_ThePolygonToolOfHInter.BeginOfSeg(*args)

@deprecated
def IntCurveSurface_ThePolygonToolOfHInter_Bounding(*args):
	return IntCurveSurface_ThePolygonToolOfHInter.Bounding(*args)

@deprecated
def IntCurveSurface_ThePolygonToolOfHInter_Closed(*args):
	return IntCurveSurface_ThePolygonToolOfHInter.Closed(*args)

@deprecated
def IntCurveSurface_ThePolygonToolOfHInter_DeflectionOverEstimation(*args):
	return IntCurveSurface_ThePolygonToolOfHInter.DeflectionOverEstimation(*args)

@deprecated
def IntCurveSurface_ThePolygonToolOfHInter_Dump(*args):
	return IntCurveSurface_ThePolygonToolOfHInter.Dump(*args)

@deprecated
def IntCurveSurface_ThePolygonToolOfHInter_EndOfSeg(*args):
	return IntCurveSurface_ThePolygonToolOfHInter.EndOfSeg(*args)

@deprecated
def IntCurveSurface_ThePolygonToolOfHInter_NbSegments(*args):
	return IntCurveSurface_ThePolygonToolOfHInter.NbSegments(*args)

@deprecated
def IntCurveSurface_ThePolyhedronToolOfHInter_Bounding(*args):
	return IntCurveSurface_ThePolyhedronToolOfHInter.Bounding(*args)

@deprecated
def IntCurveSurface_ThePolyhedronToolOfHInter_ComponentsBounding(*args):
	return IntCurveSurface_ThePolyhedronToolOfHInter.ComponentsBounding(*args)

@deprecated
def IntCurveSurface_ThePolyhedronToolOfHInter_DeflectionOverEstimation(*args):
	return IntCurveSurface_ThePolyhedronToolOfHInter.DeflectionOverEstimation(*args)

@deprecated
def IntCurveSurface_ThePolyhedronToolOfHInter_Dump(*args):
	return IntCurveSurface_ThePolyhedronToolOfHInter.Dump(*args)

@deprecated
def IntCurveSurface_ThePolyhedronToolOfHInter_GetBorderDeflection(*args):
	return IntCurveSurface_ThePolyhedronToolOfHInter.GetBorderDeflection(*args)

@deprecated
def IntCurveSurface_ThePolyhedronToolOfHInter_IsOnBound(*args):
	return IntCurveSurface_ThePolyhedronToolOfHInter.IsOnBound(*args)

@deprecated
def IntCurveSurface_ThePolyhedronToolOfHInter_NbTriangles(*args):
	return IntCurveSurface_ThePolyhedronToolOfHInter.NbTriangles(*args)

@deprecated
def IntCurveSurface_ThePolyhedronToolOfHInter_Point(*args):
	return IntCurveSurface_ThePolyhedronToolOfHInter.Point(*args)

@deprecated
def IntCurveSurface_ThePolyhedronToolOfHInter_TriConnex(*args):
	return IntCurveSurface_ThePolyhedronToolOfHInter.TriConnex(*args)

@deprecated
def IntCurveSurface_ThePolyhedronToolOfHInter_Triangle(*args):
	return IntCurveSurface_ThePolyhedronToolOfHInter.Triangle(*args)

}
