/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") IntRes2d

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include IntRes2d_headers.i

/* typedefs */
/* end typedefs declaration */

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

%nodefaultctor IntRes2d_Domain;
class IntRes2d_Domain {
	public:
		%feature("autodoc", "	* Creates an infinite Domain (HasFirstPoint = False and HasLastPoint = False).

	:rtype: None
") IntRes2d_Domain;
		 IntRes2d_Domain ();
		%feature("autodoc", "	* Creates a bounded Domain.

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
	:rtype: None
") IntRes2d_Domain;
		 IntRes2d_Domain (const gp_Pnt2d & Pnt1,const Standard_Real Par1,const Standard_Real Tol1,const gp_Pnt2d & Pnt2,const Standard_Real Par2,const Standard_Real Tol2);
		%feature("autodoc", "	* Creates a semi-infinite Domain. If First is set to True, the given point is the first point of the domain, otherwise it is the last point.

	:param Pnt:
	:type Pnt: gp_Pnt2d
	:param Par:
	:type Par: float
	:param Tol:
	:type Tol: float
	:param First:
	:type First: bool
	:rtype: None
") IntRes2d_Domain;
		 IntRes2d_Domain (const gp_Pnt2d & Pnt,const Standard_Real Par,const Standard_Real Tol,const Standard_Boolean First);
		%feature("autodoc", "	* Sets the values for a bounded domain.

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
	:rtype: None
") SetValues;
		void SetValues (const gp_Pnt2d & Pnt1,const Standard_Real Par1,const Standard_Real Tol1,const gp_Pnt2d & Pnt2,const Standard_Real Par2,const Standard_Real Tol2);
		%feature("autodoc", "	* Sets the values for an infinite domain.

	:rtype: None
") SetValues;
		void SetValues ();
		%feature("autodoc", "	* Sets the values for a semi-infinite domain.

	:param Pnt:
	:type Pnt: gp_Pnt2d
	:param Par:
	:type Par: float
	:param Tol:
	:type Tol: float
	:param First:
	:type First: bool
	:rtype: None
") SetValues;
		void SetValues (const gp_Pnt2d & Pnt,const Standard_Real Par,const Standard_Real Tol,const Standard_Boolean First);
		%feature("autodoc", "	* Defines a closed domain.

	:param zero:
	:type zero: float
	:param period:
	:type period: float
	:rtype: None
") SetEquivalentParameters;
		void SetEquivalentParameters (const Standard_Real zero,const Standard_Real period);
		%feature("autodoc", "	* Returns True if the domain has a first point, i-e a point defining the lowest admitted parameter on the curve.

	:rtype: bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("autodoc", "	* Returns the parameter of the first point of the domain The exception DomainError is raised if HasFirstPoint returns False.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	* Returns the first point of the domain. The exception DomainError is raised if HasFirstPoint returns False.

	:rtype: gp_Pnt2d
") FirstPoint;
		const gp_Pnt2d  FirstPoint ();
		%feature("autodoc", "	* Returns the tolerance of the first (left) bound. The exception DomainError is raised if HasFirstPoint returns False.

	:rtype: float
") FirstTolerance;
		Standard_Real FirstTolerance ();
		%feature("autodoc", "	* Returns True if the domain has a last point, i-e a point defining the highest admitted parameter on the curve.

	:rtype: bool
") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("autodoc", "	* Returns the parameter of the last point of the domain. The exception DomainError is raised if HasLastPoint returns False.

	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	* Returns the last point of the domain. The exception DomainError is raised if HasLastPoint returns False.

	:rtype: gp_Pnt2d
") LastPoint;
		const gp_Pnt2d  LastPoint ();
		%feature("autodoc", "	* Returns the tolerance of the last (right) bound. The exception DomainError is raised if HasLastPoint returns False.

	:rtype: float
") LastTolerance;
		Standard_Real LastTolerance ();
		%feature("autodoc", "	* Returns True if the domain is closed.

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "	* Returns Equivalent parameters if the domain is closed. Otherwise, the exception DomainError is raised.

	:param zero:
	:type zero: float &
	:param zeroplusperiod:
	:type zeroplusperiod: float &
	:rtype: None
") EquivalentParameters;
		void EquivalentParameters (Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") IntRes2d_Domain::~IntRes2d_Domain %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntRes2d_Domain {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntRes2d_Intersection;
class IntRes2d_Intersection {
	public:
		%feature("autodoc", "	* returns True when the computation was successful.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns True if there is no intersection between the given arguments. The exception NotDone is raised if IsDone returns False.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	* This function returns the number of intersection points between the 2 curves. The exception NotDone is raised if IsDone returns False.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "	* This function returns the intersection point of range N; The exception NotDone is raised if IsDone returns False. The exception OutOfRange is raised if (N <= 0) or (N > NbPoints).

	:param N:
	:type N: Standard_Integer
	:rtype: IntRes2d_IntersectionPoint
") Point;
		const IntRes2d_IntersectionPoint & Point (const Standard_Integer N);
		%feature("autodoc", "	* This function returns the number of intersection segments between the two curves. The exception NotDone is raised if IsDone returns False.

	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "	* This function returns the intersection segment of range N; The exception NotDone is raised if IsDone returns False. The exception OutOfRange is raised if (N <= 0) or (N > NbPoints).

	:param N:
	:type N: Standard_Integer
	:rtype: IntRes2d_IntersectionSegment
") Segment;
		const IntRes2d_IntersectionSegment & Segment (const Standard_Integer N);
		%feature("autodoc", "	:param Reverseflag:
	:type Reverseflag: bool
	:rtype: None
") SetReversedParameters;
		void SetReversedParameters (const Standard_Boolean Reverseflag);
};


%feature("shadow") IntRes2d_Intersection::~IntRes2d_Intersection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntRes2d_Intersection {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntRes2d_IntersectionPoint;
class IntRes2d_IntersectionPoint {
	public:
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") IntRes2d_IntersectionPoint;
		 IntRes2d_IntersectionPoint ();
		%feature("autodoc", "	* Creates an IntersectionPoint. if ReversedFlag is False, the parameter Uc1(resp. Uc2) and the Transition Trans1 (resp. Trans2) refer to the first curve (resp. second curve) otherwise Uc1 and Trans1 (resp. Uc2 and Trans2) refer to the second curve (resp. the first curve).

	:param P:
	:type P: gp_Pnt2d
	:param Uc1:
	:type Uc1: float
	:param Uc2:
	:type Uc2: float
	:param Trans1:
	:type Trans1: IntRes2d_Transition &
	:param Trans2:
	:type Trans2: IntRes2d_Transition &
	:param ReversedFlag:
	:type ReversedFlag: bool
	:rtype: None
") IntRes2d_IntersectionPoint;
		 IntRes2d_IntersectionPoint (const gp_Pnt2d & P,const Standard_Real Uc1,const Standard_Real Uc2,const IntRes2d_Transition & Trans1,const IntRes2d_Transition & Trans2,const Standard_Boolean ReversedFlag);
		%feature("autodoc", "	* Sets the values for an existing intersection point. The meaning of the parameters are the same as for the Create.

	:param P:
	:type P: gp_Pnt2d
	:param Uc1:
	:type Uc1: float
	:param Uc2:
	:type Uc2: float
	:param Trans1:
	:type Trans1: IntRes2d_Transition &
	:param Trans2:
	:type Trans2: IntRes2d_Transition &
	:param ReversedFlag:
	:type ReversedFlag: bool
	:rtype: None
") SetValues;
		void SetValues (const gp_Pnt2d & P,const Standard_Real Uc1,const Standard_Real Uc2,const IntRes2d_Transition & Trans1,const IntRes2d_Transition & Trans2,const Standard_Boolean ReversedFlag);
		%feature("autodoc", "	* Returns the value of the coordinates of the intersection point in the 2D space.

	:rtype: gp_Pnt2d
") Value;
		const gp_Pnt2d  Value ();
		%feature("autodoc", "	* Returns the parameter on the first curve.

	:rtype: float
") ParamOnFirst;
		Standard_Real ParamOnFirst ();
		%feature("autodoc", "	* Returns the parameter on the second curve.

	:rtype: float
") ParamOnSecond;
		Standard_Real ParamOnSecond ();
		%feature("autodoc", "	* Returns the transition of the 1st curve compared to the 2nd one.

	:rtype: IntRes2d_Transition
") TransitionOfFirst;
		const IntRes2d_Transition & TransitionOfFirst ();
		%feature("autodoc", "	* returns the transition of the 2nd curve compared to the 1st one.

	:rtype: IntRes2d_Transition
") TransitionOfSecond;
		const IntRes2d_Transition & TransitionOfSecond ();
		%feature("autodoc", "	:rtype: gp_Pnt2d
") _CSFDB_GetIntRes2d_IntersectionPointpt;
		const gp_Pnt2d  _CSFDB_GetIntRes2d_IntersectionPointpt ();
		%feature("autodoc", "	:rtype: float
") _CSFDB_GetIntRes2d_IntersectionPointp1;
		Standard_Real _CSFDB_GetIntRes2d_IntersectionPointp1 ();
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_SetIntRes2d_IntersectionPointp1;
		void _CSFDB_SetIntRes2d_IntersectionPointp1 (const Standard_Real p);
		%feature("autodoc", "	:rtype: float
") _CSFDB_GetIntRes2d_IntersectionPointp2;
		Standard_Real _CSFDB_GetIntRes2d_IntersectionPointp2 ();
		%feature("autodoc", "	:param p:
	:type p: float
	:rtype: None
") _CSFDB_SetIntRes2d_IntersectionPointp2;
		void _CSFDB_SetIntRes2d_IntersectionPointp2 (const Standard_Real p);
		%feature("autodoc", "	:rtype: IntRes2d_Transition
") _CSFDB_GetIntRes2d_IntersectionPointtrans1;
		const IntRes2d_Transition & _CSFDB_GetIntRes2d_IntersectionPointtrans1 ();
		%feature("autodoc", "	:rtype: IntRes2d_Transition
") _CSFDB_GetIntRes2d_IntersectionPointtrans2;
		const IntRes2d_Transition & _CSFDB_GetIntRes2d_IntersectionPointtrans2 ();
};


%feature("shadow") IntRes2d_IntersectionPoint::~IntRes2d_IntersectionPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntRes2d_IntersectionPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntRes2d_IntersectionSegment;
class IntRes2d_IntersectionSegment {
	public:
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment ();
		%feature("autodoc", "	:param P1:
	:type P1: IntRes2d_IntersectionPoint &
	:param P2:
	:type P2: IntRes2d_IntersectionPoint &
	:param Oppos:
	:type Oppos: bool
	:param ReverseFlag:
	:type ReverseFlag: bool
	:rtype: None
") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment (const IntRes2d_IntersectionPoint & P1,const IntRes2d_IntersectionPoint & P2,const Standard_Boolean Oppos,const Standard_Boolean ReverseFlag);
		%feature("autodoc", "	:param P:
	:type P: IntRes2d_IntersectionPoint &
	:param First:
	:type First: bool
	:param Oppos:
	:type Oppos: bool
	:param ReverseFlag:
	:type ReverseFlag: bool
	:rtype: None
") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment (const IntRes2d_IntersectionPoint & P,const Standard_Boolean First,const Standard_Boolean Oppos,const Standard_Boolean ReverseFlag);
		%feature("autodoc", "	* Creates an infinite segment of intersection.

	:param Oppos:
	:type Oppos: bool
	:rtype: None
") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment (const Standard_Boolean Oppos);
		%feature("autodoc", "	* Returns True if the intersection segment has got the same orientation on both curves.

	:rtype: bool
") IsOpposite;
		Standard_Boolean IsOpposite ();
		%feature("autodoc", "	* Returns True if the segment is limited by a first point. This point defines the lowest parameter admitted on the first curve for the segment. If IsOpposite returns False, it defines the lowest parameter on the second curve, otherwise, it is the highest parameter on the second curve.

	:rtype: bool
") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("autodoc", "	* Returns the first point of the segment as an IntersectionPoint (with a transition). The exception DomainError is raised if HasFirstPoint returns False.

	:rtype: IntRes2d_IntersectionPoint
") FirstPoint;
		const IntRes2d_IntersectionPoint & FirstPoint ();
		%feature("autodoc", "	* Returns True if the segment is limited by a last point. This point defines the highest parameter admitted on the first curve for the segment. If IsOpposite returns False, it defines the highest parameter on the second curve, otherwise, it is the lowest parameter on the second curve.

	:rtype: bool
") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("autodoc", "	* Returns the last point of the segment as an IntersectionPoint (with a transition). The exception DomainError is raised if HasLastExtremity returns False.

	:rtype: IntRes2d_IntersectionPoint
") LastPoint;
		const IntRes2d_IntersectionPoint & LastPoint ();
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetIntRes2d_IntersectionSegmentoppos;
		Standard_Boolean _CSFDB_GetIntRes2d_IntersectionSegmentoppos ();
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetIntRes2d_IntersectionSegmentoppos;
		void _CSFDB_SetIntRes2d_IntersectionSegmentoppos (const Standard_Boolean p);
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetIntRes2d_IntersectionSegmentfirst;
		Standard_Boolean _CSFDB_GetIntRes2d_IntersectionSegmentfirst ();
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetIntRes2d_IntersectionSegmentfirst;
		void _CSFDB_SetIntRes2d_IntersectionSegmentfirst (const Standard_Boolean p);
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetIntRes2d_IntersectionSegmentlast;
		Standard_Boolean _CSFDB_GetIntRes2d_IntersectionSegmentlast ();
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetIntRes2d_IntersectionSegmentlast;
		void _CSFDB_SetIntRes2d_IntersectionSegmentlast (const Standard_Boolean p);
		%feature("autodoc", "	:rtype: IntRes2d_IntersectionPoint
") _CSFDB_GetIntRes2d_IntersectionSegmentptfirst;
		const IntRes2d_IntersectionPoint & _CSFDB_GetIntRes2d_IntersectionSegmentptfirst ();
		%feature("autodoc", "	:rtype: IntRes2d_IntersectionPoint
") _CSFDB_GetIntRes2d_IntersectionSegmentptlast;
		const IntRes2d_IntersectionPoint & _CSFDB_GetIntRes2d_IntersectionSegmentptlast ();
};


%feature("shadow") IntRes2d_IntersectionSegment::~IntRes2d_IntersectionSegment %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntRes2d_IntersectionSegment {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint;
class IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: IntRes2d_IntersectionPoint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint;
		 IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint (const IntRes2d_IntersectionPoint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: IntRes2d_IntersectionPoint
") Value;
		IntRes2d_IntersectionPoint & Value ();
};


%feature("shadow") IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint::~IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint {
	Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint GetHandle() {
	return *(Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint*) &$self;
	}
};

%nodefaultctor Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint;
class Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint();
        Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint(const Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint &aHandle);
        Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint(const IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint {
    IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint* GetObject() {
    return (IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint*)$self->Access();
    }
};
%feature("shadow") Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint::~Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment;
class IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment : public TCollection_SeqNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: IntRes2d_IntersectionSegment &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment;
		 IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment (const IntRes2d_IntersectionSegment & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: IntRes2d_IntersectionSegment
") Value;
		IntRes2d_IntersectionSegment & Value ();
};


%feature("shadow") IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment::~IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment {
	Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment GetHandle() {
	return *(Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment*) &$self;
	}
};

%nodefaultctor Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment;
class Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment();
        Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment(const Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment &aHandle);
        Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment(const IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment {
    IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment* GetObject() {
    return (IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment*)$self->Access();
    }
};
%feature("shadow") Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment::~Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntRes2d_SequenceOfIntersectionPoint;
class IntRes2d_SequenceOfIntersectionPoint : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") IntRes2d_SequenceOfIntersectionPoint;
		 IntRes2d_SequenceOfIntersectionPoint ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: IntRes2d_SequenceOfIntersectionPoint &
	:rtype: IntRes2d_SequenceOfIntersectionPoint
") Assign;
		const IntRes2d_SequenceOfIntersectionPoint & Assign (const IntRes2d_SequenceOfIntersectionPoint & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntRes2d_SequenceOfIntersectionPoint &
	:rtype: IntRes2d_SequenceOfIntersectionPoint
") operator=;
		const IntRes2d_SequenceOfIntersectionPoint & operator = (const IntRes2d_SequenceOfIntersectionPoint & Other);
		%feature("autodoc", "	:param T:
	:type T: IntRes2d_IntersectionPoint &
	:rtype: None
") Append;
		void Append (const IntRes2d_IntersectionPoint & T);
		%feature("autodoc", "	:param S:
	:type S: IntRes2d_SequenceOfIntersectionPoint &
	:rtype: None
") Append;
		void Append (IntRes2d_SequenceOfIntersectionPoint & S);
		%feature("autodoc", "	:param T:
	:type T: IntRes2d_IntersectionPoint &
	:rtype: None
") Prepend;
		void Prepend (const IntRes2d_IntersectionPoint & T);
		%feature("autodoc", "	:param S:
	:type S: IntRes2d_SequenceOfIntersectionPoint &
	:rtype: None
") Prepend;
		void Prepend (IntRes2d_SequenceOfIntersectionPoint & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntRes2d_IntersectionPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntRes2d_IntersectionPoint & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntRes2d_SequenceOfIntersectionPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntRes2d_SequenceOfIntersectionPoint & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntRes2d_IntersectionPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntRes2d_IntersectionPoint & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntRes2d_SequenceOfIntersectionPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntRes2d_SequenceOfIntersectionPoint & S);
		%feature("autodoc", "	:rtype: IntRes2d_IntersectionPoint
") First;
		const IntRes2d_IntersectionPoint & First ();
		%feature("autodoc", "	:rtype: IntRes2d_IntersectionPoint
") Last;
		const IntRes2d_IntersectionPoint & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: IntRes2d_SequenceOfIntersectionPoint &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntRes2d_SequenceOfIntersectionPoint & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntRes2d_IntersectionPoint
") Value;
		const IntRes2d_IntersectionPoint & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: IntRes2d_IntersectionPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntRes2d_IntersectionPoint & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntRes2d_IntersectionPoint
") ChangeValue;
		IntRes2d_IntersectionPoint & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") IntRes2d_SequenceOfIntersectionPoint::~IntRes2d_SequenceOfIntersectionPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntRes2d_SequenceOfIntersectionPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntRes2d_SequenceOfIntersectionSegment;
class IntRes2d_SequenceOfIntersectionSegment : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "	:rtype: None
") IntRes2d_SequenceOfIntersectionSegment;
		 IntRes2d_SequenceOfIntersectionSegment ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: IntRes2d_SequenceOfIntersectionSegment &
	:rtype: IntRes2d_SequenceOfIntersectionSegment
") Assign;
		const IntRes2d_SequenceOfIntersectionSegment & Assign (const IntRes2d_SequenceOfIntersectionSegment & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntRes2d_SequenceOfIntersectionSegment &
	:rtype: IntRes2d_SequenceOfIntersectionSegment
") operator=;
		const IntRes2d_SequenceOfIntersectionSegment & operator = (const IntRes2d_SequenceOfIntersectionSegment & Other);
		%feature("autodoc", "	:param T:
	:type T: IntRes2d_IntersectionSegment &
	:rtype: None
") Append;
		void Append (const IntRes2d_IntersectionSegment & T);
		%feature("autodoc", "	:param S:
	:type S: IntRes2d_SequenceOfIntersectionSegment &
	:rtype: None
") Append;
		void Append (IntRes2d_SequenceOfIntersectionSegment & S);
		%feature("autodoc", "	:param T:
	:type T: IntRes2d_IntersectionSegment &
	:rtype: None
") Prepend;
		void Prepend (const IntRes2d_IntersectionSegment & T);
		%feature("autodoc", "	:param S:
	:type S: IntRes2d_SequenceOfIntersectionSegment &
	:rtype: None
") Prepend;
		void Prepend (IntRes2d_SequenceOfIntersectionSegment & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntRes2d_IntersectionSegment &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntRes2d_IntersectionSegment & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntRes2d_SequenceOfIntersectionSegment &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntRes2d_SequenceOfIntersectionSegment & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntRes2d_IntersectionSegment &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntRes2d_IntersectionSegment & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntRes2d_SequenceOfIntersectionSegment &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntRes2d_SequenceOfIntersectionSegment & S);
		%feature("autodoc", "	:rtype: IntRes2d_IntersectionSegment
") First;
		const IntRes2d_IntersectionSegment & First ();
		%feature("autodoc", "	:rtype: IntRes2d_IntersectionSegment
") Last;
		const IntRes2d_IntersectionSegment & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: IntRes2d_SequenceOfIntersectionSegment &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntRes2d_SequenceOfIntersectionSegment & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntRes2d_IntersectionSegment
") Value;
		const IntRes2d_IntersectionSegment & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: IntRes2d_IntersectionSegment &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntRes2d_IntersectionSegment & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntRes2d_IntersectionSegment
") ChangeValue;
		IntRes2d_IntersectionSegment & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: Standard_Integer
	:param ToIndex:
	:type ToIndex: Standard_Integer
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") IntRes2d_SequenceOfIntersectionSegment::~IntRes2d_SequenceOfIntersectionSegment %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntRes2d_SequenceOfIntersectionSegment {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntRes2d_Transition;
class IntRes2d_Transition {
	public:
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") IntRes2d_Transition;
		 IntRes2d_Transition ();
		%feature("autodoc", "	* Creates an IN or OUT transition.

	:param Tangent:
	:type Tangent: bool
	:param Pos:
	:type Pos: IntRes2d_Position
	:param Type:
	:type Type: IntRes2d_TypeTrans
	:rtype: None
") IntRes2d_Transition;
		 IntRes2d_Transition (const Standard_Boolean Tangent,const IntRes2d_Position Pos,const IntRes2d_TypeTrans Type);
		%feature("autodoc", "	* Creates a TOUCH transition.

	:param Tangent:
	:type Tangent: bool
	:param Pos:
	:type Pos: IntRes2d_Position
	:param Situ:
	:type Situ: IntRes2d_Situation
	:param Oppos:
	:type Oppos: bool
	:rtype: None
") IntRes2d_Transition;
		 IntRes2d_Transition (const Standard_Boolean Tangent,const IntRes2d_Position Pos,const IntRes2d_Situation Situ,const Standard_Boolean Oppos);
		%feature("autodoc", "	* Creates an UNDECIDED transition.

	:param Pos:
	:type Pos: IntRes2d_Position
	:rtype: None
") IntRes2d_Transition;
		 IntRes2d_Transition (const IntRes2d_Position Pos);
		%feature("autodoc", "	* Sets the values of an IN or OUT transition.

	:param Tangent:
	:type Tangent: bool
	:param Pos:
	:type Pos: IntRes2d_Position
	:param Type:
	:type Type: IntRes2d_TypeTrans
	:rtype: None
") SetValue;
		void SetValue (const Standard_Boolean Tangent,const IntRes2d_Position Pos,const IntRes2d_TypeTrans Type);
		%feature("autodoc", "	* Sets the values of a TOUCH transition.

	:param Tangent:
	:type Tangent: bool
	:param Pos:
	:type Pos: IntRes2d_Position
	:param Situ:
	:type Situ: IntRes2d_Situation
	:param Oppos:
	:type Oppos: bool
	:rtype: None
") SetValue;
		void SetValue (const Standard_Boolean Tangent,const IntRes2d_Position Pos,const IntRes2d_Situation Situ,const Standard_Boolean Oppos);
		%feature("autodoc", "	* Sets the values of an UNDECIDED transition.

	:param Pos:
	:type Pos: IntRes2d_Position
	:rtype: None
") SetValue;
		void SetValue (const IntRes2d_Position Pos);
		%feature("autodoc", "	* Sets the value of the position.

	:param Pos:
	:type Pos: IntRes2d_Position
	:rtype: None
") SetPosition;
		void SetPosition (const IntRes2d_Position Pos);
		%feature("autodoc", "	* Indicates if the intersection is at the beginning (IntRes2d_Head), at the end (IntRes2d_End), or in the middle (IntRes2d_Middle) of the curve.

	:rtype: IntRes2d_Position
") PositionOnCurve;
		IntRes2d_Position PositionOnCurve ();
		%feature("autodoc", "	* Returns the type of transition at the intersection. It may be IN or OUT or TOUCH, or UNDECIDED if the two first derivatives are not enough to give the tangent to one of the two curves.

	:rtype: IntRes2d_TypeTrans
") TransitionType;
		IntRes2d_TypeTrans TransitionType ();
		%feature("autodoc", "	* Returns True when the 2 curves are tangent at the intersection point. Theexception DomainError is raised if the type of transition is UNDECIDED.

	:rtype: bool
") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("autodoc", "	* returns a significant value if TransitionType returns TOUCH. In this case, the function returns : INSIDE when the curve remains inside the other one, OUTSIDE when it remains outside the other one, UNKNOWN when the calculus, based on the second derivatives cannot give the result. If TransitionType returns IN or OUT or UNDECIDED, the exception DomainError is raised.

	:rtype: IntRes2d_Situation
") Situation;
		IntRes2d_Situation Situation ();
		%feature("autodoc", "	* returns a significant value if TransitionType returns TOUCH. In this case, the function returns true when the 2 curves locally define two different parts of the space. If TransitionType returns IN or OUT or UNDECIDED, the exception DomainError is raised.

	:rtype: bool
") IsOpposite;
		Standard_Boolean IsOpposite ();
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetIntRes2d_Transitiontangent;
		Standard_Boolean _CSFDB_GetIntRes2d_Transitiontangent ();
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetIntRes2d_Transitiontangent;
		void _CSFDB_SetIntRes2d_Transitiontangent (const Standard_Boolean p);
		%feature("autodoc", "	:rtype: IntRes2d_Position
") _CSFDB_GetIntRes2d_Transitionposit;
		IntRes2d_Position _CSFDB_GetIntRes2d_Transitionposit ();
		%feature("autodoc", "	:param p:
	:type p: IntRes2d_Position
	:rtype: None
") _CSFDB_SetIntRes2d_Transitionposit;
		void _CSFDB_SetIntRes2d_Transitionposit (const IntRes2d_Position p);
		%feature("autodoc", "	:rtype: IntRes2d_TypeTrans
") _CSFDB_GetIntRes2d_Transitiontypetra;
		IntRes2d_TypeTrans _CSFDB_GetIntRes2d_Transitiontypetra ();
		%feature("autodoc", "	:param p:
	:type p: IntRes2d_TypeTrans
	:rtype: None
") _CSFDB_SetIntRes2d_Transitiontypetra;
		void _CSFDB_SetIntRes2d_Transitiontypetra (const IntRes2d_TypeTrans p);
		%feature("autodoc", "	:rtype: IntRes2d_Situation
") _CSFDB_GetIntRes2d_Transitionsituat;
		IntRes2d_Situation _CSFDB_GetIntRes2d_Transitionsituat ();
		%feature("autodoc", "	:param p:
	:type p: IntRes2d_Situation
	:rtype: None
") _CSFDB_SetIntRes2d_Transitionsituat;
		void _CSFDB_SetIntRes2d_Transitionsituat (const IntRes2d_Situation p);
		%feature("autodoc", "	:rtype: bool
") _CSFDB_GetIntRes2d_Transitionoppos;
		Standard_Boolean _CSFDB_GetIntRes2d_Transitionoppos ();
		%feature("autodoc", "	:param p:
	:type p: bool
	:rtype: None
") _CSFDB_SetIntRes2d_Transitionoppos;
		void _CSFDB_SetIntRes2d_Transitionoppos (const Standard_Boolean p);
};


%feature("shadow") IntRes2d_Transition::~IntRes2d_Transition %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntRes2d_Transition {
	void _kill_pointed() {
		delete $self;
	}
};
