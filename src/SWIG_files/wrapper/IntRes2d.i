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

/* handles */
/* end handles declaration */

/* templates */
%template(IntRes2d_SequenceOfIntersectionSegment) NCollection_Sequence <IntRes2d_IntersectionSegment>;
%template(IntRes2d_SequenceOfIntersectionPoint) NCollection_Sequence <IntRes2d_IntersectionPoint>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <IntRes2d_IntersectionSegment> IntRes2d_SequenceOfIntersectionSegment;
typedef NCollection_Sequence <IntRes2d_IntersectionPoint> IntRes2d_SequenceOfIntersectionPoint;
/* end typedefs declaration */

/************************
* class IntRes2d_Domain *
************************/
class IntRes2d_Domain {
	public:
		/****************** EquivalentParameters ******************/
		%feature("compactdefaultargs") EquivalentParameters;
		%feature("autodoc", "* Returns Equivalent parameters if the domain is closed. Otherwise, the exception DomainError is raised.
	:param zero:
	:type zero: float
	:param zeroplusperiod:
	:type zeroplusperiod: float
	:rtype: None") EquivalentParameters;
		void EquivalentParameters (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "* Returns the parameter of the first point of the domain The exception DomainError is raised if HasFirstPoint returns False.
	:rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the first point of the domain. The exception DomainError is raised if HasFirstPoint returns False.
	:rtype: gp_Pnt2d") FirstPoint;
		const gp_Pnt2d  FirstPoint ();

		/****************** FirstTolerance ******************/
		%feature("compactdefaultargs") FirstTolerance;
		%feature("autodoc", "* Returns the tolerance of the first (left) bound. The exception DomainError is raised if HasFirstPoint returns False.
	:rtype: float") FirstTolerance;
		Standard_Real FirstTolerance ();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "* Returns True if the domain has a first point, i-e a point defining the lowest admitted parameter on the curve.
	:rtype: bool") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "* Returns True if the domain has a last point, i-e a point defining the highest admitted parameter on the curve.
	:rtype: bool") HasLastPoint;
		Standard_Boolean HasLastPoint ();

		/****************** IntRes2d_Domain ******************/
		%feature("compactdefaultargs") IntRes2d_Domain;
		%feature("autodoc", "* Creates an infinite Domain (HasFirstPoint = False and HasLastPoint = False).
	:rtype: None") IntRes2d_Domain;
		 IntRes2d_Domain ();

		/****************** IntRes2d_Domain ******************/
		%feature("compactdefaultargs") IntRes2d_Domain;
		%feature("autodoc", "* Creates a bounded Domain.
	:param Pnt1:
	:type Pnt1: gp_Pnt2d
	:param Par1:
	:type Par1: float
	:param Tol1:
	:type Tol1: float
	:param Pnt2:
	:type Pnt2: gp_Pnt2d
	:param Par2:
	:type Par2: float
	:param Tol2:
	:type Tol2: float
	:rtype: None") IntRes2d_Domain;
		 IntRes2d_Domain (const gp_Pnt2d & Pnt1,const Standard_Real Par1,const Standard_Real Tol1,const gp_Pnt2d & Pnt2,const Standard_Real Par2,const Standard_Real Tol2);

		/****************** IntRes2d_Domain ******************/
		%feature("compactdefaultargs") IntRes2d_Domain;
		%feature("autodoc", "* Creates a semi-infinite Domain. If First is set to True, the given point is the first point of the domain, otherwise it is the last point.
	:param Pnt:
	:type Pnt: gp_Pnt2d
	:param Par:
	:type Par: float
	:param Tol:
	:type Tol: float
	:param First:
	:type First: bool
	:rtype: None") IntRes2d_Domain;
		 IntRes2d_Domain (const gp_Pnt2d & Pnt,const Standard_Real Par,const Standard_Real Tol,const Standard_Boolean First);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "* Returns True if the domain is closed.
	:rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "* Returns the parameter of the last point of the domain. The exception DomainError is raised if HasLastPoint returns False.
	:rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "* Returns the last point of the domain. The exception DomainError is raised if HasLastPoint returns False.
	:rtype: gp_Pnt2d") LastPoint;
		const gp_Pnt2d  LastPoint ();

		/****************** LastTolerance ******************/
		%feature("compactdefaultargs") LastTolerance;
		%feature("autodoc", "* Returns the tolerance of the last (right) bound. The exception DomainError is raised if HasLastPoint returns False.
	:rtype: float") LastTolerance;
		Standard_Real LastTolerance ();

		/****************** SetEquivalentParameters ******************/
		%feature("compactdefaultargs") SetEquivalentParameters;
		%feature("autodoc", "* Defines a closed domain.
	:param zero:
	:type zero: float
	:param period:
	:type period: float
	:rtype: None") SetEquivalentParameters;
		void SetEquivalentParameters (const Standard_Real zero,const Standard_Real period);

		/****************** SetValues ******************/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "* Sets the values for a bounded domain.
	:param Pnt1:
	:type Pnt1: gp_Pnt2d
	:param Par1:
	:type Par1: float
	:param Tol1:
	:type Tol1: float
	:param Pnt2:
	:type Pnt2: gp_Pnt2d
	:param Par2:
	:type Par2: float
	:param Tol2:
	:type Tol2: float
	:rtype: None") SetValues;
		void SetValues (const gp_Pnt2d & Pnt1,const Standard_Real Par1,const Standard_Real Tol1,const gp_Pnt2d & Pnt2,const Standard_Real Par2,const Standard_Real Tol2);

		/****************** SetValues ******************/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "* Sets the values for an infinite domain.
	:rtype: None") SetValues;
		void SetValues ();

		/****************** SetValues ******************/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "* Sets the values for a semi-infinite domain.
	:param Pnt:
	:type Pnt: gp_Pnt2d
	:param Par:
	:type Par: float
	:param Tol:
	:type Tol: float
	:param First:
	:type First: bool
	:rtype: None") SetValues;
		void SetValues (const gp_Pnt2d & Pnt,const Standard_Real Par,const Standard_Real Tol,const Standard_Boolean First);

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
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns True when the computation was successful.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "* Returns True if there is no intersection between the given arguments. The exception NotDone is raised if IsDone returns False.
	:rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "* This function returns the number of intersection points between the 2 curves. The exception NotDone is raised if IsDone returns False.
	:rtype: int") NbPoints;
		Standard_Integer NbPoints ();

		/****************** NbSegments ******************/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "* This function returns the number of intersection segments between the two curves. The exception NotDone is raised if IsDone returns False.
	:rtype: int") NbSegments;
		Standard_Integer NbSegments ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* This function returns the intersection point of range N; The exception NotDone is raised if IsDone returns False. The exception OutOfRange is raised if (N <= 0) or (N > NbPoints).
	:param N:
	:type N: int
	:rtype: IntRes2d_IntersectionPoint") Point;
		const IntRes2d_IntersectionPoint & Point (const Standard_Integer N);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "* This function returns the intersection segment of range N; The exception NotDone is raised if IsDone returns False. The exception OutOfRange is raised if (N <= 0) or (N > NbPoints).
	:param N:
	:type N: int
	:rtype: IntRes2d_IntersectionSegment") Segment;
		const IntRes2d_IntersectionSegment & Segment (const Standard_Integer N);

		/****************** SetReversedParameters ******************/
		%feature("compactdefaultargs") SetReversedParameters;
		%feature("autodoc", ":param Reverseflag:
	:type Reverseflag: bool
	:rtype: None") SetReversedParameters;
		void SetReversedParameters (const Standard_Boolean Reverseflag);

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
		%feature("compactdefaultargs") IntRes2d_IntersectionPoint;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") IntRes2d_IntersectionPoint;
		 IntRes2d_IntersectionPoint ();

		/****************** IntRes2d_IntersectionPoint ******************/
		%feature("compactdefaultargs") IntRes2d_IntersectionPoint;
		%feature("autodoc", "* Creates an IntersectionPoint. if ReversedFlag is False, the parameter Uc1(resp. Uc2) and the Transition Trans1 (resp. Trans2) refer to the first curve (resp. second curve) otherwise Uc1 and Trans1 (resp. Uc2 and Trans2) refer to the second curve (resp. the first curve).
	:param P:
	:type P: gp_Pnt2d
	:param Uc1:
	:type Uc1: float
	:param Uc2:
	:type Uc2: float
	:param Trans1:
	:type Trans1: IntRes2d_Transition
	:param Trans2:
	:type Trans2: IntRes2d_Transition
	:param ReversedFlag:
	:type ReversedFlag: bool
	:rtype: None") IntRes2d_IntersectionPoint;
		 IntRes2d_IntersectionPoint (const gp_Pnt2d & P,const Standard_Real Uc1,const Standard_Real Uc2,const IntRes2d_Transition & Trans1,const IntRes2d_Transition & Trans2,const Standard_Boolean ReversedFlag);

		/****************** ParamOnFirst ******************/
		%feature("compactdefaultargs") ParamOnFirst;
		%feature("autodoc", "* Returns the parameter on the first curve.
	:rtype: float") ParamOnFirst;
		Standard_Real ParamOnFirst ();

		/****************** ParamOnSecond ******************/
		%feature("compactdefaultargs") ParamOnSecond;
		%feature("autodoc", "* Returns the parameter on the second curve.
	:rtype: float") ParamOnSecond;
		Standard_Real ParamOnSecond ();

		/****************** SetValues ******************/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "* Sets the values for an existing intersection point. The meaning of the parameters are the same as for the Create.
	:param P:
	:type P: gp_Pnt2d
	:param Uc1:
	:type Uc1: float
	:param Uc2:
	:type Uc2: float
	:param Trans1:
	:type Trans1: IntRes2d_Transition
	:param Trans2:
	:type Trans2: IntRes2d_Transition
	:param ReversedFlag:
	:type ReversedFlag: bool
	:rtype: None") SetValues;
		void SetValues (const gp_Pnt2d & P,const Standard_Real Uc1,const Standard_Real Uc2,const IntRes2d_Transition & Trans1,const IntRes2d_Transition & Trans2,const Standard_Boolean ReversedFlag);

		/****************** TransitionOfFirst ******************/
		%feature("compactdefaultargs") TransitionOfFirst;
		%feature("autodoc", "* Returns the transition of the 1st curve compared to the 2nd one.
	:rtype: IntRes2d_Transition") TransitionOfFirst;
		const IntRes2d_Transition & TransitionOfFirst ();

		/****************** TransitionOfSecond ******************/
		%feature("compactdefaultargs") TransitionOfSecond;
		%feature("autodoc", "* returns the transition of the 2nd curve compared to the 1st one.
	:rtype: IntRes2d_Transition") TransitionOfSecond;
		const IntRes2d_Transition & TransitionOfSecond ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the value of the coordinates of the intersection point in the 2D space.
	:rtype: gp_Pnt2d") Value;
		const gp_Pnt2d  Value ();

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
		/****************** FirstPoint ******************/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "* Returns the first point of the segment as an IntersectionPoint (with a transition). The exception DomainError is raised if HasFirstPoint returns False.
	:rtype: IntRes2d_IntersectionPoint") FirstPoint;
		const IntRes2d_IntersectionPoint & FirstPoint ();

		/****************** HasFirstPoint ******************/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "* Returns True if the segment is limited by a first point. This point defines the lowest parameter admitted on the first curve for the segment. If IsOpposite returns False, it defines the lowest parameter on the second curve, otherwise, it is the highest parameter on the second curve.
	:rtype: bool") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();

		/****************** HasLastPoint ******************/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "* Returns True if the segment is limited by a last point. This point defines the highest parameter admitted on the first curve for the segment. If IsOpposite returns False, it defines the highest parameter on the second curve, otherwise, it is the lowest parameter on the second curve.
	:rtype: bool") HasLastPoint;
		Standard_Boolean HasLastPoint ();

		/****************** IntRes2d_IntersectionSegment ******************/
		%feature("compactdefaultargs") IntRes2d_IntersectionSegment;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment ();

		/****************** IntRes2d_IntersectionSegment ******************/
		%feature("compactdefaultargs") IntRes2d_IntersectionSegment;
		%feature("autodoc", ":param P1:
	:type P1: IntRes2d_IntersectionPoint
	:param P2:
	:type P2: IntRes2d_IntersectionPoint
	:param Oppos:
	:type Oppos: bool
	:param ReverseFlag:
	:type ReverseFlag: bool
	:rtype: None") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment (const IntRes2d_IntersectionPoint & P1,const IntRes2d_IntersectionPoint & P2,const Standard_Boolean Oppos,const Standard_Boolean ReverseFlag);

		/****************** IntRes2d_IntersectionSegment ******************/
		%feature("compactdefaultargs") IntRes2d_IntersectionSegment;
		%feature("autodoc", ":param P:
	:type P: IntRes2d_IntersectionPoint
	:param First:
	:type First: bool
	:param Oppos:
	:type Oppos: bool
	:param ReverseFlag:
	:type ReverseFlag: bool
	:rtype: None") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment (const IntRes2d_IntersectionPoint & P,const Standard_Boolean First,const Standard_Boolean Oppos,const Standard_Boolean ReverseFlag);

		/****************** IntRes2d_IntersectionSegment ******************/
		%feature("compactdefaultargs") IntRes2d_IntersectionSegment;
		%feature("autodoc", "* Creates an infinite segment of intersection.
	:param Oppos:
	:type Oppos: bool
	:rtype: None") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment (const Standard_Boolean Oppos);

		/****************** IsOpposite ******************/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "* Returns False if the intersection segment has got the same orientation on both curves.
	:rtype: bool") IsOpposite;
		Standard_Boolean IsOpposite ();

		/****************** LastPoint ******************/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "* Returns the last point of the segment as an IntersectionPoint (with a transition). The exception DomainError is raised if HasLastExtremity returns False.
	:rtype: IntRes2d_IntersectionPoint") LastPoint;
		const IntRes2d_IntersectionPoint & LastPoint ();

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
		%feature("compactdefaultargs") IntRes2d_Transition;
		%feature("autodoc", "* Empty constructor.
	:rtype: None") IntRes2d_Transition;
		 IntRes2d_Transition ();

		/****************** IntRes2d_Transition ******************/
		%feature("compactdefaultargs") IntRes2d_Transition;
		%feature("autodoc", "* Creates an IN or OUT transition.
	:param Tangent:
	:type Tangent: bool
	:param Pos:
	:type Pos: IntRes2d_Position
	:param Type:
	:type Type: IntRes2d_TypeTrans
	:rtype: None") IntRes2d_Transition;
		 IntRes2d_Transition (const Standard_Boolean Tangent,const IntRes2d_Position Pos,const IntRes2d_TypeTrans Type);

		/****************** IntRes2d_Transition ******************/
		%feature("compactdefaultargs") IntRes2d_Transition;
		%feature("autodoc", "* Creates a TOUCH transition.
	:param Tangent:
	:type Tangent: bool
	:param Pos:
	:type Pos: IntRes2d_Position
	:param Situ:
	:type Situ: IntRes2d_Situation
	:param Oppos:
	:type Oppos: bool
	:rtype: None") IntRes2d_Transition;
		 IntRes2d_Transition (const Standard_Boolean Tangent,const IntRes2d_Position Pos,const IntRes2d_Situation Situ,const Standard_Boolean Oppos);

		/****************** IntRes2d_Transition ******************/
		%feature("compactdefaultargs") IntRes2d_Transition;
		%feature("autodoc", "* Creates an UNDECIDED transition.
	:param Pos:
	:type Pos: IntRes2d_Position
	:rtype: None") IntRes2d_Transition;
		 IntRes2d_Transition (const IntRes2d_Position Pos);

		/****************** IsOpposite ******************/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "* returns a significant value if TransitionType returns TOUCH. In this case, the function returns true when the 2 curves locally define two different parts of the space. If TransitionType returns IN or OUT or UNDECIDED, the exception DomainError is raised.
	:rtype: bool") IsOpposite;
		Standard_Boolean IsOpposite ();

		/****************** IsTangent ******************/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "* Returns True when the 2 curves are tangent at the intersection point. Theexception DomainError is raised if the type of transition is UNDECIDED.
	:rtype: bool") IsTangent;
		Standard_Boolean IsTangent ();

		/****************** PositionOnCurve ******************/
		%feature("compactdefaultargs") PositionOnCurve;
		%feature("autodoc", "* Indicates if the intersection is at the beginning (IntRes2d_Head), at the end (IntRes2d_End), or in the middle (IntRes2d_Middle) of the curve.
	:rtype: IntRes2d_Position") PositionOnCurve;
		IntRes2d_Position PositionOnCurve ();

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "* Sets the value of the position.
	:param Pos:
	:type Pos: IntRes2d_Position
	:rtype: None") SetPosition;
		void SetPosition (const IntRes2d_Position Pos);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Sets the values of an IN or OUT transition.
	:param Tangent:
	:type Tangent: bool
	:param Pos:
	:type Pos: IntRes2d_Position
	:param Type:
	:type Type: IntRes2d_TypeTrans
	:rtype: None") SetValue;
		void SetValue (const Standard_Boolean Tangent,const IntRes2d_Position Pos,const IntRes2d_TypeTrans Type);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Sets the values of a TOUCH transition.
	:param Tangent:
	:type Tangent: bool
	:param Pos:
	:type Pos: IntRes2d_Position
	:param Situ:
	:type Situ: IntRes2d_Situation
	:param Oppos:
	:type Oppos: bool
	:rtype: None") SetValue;
		void SetValue (const Standard_Boolean Tangent,const IntRes2d_Position Pos,const IntRes2d_Situation Situ,const Standard_Boolean Oppos);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Sets the values of an UNDECIDED transition.
	:param Pos:
	:type Pos: IntRes2d_Position
	:rtype: None") SetValue;
		void SetValue (const IntRes2d_Position Pos);

		/****************** Situation ******************/
		%feature("compactdefaultargs") Situation;
		%feature("autodoc", "* returns a significant value if TransitionType returns TOUCH. In this case, the function returns : INSIDE when the curve remains inside the other one, OUTSIDE when it remains outside the other one, UNKNOWN when the calculus, based on the second derivatives cannot give the result. If TransitionType returns IN or OUT or UNDECIDED, the exception DomainError is raised.
	:rtype: IntRes2d_Situation") Situation;
		IntRes2d_Situation Situation ();

		/****************** TransitionType ******************/
		%feature("compactdefaultargs") TransitionType;
		%feature("autodoc", "* Returns the type of transition at the intersection. It may be IN or OUT or TOUCH, or UNDECIDED if the two first derivatives are not enough to give the tangent to one of the two curves.
	:rtype: IntRes2d_TypeTrans") TransitionType;
		IntRes2d_TypeTrans TransitionType ();

};


%extend IntRes2d_Transition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
