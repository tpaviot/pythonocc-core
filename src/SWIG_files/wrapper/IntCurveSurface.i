/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_intcurvesurface.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
		/****** IntCurveSurface_Intersection::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
Dump all the fields.
") Dump;
		void Dump();

		/****** IntCurveSurface_Intersection::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns the <done> field.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntCurveSurface_Intersection::IsParallel ******/
		/****** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if curve is parallel or belongs surface This case is recognized only for some pairs of analytical curves and surfaces (plane - line, ...).
") IsParallel;
		Standard_Boolean IsParallel();

		/****** IntCurveSurface_Intersection::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of IntersectionPoint if IsDone returns True. else NotDone is raised.
") NbPoints;
		Standard_Integer NbPoints();

		/****** IntCurveSurface_Intersection::NbSegments ******/
		/****** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of IntersectionSegment if IsDone returns True. else NotDone is raised.
") NbSegments;
		Standard_Integer NbSegments();

		/****** IntCurveSurface_Intersection::Point ******/
		/****** md5 signature: d256d65e02c0791f5559745977a1209e ******/
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
returns the IntersectionPoint of range <Index> raises NotDone if the computation has failed or if the computation has not been done raises OutOfRange if Index is not in the range <1..NbPoints>.
") Point;
		IntCurveSurface_IntersectionPoint Point(const Standard_Integer Index);

		/****** IntCurveSurface_Intersection::Segment ******/
		/****** md5 signature: 7447c62bdef950bcde1897b587756423 ******/
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
returns the IntersectionSegment of range <Index> raises NotDone if the computation has failed or if the computation has not been done raises OutOfRange if Index is not in the range <1..NbSegment>.
") Segment;
		IntCurveSurface_IntersectionSegment Segment(const Standard_Integer Index);

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
		/****** IntCurveSurface_IntersectionPoint::IntCurveSurface_IntersectionPoint ******/
		/****** md5 signature: 294046f74db31153af5c7b60dec13d71 ******/
		%feature("compactdefaultargs") IntCurveSurface_IntersectionPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty Constructor.
") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint();

		/****** IntCurveSurface_IntersectionPoint::IntCurveSurface_IntersectionPoint ******/
		/****** md5 signature: ccaf6da9f784540c7c0813c49dd41e7d ******/
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
Create an IntersectionPoint.
") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint(const gp_Pnt & P, const Standard_Real USurf, const Standard_Real VSurf, const Standard_Real UCurv, const IntCurveSurface_TransitionOnCurve TrCurv);

		/****** IntCurveSurface_IntersectionPoint::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
Dump all the fields.
") Dump;
		void Dump();

		/****** IntCurveSurface_IntersectionPoint::Pnt ******/
		/****** md5 signature: c0bafeed50f4eebb5964e2bf8520bf90 ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
returns the geometric point.
") Pnt;
		const gp_Pnt Pnt();

		/****** IntCurveSurface_IntersectionPoint::SetValues ******/
		/****** md5 signature: 4484a1960ef186062763f9c263178096 ******/
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
Set the fields of the current IntersectionPoint.
") SetValues;
		void SetValues(const gp_Pnt & P, const Standard_Real USurf, const Standard_Real VSurf, const Standard_Real UCurv, const IntCurveSurface_TransitionOnCurve TrCurv);

		/****** IntCurveSurface_IntersectionPoint::Transition ******/
		/****** md5 signature: bd528dc9c78a60a5b26409b8cf4f3afe ******/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Return
-------
IntCurveSurface_TransitionOnCurve

Description
-----------
returns the Transition of the point.
") Transition;
		IntCurveSurface_TransitionOnCurve Transition();

		/****** IntCurveSurface_IntersectionPoint::U ******/
		/****** md5 signature: dd41b21b6ce05c48c2d8d002663816e1 ******/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the U parameter on the surface.
") U;
		Standard_Real U();

		/****** IntCurveSurface_IntersectionPoint::V ******/
		/****** md5 signature: a561db1f9ebb0e926d3862b2e88ce187 ******/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the V parameter on the surface.
