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
%define INTRES2DDOCSTRING
"IntRes2d module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_intres2d.html"
%enddef
%module (package="OCC.Core", docstring=INTRES2DDOCSTRING) IntRes2d


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
#include<IntRes2d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum IntRes2d_Position {
	IntRes2d_Head = 0,
	IntRes2d_Middle = 1,
	IntRes2d_End = 2,
};

enum IntRes2d_Situation {
	IntRes2d_Inside = 0,
	IntRes2d_Outside = 1,
	IntRes2d_Unknown = 2,
};

enum IntRes2d_TypeTrans {
	IntRes2d_In = 0,
	IntRes2d_Out = 1,
	IntRes2d_Touch = 2,
	IntRes2d_Undecided = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class IntRes2d_Position(IntEnum):
	IntRes2d_Head = 0
	IntRes2d_Middle = 1
	IntRes2d_End = 2
IntRes2d_Head = IntRes2d_Position.IntRes2d_Head
IntRes2d_Middle = IntRes2d_Position.IntRes2d_Middle
IntRes2d_End = IntRes2d_Position.IntRes2d_End

class IntRes2d_Situation(IntEnum):
	IntRes2d_Inside = 0
	IntRes2d_Outside = 1
	IntRes2d_Unknown = 2
IntRes2d_Inside = IntRes2d_Situation.IntRes2d_Inside
IntRes2d_Outside = IntRes2d_Situation.IntRes2d_Outside
IntRes2d_Unknown = IntRes2d_Situation.IntRes2d_Unknown

class IntRes2d_TypeTrans(IntEnum):
	IntRes2d_In = 0
	IntRes2d_Out = 1
	IntRes2d_Touch = 2
	IntRes2d_Undecided = 3
IntRes2d_In = IntRes2d_TypeTrans.IntRes2d_In
IntRes2d_Out = IntRes2d_TypeTrans.IntRes2d_Out
IntRes2d_Touch = IntRes2d_TypeTrans.IntRes2d_Touch
IntRes2d_Undecided = IntRes2d_TypeTrans.IntRes2d_Undecided
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(IntRes2d_SequenceOfIntersectionPoint) NCollection_Sequence<IntRes2d_IntersectionPoint>;

%extend NCollection_Sequence<IntRes2d_IntersectionPoint> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntRes2d_SequenceOfIntersectionSegment) NCollection_Sequence<IntRes2d_IntersectionSegment>;

%extend NCollection_Sequence<IntRes2d_IntersectionSegment> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<IntRes2d_IntersectionPoint> IntRes2d_SequenceOfIntersectionPoint;
typedef NCollection_Sequence<IntRes2d_IntersectionSegment> IntRes2d_SequenceOfIntersectionSegment;
/* end typedefs declaration */

/************************
* class IntRes2d_Domain *
************************/
class IntRes2d_Domain {
	public:
		/****** IntRes2d_Domain::IntRes2d_Domain ******/
		/****** md5 signature: 830896a3af44ebac22b04c662e0f861d ******/
		%feature("compactdefaultargs") IntRes2d_Domain;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an infinite Domain (HasFirstPoint = False and HasLastPoint = False).
") IntRes2d_Domain;
		 IntRes2d_Domain();

