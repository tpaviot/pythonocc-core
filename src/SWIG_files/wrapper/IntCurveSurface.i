/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_intcurvesurface.html"
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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns the <done> field.
") IsDone;
		bool IsDone();

		/****** IntCurveSurface_Intersection::IsParallel ******/
		/****** md5 signature: 25d4ac955341335e2fbcc4e3737ea518 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if curve is parallel or belongs surface This case is recognized only for some pairs of analytical curves and surfaces (plane - line, ...).
") IsParallel;
		bool IsParallel();

		/****** IntCurveSurface_Intersection::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of IntersectionPoint if IsDone returns True. else NotDone is raised.
") NbPoints;
		int NbPoints();

		/****** IntCurveSurface_Intersection::NbSegments ******/
		/****** md5 signature: 9aee6c2253f8ba296b560fdee30e17ad ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of IntersectionSegment if IsDone returns True. else NotDone is raised.
") NbSegments;
		int NbSegments();

		/****** IntCurveSurface_Intersection::Point ******/
		/****** md5 signature: 59000dcaae2246109b20c8634724f06c ******/
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
		IntCurveSurface_IntersectionPoint Point(const int Index);

		/****** IntCurveSurface_Intersection::Segment ******/
		/****** md5 signature: 5c1325b26a75b4cbd4589e92e42ae686 ******/
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
		IntCurveSurface_IntersectionSegment Segment(const int Index);

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
		/****** md5 signature: f131a6ad07f06bdcc4ae4cf17d6daf97 ******/
		%feature("compactdefaultargs") IntCurveSurface_IntersectionPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
USurf: double
VSurf: double
UCurv: double
TrCurv: IntCurveSurface_TransitionOnCurve

Return
-------
None

Description
-----------
Create an IntersectionPoint.
") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint(const gp_Pnt & P, const double USurf, const double VSurf, const double UCurv, const IntCurveSurface_TransitionOnCurve TrCurv);

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
		/****** md5 signature: a837281e3d678870fa690b0996d2371c ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
USurf: double
VSurf: double
UCurv: double
TrCurv: IntCurveSurface_TransitionOnCurve

Return
-------
None

Description
-----------
Set the fields of the current IntersectionPoint.
") SetValues;
		void SetValues(const gp_Pnt & P, const double USurf, const double VSurf, const double UCurv, const IntCurveSurface_TransitionOnCurve TrCurv);

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
		/****** md5 signature: 24a52b75fd4611a4a916df4a2ae4ce79 ******/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the U parameter on the surface.
") U;
		double U();

		/****** IntCurveSurface_IntersectionPoint::V ******/
		/****** md5 signature: 9cf199b5c48f75fe3b18269f74bd944d ******/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the V parameter on the surface.
") V;
		double V();

		/****** IntCurveSurface_IntersectionPoint::Values ******/
		/****** md5 signature: 6766346f46da935402da24cf55143472 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
USurf: double
VSurf: double
UCurv: double
TrCurv: IntCurveSurface_TransitionOnCurve

Description
-----------
Get the fields of the current IntersectionPoint.
") Values;
		void Values(gp_Pnt & P, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, IntCurveSurface_TransitionOnCurve &OutValue);

		/****** IntCurveSurface_IntersectionPoint::W ******/
		/****** md5 signature: cbc50f6628b29f2a86ad0521bdf9bc53 ******/
		%feature("compactdefaultargs") W;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the parameter on the curve.
") W;
		double W();

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
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** IntCurveSurface_TheCSFunctionOfHInter::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		int NbEquations();

		/****** IntCurveSurface_TheCSFunctionOfHInter::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

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
		/****** md5 signature: 4cac472ec2e8bbc115a694c59e4b1b4e ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Root;
		double Root();

		/****** IntCurveSurface_TheCSFunctionOfHInter::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** IntCurveSurface_TheCSFunctionOfHInter::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 702c086fb5eddff760ee7f495a78624b ******/
		%feature("compactdefaultargs") IntCurveSurface_TheExactHInter;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
