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
%define INTRES2DDOCSTRING
"IntRes2d module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_intres2d.html"
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
		/****** md5 signature: 27a9c37c5abfee656765c7029b3bc17b ******/
		%feature("compactdefaultargs") IntRes2d_Domain;
		%feature("autodoc", "
Parameters
----------
Pnt1: gp_Pnt2d
Par1: double
Tol1: double
Pnt2: gp_Pnt2d
Par2: double
Tol2: double

Return
-------
None

Description
-----------
Creates a bounded Domain.
") IntRes2d_Domain;
		 IntRes2d_Domain(const gp_Pnt2d & Pnt1, const double Par1, const double Tol1, const gp_Pnt2d & Pnt2, const double Par2, const double Tol2);

		/****** IntRes2d_Domain::IntRes2d_Domain ******/
		/****** md5 signature: 786177724269caaf712d07d7ed22ba54 ******/
		%feature("compactdefaultargs") IntRes2d_Domain;
		%feature("autodoc", "
Parameters
----------
Pnt: gp_Pnt2d
Par: double
Tol: double
First: bool

Return
-------
None

Description
-----------
Creates a semi-infinite Domain. If First is set to True, the given point is the first point of the domain, otherwise it is the last point.
") IntRes2d_Domain;
		 IntRes2d_Domain(const gp_Pnt2d & Pnt, const double Par, const double Tol, const bool First);

		/****** IntRes2d_Domain::EquivalentParameters ******/
		/****** md5 signature: e5e3e4628bda6e9c60e1e9735f3b300e ******/
		%feature("compactdefaultargs") EquivalentParameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
zero: double
zeroplusperiod: double

Description
-----------
Returns Equivalent parameters if the domain is closed. Otherwise, the exception DomainError is raised.
") EquivalentParameters;
		void EquivalentParameters(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntRes2d_Domain::FirstParameter ******/
		/****** md5 signature: 663a02fdcfecea2f8437f306e48dfc6b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter of the first point of the domain The exception DomainError is raised if HasFirstPoint returns False.
") FirstParameter;
		double FirstParameter();

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
		/****** md5 signature: 7dc04d438aad3d00d0508ac7da356b69 ******/
		%feature("compactdefaultargs") FirstTolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the tolerance of the first (left) bound. The exception DomainError is raised if HasFirstPoint returns False.
") FirstTolerance;
		double FirstTolerance();

		/****** IntRes2d_Domain::HasFirstPoint ******/
		/****** md5 signature: 1bdb89cc339a420f24f2f400d73d6b54 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the domain has a first point, i-e a point defining the lowest admitted parameter on the curve.
") HasFirstPoint;
		bool HasFirstPoint();

		/****** IntRes2d_Domain::HasLastPoint ******/
		/****** md5 signature: c85dac3d84a6b6ab2854e34ac0e4ffcb ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the domain has a last point, i-e a point defining the highest admitted parameter on the curve.
") HasLastPoint;
		bool HasLastPoint();

		/****** IntRes2d_Domain::IsClosed ******/
		/****** md5 signature: 66fc0caa1853d24780b1d28b8296bc6c ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the domain is closed.
") IsClosed;
		bool IsClosed();

		/****** IntRes2d_Domain::LastParameter ******/
		/****** md5 signature: fca5164159fd9f44a10664b338b6e402 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter of the last point of the domain. The exception DomainError is raised if HasLastPoint returns False.
") LastParameter;
		double LastParameter();

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
		/****** md5 signature: 67f13471bb20bf9bdca7602353a3d9ab ******/
		%feature("compactdefaultargs") LastTolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the tolerance of the last (right) bound. The exception DomainError is raised if HasLastPoint returns False.
") LastTolerance;
		double LastTolerance();

		/****** IntRes2d_Domain::SetEquivalentParameters ******/
		/****** md5 signature: 737e32f13acd5c3ff0378d2a4e902ae7 ******/
		%feature("compactdefaultargs") SetEquivalentParameters;
		%feature("autodoc", "
Parameters
----------
zero: double
period: double

Return
-------
None

Description
-----------
Defines a closed domain.
") SetEquivalentParameters;
		void SetEquivalentParameters(const double zero, const double period);

		/****** IntRes2d_Domain::SetValues ******/
		/****** md5 signature: 725b6b2ca09ade60cb92abe5539de870 ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
Pnt1: gp_Pnt2d
Par1: double
Tol1: double
Pnt2: gp_Pnt2d
Par2: double
Tol2: double

Return
-------
None

Description
-----------
Sets the values for a bounded domain.
") SetValues;
		void SetValues(const gp_Pnt2d & Pnt1, const double Par1, const double Tol1, const gp_Pnt2d & Pnt2, const double Par2, const double Tol2);

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
		/****** md5 signature: c3566cad0ee7c9560d7cd9aa646b2aab ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
Pnt: gp_Pnt2d
Par: double
Tol: double
First: bool

Return
-------
None

Description
-----------
Sets the values for a semi-infinite domain.
") SetValues;
		void SetValues(const gp_Pnt2d & Pnt, const double Par, const double Tol, const bool First);

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
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True when the computation was successful.
") IsDone;
		bool IsDone();

		/****** IntRes2d_Intersection::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is no intersection between the given arguments. The exception NotDone is raised if IsDone returns False.
") IsEmpty;
		bool IsEmpty();

		/****** IntRes2d_Intersection::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
This function returns the number of intersection points between the 2 curves. The exception NotDone is raised if IsDone returns False.
") NbPoints;
		int NbPoints();

		/****** IntRes2d_Intersection::NbSegments ******/
		/****** md5 signature: 9aee6c2253f8ba296b560fdee30e17ad ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
This function returns the number of intersection segments between the two curves. The exception NotDone is raised if IsDone returns False.
") NbSegments;
		int NbSegments();

		/****** IntRes2d_Intersection::Point ******/
		/****** md5 signature: 2f59b4f0a1ef7de78ab232b1e95a2ce4 ******/
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
		const IntRes2d_IntersectionPoint & Point(const int N);

		/****** IntRes2d_Intersection::Segment ******/
		/****** md5 signature: b1d4b7b120ed513838a14f8fe26feb70 ******/
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
		const IntRes2d_IntersectionSegment & Segment(const int N);

		/****** IntRes2d_Intersection::SetReversedParameters ******/
		/****** md5 signature: 282df14c9686ea3631914e6d5a134737 ******/
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
		void SetReversedParameters(const bool Reverseflag);

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
		/****** md5 signature: 2c85ba07e85ab6f90926936732f48b18 ******/
		%feature("compactdefaultargs") IntRes2d_IntersectionPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Uc1: double
Uc2: double
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
		 IntRes2d_IntersectionPoint(const gp_Pnt2d & P, const double Uc1, const double Uc2, const IntRes2d_Transition & Trans1, const IntRes2d_Transition & Trans2, const bool ReversedFlag);

		/****** IntRes2d_IntersectionPoint::ParamOnFirst ******/
		/****** md5 signature: 2f88afb75508f4b380339ca1dd478625 ******/
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter on the first curve.
") ParamOnFirst;
		double ParamOnFirst();

		/****** IntRes2d_IntersectionPoint::ParamOnSecond ******/
		/****** md5 signature: 6368db0882aa68546b85e64558fde976 ******/
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter on the second curve.
") ParamOnSecond;
		double ParamOnSecond();

		/****** IntRes2d_IntersectionPoint::SetValues ******/
		/****** md5 signature: d882f88fb5532d2a70a58310c40b20bf ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Uc1: double
Uc2: double
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
		void SetValues(const gp_Pnt2d & P, const double Uc1, const double Uc2, const IntRes2d_Transition & Trans1, const IntRes2d_Transition & Trans2, const bool ReversedFlag);

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
		/****** md5 signature: ccd7592ab20941446f7240f5aad92c2e ******/
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
		 IntRes2d_IntersectionSegment(const IntRes2d_IntersectionPoint & P1, const IntRes2d_IntersectionPoint & P2, const bool Oppos, const bool ReverseFlag);

		/****** IntRes2d_IntersectionSegment::IntRes2d_IntersectionSegment ******/
		/****** md5 signature: fe464d6beabd5b9e7105f263b99e5cf2 ******/
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
		 IntRes2d_IntersectionSegment(const IntRes2d_IntersectionPoint & P, const bool First, const bool Oppos, const bool ReverseFlag);

		/****** IntRes2d_IntersectionSegment::IntRes2d_IntersectionSegment ******/
		/****** md5 signature: 761c45c524142b2d30528c1aaa0f7f66 ******/
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
		 IntRes2d_IntersectionSegment(const bool Oppos);

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
		/****** md5 signature: 1bdb89cc339a420f24f2f400d73d6b54 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the segment is limited by a first point. This point defines the lowest parameter admitted on the first curve for the segment. If IsOpposite returns False, it defines the lowest parameter on the second curve, otherwise, it is the highest parameter on the second curve.
") HasFirstPoint;
		bool HasFirstPoint();

		/****** IntRes2d_IntersectionSegment::HasLastPoint ******/
		/****** md5 signature: c85dac3d84a6b6ab2854e34ac0e4ffcb ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the segment is limited by a last point. This point defines the highest parameter admitted on the first curve for the segment. If IsOpposite returns False, it defines the highest parameter on the second curve, otherwise, it is the lowest parameter on the second curve.
") HasLastPoint;
		bool HasLastPoint();

		/****** IntRes2d_IntersectionSegment::IsOpposite ******/
		/****** md5 signature: 39d290f12a9d2a15df826d772b56db60 ******/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False if the intersection segment has got the same orientation on both curves.
") IsOpposite;
		bool IsOpposite();

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
		/****** md5 signature: 735b1645735cb30a96608494a342c817 ******/
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
		 IntRes2d_Transition(const bool Tangent, const IntRes2d_Position Pos, const IntRes2d_TypeTrans Type);

		/****** IntRes2d_Transition::IntRes2d_Transition ******/
		/****** md5 signature: e291068d103eb214942dd21accb7c997 ******/
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
		 IntRes2d_Transition(const bool Tangent, const IntRes2d_Position Pos, const IntRes2d_Situation Situ, const bool Oppos);

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
		/****** md5 signature: 39d290f12a9d2a15df826d772b56db60 ******/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns a significant value if TransitionType returns TOUCH. In this case, the function returns true when the 2 curves locally define two different parts of the space. If TransitionType returns IN or OUT or UNDECIDED, the exception DomainError is raised.
") IsOpposite;
		bool IsOpposite();

		/****** IntRes2d_Transition::IsTangent ******/
		/****** md5 signature: baca3d34e02c226d40f886fc1be3d673 ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the 2 curves are tangent at the intersection point. Theexception DomainError is raised if the type of transition is UNDECIDED.
") IsTangent;
		bool IsTangent();

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
		/****** md5 signature: a7d56b096f3a7dd36002ccccd32e1d59 ******/
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
		void SetValue(const bool Tangent, const IntRes2d_Position Pos, const IntRes2d_TypeTrans Type);

		/****** IntRes2d_Transition::SetValue ******/
		/****** md5 signature: 25bf4d303f1a0b9aa51527b10c2ed8e0 ******/
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
		void SetValue(const bool Tangent, const IntRes2d_Position Pos, const IntRes2d_Situation Situ, const bool Oppos);

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