		/****** IntRes2d_Domain::IntRes2d_Domain ******/
		/****** md5 signature: 8e11d8df6b10a89b29555e2ea045dbfe ******/
		%feature("compactdefaultargs") IntRes2d_Domain;
		%feature("autodoc", "
Parameters
----------
Pnt1: gp_Pnt2d
Par1: float
Tol1: float
Pnt2: gp_Pnt2d
Par2: float
Tol2: float

Return
-------
None

Description
-----------
Creates a bounded Domain.
") IntRes2d_Domain;
		 IntRes2d_Domain(const gp_Pnt2d & Pnt1, const Standard_Real Par1, const Standard_Real Tol1, const gp_Pnt2d & Pnt2, const Standard_Real Par2, const Standard_Real Tol2);

		/****** IntRes2d_Domain::IntRes2d_Domain ******/
		/****** md5 signature: 12a03600d7395856887b2df2d476a4d8 ******/
		%feature("compactdefaultargs") IntRes2d_Domain;
		%feature("autodoc", "
Parameters
----------
Pnt: gp_Pnt2d
Par: float
Tol: float
First: bool

Return
-------
None

Description
-----------
Creates a semi-infinite Domain. If First is set to True, the given point is the first point of the domain, otherwise it is the last point.
") IntRes2d_Domain;
		 IntRes2d_Domain(const gp_Pnt2d & Pnt, const Standard_Real Par, const Standard_Real Tol, const Standard_Boolean First);

		/****** IntRes2d_Domain::EquivalentParameters ******/
		/****** md5 signature: 529150b6201d932091998664690ad568 ******/
		%feature("compactdefaultargs") EquivalentParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
zero: float
zeroplusperiod: float

Description
-----------
Returns Equivalent parameters if the domain is closed. Otherwise, the exception DomainError is raised.
") EquivalentParameters;
		void EquivalentParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntRes2d_Domain::FirstParameter ******/
		/****** md5 signature: 4ccedbaad83be904f510b4760c75f69c ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter of the first point of the domain The exception DomainError is raised if HasFirstPoint returns False.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** IntRes2d_Domain::FirstPoint ******/
		/****** md5 signature: 45a8071be0ec041ebea476ab7cf944d7 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the first point of the domain. The exception DomainError is raised if HasFirstPoint returns False.
") FirstPoint;
		const gp_Pnt2d FirstPoint();

		/****** IntRes2d_Domain::FirstTolerance ******/
		/****** md5 signature: 41b554fe9b1f8f40c338aab76b0c1e6d ******/
		%feature("compactdefaultargs") FirstTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the tolerance of the first (left) bound. The exception DomainError is raised if HasFirstPoint returns False.
") FirstTolerance;
		Standard_Real FirstTolerance();

		/****** IntRes2d_Domain::HasFirstPoint ******/
		/****** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the domain has a first point, i-e a point defining the lowest admitted parameter on the curve.
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****** IntRes2d_Domain::HasLastPoint ******/
		/****** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the domain has a last point, i-e a point defining the highest admitted parameter on the curve.
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****** IntRes2d_Domain::IsClosed ******/
		/****** md5 signature: 29709d02fadc9fcb79a766bc9679271b ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the domain is closed.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** IntRes2d_Domain::LastParameter ******/
		/****** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter of the last point of the domain. The exception DomainError is raised if HasLastPoint returns False.
") LastParameter;
		Standard_Real LastParameter();

		/****** IntRes2d_Domain::LastPoint ******/
		/****** md5 signature: 4fd5d4a443c7a29d01ea076c168fe9dc ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the last point of the domain. The exception DomainError is raised if HasLastPoint returns False.
") LastPoint;
		const gp_Pnt2d LastPoint();

		/****** IntRes2d_Domain::LastTolerance ******/
		/****** md5 signature: 1395695dc8616000501e8ec050fd49d9 ******/
		%feature("compactdefaultargs") LastTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the tolerance of the last (right) bound. The exception DomainError is raised if HasLastPoint returns False.
") LastTolerance;
		Standard_Real LastTolerance();

		/****** IntRes2d_Domain::SetEquivalentParameters ******/
		/****** md5 signature: aaf871dd079e93ebec68fdf60fc42f97 ******/
		%feature("compactdefaultargs") SetEquivalentParameters;
		%feature("autodoc", "
Parameters
----------
zero: float
period: float

Return
-------
None

Description
-----------
Defines a closed domain.
") SetEquivalentParameters;
		void SetEquivalentParameters(const Standard_Real zero, const Standard_Real period);

		/****** IntRes2d_Domain::SetValues ******/
		/****** md5 signature: dd2358f8cf5809fe1e358346131c7e23 ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
Pnt1: gp_Pnt2d
Par1: float
Tol1: float
Pnt2: gp_Pnt2d
Par2: float
Tol2: float

Return
-------
None

Description
-----------
Sets the values for a bounded domain.
") SetValues;
		void SetValues(const gp_Pnt2d & Pnt1, const Standard_Real Par1, const Standard_Real Tol1, const gp_Pnt2d & Pnt2, const Standard_Real Par2, const Standard_Real Tol2);

		/****** IntRes2d_Domain::SetValues ******/
		/****** md5 signature: 89c38a8459c210b2cc3ff34f36c20cd5 ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets the values for an infinite domain.
") SetValues;
		void SetValues();

		/****** IntRes2d_Domain::SetValues ******/
		/****** md5 signature: aa63b3ea90a58ffd26415ffae6d08050 ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
Pnt: gp_Pnt2d
Par: float
Tol: float
First: bool

Return
-------
None

Description
-----------
Sets the values for a semi-infinite domain.
") SetValues;
		void SetValues(const gp_Pnt2d & Pnt, const Standard_Real Par, const Standard_Real Tol, const Standard_Boolean First);

};


%extend IntRes2d_Domain {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IntRes2d_Intersection *
******************************/
%nodefaultctor IntRes2d_Intersection;
%ignore IntRes2d_Intersection::~IntRes2d_Intersection();
class IntRes2d_Intersection {
	public:
		/****** IntRes2d_Intersection::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True when the computation was successful.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntRes2d_Intersection::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is no intersection between the given arguments. The exception NotDone is raised if IsDone returns False.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** IntRes2d_Intersection::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
This function returns the number of intersection points between the 2 curves. The exception NotDone is raised if IsDone returns False.
") NbPoints;
		Standard_Integer NbPoints();

		/****** IntRes2d_Intersection::NbSegments ******/
		/****** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
This function returns the number of intersection segments between the two curves. The exception NotDone is raised if IsDone returns False.
") NbSegments;
		Standard_Integer NbSegments();

		/****** IntRes2d_Intersection::Point ******/
		/****** md5 signature: ab5be2f4faa8204905c7defafba7f249 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
IntRes2d_IntersectionPoint

Description
-----------
This function returns the intersection point of range N; The exception NotDone is raised if IsDone returns False. The exception OutOfRange is raised if (N <= 0) or (N > NbPoints).
") Point;
		const IntRes2d_IntersectionPoint & Point(const Standard_Integer N);

		/****** IntRes2d_Intersection::Segment ******/
		/****** md5 signature: 423d5f868e6a816f02143de11c5f58dc ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
IntRes2d_IntersectionSegment

Description
-----------
This function returns the intersection segment of range N; The exception NotDone is raised if IsDone returns False. The exception OutOfRange is raised if (N <= 0) or (N > NbPoints).
") Segment;
		const IntRes2d_IntersectionSegment & Segment(const Standard_Integer N);

		/****** IntRes2d_Intersection::SetReversedParameters ******/
		/****** md5 signature: 915240ff86dd03cd777ca9d79abbff2a ******/
		%feature("compactdefaultargs") SetReversedParameters;
		%feature("autodoc", "
Parameters
----------
Reverseflag: bool

Return
-------
None

Description
-----------
No available documentation.
") SetReversedParameters;
		void SetReversedParameters(const Standard_Boolean Reverseflag);

};


%extend IntRes2d_Intersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class IntRes2d_IntersectionPoint *
***********************************/
class IntRes2d_IntersectionPoint {
	public:
		/****** IntRes2d_IntersectionPoint::IntRes2d_IntersectionPoint ******/
		/****** md5 signature: c88ecc7652c9da4bf47a1edb0996842a ******/
		%feature("compactdefaultargs") IntRes2d_IntersectionPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntRes2d_IntersectionPoint;
		 IntRes2d_IntersectionPoint();

		/****** IntRes2d_IntersectionPoint::IntRes2d_IntersectionPoint ******/
		/****** md5 signature: 9925c63553f7a26a4e7719e9de911fab ******/
		%feature("compactdefaultargs") IntRes2d_IntersectionPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Uc1: float
Uc2: float
Trans1: IntRes2d_Transition
Trans2: IntRes2d_Transition
ReversedFlag: bool

Return
-------
None

Description
-----------
Creates an IntersectionPoint. if ReversedFlag is False, the parameter Uc1(resp. Uc2) and the Transition Trans1 (resp. Trans2) refer to the first curve (resp. second curve) otherwise Uc1 and Trans1 (resp. Uc2 and Trans2) refer to the second curve (resp. the first curve).
") IntRes2d_IntersectionPoint;
		 IntRes2d_IntersectionPoint(const gp_Pnt2d & P, const Standard_Real Uc1, const Standard_Real Uc2, const IntRes2d_Transition & Trans1, const IntRes2d_Transition & Trans2, const Standard_Boolean ReversedFlag);

		/****** IntRes2d_IntersectionPoint::ParamOnFirst ******/
		/****** md5 signature: c1af1fad86dcc6635235f3d2a2efda3a ******/
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter on the first curve.
") ParamOnFirst;
		Standard_Real ParamOnFirst();

		/****** IntRes2d_IntersectionPoint::ParamOnSecond ******/
		/****** md5 signature: 4cf4e18e7ca9aa68a1f4328994d835d7 ******/
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the parameter on the second curve.
") ParamOnSecond;
		Standard_Real ParamOnSecond();

		/****** IntRes2d_IntersectionPoint::SetValues ******/
		/****** md5 signature: f6051dc77123f4b6df2913e25fc1a92b ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Uc1: float
Uc2: float
Trans1: IntRes2d_Transition
Trans2: IntRes2d_Transition
ReversedFlag: bool

Return
-------
None

Description
-----------
Sets the values for an existing intersection point. The meaning of the parameters are the same as for the Create.
") SetValues;
		void SetValues(const gp_Pnt2d & P, const Standard_Real Uc1, const Standard_Real Uc2, const IntRes2d_Transition & Trans1, const IntRes2d_Transition & Trans2, const Standard_Boolean ReversedFlag);

		/****** IntRes2d_IntersectionPoint::TransitionOfFirst ******/
		/****** md5 signature: 3cce10625695ef9b8b7369bebb0aff66 ******/
		%feature("compactdefaultargs") TransitionOfFirst;
		%feature("autodoc", "Return
-------
IntRes2d_Transition

Description
-----------
Returns the transition of the 1st curve compared to the 2nd one.
") TransitionOfFirst;
		const IntRes2d_Transition & TransitionOfFirst();

		/****** IntRes2d_IntersectionPoint::TransitionOfSecond ******/
		/****** md5 signature: db58cbb906991e3313f149a6858825fd ******/
		%feature("compactdefaultargs") TransitionOfSecond;
		%feature("autodoc", "Return
-------
IntRes2d_Transition

Description
-----------
returns the transition of the 2nd curve compared to the 1st one.
") TransitionOfSecond;
		const IntRes2d_Transition & TransitionOfSecond();

		/****** IntRes2d_IntersectionPoint::Value ******/
		/****** md5 signature: 01b97600ad700e4edb97bc6008ad0c9b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the value of the coordinates of the intersection point in the 2D space.
") Value;
		const gp_Pnt2d Value();

};


%extend IntRes2d_IntersectionPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class IntRes2d_IntersectionSegment *
*************************************/
class IntRes2d_IntersectionSegment {
	public:
		/****** IntRes2d_IntersectionSegment::IntRes2d_IntersectionSegment ******/
		/****** md5 signature: dc4f669e13c04d5d314ed0aed73d10ad ******/
		%feature("compactdefaultargs") IntRes2d_IntersectionSegment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment();

		/****** IntRes2d_IntersectionSegment::IntRes2d_IntersectionSegment ******/
		/****** md5 signature: 8fc3bb56dcac037ab3f5ba8b64553c98 ******/
		%feature("compactdefaultargs") IntRes2d_IntersectionSegment;
		%feature("autodoc", "
Parameters
----------
P1: IntRes2d_IntersectionPoint
P2: IntRes2d_IntersectionPoint
Oppos: bool
ReverseFlag: bool

Return
-------
None

Description
-----------
No available documentation.
") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment(const IntRes2d_IntersectionPoint & P1, const IntRes2d_IntersectionPoint & P2, const Standard_Boolean Oppos, const Standard_Boolean ReverseFlag);

		/****** IntRes2d_IntersectionSegment::IntRes2d_IntersectionSegment ******/
		/****** md5 signature: 55ee4c283605318f4685f93b5c5d5cee ******/
		%feature("compactdefaultargs") IntRes2d_IntersectionSegment;
		%feature("autodoc", "
Parameters
----------
P: IntRes2d_IntersectionPoint
First: bool
Oppos: bool
ReverseFlag: bool

Return
-------
None

Description
-----------
No available documentation.
") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment(const IntRes2d_IntersectionPoint & P, const Standard_Boolean First, const Standard_Boolean Oppos, const Standard_Boolean ReverseFlag);

		/****** IntRes2d_IntersectionSegment::IntRes2d_IntersectionSegment ******/
		/****** md5 signature: 6b2e75d69deabcab7c0be000edc21f47 ******/
		%feature("compactdefaultargs") IntRes2d_IntersectionSegment;
		%feature("autodoc", "
Parameters
----------
Oppos: bool

Return
-------
None

Description
-----------
Creates an infinite segment of intersection.
") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment(const Standard_Boolean Oppos);

		/****** IntRes2d_IntersectionSegment::FirstPoint ******/
		/****** md5 signature: d49a4467c5a878587db115e95010563f ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntRes2d_IntersectionPoint

Description
-----------
Returns the first point of the segment as an IntersectionPoint (with a transition). The exception DomainError is raised if HasFirstPoint returns False.
") FirstPoint;
		const IntRes2d_IntersectionPoint & FirstPoint();

		/****** IntRes2d_IntersectionSegment::HasFirstPoint ******/
		/****** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the segment is limited by a first point. This point defines the lowest parameter admitted on the first curve for the segment. If IsOpposite returns False, it defines the lowest parameter on the second curve, otherwise, it is the highest parameter on the second curve.
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****** IntRes2d_IntersectionSegment::HasLastPoint ******/
		/****** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the segment is limited by a last point. This point defines the highest parameter admitted on the first curve for the segment. If IsOpposite returns False, it defines the highest parameter on the second curve, otherwise, it is the lowest parameter on the second curve.
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****** IntRes2d_IntersectionSegment::IsOpposite ******/
		/****** md5 signature: 393aca3277062552b7a8ec8cd414f82d ******/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False if the intersection segment has got the same orientation on both curves.
") IsOpposite;
		Standard_Boolean IsOpposite();

		/****** IntRes2d_IntersectionSegment::LastPoint ******/
		/****** md5 signature: 0b0d0759492f07d553c471992b8ffa02 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
IntRes2d_IntersectionPoint

Description
-----------
Returns the last point of the segment as an IntersectionPoint (with a transition). The exception DomainError is raised if HasLastExtremity returns False.
") LastPoint;
		const IntRes2d_IntersectionPoint & LastPoint();

};


%extend IntRes2d_IntersectionSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntRes2d_Transition *
****************************/
class IntRes2d_Transition {
	public:
		/****** IntRes2d_Transition::IntRes2d_Transition ******/
		/****** md5 signature: 160512b100f5f87f7a2d071066976eb2 ******/
		%feature("compactdefaultargs") IntRes2d_Transition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntRes2d_Transition;
		 IntRes2d_Transition();

		/****** IntRes2d_Transition::IntRes2d_Transition ******/
		/****** md5 signature: a539ac554bb878a5b682b2ca759b2d6d ******/
		%feature("compactdefaultargs") IntRes2d_Transition;
		%feature("autodoc", "
Parameters
----------
Tangent: bool
Pos: IntRes2d_Position
Type: IntRes2d_TypeTrans

Return
-------
None

Description
-----------
Creates an IN or OUT transition.
") IntRes2d_Transition;
		 IntRes2d_Transition(const Standard_Boolean Tangent, const IntRes2d_Position Pos, const IntRes2d_TypeTrans Type);

		/****** IntRes2d_Transition::IntRes2d_Transition ******/
		/****** md5 signature: 2bdf38eb278a15d76198abd91e3c52a3 ******/
		%feature("compactdefaultargs") IntRes2d_Transition;
		%feature("autodoc", "
Parameters
----------
Tangent: bool
Pos: IntRes2d_Position
Situ: IntRes2d_Situation
Oppos: bool

Return
-------
None

Description
-----------
Creates a TOUCH transition.
") IntRes2d_Transition;
		 IntRes2d_Transition(const Standard_Boolean Tangent, const IntRes2d_Position Pos, const IntRes2d_Situation Situ, const Standard_Boolean Oppos);

		/****** IntRes2d_Transition::IntRes2d_Transition ******/
		/****** md5 signature: b693be5afba28c3736c86d73fd1236cf ******/
		%feature("compactdefaultargs") IntRes2d_Transition;
		%feature("autodoc", "
Parameters
----------
Pos: IntRes2d_Position

Return
-------
None

Description
-----------
Creates an UNDECIDED transition.
") IntRes2d_Transition;
		 IntRes2d_Transition(const IntRes2d_Position Pos);

		/****** IntRes2d_Transition::IsOpposite ******/
		/****** md5 signature: 393aca3277062552b7a8ec8cd414f82d ******/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns a significant value if TransitionType returns TOUCH. In this case, the function returns true when the 2 curves locally define two different parts of the space. If TransitionType returns IN or OUT or UNDECIDED, the exception DomainError is raised.
") IsOpposite;
		Standard_Boolean IsOpposite();

		/****** IntRes2d_Transition::IsTangent ******/
		/****** md5 signature: 16a7964bb24e34f80fabc93e5a65aedc ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the 2 curves are tangent at the intersection point. Theexception DomainError is raised if the type of transition is UNDECIDED.
") IsTangent;
		Standard_Boolean IsTangent();

		/****** IntRes2d_Transition::PositionOnCurve ******/
		/****** md5 signature: 6ec671a74a3486d7085a0806bfda725f ******/
		%feature("compactdefaultargs") PositionOnCurve;
		%feature("autodoc", "Return
-------
IntRes2d_Position

Description
-----------
Indicates if the intersection is at the beginning (IntRes2d_Head), at the end (IntRes2d_End), or in the middle (IntRes2d_Middle) of the curve.
") PositionOnCurve;
		IntRes2d_Position PositionOnCurve();

		/****** IntRes2d_Transition::SetPosition ******/
		/****** md5 signature: fb7c79507079249799175e7ce6af84a0 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
Pos: IntRes2d_Position

Return
-------
None

Description
-----------
Sets the value of the position.
") SetPosition;
		void SetPosition(const IntRes2d_Position Pos);

		/****** IntRes2d_Transition::SetValue ******/
		/****** md5 signature: 764e4aee8b26273711f0314c3bb0deb7 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Tangent: bool
Pos: IntRes2d_Position
Type: IntRes2d_TypeTrans

Return
-------
None

Description
-----------
Sets the values of an IN or OUT transition.
") SetValue;
		void SetValue(const Standard_Boolean Tangent, const IntRes2d_Position Pos, const IntRes2d_TypeTrans Type);

		/****** IntRes2d_Transition::SetValue ******/
		/****** md5 signature: 80b0c9c4b8e49c85a7ef5ac1199deafd ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Tangent: bool
Pos: IntRes2d_Position
Situ: IntRes2d_Situation
Oppos: bool

Return
-------
None

Description
-----------
Sets the values of a TOUCH transition.
") SetValue;
		void SetValue(const Standard_Boolean Tangent, const IntRes2d_Position Pos, const IntRes2d_Situation Situ, const Standard_Boolean Oppos);

		/****** IntRes2d_Transition::SetValue ******/
		/****** md5 signature: 321caa07384cf36484626bfab1cbd04c ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pos: IntRes2d_Position

Return
-------
None

Description
-----------
Sets the values of an UNDECIDED transition.
") SetValue;
		void SetValue(const IntRes2d_Position Pos);

		/****** IntRes2d_Transition::Situation ******/
		/****** md5 signature: da487009d8ea6c1e7b8ed35242dd0623 ******/
		%feature("compactdefaultargs") Situation;
		%feature("autodoc", "Return
-------
IntRes2d_Situation

Description
-----------
returns a significant value if TransitionType returns TOUCH. In this case, the function returns: INSIDE when the curve remains inside the other one, OUTSIDE when it remains outside the other one, UNKNOWN when the calculus, based on the second derivatives cannot give the result. If TransitionType returns IN or OUT or UNDECIDED, the exception DomainError is raised.
") Situation;
		IntRes2d_Situation Situation();

		/****** IntRes2d_Transition::TransitionType ******/
		/****** md5 signature: a4a1f4cb6dbeb6596269095356537484 ******/
		%feature("compactdefaultargs") TransitionType;
		%feature("autodoc", "Return
-------
IntRes2d_TypeTrans

Description
-----------
Returns the type of transition at the intersection. It may be IN or OUT or TOUCH, or UNDECIDED if the two first derivatives are not enough to give the tangent to one of the two curves.
") TransitionType;
		IntRes2d_TypeTrans TransitionType();

};


%extend IntRes2d_Transition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