W: double
F: IntCurveSurface_TheCSFunctionOfHInter
TolTangency: double
MarginCoef: double (optional, default to 0.0)

Return
-------
None

Description
-----------
compute the solution point with the close point MarginCoef is the coefficient for extension of UV bounds. Ex., UFirst -= MarginCoef*(ULast-UFirst).
") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter(const double U, const double V, const double W, const IntCurveSurface_TheCSFunctionOfHInter & F, const double TolTangency, const double MarginCoef = 0.0);

		/****** IntCurveSurface_TheExactHInter::IntCurveSurface_TheExactHInter ******/
		/****** md5 signature: 2e99f07ebf6d505e6e344e05f80d6ab2 ******/
		%feature("compactdefaultargs") IntCurveSurface_TheExactHInter;
		%feature("autodoc", "
Parameters
----------
F: IntCurveSurface_TheCSFunctionOfHInter
TolTangency: double

Return
-------
None

Description
-----------
initialize the parameters to compute the solution.
") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter(const IntCurveSurface_TheCSFunctionOfHInter & F, const double TolTangency);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the creation completed without failure.
") IsDone;
		bool IsDone();

		/****** IntCurveSurface_TheExactHInter::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		bool IsEmpty();

		/****** IntCurveSurface_TheExactHInter::ParameterOnCurve ******/
		/****** md5 signature: 57f5295e1d0243d744a43fcea3cf7388 ******/
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ParameterOnCurve;
		double ParameterOnCurve();

		/****** IntCurveSurface_TheExactHInter::ParameterOnSurface ******/
		/****** md5 signature: 7f31eb7c473aecf695130da66c37cc8a ******/
		%feature("compactdefaultargs") ParameterOnSurface;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: double
V: double

Description
-----------
No available documentation.
") ParameterOnSurface;
		void ParameterOnSurface(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntCurveSurface_TheExactHInter::Perform ******/
		/****** md5 signature: 32414faba82bb6739429b692c1146008 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
W: double
Rsnld: math_FunctionSetRoot
u0: double
v0: double
u1: double
v1: double
w0: double
w1: double

Return
-------
None

Description
-----------
compute the solution it's possible to write to optimize: IntImp_IntCS inter(S1,C1,Toltangency) math_FunctionSetRoot rsnld(Inter.function()) while ...{ u=... v=... w=... inter.Perform(u,v,w,rsnld) } or IntImp_IntCS inter(Toltangency) inter.SetSurface(S); math_FunctionSetRoot rsnld(Inter.function()) while ...{ C=... inter.SetCurve(C); u=... v=... w=... inter.Perform(u,v,w,rsnld) }.
") Perform;
		void Perform(const double U, const double V, const double W, math_FunctionSetRoot & Rsnld, const double u0, const double v0, const double u1, const double v1, const double w0, const double w1);

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
		/****** md5 signature: c4c9abda4b04307222fd06dbc649edcb ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: double
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		static void D0(const opencascade::handle<Adaptor3d_Curve> & C, const double U, gp_Pnt & P);

		/****** IntCurveSurface_TheHCurveTool::D1 ******/
		/****** md5 signature: 383cbf11f3a05591215ff3345f427822 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: double
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		static void D1(const opencascade::handle<Adaptor3d_Curve> & C, const double U, gp_Pnt & P, gp_Vec & V);

		/****** IntCurveSurface_TheHCurveTool::D2 ******/
		/****** md5 signature: 9cb6049109401bde84aae23bb5afad0a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: double
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
		static void D2(const opencascade::handle<Adaptor3d_Curve> & C, const double U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** IntCurveSurface_TheHCurveTool::D3 ******/
		/****** md5 signature: 8fd0cbbb81e20416668374e0d0902fcc ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: double
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
		static void D3(const opencascade::handle<Adaptor3d_Curve> & C, const double U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** IntCurveSurface_TheHCurveTool::DN ******/
		/****** md5 signature: c475e77fa460933ae409b29cb01e970b ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: double
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		static gp_Vec DN(const opencascade::handle<Adaptor3d_Curve> & C, const double U, const int N);

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
		/****** md5 signature: c303245480149ff265cc4b53afa4b717 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		static double FirstParameter(const opencascade::handle<Adaptor3d_Curve> & C);

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
		/****** md5 signature: e9fd5b5356455eead7005cf798fdbcc6 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor3d_Curve> & C, NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** IntCurveSurface_TheHCurveTool::IsClosed ******/
		/****** md5 signature: b229007a72b110f368a977486fc9b60b ******/
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
		static bool IsClosed(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** IntCurveSurface_TheHCurveTool::IsPeriodic ******/
		/****** md5 signature: 3063547102afe5d6e2aa4aceb60165e4 ******/
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
		static bool IsPeriodic(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** IntCurveSurface_TheHCurveTool::LastParameter ******/
		/****** md5 signature: 5ce70a8541f7a3dc8fd0ebffdfb69f45 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		static double LastParameter(const opencascade::handle<Adaptor3d_Curve> & C);

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
		/****** md5 signature: 299712a3abb65ab93eeaa449a3885334 ******/
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
		static int NbIntervals(const opencascade::handle<Adaptor3d_Curve> & C, const GeomAbs_Shape S);

		/****** IntCurveSurface_TheHCurveTool::NbSamples ******/
		/****** md5 signature: 1cd7024b658dee50eb25704471421ead ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U0: double
U1: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static int NbSamples(const opencascade::handle<Adaptor3d_Curve> & C, const double U0, const double U1);

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
		/****** md5 signature: 0ae0eb32c4eff7c382765eda0b120ba4 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
double

Description
-----------
No available documentation.
") Period;
		static double Period(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** IntCurveSurface_TheHCurveTool::Resolution ******/
		/****** md5 signature: 6f399c364a8363f505be7715add4af69 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
R3d: double

Return
-------
double

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		static double Resolution(const opencascade::handle<Adaptor3d_Curve> & C, const double R3d);

		/****** IntCurveSurface_TheHCurveTool::SamplePars ******/
		/****** md5 signature: 574c3376bd1e8f8fe03e0b9b1c97066c ******/
		%feature("compactdefaultargs") SamplePars;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U0: double
U1: double
Defl: double
NbMin: int

Return
-------
opencascade::handle<NCollection_HArray1<double>>

Description
-----------
Returns sample parameters for the curve within [U0, U1] range, computed based on deflection and minimum number of points. 
Input parameter: C the curve adaptor 
Input parameter: U0 start parameter 
Input parameter: U1 end parameter 
Input parameter: Defl deflection tolerance 
Input parameter: NbMin minimum number of sample points 
Return: array of sample parameter values.
") SamplePars;
		static opencascade::handle<NCollection_HArray1<double>> SamplePars(const opencascade::handle<Adaptor3d_Curve> & C, const double U0, const double U1, const double Defl, const int NbMin);

		/****** IntCurveSurface_TheHCurveTool::SamplePars ******/
		/****** md5 signature: 04ef48e8971fdba663161152af15047f ******/
		%feature("compactdefaultargs") SamplePars;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U0: double
U1: double
Defl: double
NbMin: int
Pars: NCollection_HArray1<double

Return
-------
None

Description
-----------
No available documentation.
") SamplePars;
		static void SamplePars(const opencascade::handle<Adaptor3d_Curve> & C, const double U0, const double U1, const double Defl, const int NbMin, opencascade::handle<NCollection_HArray1<double> > & Pars);

		/****** IntCurveSurface_TheHCurveTool::Value ******/
		/****** md5 signature: 12d50f41171920cb7684ceb1b87ec20a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
U: double

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		static gp_Pnt Value(const opencascade::handle<Adaptor3d_Curve> & C, const double U);

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
		/****** md5 signature: 34dc36fe5fc52042e32794555cc419d0 ******/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "
Parameters
----------
theLins: NCollection_Array1<gp_Lin>
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
None

Description
-----------
Constructs and computes an interference between the Straight Lines and the Polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const NCollection_Array1<gp_Lin> & theLins, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

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
		/****** md5 signature: 3a820f76c34a442a5982cb6c64217495 ******/
		%feature("compactdefaultargs") IntCurveSurface_TheInterferenceOfHInter;
		%feature("autodoc", "
Parameters
----------
theLins: NCollection_Array1<gp_Lin>
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Constructs and computes an interference between the Straight Lines and the Polyhedron.
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter(const NCollection_Array1<gp_Lin> & theLins, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

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
		/****** md5 signature: c6489d51187ac5da816be4e019ad30b8 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theLins: NCollection_Array1<gp_Lin>
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
None

Description
-----------
Computes an interference between the Straight Lines and the Polyhedron.
") Perform;
		void Perform(const NCollection_Array1<gp_Lin> & theLins, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

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
		/****** md5 signature: dbd67b050ced475a62ba506ced64a7fd ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theLins: NCollection_Array1<gp_Lin>
thePolyh: IntCurveSurface_ThePolyhedronOfHInter
theBoundSB: Bnd_BoundSortBox

Return
-------
None

Description
-----------
Computes an interference between the Straight Lines and the Polyhedron.
") Perform;
		void Perform(const NCollection_Array1<gp_Lin> & theLins, const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, Bnd_BoundSortBox & theBoundSB);

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
		/****** md5 signature: a56438313eed87fc34111bfd1ab94642 ******/
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
		 IntCurveSurface_ThePolygonOfHInter(const opencascade::handle<Adaptor3d_Curve> & Curve, const int NbPnt);

		/****** IntCurveSurface_ThePolygonOfHInter::IntCurveSurface_ThePolygonOfHInter ******/
		/****** md5 signature: f5b578f805c61bec123d5695f57e4593 ******/
		%feature("compactdefaultargs") IntCurveSurface_ThePolygonOfHInter;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
U1: double
U2: double
NbPnt: int

Return
-------
None

Description
-----------
No available documentation.
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter(const opencascade::handle<Adaptor3d_Curve> & Curve, const double U1, const double U2, const int NbPnt);

		/****** IntCurveSurface_ThePolygonOfHInter::IntCurveSurface_ThePolygonOfHInter ******/
		/****** md5 signature: d71b648697855d4baac2897cdb1d5578 ******/
		%feature("compactdefaultargs") IntCurveSurface_ThePolygonOfHInter;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
Upars: NCollection_Array1<double>

Return
-------
None

Description
-----------
No available documentation.
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter(const opencascade::handle<Adaptor3d_Curve> & Curve, const NCollection_Array1<double> & Upars);

		/****** IntCurveSurface_ThePolygonOfHInter::ApproxParamOnCurve ******/
		/****** md5 signature: 520ca19aee00f08506bff5bce4928594 ******/
		%feature("compactdefaultargs") ApproxParamOnCurve;
		%feature("autodoc", "
Parameters
----------
Index: int
ParamOnLine: double

Return
-------
double

Description
-----------
Give an approximation of the parameter on the curve according to the discretization of the Curve.
") ApproxParamOnCurve;
		double ApproxParamOnCurve(const int Index, const double ParamOnLine);

		/****** IntCurveSurface_ThePolygonOfHInter::BeginOfSeg ******/
		/****** md5 signature: b5f0a31ca14db0a2f84ebff20a6aa499 ******/
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
		const gp_Pnt BeginOfSeg(const int theIndex);

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
		/****** md5 signature: 81313c484636cef829aac0b752efb72e ******/
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
		void Closed(const bool flag);

		/****** IntCurveSurface_ThePolygonOfHInter::Closed ******/
		/****** md5 signature: 8fa7f82a3a97ae7fb9544764f500c779 ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Closed;
		bool Closed();

		/****** IntCurveSurface_ThePolygonOfHInter::DeflectionOverEstimation ******/
		/****** md5 signature: 414fb811f991fcfbdeae5077c8f62bef ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") DeflectionOverEstimation;
		double DeflectionOverEstimation();

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
		/****** md5 signature: dc55838f0a8bf871ed662c6fdbf445f0 ******/
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
		const gp_Pnt EndOfSeg(const int theIndex);

		/****** IntCurveSurface_ThePolygonOfHInter::InfParameter ******/
		/****** md5 signature: 5220389c34cc0aa1dc89c36017792ac2 ******/
		%feature("compactdefaultargs") InfParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter (On the curve) of the first point of the Polygon.
") InfParameter;
		double InfParameter();

		/****** IntCurveSurface_ThePolygonOfHInter::NbSegments ******/
		/****** md5 signature: a484f4ef51493a5d103a692e844665ba ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of Segments in the polyline.
") NbSegments;
		int NbSegments();

		/****** IntCurveSurface_ThePolygonOfHInter::SetDeflectionOverEstimation ******/
		/****** md5 signature: 1dc358280ad6b7d445cb3da24d8ffaf3 ******/
		%feature("compactdefaultargs") SetDeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
x: double

Return
-------
None

Description
-----------
No available documentation.
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation(const double x);

		/****** IntCurveSurface_ThePolygonOfHInter::SupParameter ******/
		/****** md5 signature: c9a151df103c425bae261f99509e51b2 ******/
		%feature("compactdefaultargs") SupParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter (On the curve) of the last point of the Polygon.
") SupParameter;
		double SupParameter();

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
		/****** md5 signature: fd0ec0ee504d04f5499c215b36f836aa ******/
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
		static const gp_Pnt BeginOfSeg(const IntCurveSurface_ThePolygonOfHInter & thePolygon, const int Index);

		/****** IntCurveSurface_ThePolygonToolOfHInter::Bounding ******/
		/****** md5 signature: 63bfbd5bca4f7c2214c55ed4626758e2 ******/
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
		/****** md5 signature: a5f267b8437a01ea2f41d460d1a1a77a ******/
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
		static bool Closed(const IntCurveSurface_ThePolygonOfHInter & thePolygon);

		/****** IntCurveSurface_ThePolygonToolOfHInter::DeflectionOverEstimation ******/
		/****** md5 signature: 697a7f1c546617dc3fd977191bbcd29f ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
thePolygon: IntCurveSurface_ThePolygonOfHInter

Return
-------
double

Description
-----------
No available documentation.
") DeflectionOverEstimation;
		static double DeflectionOverEstimation(const IntCurveSurface_ThePolygonOfHInter & thePolygon);

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
		/****** md5 signature: 6688698d2489e949487b80074a20ded6 ******/
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
		static const gp_Pnt EndOfSeg(const IntCurveSurface_ThePolygonOfHInter & thePolygon, const int Index);

		/****** IntCurveSurface_ThePolygonToolOfHInter::NbSegments ******/
		/****** md5 signature: 99085e70a50d60bca65f46064ff7887c ******/
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
		static int NbSegments(const IntCurveSurface_ThePolygonOfHInter & thePolygon);

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
		/****** md5 signature: b5b15d8c8135dd1774c44082578c9821 ******/
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
		/****** md5 signature: eddf82b173f5db4551f1f8db461ecad8 ******/
		%feature("compactdefaultargs") ComponentsBounding;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
opencascade::handle<NCollection_HArray1<Bnd_Box>>

Description
-----------
Give the array of boxes. The box <n> corresponding to the triangle <n>.
") ComponentsBounding;
		static const opencascade::handle<NCollection_HArray1<Bnd_Box>> & ComponentsBounding(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****** IntCurveSurface_ThePolyhedronToolOfHInter::DeflectionOverEstimation ******/
		/****** md5 signature: 27997ccbd22d587245548e041f4db6c6 ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
double

Description
-----------
Give the tolerance of the polygon.
") DeflectionOverEstimation;
		static double DeflectionOverEstimation(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

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
		/****** md5 signature: 660847fc2a76dd5758598de25b99c89e ******/
		%feature("compactdefaultargs") GetBorderDeflection;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntCurveSurface_ThePolyhedronOfHInter

Return
-------
double

Description
-----------
This method returns a border deflection of the polyhedron.
") GetBorderDeflection;
		static double GetBorderDeflection(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****** IntCurveSurface_ThePolyhedronToolOfHInter::IsOnBound ******/
		/****** md5 signature: bfbaab59d2b6f53b6179927fffa38744 ******/
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
		static bool IsOnBound(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, const int Index1, const int Index2);

		/****** IntCurveSurface_ThePolyhedronToolOfHInter::NbTriangles ******/
		/****** md5 signature: 96206de4306b1400d5e0df729daf7f2f ******/
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
		static int NbTriangles(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);

		/****** IntCurveSurface_ThePolyhedronToolOfHInter::Point ******/
		/****** md5 signature: 8e8291db04c395e8baf102dd26fd76de ******/
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
		static const gp_Pnt Point(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, const int Index);

		/****** IntCurveSurface_ThePolyhedronToolOfHInter::TriConnex ******/
		/****** md5 signature: 0612a0c6b395abd8950c397150c79529 ******/
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
		static int TriConnex(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, const int Triang, const int Pivot, const int Pedge, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** IntCurveSurface_ThePolyhedronToolOfHInter::Triangle ******/
		/****** md5 signature: ca4940b284af85cdf0d0a3285d011df1 ******/
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
		static void Triangle(const IntCurveSurface_ThePolyhedronOfHInter & thePolyh, const int Index, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

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
		/****** md5 signature: bdd6e5353d45148d8c089d86d60d9f07 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
U1: double
U2: double

Description
-----------
U1 and U2 are the parameters of a segment on the curve.
") Intervals;
		void Intervals(const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntCurveSurface_TheQuadCurvExactHInter::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** IntCurveSurface_TheQuadCurvExactHInter::NbIntervals ******/
		/****** md5 signature: 487b014b9cd194c58d109502ca451d5e ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbIntervals;
		int NbIntervals();

		/****** IntCurveSurface_TheQuadCurvExactHInter::NbRoots ******/
		/****** md5 signature: fe443a1190b192943b5fddf45586a22a ******/
		%feature("compactdefaultargs") NbRoots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbRoots;
		int NbRoots();

		/****** IntCurveSurface_TheQuadCurvExactHInter::Root ******/
		/****** md5 signature: 924d892bdccaf8b866e5773695c2abbb ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
No available documentation.
") Root;
		double Root(const int Index);

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
		/****** md5 signature: 9056fc5f695c62612651effc85cb18ad ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
D: double

Description
-----------
Computes the derivative of the previous function at parameter Param. Derivative always returns True.
") Derivative;
		bool Derivative(const double Param, Standard_Real &OutValue);

		/****** IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter::Value ******/
		/****** md5 signature: 92dd35931de1aecdc8277d063de13ec7 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
F: double

Description
-----------
Computes the value of the signed distance between the implicit surface and the point at parameter Param on the parametrised curve. Value always returns True.
") Value;
		bool Value(const double Param, Standard_Real &OutValue);

		/****** IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter::Values ******/
		/****** md5 signature: 03dca4b59c48db2ee672dd2d7904db60 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
F: double
D: double

Description
-----------
Computes the value and the derivative of the function. returns True.
") Values;
		bool Values(const double Param, Standard_Real &OutValue, Standard_Real &OutValue);

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