") V;
		Standard_Real V();

		/****** IntCurveSurface_IntersectionPoint::Values ******/
		/****** md5 signature: 125307a2c06cc906fe4b9af7cc3b2872 ******/
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
Get the fields of the current IntersectionPoint.
") Values;
		void Values(gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, IntCurveSurface_TransitionOnCurve &OutValue);

		/****** IntCurveSurface_IntersectionPoint::W ******/
		/****** md5 signature: dde24677dd63b48ccacea2fe8006eed7 ******/
		%feature("compactdefaultargs") W;
		%feature("autodoc", "Return
-------
float

Description
-----------
returns the parameter on the curve.
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
		/****** IntCurveSurface_IntersectionSegment::IntCurveSurface_IntersectionSegment ******/
		/****** md5 signature: e40b82f2fd1e0d330e1cdaf22bdaaee8 ******/
		%feature("compactdefaultargs") IntCurveSurface_IntersectionSegment;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntCurveSurface_IntersectionSegment;
		 IntCurveSurface_IntersectionSegment();

		/****** IntCurveSurface_IntersectionSegment::IntCurveSurface_IntersectionSegment ******/
		/****** md5 signature: 7d292660fcf1a1c98b903a4392107993 ******/
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

		/****** IntCurveSurface_IntersectionSegment::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** IntCurveSurface_IntersectionSegment::FirstPoint ******/
		/****** md5 signature: 471c212edfeb4d6747a5d44feb57eaf1 ******/
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

		/****** IntCurveSurface_IntersectionSegment::FirstPoint ******/
		/****** md5 signature: c778c0b569431fdfe6fba1b55c48eac6 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntCurveSurface_IntersectionPoint

Description
-----------
No available documentation.
") FirstPoint;
		IntCurveSurface_IntersectionPoint FirstPoint();

		/****** IntCurveSurface_IntersectionSegment::SecondPoint ******/
		/****** md5 signature: f9e618a1839283d5ae57e523171f81fd ******/
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

		/****** IntCurveSurface_IntersectionSegment::SecondPoint ******/
		/****** md5 signature: bd31bb5df88055a35b2946d35b74fd34 ******/
		%feature("compactdefaultargs") SecondPoint;
		%feature("autodoc", "Return
-------
IntCurveSurface_IntersectionPoint

Description
-----------
No available documentation.
") SecondPoint;
		IntCurveSurface_IntersectionPoint SecondPoint();

		/****** IntCurveSurface_IntersectionSegment::SetValues ******/
		/****** md5 signature: 8c4f62db01e7a648d2d3ac4f7be53b7c ******/
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

		/****** IntCurveSurface_IntersectionSegment::Values ******/
		/****** md5 signature: fa392a8633b815a88ed6a2a2dc438083 ******/
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
		/****** IntCurveSurface_TheCSFunctionOfHInter::IntCurveSurface_TheCSFunctionOfHInter ******/
		/****** md5 signature: 78b033c5aa81abd59886b6aa2483bbd6 ******/
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

		/****** IntCurveSurface_TheCSFunctionOfHInter::AuxillarCurve ******/
		/****** md5 signature: 1f51289ad95c1360f777c3a993b735bb ******/
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") AuxillarCurve;
		const opencascade::handle<Adaptor3d_Curve> & AuxillarCurve();

		/****** IntCurveSurface_TheCSFunctionOfHInter::AuxillarSurface ******/
		/****** md5 signature: b291a5935dc6f37ed5922990c14f0acd ******/
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") AuxillarSurface;
		const opencascade::handle<Adaptor3d_Surface> & AuxillarSurface();

		/****** IntCurveSurface_TheCSFunctionOfHInter::Derivatives ******/
		/****** md5 signature: 80ee5f16e62731c095910ad60228848b ******/
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

		/****** IntCurveSurface_TheCSFunctionOfHInter::NbEquations ******/
		/****** md5 signature: 42be0dc2e32c8e563393e8490171707e ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		Standard_Integer NbEquations();

		/****** IntCurveSurface_TheCSFunctionOfHInter::NbVariables ******/
		/****** md5 signature: a3de6b8a577fc113199e11b2b0bcdced ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		Standard_Integer NbVariables();

		/****** IntCurveSurface_TheCSFunctionOfHInter::Point ******/
		/****** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Point;
		const gp_Pnt Point();

		/****** IntCurveSurface_TheCSFunctionOfHInter::Root ******/
		/****** md5 signature: 1f1a437be6bd034392962de6cf04ded1 ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Root;
		Standard_Real Root();

		/****** IntCurveSurface_TheCSFunctionOfHInter::Value ******/
		/****** md5 signature: 31f6ba581b8fae503400d98976418349 ******/
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

		/****** IntCurveSurface_TheCSFunctionOfHInter::Values ******/
		/****** md5 signature: 17c41f2c2b925e9ddfe2f61a9052313c ******/
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
		/****** IntCurveSurface_TheExactHInter::IntCurveSurface_TheExactHInter ******/
		/****** md5 signature: 223895d0a9dc70600c94ab17c6dc65dd ******/
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
compute the solution point with the close point MarginCoef is the coefficient for extension of UV bounds. Ex., UFirst -= MarginCoef*(ULast-UFirst).
") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter(const Standard_Real U, const Standard_Real V, const Standard_Real W, const IntCurveSurface_TheCSFunctionOfHInter & F, const Standard_Real TolTangency, const Standard_Real MarginCoef = 0.0);

		/****** IntCurveSurface_TheExactHInter::IntCurveSurface_TheExactHInter ******/
		/****** md5 signature: 1ab676920576692ff41bf3df7e08260c ******/
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
initialize the parameters to compute the solution.
") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter(const IntCurveSurface_TheCSFunctionOfHInter & F, const Standard_Real TolTangency);

		/****** IntCurveSurface_TheExactHInter::Function ******/
		/****** md5 signature: 87817a81458dd7b55e723924632b4ea1 ******/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return
-------
IntCurveSurface_TheCSFunctionOfHInter

Description
-----------
return the math function which is used to compute the intersection.
") Function;
		IntCurveSurface_TheCSFunctionOfHInter & Function();

		/****** IntCurveSurface_TheExactHInter::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the creation completed without failure.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntCurveSurface_TheExactHInter::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** IntCurveSurface_TheExactHInter::ParameterOnCurve ******/
		/****** md5 signature: ac81682b4b1f0988f8f73835e37144bf ******/
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParameterOnCurve;
		Standard_Real ParameterOnCurve();

		/****** IntCurveSurface_TheExactHInter::ParameterOnSurface ******/
		/****** md5 signature: b1ff2b42bc6096157075c8f0a6c1b6a5 ******/
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

		/****** IntCurveSurface_TheExactHInter::Perform ******/
		/****** md5 signature: 193bc13b7dd6d13fbf6a72a44d7ddd7b ******/
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
compute the solution it's possible to write to optimize: IntImp_IntCS inter(S1,C1,Toltangency) math_FunctionSetRoot rsnld(Inter.function()) while ...{ u=... v=... w=... inter.Perform(u,v,w,rsnld) } or IntImp_IntCS inter(Toltangency) inter.SetSurface(S); math_FunctionSetRoot rsnld(Inter.function()) while ...{ C=... inter.SetCurve(C); u=... v=... w=... inter.Perform(u,v,w,rsnld) }.
") Perform;
		void Perform(const Standard_Real U, const Standard_Real V, const Standard_Real W, math_FunctionSetRoot & Rsnld, const Standard_Real u0, const Standard_Real v0, const Standard_Real u1, const Standard_Real v1, const Standard_Real w0, const Standard_Real w1);

		/****** IntCurveSurface_TheExactHInter::Point ******/
		/****** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
returns the intersection point The exception NotDone is raised if IsDone is false. The exception DomainError is raised if IsEmpty is true.
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
		/****** IntCurveSurface_TheHCurveTool::BSpline ******/
		/****** md5 signature: f2a2c90a0bedf5095eea00c2e107a369 ******/
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

		/****** IntCurveSurface_TheHCurveTool::Bezier ******/
		/****** md5 signature: b42ebe6c926b5fb77a6331705b4963e5 ******/
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

		/****** IntCurveSurface_TheHCurveTool::Circle ******/
		/****** md5 signature: aa9214afb3ea57c15d5f41b39ea0359e ******/
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

		/****** IntCurveSurface_TheHCurveTool::Continuity ******/
		/****** md5 signature: 6a07d78b03295fd033c1463c953b327a ******/
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

		/****** IntCurveSurface_TheHCurveTool::D0 ******/
		/****** md5 signature: 1904835766bb10f31708f629b8bb606d ******/
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
Computes the point of parameter U on the curve.
") D0;
		static void D0(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P);

		/****** IntCurveSurface_TheHCurveTool::D1 ******/
		/****** md5 signature: 354bdf853d601711ce0e15e45fbe03c7 ******/
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
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		static void D1(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****** IntCurveSurface_TheHCurveTool::D2 ******/
		/****** md5 signature: cc9b7dad360ef1436afcb96410e2145a ******/
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
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
") D2;
		static void D2(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** IntCurveSurface_TheHCurveTool::D3 ******/
		/****** md5 signature: e1e4feeb3ea84a4f70c896deb89d59cd ******/
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
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		static void D3(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** IntCurveSurface_TheHCurveTool::DN ******/
		/****** md5 signature: 33fba57fa0e43164542a459fa95cc32b ******/
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
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		static gp_Vec DN(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real U, const Standard_Integer N);

		/****** IntCurveSurface_TheHCurveTool::Ellipse ******/
		/****** md5 signature: de248e1260f87dec86decdd85617a0d4 ******/
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

		/****** IntCurveSurface_TheHCurveTool::FirstParameter ******/
		/****** md5 signature: 065317d1a0ad241cbbf084ece4451980 ******/
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

		/****** IntCurveSurface_TheHCurveTool::GetType ******/
		/****** md5 signature: cb051ca1196d0306cf670dc876af9ad8 ******/
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
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		static GeomAbs_CurveType GetType(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** IntCurveSurface_TheHCurveTool::Hyperbola ******/
		/****** md5 signature: 5d3c9969f2fdc07af59bef8fa5cc0e25 ******/
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

		/****** IntCurveSurface_TheHCurveTool::Intervals ******/
		/****** md5 signature: d5a4bb40cdb6a8b5891abeea0ea89a92 ******/
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
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor3d_Curve> & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** IntCurveSurface_TheHCurveTool::IsClosed ******/
		/****** md5 signature: aeb1d7388bc1c1c6c162cf2bb09b47c3 ******/
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

		/****** IntCurveSurface_TheHCurveTool::IsPeriodic ******/
		/****** md5 signature: b28709e22e2b6eb72c7ae6c9691d26cc ******/
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

		/****** IntCurveSurface_TheHCurveTool::LastParameter ******/
		/****** md5 signature: ddc56989a2eb226d2e27c5454157f912 ******/
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

		/****** IntCurveSurface_TheHCurveTool::Line ******/
		/****** md5 signature: 81850752bdbb876955439b815e391b19 ******/
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

		/****** IntCurveSurface_TheHCurveTool::NbIntervals ******/
		/****** md5 signature: 3aacda9f1e126d5751d268b46a4f7576 ******/
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
Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>.
") NbIntervals;
		static Standard_Integer NbIntervals(const opencascade::handle<Adaptor3d_Curve> & C, const GeomAbs_Shape S);

		/****** IntCurveSurface_TheHCurveTool::NbSamples ******/
		/****** md5 signature: b050222a5e2dbdd07a79f2aec3a93db5 ******/
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

		/****** IntCurveSurface_TheHCurveTool::Parabola ******/
		/****** md5 signature: cd5041b75a0e8fd63a8ea0db7fdf8b69 ******/
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

		/****** IntCurveSurface_TheHCurveTool::Period ******/
		/****** md5 signature: c1952c704f70b1bcad49c5690ca1f85f ******/
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

		/****** IntCurveSurface_TheHCurveTool::Resolution ******/
		/****** md5 signature: a30595435b718ddc527b3d6b86455085 ******/
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
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		static Standard_Real Resolution(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real R3d);

		/****** IntCurveSurface_TheHCurveTool::SamplePars ******/
		/****** md5 signature: 687011ec6271e681eb1f024a48e6210e ******/
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

		/****** IntCurveSurface_TheHCurveTool::Value ******/
		/****** md5 signature: 533412a1a9d91bbfb74754dc0e074a68 ******/
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
Computes the point of parameter U on the curve.
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
		/****** IntCurveSurface_TheInterferenceOfHInter::IntCurveSurface_TheInterferenceOfHInter ******/
		/****** md5 signature: 9f269a49154528a7347174a04e76266a ******/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty interference between Polygon and Polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter();

		/****** IntCurveSurface_TheInterferenceOfHInter::IntCurveSurface_TheInterferenceOfHInter ******/
		/****** md5 signature: 1fc35f3c529bed831144ad885c8bcd10 ******/
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
Constructs and computes an interference between the Polygon and the Polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****** IntCurveSurface_TheInterferenceOfHInter::IntCurveSurface_TheInterferenceOfHInter ******/
		/****** md5 signature: fe32be20e5e982616448cb88defb89b5 ******/
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
Constructs and computes an interference between the Straight Line and the Polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const gp_Lin & theLin, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****** IntCurveSurface_TheInterferenceOfHInter::IntCurveSurface_TheInterferenceOfHInter ******/
		/****** md5 signature: c482c24d732ca7f0ebaa5ccf5267a806 ******/
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
Constructs and computes an interference between the Straight Lines and the Polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const Intf_Array1OfLin & theLins, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****** IntCurveSurface_TheInterferenceOfHInter::IntCurveSurface_TheInterferenceOfHInter ******/
		/****** md5 signature: cb2d29a8a9436369c974bf35e252c9c8 ******/
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
Constructs and computes an interference between the Polygon and the Polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****** IntCurveSurface_TheInterferenceOfHInter::IntCurveSurface_TheInterferenceOfHInter ******/
		/****** md5 signature: a02b9243d7dc4d63ca46b7f379fad3ad ******/
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
Constructs and computes an interference between the Straight Line and the Polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const gp_Lin & theLin, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****** IntCurveSurface_TheInterferenceOfHInter::IntCurveSurface_TheInterferenceOfHInter ******/
		/****** md5 signature: 4a140f601a5623b0babeabfacd1f2833 ******/
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
Constructs and computes an interference between the Straight Lines and the Polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const Intf_Array1OfLin & theLins, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****** IntCurveSurface_TheInterferenceOfHInter::Interference ******/
		/****** md5 signature: 6bf066120f0891c84d5b834298c9fef9 ******/
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
Compares the boundings between the segment of <thePolyg> and the facets of <thePolyh>.
") Interference;
		void Interference(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****** IntCurveSurface_TheInterferenceOfHInter::Interference ******/
		/****** md5 signature: 9ea4eb36ee606512c95071a99b2423ec ******/
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
Compares the boundings between the segment of <thePolyg> and the facets of <thePolyh>.
") Interference;
		void Interference(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****** IntCurveSurface_TheInterferenceOfHInter::Perform ******/
		/****** md5 signature: e1b28d497c638075aab91ce35fe79a4d ******/
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
Computes an interference between the Polygon and the Polyhedron.
") Perform;
		void Perform(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****** IntCurveSurface_TheInterferenceOfHInter::Perform ******/
		/****** md5 signature: a85b72f95f52030e4e25015fce186d02 ******/
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
Computes an interference between the Straight Line and the Polyhedron.
") Perform;
		void Perform(const gp_Lin & theLin, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****** IntCurveSurface_TheInterferenceOfHInter::Perform ******/
		/****** md5 signature: 51d211e4e454f4ac60fa5f4e78cf27c5 ******/
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
Computes an interference between the Straight Lines and the Polyhedron.
") Perform;
		void Perform(const Intf_Array1OfLin & theLins, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****** IntCurveSurface_TheInterferenceOfHInter::Perform ******/
		/****** md5 signature: 69eb7cb92ebac1fb15f3a670084d267d ******/
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
Computes an interference between the Polygon and the Polyhedron.
") Perform;
		void Perform(const IntCurveSurface_ThePolygonOfHInter & thePolyg, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****** IntCurveSurface_TheInterferenceOfHInter::Perform ******/
		/****** md5 signature: 8563dc0d18a2f310c361109a23301a8f ******/
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
Computes an interference between the Straight Line and the Polyhedron.
") Perform;
		void Perform(const gp_Lin & theLin, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

		/****** IntCurveSurface_TheInterferenceOfHInter::Perform ******/
		/****** md5 signature: 4c5038f0fe76add60e56a6105b83d1ea ******/
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
Computes an interference between the Straight Lines and the Polyhedron.
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
		/****** IntCurveSurface_ThePolygonOfHInter::IntCurveSurface_ThePolygonOfHInter ******/
		/****** md5 signature: 8607fc4d81bccabc25390ed85263028a ******/
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

		/****** IntCurveSurface_ThePolygonOfHInter::IntCurveSurface_ThePolygonOfHInter ******/
		/****** md5 signature: cfc389022764ab206816e49acf0b9b59 ******/
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

		/****** IntCurveSurface_ThePolygonOfHInter::IntCurveSurface_ThePolygonOfHInter ******/
		/****** md5 signature: 4b3c71047f9b5f23656b10d928f193be ******/
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

		/****** IntCurveSurface_ThePolygonOfHInter::ApproxParamOnCurve ******/
		/****** md5 signature: ea6b1c4f19abd104ce26cf986e38bc0b ******/
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
Give an approximation of the parameter on the curve according to the discretization of the Curve.
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve(const Standard_Integer Index, const Standard_Real ParamOnLine);

		/****** IntCurveSurface_ThePolygonOfHInter::BeginOfSeg ******/
		/****** md5 signature: d9c773bc099d0d92cc222653e8226d5e ******/
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
Give the point of range Index in the Polygon.
") BeginOfSeg;
		const gp_Pnt BeginOfSeg(const Standard_Integer theIndex);

		/****** IntCurveSurface_ThePolygonOfHInter::Bounding ******/
		/****** md5 signature: 54ccbf8f63f02bb43c2fc9c718922d78 ******/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
Give the bounding box of the polygon.
") Bounding;
		const Bnd_Box & Bounding();

		/****** IntCurveSurface_ThePolygonOfHInter::Closed ******/
		/****** md5 signature: e853f3a0de69f6e7f92ebd8ac1362e0c ******/
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

		/****** IntCurveSurface_ThePolygonOfHInter::Closed ******/
		/****** md5 signature: f94551c898fe323903f1d14861bbe901 ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Closed;
		Standard_Boolean Closed();

		/****** IntCurveSurface_ThePolygonOfHInter::DeflectionOverEstimation ******/
		/****** md5 signature: b4c80a54735f171bb52e56c083257109 ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation();

		/****** IntCurveSurface_ThePolygonOfHInter::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** IntCurveSurface_ThePolygonOfHInter::EndOfSeg ******/
		/****** md5 signature: fa65a7dd84749b3192eff93d48f5b1d6 ******/
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
Give the point of range Index in the Polygon.
") EndOfSeg;
		const gp_Pnt EndOfSeg(const Standard_Integer theIndex);

		/****** IntCurveSurface_ThePolygonOfHInter::InfParameter ******/
		/****** md5 signature: f596238a0398d517210e4fad0d4b84b2 ******/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter (On the curve) of the first point of the Polygon.
") InfParameter;
		Standard_Real InfParameter();

		/****** IntCurveSurface_ThePolygonOfHInter::NbSegments ******/
		/****** md5 signature: 9f8199ef0d5690074e4037e7feba62da ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of Segments in the polyline.
") NbSegments;
		Standard_Integer NbSegments();

		/****** IntCurveSurface_ThePolygonOfHInter::SetDeflectionOverEstimation ******/
		/****** md5 signature: 872cf63726ece2c3b812a597bb60fe29 ******/
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

		/****** IntCurveSurface_ThePolygonOfHInter::SupParameter ******/
		/****** md5 signature: 688f110f02a5711ae550904ec8e3220d ******/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter (On the curve) of the last point of the Polygon.
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
		/****** IntCurveSurface_ThePolygonToolOfHInter::BeginOfSeg ******/
		/****** md5 signature: c3ce8d71b99130386b371f37d249b1c2 ******/
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
Give the point of range Index in the Polygon.
") BeginOfSeg;
		static const gp_Pnt BeginOfSeg(const IntCurveSurface_ThePolygonOfHInter & thePolygon, const Standard_Integer Index);

		/****** IntCurveSurface_ThePolygonToolOfHInter::Bounding ******/
		/****** md5 signature: 2d8a88eea83f895f9a0709d892b00faa ******/
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

		/****** IntCurveSurface_ThePolygonToolOfHInter::Closed ******/
		/****** md5 signature: fa65dc78037adcd44ed4a44d893cab0a ******/
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

		/****** IntCurveSurface_ThePolygonToolOfHInter::DeflectionOverEstimation ******/
		/****** md5 signature: 1c23357db2c1501e81a046c3c9b6eb3d ******/
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

		/****** IntCurveSurface_ThePolygonToolOfHInter::Dump ******/
		/****** md5 signature: 9966370870a318adeb703c8d631ca2b8 ******/
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

		/****** IntCurveSurface_ThePolygonToolOfHInter::EndOfSeg ******/
		/****** md5 signature: a659f74ed9f2eaed8ffda44c22ad74da ******/
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
Give the point of range Index in the Polygon.
") EndOfSeg;
		static const gp_Pnt EndOfSeg(const IntCurveSurface_ThePolygonOfHInter & thePolygon, const Standard_Integer Index);

		/****** IntCurveSurface_ThePolygonToolOfHInter::NbSegments ******/
		/****** md5 signature: 69db76ba53411856428bd7f75b3c1833 ******/
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
		/****** IntCurveSurface_ThePolyhedronToolOfHInter::Bounding ******/
		/****** md5 signature: b831938a9c6064b113ea9dcbbaacd0d7 ******/
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
Give the bounding box of the PolyhedronTool.
") Bounding;
		static const Bnd_Box & Bounding(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****** IntCurveSurface_ThePolyhedronToolOfHInter::ComponentsBounding ******/
		/****** md5 signature: 761297bd30540845381cd002f5cd3092 ******/
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
Give the array of boxes. The box <n> corresponding to the triangle <n>.
") ComponentsBounding;
		static const opencascade::handle<Bnd_HArray1OfBox> & ComponentsBounding(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****** IntCurveSurface_ThePolyhedronToolOfHInter::DeflectionOverEstimation ******/
		/****** md5 signature: 12ee30a0552628992c8694e5e537d220 ******/
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

		/****** IntCurveSurface_ThePolyhedronToolOfHInter::Dump ******/
		/****** md5 signature: a04645c47ddce194e67fff3da32e9074 ******/
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

		/****** IntCurveSurface_ThePolyhedronToolOfHInter::GetBorderDeflection ******/
		/****** md5 signature: 6e6e6b15c436ca7e936bf316e36c39b8 ******/
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

		/****** IntCurveSurface_ThePolyhedronToolOfHInter::IsOnBound ******/
		/****** md5 signature: cbbd7a99516fc080c7522ed924cf9a8b ******/
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
This method returns true if the edge based on points with indices Index1 and Index2 represents a boundary edge. It is necessary to take into account the boundary deflection for this edge.
") IsOnBound;
		static Standard_Boolean IsOnBound(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, const Standard_Integer Index1, const Standard_Integer Index2);

		/****** IntCurveSurface_ThePolyhedronToolOfHInter::NbTriangles ******/
		/****** md5 signature: bdd670f00f0a5edcddc9ab980b962494 ******/
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

		/****** IntCurveSurface_ThePolyhedronToolOfHInter::Point ******/
		/****** md5 signature: 52a78c4f8cd34c4673e1816fe02109c7 ******/
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

		/****** IntCurveSurface_ThePolyhedronToolOfHInter::TriConnex ******/
		/****** md5 signature: a3ad5c2542c00278319177801a1d1337 ******/
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
Give the address Tricon of the triangle connexe to the triangle of address Triang by the edge Pivot Pedge and the third point of this connexe triangle. When we are on a free edge TriCon==0 but the function return the value of the triangle in the other side of Pivot on the free edge. Used to turn around a vertex.
") TriConnex;
		static Standard_Integer TriConnex(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, const Standard_Integer Triang, const Standard_Integer Pivot, const Standard_Integer Pedge, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** IntCurveSurface_ThePolyhedronToolOfHInter::Triangle ******/
		/****** md5 signature: 18708030ea56c11d997b59c6e831ccb4 ******/
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
Give the indices of the 3 points of the triangle of address Index in the PolyhedronTool.
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
		/****** IntCurveSurface_TheQuadCurvExactHInter::IntCurveSurface_TheQuadCurvExactHInter ******/
		/****** md5 signature: ac7dcc5c45368df4f5d35e48176ea6f2 ******/
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
Provides the signed distance function: Q(w) and its first derivative dQ(w)/dw.
") IntCurveSurface_TheQuadCurvExactHInter;
		 IntCurveSurface_TheQuadCurvExactHInter(const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & C);

		/****** IntCurveSurface_TheQuadCurvExactHInter::Intervals ******/
		/****** md5 signature: a19f8bd23050233003b16b9179a07a15 ******/
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
U1 and U2 are the parameters of a segment on the curve.
") Intervals;
		void Intervals(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntCurveSurface_TheQuadCurvExactHInter::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntCurveSurface_TheQuadCurvExactHInter::NbIntervals ******/
		/****** md5 signature: 64f54fde4d9752772b52d73d27261bcb ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbIntervals;
		Standard_Integer NbIntervals();

		/****** IntCurveSurface_TheQuadCurvExactHInter::NbRoots ******/
		/****** md5 signature: d23dc5b5f7fe61d6b998e72ba9eb27b3 ******/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbRoots;
		Standard_Integer NbRoots();

		/****** IntCurveSurface_TheQuadCurvExactHInter::Root ******/
		/****** md5 signature: 2e5be20bda2ce764c489750fb301f80e ******/
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
		/****** IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter::IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter ******/
		/****** md5 signature: e819d921f7ec4605895d1bc1c29e38ff ******/
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

		/****** IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter::Derivative ******/
		/****** md5 signature: f61c873331fa555e182f1973e95f59da ******/
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
Computes the derivative of the previous function at parameter Param. Derivative always returns True.
") Derivative;
		Standard_Boolean Derivative(const Standard_Real Param, Standard_Real &OutValue);

		/****** IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter::Value ******/
		/****** md5 signature: 96999dda9fe43560f6ec0c3dc2a0f930 ******/
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
Computes the value of the signed distance between the implicit surface and the point at parameter Param on the parametrised curve. Value always returns True.
") Value;
		Standard_Boolean Value(const Standard_Real Param, Standard_Real &OutValue);

		/****** IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter::Values ******/
		/****** md5 signature: 30b6c9e0ecc359e02c44e042b54e6b7c ******/
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
Computes the value and the derivative of the function. returns True.
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
		/****** IntCurveSurface_HInter::IntCurveSurface_HInter ******/
		/****** md5 signature: 61b0224e89e874efcc8cd5e2b7e1420a ******/
		%feature("compactdefaultargs") IntCurveSurface_HInter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty Constructor.
") IntCurveSurface_HInter;
		 IntCurveSurface_HInter();

		/****** IntCurveSurface_HInter::Perform ******/
		/****** md5 signature: 91c228b2481819fc2df45ad4cfb0ffe0 ******/
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
Compute the Intersection between the curve and the surface.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & Curve, const opencascade::handle<Adaptor3d_Surface> & Surface);

		/****** IntCurveSurface_HInter::Perform ******/
		/****** md5 signature: 5c682ee95377c875d30f6e459fdd7a63 ******/
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
Compute the Intersection between the curve and the surface. The Curve is already sampled and its polygon: <Polygon> is given.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & Curve, const IntCurveSurface_ThePolygonOfHInter & Polygon, const opencascade::handle<Adaptor3d_Surface> & Surface);

		/****** IntCurveSurface_HInter::Perform ******/
		/****** md5 signature: e7d1708684046cf89a0658d9b54e4548 ******/
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
Compute the Intersection between the curve and the surface. The Curve is already sampled and its polygon: <Polygon> is given. The Surface is also sampled and <Polyhedron> is given.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & Curve, const IntCurveSurface_ThePolygonOfHInter & ThePolygon, const opencascade::handle<Adaptor3d_Surface> & Surface, const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron);

		/****** IntCurveSurface_HInter::Perform ******/
		/****** md5 signature: 5b00a27700d57fa276f88e27a3f76726 ******/
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
Compute the Intersection between the curve and the surface. The Curve is already sampled and its polygon: <Polygon> is given. The Surface is also sampled and <Polyhedron> is given.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & Curve, const IntCurveSurface_ThePolygonOfHInter & ThePolygon, const opencascade::handle<Adaptor3d_Surface> & Surface, const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron, Bnd_BoundSortBox & BndBSB);

		/****** IntCurveSurface_HInter::Perform ******/
		/****** md5 signature: e29fe9ea101d6584c14df774972d4b0d ******/
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
Compute the Intersection between the curve and the surface. The Surface is already sampled and its polyhedron: <Polyhedron> is given.
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
