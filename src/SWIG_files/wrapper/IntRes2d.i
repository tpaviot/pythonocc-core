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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an infinite Domain (HasFirstPoint = False  
         and HasLastPoint = False).") IntRes2d_Domain;
		 IntRes2d_Domain ();
		%feature("autodoc", "Args:
	Pnt1(gp_Pnt2d)
	Par1(Standard_Real)
	Tol1(Standard_Real)
	Pnt2(gp_Pnt2d)
	Par2(Standard_Real)
	Tol2(Standard_Real)

Returns:
	None

Creates a bounded Domain.") IntRes2d_Domain;
		 IntRes2d_Domain (const gp_Pnt2d & Pnt1,const Standard_Real Par1,const Standard_Real Tol1,const gp_Pnt2d & Pnt2,const Standard_Real Par2,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	Pnt(gp_Pnt2d)
	Par(Standard_Real)
	Tol(Standard_Real)
	First(Standard_Boolean)

Returns:
	None

Creates a semi-infinite Domain. If First is set to  
         True, the given point is the first point of the domain,  
         otherwise it is the last point.") IntRes2d_Domain;
		 IntRes2d_Domain (const gp_Pnt2d & Pnt,const Standard_Real Par,const Standard_Real Tol,const Standard_Boolean First);
		%feature("autodoc", "Args:
	Pnt1(gp_Pnt2d)
	Par1(Standard_Real)
	Tol1(Standard_Real)
	Pnt2(gp_Pnt2d)
	Par2(Standard_Real)
	Tol2(Standard_Real)

Returns:
	None

Sets the values for a bounded domain.") SetValues;
		void SetValues (const gp_Pnt2d & Pnt1,const Standard_Real Par1,const Standard_Real Tol1,const gp_Pnt2d & Pnt2,const Standard_Real Par2,const Standard_Real Tol2);
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the values for an infinite domain.") SetValues;
		void SetValues ();
		%feature("autodoc", "Args:
	Pnt(gp_Pnt2d)
	Par(Standard_Real)
	Tol(Standard_Real)
	First(Standard_Boolean)

Returns:
	None

Sets the values for a semi-infinite domain.") SetValues;
		void SetValues (const gp_Pnt2d & Pnt,const Standard_Real Par,const Standard_Real Tol,const Standard_Boolean First);
		%feature("autodoc", "Args:
	zero(Standard_Real)
	period(Standard_Real)

Returns:
	None

Defines a closed domain.") SetEquivalentParameters;
		void SetEquivalentParameters (const Standard_Real zero,const Standard_Real period);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the domain has a first point, i-e  
         a point defining the lowest admitted parameter on the  
         curve.") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the parameter of the first point of the domain  
         The exception DomainError is raised if HasFirstPoint  
         returns False.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the first point of the domain.  
         The exception DomainError is raised if HasFirstPoint  
         returns False.") FirstPoint;
		const gp_Pnt2d & FirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the tolerance of the first (left) bound.  
         The exception DomainError is raised if HasFirstPoint  
         returns False.") FirstTolerance;
		Standard_Real FirstTolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the domain has a last point, i-e  
         a point defining the highest admitted parameter on the  
         curve.") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the parameter of the last point of the domain.  
         The exception DomainError is raised if HasLastPoint  
         returns False.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the last point of the domain.  
         The exception DomainError is raised if HasLastPoint  
         returns False.") LastPoint;
		const gp_Pnt2d & LastPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the tolerance of the last (right) bound.  
         The exception DomainError is raised if HasLastPoint  
         returns False.") LastTolerance;
		Standard_Real LastTolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the domain is closed.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	zero(Standard_Real)
	zeroplusperiod(Standard_Real)

Returns:
	None

Returns Equivalent parameters if the domain is closed.  
         Otherwise, the exception DomainError is raised.") EquivalentParameters;
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
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns TRUE when the computation was successful.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if there is no intersection between the  
         given arguments.  
         The exception NotDone is raised if IsDone returns FALSE.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

This function returns the number of intersection  
         points between the 2 curves.  
         The exception NotDone is raised if IsDone returns FALSE.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	IntRes2d_IntersectionPoint

This function returns the intersection point  
         of range N;  
         The exception NotDone is raised if IsDone returns FALSE.  
         The exception OutOfRange is raised if (N <= 0)  
         or (N > NbPoints).") Point;
		const IntRes2d_IntersectionPoint & Point (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

This function returns the number of intersection  
         segments between the two curves.  
         The exception NotDone is raised if IsDone returns FALSE.") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	IntRes2d_IntersectionSegment

This function returns the intersection segment  
         of range N;  
         The exception NotDone is raised if IsDone returns FALSE.  
         The exception OutOfRange is raised if (N <= 0)  
         or (N > NbPoints).") Segment;
		const IntRes2d_IntersectionSegment & Segment (const Standard_Integer N);
		%feature("autodoc", "Args:
	Reverseflag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetReversedParameters;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") IntRes2d_IntersectionPoint;
		 IntRes2d_IntersectionPoint ();
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Uc1(Standard_Real)
	Uc2(Standard_Real)
	Trans1(IntRes2d_Transition)
	Trans2(IntRes2d_Transition)
	ReversedFlag(Standard_Boolean)

Returns:
	None

Creates an IntersectionPoint.  
         if ReversedFlag is False, the parameter Uc1(resp. Uc2)  
         and the Transition Trans1 (resp. Trans2) refer to  
         the first curve (resp. second curve) otherwise Uc1  
         and Trans1 (resp. Uc2 and Trans2) refer to the  
         second curve (resp. the first curve).") IntRes2d_IntersectionPoint;
		 IntRes2d_IntersectionPoint (const gp_Pnt2d & P,const Standard_Real Uc1,const Standard_Real Uc2,const IntRes2d_Transition & Trans1,const IntRes2d_Transition & Trans2,const Standard_Boolean ReversedFlag);
		%feature("autodoc", "Args:
	P(gp_Pnt2d)
	Uc1(Standard_Real)
	Uc2(Standard_Real)
	Trans1(IntRes2d_Transition)
	Trans2(IntRes2d_Transition)
	ReversedFlag(Standard_Boolean)

Returns:
	None

Sets the values for an existing intersection  
         point. The meaning of the parameters are the same  
         as for the Create.") SetValues;
		void SetValues (const gp_Pnt2d & P,const Standard_Real Uc1,const Standard_Real Uc2,const IntRes2d_Transition & Trans1,const IntRes2d_Transition & Trans2,const Standard_Boolean ReversedFlag);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

Returns the value of the coordinates of the  
         intersection point in the 2D space.") Value;
		const gp_Pnt2d & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the parameter on the first curve.") ParamOnFirst;
		Standard_Real ParamOnFirst ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the parameter on the second curve.") ParamOnSecond;
		Standard_Real ParamOnSecond ();
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_Transition

Returns the transition of the 1st curve compared to  
         the 2nd one.") TransitionOfFirst;
		const IntRes2d_Transition & TransitionOfFirst ();
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_Transition

returns the transition of the 2nd curve compared to  
         the 1st one.") TransitionOfSecond;
		const IntRes2d_Transition & TransitionOfSecond ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt2d

No detailed docstring for this function.") _CSFDB_GetIntRes2d_IntersectionPointpt;
		const gp_Pnt2d & _CSFDB_GetIntRes2d_IntersectionPointpt ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_GetIntRes2d_IntersectionPointp1;
		Standard_Real _CSFDB_GetIntRes2d_IntersectionPointp1 ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetIntRes2d_IntersectionPointp1;
		void _CSFDB_SetIntRes2d_IntersectionPointp1 (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") _CSFDB_GetIntRes2d_IntersectionPointp2;
		Standard_Real _CSFDB_GetIntRes2d_IntersectionPointp2 ();
		%feature("autodoc", "Args:
	p(Standard_Real)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetIntRes2d_IntersectionPointp2;
		void _CSFDB_SetIntRes2d_IntersectionPointp2 (const Standard_Real p);
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_Transition

No detailed docstring for this function.") _CSFDB_GetIntRes2d_IntersectionPointtrans1;
		const IntRes2d_Transition & _CSFDB_GetIntRes2d_IntersectionPointtrans1 ();
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_Transition

No detailed docstring for this function.") _CSFDB_GetIntRes2d_IntersectionPointtrans2;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment ();
		%feature("autodoc", "Args:
	P1(IntRes2d_IntersectionPoint)
	P2(IntRes2d_IntersectionPoint)
	Oppos(Standard_Boolean)
	ReverseFlag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment (const IntRes2d_IntersectionPoint & P1,const IntRes2d_IntersectionPoint & P2,const Standard_Boolean Oppos,const Standard_Boolean ReverseFlag);
		%feature("autodoc", "Args:
	P(IntRes2d_IntersectionPoint)
	First(Standard_Boolean)
	Oppos(Standard_Boolean)
	ReverseFlag(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment (const IntRes2d_IntersectionPoint & P,const Standard_Boolean First,const Standard_Boolean Oppos,const Standard_Boolean ReverseFlag);
		%feature("autodoc", "Args:
	Oppos(Standard_Boolean)

Returns:
	None

Creates an infinite segment of intersection.") IntRes2d_IntersectionSegment;
		 IntRes2d_IntersectionSegment (const Standard_Boolean Oppos);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE if the intersection segment has got  
         the same orientation on both curves.") IsOpposite;
		Standard_Boolean IsOpposite ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the segment is  limited by a first  
         point.   This  point defines  the lowest parameter  
         admitted on the first  curve for the  segment.  If  
         IsOpposite  returns  False, it  defines the lowest  
         parameter on the  second curve, otherwise,  it  is  
         the highest parameter on the second curve.") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_IntersectionPoint

Returns the  first point   of the segment    as an  
         IntersectionPoint (with    a    transition).   The  
         exception  DomainError  is raised if HasFirstPoint  
         returns False.") FirstPoint;
		const IntRes2d_IntersectionPoint & FirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the segment  is  limited by a last  
         point.  This point  defines  the highest parameter  
         admitted on the  first curve for  the segment.  If  
         IsOpposite returns  False, it  defines the highest  
         parameter on  the  second curve, otherwise, it  is  
         the lowest parameter on the second curve.") HasLastPoint;
		Standard_Boolean HasLastPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_IntersectionPoint

Returns   the  last point  of the    segment as an  
         IntersectionPoint   (with  a    transition).   The  
         exception        DomainError     is   raised    if  
         HasLastExtremity returns False.") LastPoint;
		const IntRes2d_IntersectionPoint & LastPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") _CSFDB_GetIntRes2d_IntersectionSegmentoppos;
		Standard_Boolean _CSFDB_GetIntRes2d_IntersectionSegmentoppos ();
		%feature("autodoc", "Args:
	p(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetIntRes2d_IntersectionSegmentoppos;
		void _CSFDB_SetIntRes2d_IntersectionSegmentoppos (const Standard_Boolean p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") _CSFDB_GetIntRes2d_IntersectionSegmentfirst;
		Standard_Boolean _CSFDB_GetIntRes2d_IntersectionSegmentfirst ();
		%feature("autodoc", "Args:
	p(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetIntRes2d_IntersectionSegmentfirst;
		void _CSFDB_SetIntRes2d_IntersectionSegmentfirst (const Standard_Boolean p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") _CSFDB_GetIntRes2d_IntersectionSegmentlast;
		Standard_Boolean _CSFDB_GetIntRes2d_IntersectionSegmentlast ();
		%feature("autodoc", "Args:
	p(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetIntRes2d_IntersectionSegmentlast;
		void _CSFDB_SetIntRes2d_IntersectionSegmentlast (const Standard_Boolean p);
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_IntersectionPoint

No detailed docstring for this function.") _CSFDB_GetIntRes2d_IntersectionSegmentptfirst;
		const IntRes2d_IntersectionPoint & _CSFDB_GetIntRes2d_IntersectionSegmentptfirst ();
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_IntersectionPoint

No detailed docstring for this function.") _CSFDB_GetIntRes2d_IntersectionSegmentptlast;
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
		%feature("autodoc", "Args:
	I(IntRes2d_IntersectionPoint)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint;
		 IntRes2d_SequenceNodeOfSequenceOfIntersectionPoint (const IntRes2d_IntersectionPoint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_IntersectionPoint

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(IntRes2d_IntersectionSegment)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment;
		 IntRes2d_SequenceNodeOfSequenceOfIntersectionSegment (const IntRes2d_IntersectionSegment & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_IntersectionSegment

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntRes2d_SequenceOfIntersectionPoint;
		 IntRes2d_SequenceOfIntersectionPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IntRes2d_SequenceOfIntersectionPoint)

Returns:
	IntRes2d_SequenceOfIntersectionPoint

No detailed docstring for this function.") Assign;
		const IntRes2d_SequenceOfIntersectionPoint & Assign (const IntRes2d_SequenceOfIntersectionPoint & Other);
		%feature("autodoc", "Args:
	Other(IntRes2d_SequenceOfIntersectionPoint)

Returns:
	IntRes2d_SequenceOfIntersectionPoint

No detailed docstring for this function.") operator=;
		const IntRes2d_SequenceOfIntersectionPoint & operator = (const IntRes2d_SequenceOfIntersectionPoint & Other);
		%feature("autodoc", "Args:
	T(IntRes2d_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntRes2d_IntersectionPoint & T);
		%feature("autodoc", "Args:
	S(IntRes2d_SequenceOfIntersectionPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntRes2d_SequenceOfIntersectionPoint & S);
		%feature("autodoc", "Args:
	T(IntRes2d_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntRes2d_IntersectionPoint & T);
		%feature("autodoc", "Args:
	S(IntRes2d_SequenceOfIntersectionPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntRes2d_SequenceOfIntersectionPoint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntRes2d_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntRes2d_IntersectionPoint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntRes2d_SequenceOfIntersectionPoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntRes2d_SequenceOfIntersectionPoint & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntRes2d_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntRes2d_IntersectionPoint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntRes2d_SequenceOfIntersectionPoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntRes2d_SequenceOfIntersectionPoint & S);
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_IntersectionPoint

No detailed docstring for this function.") First;
		const IntRes2d_IntersectionPoint & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_IntersectionPoint

No detailed docstring for this function.") Last;
		const IntRes2d_IntersectionPoint & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IntRes2d_SequenceOfIntersectionPoint)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IntRes2d_SequenceOfIntersectionPoint & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntRes2d_IntersectionPoint

No detailed docstring for this function.") Value;
		const IntRes2d_IntersectionPoint & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(IntRes2d_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const IntRes2d_IntersectionPoint & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntRes2d_IntersectionPoint

No detailed docstring for this function.") ChangeValue;
		IntRes2d_IntersectionPoint & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntRes2d_SequenceOfIntersectionSegment;
		 IntRes2d_SequenceOfIntersectionSegment ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IntRes2d_SequenceOfIntersectionSegment)

Returns:
	IntRes2d_SequenceOfIntersectionSegment

No detailed docstring for this function.") Assign;
		const IntRes2d_SequenceOfIntersectionSegment & Assign (const IntRes2d_SequenceOfIntersectionSegment & Other);
		%feature("autodoc", "Args:
	Other(IntRes2d_SequenceOfIntersectionSegment)

Returns:
	IntRes2d_SequenceOfIntersectionSegment

No detailed docstring for this function.") operator=;
		const IntRes2d_SequenceOfIntersectionSegment & operator = (const IntRes2d_SequenceOfIntersectionSegment & Other);
		%feature("autodoc", "Args:
	T(IntRes2d_IntersectionSegment)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntRes2d_IntersectionSegment & T);
		%feature("autodoc", "Args:
	S(IntRes2d_SequenceOfIntersectionSegment)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntRes2d_SequenceOfIntersectionSegment & S);
		%feature("autodoc", "Args:
	T(IntRes2d_IntersectionSegment)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntRes2d_IntersectionSegment & T);
		%feature("autodoc", "Args:
	S(IntRes2d_SequenceOfIntersectionSegment)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntRes2d_SequenceOfIntersectionSegment & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntRes2d_IntersectionSegment)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntRes2d_IntersectionSegment & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntRes2d_SequenceOfIntersectionSegment)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntRes2d_SequenceOfIntersectionSegment & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntRes2d_IntersectionSegment)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntRes2d_IntersectionSegment & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntRes2d_SequenceOfIntersectionSegment)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntRes2d_SequenceOfIntersectionSegment & S);
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_IntersectionSegment

No detailed docstring for this function.") First;
		const IntRes2d_IntersectionSegment & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_IntersectionSegment

No detailed docstring for this function.") Last;
		const IntRes2d_IntersectionSegment & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IntRes2d_SequenceOfIntersectionSegment)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IntRes2d_SequenceOfIntersectionSegment & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntRes2d_IntersectionSegment

No detailed docstring for this function.") Value;
		const IntRes2d_IntersectionSegment & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(IntRes2d_IntersectionSegment)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const IntRes2d_IntersectionSegment & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntRes2d_IntersectionSegment

No detailed docstring for this function.") ChangeValue;
		IntRes2d_IntersectionSegment & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") IntRes2d_Transition;
		 IntRes2d_Transition ();
		%feature("autodoc", "Args:
	Tangent(Standard_Boolean)
	Pos(IntRes2d_Position)
	Type(IntRes2d_TypeTrans)

Returns:
	None

Creates an IN or OUT transition.") IntRes2d_Transition;
		 IntRes2d_Transition (const Standard_Boolean Tangent,const IntRes2d_Position Pos,const IntRes2d_TypeTrans Type);
		%feature("autodoc", "Args:
	Tangent(Standard_Boolean)
	Pos(IntRes2d_Position)
	Situ(IntRes2d_Situation)
	Oppos(Standard_Boolean)

Returns:
	None

Creates a TOUCH transition.") IntRes2d_Transition;
		 IntRes2d_Transition (const Standard_Boolean Tangent,const IntRes2d_Position Pos,const IntRes2d_Situation Situ,const Standard_Boolean Oppos);
		%feature("autodoc", "Args:
	Pos(IntRes2d_Position)

Returns:
	None

Creates an UNDECIDED transition.") IntRes2d_Transition;
		 IntRes2d_Transition (const IntRes2d_Position Pos);
		%feature("autodoc", "Args:
	Tangent(Standard_Boolean)
	Pos(IntRes2d_Position)
	Type(IntRes2d_TypeTrans)

Returns:
	None

Sets the values of an IN or OUT transition.") SetValue;
		void SetValue (const Standard_Boolean Tangent,const IntRes2d_Position Pos,const IntRes2d_TypeTrans Type);
		%feature("autodoc", "Args:
	Tangent(Standard_Boolean)
	Pos(IntRes2d_Position)
	Situ(IntRes2d_Situation)
	Oppos(Standard_Boolean)

Returns:
	None

Sets the values of a TOUCH transition.") SetValue;
		void SetValue (const Standard_Boolean Tangent,const IntRes2d_Position Pos,const IntRes2d_Situation Situ,const Standard_Boolean Oppos);
		%feature("autodoc", "Args:
	Pos(IntRes2d_Position)

Returns:
	None

Sets the values of an UNDECIDED transition.") SetValue;
		void SetValue (const IntRes2d_Position Pos);
		%feature("autodoc", "Args:
	Pos(IntRes2d_Position)

Returns:
	None

Sets the value of the position.") SetPosition;
		void SetPosition (const IntRes2d_Position Pos);
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_Position

Indicates if the  intersection is at the beginning  
         (IntRes2d_Head),  at the end (IntRes2d_End), or in  
         the middle (IntRes2d_Middle) of the curve.") PositionOnCurve;
		IntRes2d_Position PositionOnCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_TypeTrans

Returns the type of transition at the intersection.  
         It may be IN or OUT or TOUCH, or UNDECIDED if the  
         two first derivatives are not enough to give  
         the tangent to one of the two curves.") TransitionType;
		IntRes2d_TypeTrans TransitionType ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns TRUE when the 2 curves are tangent at the  
         intersection point.  
         Theexception DomainError is raised if the type of  
         transition is UNDECIDED.") IsTangent;
		Standard_Boolean IsTangent ();
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_Situation

returns a significant value if TransitionType returns  
         TOUCH. In this case, the function returns :  
         INSIDE when the curve remains inside the other one,  
         OUTSIDE when it remains outside the other one,  
         UNKNOWN when the calculus, based on the second derivatives  
         cannot give the result.  
         If TransitionType returns IN or OUT or UNDECIDED, the  
         exception DomainError is raised.") Situation;
		IntRes2d_Situation Situation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns a  significant value   if   TransitionType  
         returns TOUCH. In this  case, the function returns  
         true   when  the  2   curves   locally define  two  
         different  parts of the  space.  If TransitionType  
         returns  IN or   OUT or UNDECIDED,  the  exception  
         DomainError is raised.") IsOpposite;
		Standard_Boolean IsOpposite ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") _CSFDB_GetIntRes2d_Transitiontangent;
		Standard_Boolean _CSFDB_GetIntRes2d_Transitiontangent ();
		%feature("autodoc", "Args:
	p(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetIntRes2d_Transitiontangent;
		void _CSFDB_SetIntRes2d_Transitiontangent (const Standard_Boolean p);
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_Position

No detailed docstring for this function.") _CSFDB_GetIntRes2d_Transitionposit;
		IntRes2d_Position _CSFDB_GetIntRes2d_Transitionposit ();
		%feature("autodoc", "Args:
	p(IntRes2d_Position)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetIntRes2d_Transitionposit;
		void _CSFDB_SetIntRes2d_Transitionposit (const IntRes2d_Position p);
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_TypeTrans

No detailed docstring for this function.") _CSFDB_GetIntRes2d_Transitiontypetra;
		IntRes2d_TypeTrans _CSFDB_GetIntRes2d_Transitiontypetra ();
		%feature("autodoc", "Args:
	p(IntRes2d_TypeTrans)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetIntRes2d_Transitiontypetra;
		void _CSFDB_SetIntRes2d_Transitiontypetra (const IntRes2d_TypeTrans p);
		%feature("autodoc", "Args:
	None
Returns:
	IntRes2d_Situation

No detailed docstring for this function.") _CSFDB_GetIntRes2d_Transitionsituat;
		IntRes2d_Situation _CSFDB_GetIntRes2d_Transitionsituat ();
		%feature("autodoc", "Args:
	p(IntRes2d_Situation)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetIntRes2d_Transitionsituat;
		void _CSFDB_SetIntRes2d_Transitionsituat (const IntRes2d_Situation p);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") _CSFDB_GetIntRes2d_Transitionoppos;
		Standard_Boolean _CSFDB_GetIntRes2d_Transitionoppos ();
		%feature("autodoc", "Args:
	p(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") _CSFDB_SetIntRes2d_Transitionoppos;
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
