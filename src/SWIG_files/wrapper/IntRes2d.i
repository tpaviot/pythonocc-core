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
%define INTRES2DDOCSTRING
"IntRes2d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_intres2d.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** IntRes2d_Domain ******************/
		/**** md5 signature: 830896a3af44ebac22b04c662e0f861d ****/
		%feature("compactdefaultargs") IntRes2d_Domain;
		%feature("autodoc", "Creates an infinite domain (hasfirstpoint = false and haslastpoint = false).

Returns
-------
None
") IntRes2d_Domain;
		 IntRes2d_Domain();

		/****************** IntRes2d_Domain ******************/
		/**** md5 signature: 8e11d8df6b10a89b29555e2ea045dbfe ****/
		%feature("compactdefaultargs") IntRes2d_Domain;
		%feature("autodoc", "Creates a bounded domain.

Parameters
----------
Pnt1: gp_Pnt2d
Par1: float
Tol1: float
Pnt2: gp_Pnt2d
Par2: float
Tol2: float

Returns
-------
None
") IntRes2d_Domain;
		 IntRes2d_Domain(const gp_Pnt2d & Pnt1, const Standard_Real Par1, const Standard_Real Tol1, const gp_Pnt2d & Pnt2, const Standard_Real Par2, const Standard_Real Tol2);

		/****************** IntRes2d_Domain ******************/
		/**** md5 signature: 12a03600d7395856887b2df2d476a4d8 ****/
		%feature("compactdefaultargs") IntRes2d_Domain;
		%feature("autodoc", "Creates a semi-infinite domain. if first is set to true, the given point is the first point of the domain, otherwise it is the last point.

Parameters
----------
Pnt: gp_Pnt2d
Par: float
Tol: float
First: bool

Returns
-------
None
") IntRes2d_Domain;
		 IntRes2d_Domain(const gp_Pnt2d & Pnt, const Standard_Real Par, const Standard_Real Tol, const Standard_Boolean First);

		/****************** EquivalentParameters ******************/
		/**** md5 signature: 529150b6201d932091998664690ad568 ****/
		%feature("compactdefaultargs") EquivalentParameters;
		%feature("autodoc", "Returns equivalent parameters if the domain is closed. otherwise, the exception domainerror is raised.

Parameters
----------

Returns
-------
zero: float
zeroplusperiod: float
") EquivalentParameters;
		void EquivalentParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** FirstParameter ******************/
		/**** md5 signature: 4ccedbaad83be904f510b4760c75f69c ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the parameter of the first point of the domain the exception domainerror is raised if hasfirstpoint returns false.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** FirstPoint ******************/
		/**** md5 signature: 45a8071be0ec041ebea476ab7cf944d7 ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point of the domain. the exception domainerror is raised if hasfirstpoint returns false.

Returns
-------
gp_Pnt2d
") FirstPoint;
		const gp_Pnt2d FirstPoint();

		/****************** FirstTolerance ******************/
		/**** md5 signature: 41b554fe9b1f8f40c338aab76b0c1e6d ****/
		%feature("compactdefaultargs") FirstTolerance;
		%feature("autodoc", "Returns the tolerance of the first (left) bound. the exception domainerror is raised if hasfirstpoint returns false.

Returns
-------
float
") FirstTolerance;
		Standard_Real FirstTolerance();

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the domain has a first point, i-e a point defining the lowest admitted parameter on the curve.

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		/**** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if the domain has a last point, i-e a point defining the highest admitted parameter on the curve.

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** IsClosed ******************/
		/**** md5 signature: 29709d02fadc9fcb79a766bc9679271b ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the domain is closed.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** LastParameter ******************/
		/**** md5 signature: 7cdf630921ee47ad365a5a6bafd4b46e ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the parameter of the last point of the domain. the exception domainerror is raised if haslastpoint returns false.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** LastPoint ******************/
		/**** md5 signature: 4fd5d4a443c7a29d01ea076c168fe9dc ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the last point of the domain. the exception domainerror is raised if haslastpoint returns false.

Returns
-------
gp_Pnt2d
") LastPoint;
		const gp_Pnt2d LastPoint();

		/****************** LastTolerance ******************/
		/**** md5 signature: 1395695dc8616000501e8ec050fd49d9 ****/
		%feature("compactdefaultargs") LastTolerance;
		%feature("autodoc", "Returns the tolerance of the last (right) bound. the exception domainerror is raised if haslastpoint returns false.

Returns
-------
float
") LastTolerance;
		Standard_Real LastTolerance();

		/****************** SetEquivalentParameters ******************/
		/**** md5 signature: aaf871dd079e93ebec68fdf60fc42f97 ****/
		%feature("compactdefaultargs") SetEquivalentParameters;
		%feature("autodoc", "Defines a closed domain.

Parameters
----------
zero: float
period: float

Returns
-------
None
") SetEquivalentParameters;
		void SetEquivalentParameters(const Standard_Real zero, const Standard_Real period);

		/****************** SetValues ******************/
		/**** md5 signature: dd2358f8cf5809fe1e358346131c7e23 ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Sets the values for a bounded domain.

Parameters
----------
Pnt1: gp_Pnt2d
Par1: float
Tol1: float
Pnt2: gp_Pnt2d
Par2: float
Tol2: float

Returns
-------
None
") SetValues;
		void SetValues(const gp_Pnt2d & Pnt1, const Standard_Real Par1, const Standard_Real Tol1, const gp_Pnt2d & Pnt2, const Standard_Real Par2, const Standard_Real Tol2);

		/****************** SetValues ******************/
		/**** md5 signature: 89c38a8459c210b2cc3ff34f36c20cd5 ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Sets the values for an infinite domain.

Returns
-------
None
") SetValues;
		void SetValues();

		/****************** SetValues ******************/
		/**** md5 signature: aa63b3ea90a58ffd26415ffae6d08050 ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Sets the values for a semi-infinite domain.

Parameters
----------
Pnt: gp_Pnt2d
Par: float
Tol: float
First: bool

Returns
-------
None
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
		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true when the computation was successful.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if there is no intersection between the given arguments. the exception notdone is raised if isdone returns false.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "This function returns the number of intersection points between the 2 curves. the exception notdone is raised if isdone returns false.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSegments ******************/
		/**** md5 signature: 6791e2039921b3bb6b2ff0f8e741d76b ****/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "This function returns the number of intersection segments between the two curves. the exception notdone is raised if isdone returns false.

Returns
-------
int
") NbSegments;
		Standard_Integer NbSegments();

		/****************** Point ******************/
		/**** md5 signature: ab5be2f4faa8204905c7defafba7f249 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "This function returns the intersection point of range n; the exception notdone is raised if isdone returns false. the exception outofrange is raised if (n <= 0) or (n > nbpoints).

Parameters
----------
N: int

Returns
-------
IntRes2d_IntersectionPoint
") Point;
		const IntRes2d_IntersectionPoint & Point(const Standard_Integer N);

		/****************** Segment ******************/
		/**** md5 signature: 423d5f868e6a816f02143de11c5f58dc ****/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "This function returns the intersection segment of range n; the exception notdone is raised if isdone returns false. the exception outofrange is raised if (n <= 0) or (n > nbpoints).

Parameters
----------
N: int

Returns
-------
IntRes2d_IntersectionSegment
") Segment;
		const IntRes2d_IntersectionSegment & Segment(const Standard_Integer N);

		/****************** SetReversedParameters ******************/
		/**** md5 signature: 915240ff86dd03cd777ca9d79abbff2a ****/
		%feature("compactdefaultargs") SetReversedParameters;
		%feature("autodoc", "No available documentation.

Parameters
----------
Reverseflag: bool

Returns
-------
None
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
		/****************** IntRes2d_IntersectionPoint ******************/
		/**** md5 signature: c88ecc7652c9da4bf47a1edb0996842a ****/
		%feature("compactdefaultargs") IntRes2d_IntersectionPoint;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntRes2d_IntersectionPoint;
		 IntRes2d_IntersectionPoint();

		/****************** IntRes2d_IntersectionPoint ******************/
		/**** md5 signature: 9925c63553f7a26a4e7719e9de911fab ****/
		%feature("compactdefaultargs") IntRes2d_IntersectionPoint;
		%feature("autodoc", "Creates an intersectionpoint. if reversedflag is false, the parameter uc1(resp. uc2) and the transition trans1 (resp. trans2) refer to the first curve (resp. second curve) otherwise uc1 and trans1 (resp. uc2 and trans2) refer to the second curve (resp. the first curve).

Parameters
----------
P: gp_Pnt2d
Uc1: float
Uc2: float
Trans1: IntRes2d_Transition
Trans2: IntRes2d_Transition
ReversedFlag: bool

Returns
-------
None
") IntRes2d_IntersectionPoint;
		 IntRes2d_IntersectionPoint(const gp_Pnt2d & P, const Standard_Real Uc1, const Standard_Real Uc2, const IntRes2d_Transition & Trans1, const IntRes2d_Transition & Trans2, const Standard_Boolean ReversedFlag);

		/****************** ParamOnFirst ******************/
		/**** md5 signature: c1af1fad86dcc6635235f3d2a2efda3a ****/
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "Returns the parameter on the first curve.

Returns
-------
float
") ParamOnFirst;
		Standard_Real ParamOnFirst();

		/****************** ParamOnSecond ******************/
		/**** md5 signature: 4cf4e18e7ca9aa68a1f4328994d835d7 ****/
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "Returns the parameter on the second curve.

Returns
-------
float
") ParamOnSecond;
		Standard_Real ParamOnSecond();

		/****************** SetValues ******************/
		/**** md5 signature: f6051dc77123f4b6df2913e25fc1a92b ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "Sets the values for an existing intersection point. the meaning of the parameters are the same as for the create.

Parameters
----------
P: gp_Pnt2d
Uc1: float
Uc2: float
Trans1: IntRes2d_Transition
Trans2: IntRes2d_Transition
ReversedFlag: bool

Returns
-------
None
") SetValues;
		void SetValues(const gp_Pnt2d & P, const Standard_Real Uc1, const Standard_Real Uc2, const IntRes2d_Transition & Trans1, const IntRes2d_Transition & Trans2, const Standard_Boolean ReversedFlag);

		/****************** TransitionOfFirst ******************/
		/**** md5 signature: 3cce10625695ef9b8b7369bebb0aff66 ****/
		%feature("compactdefaultargs") TransitionOfFirst;
		%feature("autodoc", "Returns the transition of the 1st curve compared to the 2nd one.

Returns
-------
IntRes2d_Transition
") TransitionOfFirst;
		const IntRes2d_Transition & TransitionOfFirst();

		/****************** TransitionOfSecond ******************/
		/**** md5 signature: db58cbb906991e3313f149a6858825fd ****/
		%feature("compactdefaultargs") TransitionOfSecond;
		%feature("autodoc", "Returns the transition of the 2nd curve compared to the 1st one.

Returns
-------
IntRes2d_Transition
") TransitionOfSecond;
		const IntRes2d_Transition & TransitionOfSecond();

		/****************** Value ******************/
		/**** md5 signature: 01b97600ad700e4edb97bc6008ad0c9b ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the coordinates of the intersection point in the 2d space.

Returns
-------
gp_Pnt2d
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
		/****************** IntRes2d_IntersectionSegment ******************/
		/**** md5 signature: dc4f669e13c04d5d314ed0aed73d10ad ****/
		%feature("compactdefaultargs") IntRes2d_IntersectionSegment;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment();

		/****************** IntRes2d_IntersectionSegment ******************/
		/**** md5 signature: 8fc3bb56dcac037ab3f5ba8b64553c98 ****/
		%feature("compactdefaultargs") IntRes2d_IntersectionSegment;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: IntRes2d_IntersectionPoint
P2: IntRes2d_IntersectionPoint
Oppos: bool
ReverseFlag: bool

Returns
-------
None
") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment(const IntRes2d_IntersectionPoint & P1, const IntRes2d_IntersectionPoint & P2, const Standard_Boolean Oppos, const Standard_Boolean ReverseFlag);

		/****************** IntRes2d_IntersectionSegment ******************/
		/**** md5 signature: 55ee4c283605318f4685f93b5c5d5cee ****/
		%feature("compactdefaultargs") IntRes2d_IntersectionSegment;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: IntRes2d_IntersectionPoint
First: bool
Oppos: bool
ReverseFlag: bool

Returns
-------
None
") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment(const IntRes2d_IntersectionPoint & P, const Standard_Boolean First, const Standard_Boolean Oppos, const Standard_Boolean ReverseFlag);

		/****************** IntRes2d_IntersectionSegment ******************/
		/**** md5 signature: 6b2e75d69deabcab7c0be000edc21f47 ****/
		%feature("compactdefaultargs") IntRes2d_IntersectionSegment;
		%feature("autodoc", "Creates an infinite segment of intersection.

Parameters
----------
Oppos: bool

Returns
-------
None
") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment(const Standard_Boolean Oppos);

		/****************** FirstPoint ******************/
		/**** md5 signature: d49a4467c5a878587db115e95010563f ****/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Returns the first point of the segment as an intersectionpoint (with a transition). the exception domainerror is raised if hasfirstpoint returns false.

Returns
-------
IntRes2d_IntersectionPoint
") FirstPoint;
		const IntRes2d_IntersectionPoint & FirstPoint();

		/****************** HasFirstPoint ******************/
		/**** md5 signature: 76549d304d78c4a9c8d3c420139524d3 ****/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Returns true if the segment is limited by a first point. this point defines the lowest parameter admitted on the first curve for the segment. if isopposite returns false, it defines the lowest parameter on the second curve, otherwise, it is the highest parameter on the second curve.

Returns
-------
bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint();

		/****************** HasLastPoint ******************/
		/**** md5 signature: 66b261e1c2b182701ee59bfbc6bde915 ****/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Returns true if the segment is limited by a last point. this point defines the highest parameter admitted on the first curve for the segment. if isopposite returns false, it defines the highest parameter on the second curve, otherwise, it is the lowest parameter on the second curve.

Returns
-------
bool
") HasLastPoint;
		Standard_Boolean HasLastPoint();

		/****************** IsOpposite ******************/
		/**** md5 signature: 393aca3277062552b7a8ec8cd414f82d ****/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "Returns false if the intersection segment has got the same orientation on both curves.

Returns
-------
bool
") IsOpposite;
		Standard_Boolean IsOpposite();

		/****************** LastPoint ******************/
		/**** md5 signature: 0b0d0759492f07d553c471992b8ffa02 ****/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Returns the last point of the segment as an intersectionpoint (with a transition). the exception domainerror is raised if haslastextremity returns false.

Returns
-------
IntRes2d_IntersectionPoint
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
		/****************** IntRes2d_Transition ******************/
		/**** md5 signature: 160512b100f5f87f7a2d071066976eb2 ****/
		%feature("compactdefaultargs") IntRes2d_Transition;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IntRes2d_Transition;
		 IntRes2d_Transition();

		/****************** IntRes2d_Transition ******************/
		/**** md5 signature: a539ac554bb878a5b682b2ca759b2d6d ****/
		%feature("compactdefaultargs") IntRes2d_Transition;
		%feature("autodoc", "Creates an in or out transition.

Parameters
----------
Tangent: bool
Pos: IntRes2d_Position
Type: IntRes2d_TypeTrans

Returns
-------
None
") IntRes2d_Transition;
		 IntRes2d_Transition(const Standard_Boolean Tangent, const IntRes2d_Position Pos, const IntRes2d_TypeTrans Type);

		/****************** IntRes2d_Transition ******************/
		/**** md5 signature: 2bdf38eb278a15d76198abd91e3c52a3 ****/
		%feature("compactdefaultargs") IntRes2d_Transition;
		%feature("autodoc", "Creates a touch transition.

Parameters
----------
Tangent: bool
Pos: IntRes2d_Position
Situ: IntRes2d_Situation
Oppos: bool

Returns
-------
None
") IntRes2d_Transition;
		 IntRes2d_Transition(const Standard_Boolean Tangent, const IntRes2d_Position Pos, const IntRes2d_Situation Situ, const Standard_Boolean Oppos);

		/****************** IntRes2d_Transition ******************/
		/**** md5 signature: b693be5afba28c3736c86d73fd1236cf ****/
		%feature("compactdefaultargs") IntRes2d_Transition;
		%feature("autodoc", "Creates an undecided transition.

Parameters
----------
Pos: IntRes2d_Position

Returns
-------
None
") IntRes2d_Transition;
		 IntRes2d_Transition(const IntRes2d_Position Pos);

		/****************** IsOpposite ******************/
		/**** md5 signature: 393aca3277062552b7a8ec8cd414f82d ****/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "Returns a significant value if transitiontype returns touch. in this case, the function returns true when the 2 curves locally define two different parts of the space. if transitiontype returns in or out or undecided, the exception domainerror is raised.

Returns
-------
bool
") IsOpposite;
		Standard_Boolean IsOpposite();

		/****************** IsTangent ******************/
		/**** md5 signature: 16a7964bb24e34f80fabc93e5a65aedc ****/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Returns true when the 2 curves are tangent at the intersection point. theexception domainerror is raised if the type of transition is undecided.

Returns
-------
bool
") IsTangent;
		Standard_Boolean IsTangent();

		/****************** PositionOnCurve ******************/
		/**** md5 signature: 6ec671a74a3486d7085a0806bfda725f ****/
		%feature("compactdefaultargs") PositionOnCurve;
		%feature("autodoc", "Indicates if the intersection is at the beginning (intres2d_head), at the end (intres2d_end), or in the middle (intres2d_middle) of the curve.

Returns
-------
IntRes2d_Position
") PositionOnCurve;
		IntRes2d_Position PositionOnCurve();

		/****************** SetPosition ******************/
		/**** md5 signature: fb7c79507079249799175e7ce6af84a0 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Sets the value of the position.

Parameters
----------
Pos: IntRes2d_Position

Returns
-------
None
") SetPosition;
		void SetPosition(const IntRes2d_Position Pos);

		/****************** SetValue ******************/
		/**** md5 signature: 764e4aee8b26273711f0314c3bb0deb7 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the values of an in or out transition.

Parameters
----------
Tangent: bool
Pos: IntRes2d_Position
Type: IntRes2d_TypeTrans

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Boolean Tangent, const IntRes2d_Position Pos, const IntRes2d_TypeTrans Type);

		/****************** SetValue ******************/
		/**** md5 signature: 80b0c9c4b8e49c85a7ef5ac1199deafd ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the values of a touch transition.

Parameters
----------
Tangent: bool
Pos: IntRes2d_Position
Situ: IntRes2d_Situation
Oppos: bool

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Boolean Tangent, const IntRes2d_Position Pos, const IntRes2d_Situation Situ, const Standard_Boolean Oppos);

		/****************** SetValue ******************/
		/**** md5 signature: 321caa07384cf36484626bfab1cbd04c ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets the values of an undecided transition.

Parameters
----------
Pos: IntRes2d_Position

Returns
-------
None
") SetValue;
		void SetValue(const IntRes2d_Position Pos);

		/****************** Situation ******************/
		/**** md5 signature: da487009d8ea6c1e7b8ed35242dd0623 ****/
		%feature("compactdefaultargs") Situation;
		%feature("autodoc", "Returns a significant value if transitiontype returns touch. in this case, the function returns : inside when the curve remains inside the other one, outside when it remains outside the other one, unknown when the calculus, based on the second derivatives cannot give the result. if transitiontype returns in or out or undecided, the exception domainerror is raised.

Returns
-------
IntRes2d_Situation
") Situation;
		IntRes2d_Situation Situation();

		/****************** TransitionType ******************/
		/**** md5 signature: a4a1f4cb6dbeb6596269095356537484 ****/
		%feature("compactdefaultargs") TransitionType;
		%feature("autodoc", "Returns the type of transition at the intersection. it may be in or out or touch, or undecided if the two first derivatives are not enough to give the tangent to one of the two curves.

Returns
-------
IntRes2d_TypeTrans
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
