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
%module (package="OCC") HatchGen

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

%include HatchGen_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum HatchGen_ErrorStatus {
	HatchGen_NoProblem = 0,
	HatchGen_TrimFailure = 1,
	HatchGen_TransitionFailure = 2,
	HatchGen_IncoherentParity = 3,
	HatchGen_IncompatibleStates = 4,
};

enum HatchGen_IntersectionType {
	HatchGen_TRUE = 0,
	HatchGen_TOUCH = 1,
	HatchGen_TANGENT = 2,
	HatchGen_UNDETERMINED = 3,
};

/* end public enums declaration */

%nodefaultctor HatchGen_Domain;
class HatchGen_Domain {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an infinite domain.") HatchGen_Domain;
		 HatchGen_Domain ();
		%feature("autodoc", "Args:
	P1(HatchGen_PointOnHatching)
	P2(HatchGen_PointOnHatching)

Returns:
	None

Creates a domain for the curve associated to a hatching.") HatchGen_Domain;
		 HatchGen_Domain (const HatchGen_PointOnHatching & P1,const HatchGen_PointOnHatching & P2);
		%feature("autodoc", "Args:
	P(HatchGen_PointOnHatching)
	First(Standard_Boolean)

Returns:
	None

Creates a semi-infinite domain for the curve associated  
         to a hatching. The `First' flag means that the given  
         point is the first one.") HatchGen_Domain;
		 HatchGen_Domain (const HatchGen_PointOnHatching & P,const Standard_Boolean First);
		%feature("autodoc", "Args:
	P1(HatchGen_PointOnHatching)
	P2(HatchGen_PointOnHatching)

Returns:
	None

Sets the first and the second points of the domain.") SetPoints;
		void SetPoints (const HatchGen_PointOnHatching & P1,const HatchGen_PointOnHatching & P2);
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the first and the second points of the domain  
         as the infinite.") SetPoints;
		void SetPoints ();
		%feature("autodoc", "Args:
	P(HatchGen_PointOnHatching)

Returns:
	None

Sets the first point of the domain.") SetFirstPoint;
		void SetFirstPoint (const HatchGen_PointOnHatching & P);
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the first point of the domain at the  
         infinite.") SetFirstPoint;
		void SetFirstPoint ();
		%feature("autodoc", "Args:
	P(HatchGen_PointOnHatching)

Returns:
	None

Sets the second point of the domain.") SetSecondPoint;
		void SetSecondPoint (const HatchGen_PointOnHatching & P);
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the second point of the domain at the  
         infinite.") SetSecondPoint;
		void SetSecondPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the domain has a first point.") HasFirstPoint;
		Standard_Boolean HasFirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	HatchGen_PointOnHatching

Returns the first point of the domain.  
         The exception DomainError is raised if  
         HasFirstPoint returns False.") FirstPoint;
		const HatchGen_PointOnHatching & FirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the domain has a second point.") HasSecondPoint;
		Standard_Boolean HasSecondPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	HatchGen_PointOnHatching

Returns the second point of the domain.  
         The exception DomainError is raised if  
         HasSecondPoint returns False.") SecondPoint;
		const HatchGen_PointOnHatching & SecondPoint ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)=0

Returns:
	None

Dump of the domain.") Dump;
		void Dump (const Standard_Integer Index = 0);
};


%feature("shadow") HatchGen_Domain::~HatchGen_Domain %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HatchGen_Domain {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HatchGen_Domains;
class HatchGen_Domains : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HatchGen_Domains;
		 HatchGen_Domains ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(HatchGen_Domains)

Returns:
	HatchGen_Domains

No detailed docstring for this function.") Assign;
		const HatchGen_Domains & Assign (const HatchGen_Domains & Other);
		%feature("autodoc", "Args:
	Other(HatchGen_Domains)

Returns:
	HatchGen_Domains

No detailed docstring for this function.") operator=;
		const HatchGen_Domains & operator = (const HatchGen_Domains & Other);
		%feature("autodoc", "Args:
	T(HatchGen_Domain)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const HatchGen_Domain & T);
		%feature("autodoc", "Args:
	S(HatchGen_Domains)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (HatchGen_Domains & S);
		%feature("autodoc", "Args:
	T(HatchGen_Domain)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const HatchGen_Domain & T);
		%feature("autodoc", "Args:
	S(HatchGen_Domains)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (HatchGen_Domains & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(HatchGen_Domain)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const HatchGen_Domain & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(HatchGen_Domains)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,HatchGen_Domains & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(HatchGen_Domain)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const HatchGen_Domain & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(HatchGen_Domains)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,HatchGen_Domains & S);
		%feature("autodoc", "Args:
	None
Returns:
	HatchGen_Domain

No detailed docstring for this function.") First;
		const HatchGen_Domain & First ();
		%feature("autodoc", "Args:
	None
Returns:
	HatchGen_Domain

No detailed docstring for this function.") Last;
		const HatchGen_Domain & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(HatchGen_Domains)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,HatchGen_Domains & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HatchGen_Domain

No detailed docstring for this function.") Value;
		const HatchGen_Domain & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(HatchGen_Domain)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const HatchGen_Domain & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HatchGen_Domain

No detailed docstring for this function.") ChangeValue;
		HatchGen_Domain & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") HatchGen_Domains::~HatchGen_Domains %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HatchGen_Domains {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HatchGen_IntersectionPoint;
class HatchGen_IntersectionPoint {
	public:
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

Sets the index of the supporting curve.") SetIndex;
		void SetIndex (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the index of the supporting curve.") Index;
		Standard_Integer Index ();
		%feature("autodoc", "Args:
	Parameter(Standard_Real)

Returns:
	None

Sets the parameter on the curve.") SetParameter;
		void SetParameter (const Standard_Real Parameter);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the parameter on the curve.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	Position(TopAbs_Orientation)

Returns:
	None

Sets the position of the point on the curve.") SetPosition;
		void SetPosition (const TopAbs_Orientation Position);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

Returns the position of the point on the curve.") Position;
		TopAbs_Orientation Position ();
		%feature("autodoc", "Args:
	State(TopAbs_State)

Returns:
	None

Sets the transition state before the intersection.") SetStateBefore;
		void SetStateBefore (const TopAbs_State State);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

Returns the transition state before the intersection.") StateBefore;
		TopAbs_State StateBefore ();
		%feature("autodoc", "Args:
	State(TopAbs_State)

Returns:
	None

Sets the transition state after the intersection.") SetStateAfter;
		void SetStateAfter (const TopAbs_State State);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

Returns the transition state after of the intersection.") StateAfter;
		TopAbs_State StateAfter ();
		%feature("autodoc", "Args:
	State(Standard_Boolean)=Standard_True

Returns:
	None

Sets the flag that the point is the beginning of a segment.") SetSegmentBeginning;
		void SetSegmentBeginning (const Standard_Boolean State = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the flag that the point is the beginning of a segment.") SegmentBeginning;
		Standard_Boolean SegmentBeginning ();
		%feature("autodoc", "Args:
	State(Standard_Boolean)=Standard_True

Returns:
	None

Sets the flag that the point is the end of a segment.") SetSegmentEnd;
		void SetSegmentEnd (const Standard_Boolean State = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the flag that the point is the end of a segment.") SegmentEnd;
		Standard_Boolean SegmentEnd ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)=0

Returns:
	virtual void

Dump of the point on element.") Dump;
		virtual void Dump (const Standard_Integer Index = 0);
};


%feature("shadow") HatchGen_IntersectionPoint::~HatchGen_IntersectionPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HatchGen_IntersectionPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HatchGen_PointsOnElement;
class HatchGen_PointsOnElement : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HatchGen_PointsOnElement;
		 HatchGen_PointsOnElement ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(HatchGen_PointsOnElement)

Returns:
	HatchGen_PointsOnElement

No detailed docstring for this function.") Assign;
		const HatchGen_PointsOnElement & Assign (const HatchGen_PointsOnElement & Other);
		%feature("autodoc", "Args:
	Other(HatchGen_PointsOnElement)

Returns:
	HatchGen_PointsOnElement

No detailed docstring for this function.") operator=;
		const HatchGen_PointsOnElement & operator = (const HatchGen_PointsOnElement & Other);
		%feature("autodoc", "Args:
	T(HatchGen_PointOnElement)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const HatchGen_PointOnElement & T);
		%feature("autodoc", "Args:
	S(HatchGen_PointsOnElement)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (HatchGen_PointsOnElement & S);
		%feature("autodoc", "Args:
	T(HatchGen_PointOnElement)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const HatchGen_PointOnElement & T);
		%feature("autodoc", "Args:
	S(HatchGen_PointsOnElement)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (HatchGen_PointsOnElement & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(HatchGen_PointOnElement)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const HatchGen_PointOnElement & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(HatchGen_PointsOnElement)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,HatchGen_PointsOnElement & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(HatchGen_PointOnElement)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const HatchGen_PointOnElement & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(HatchGen_PointsOnElement)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,HatchGen_PointsOnElement & S);
		%feature("autodoc", "Args:
	None
Returns:
	HatchGen_PointOnElement

No detailed docstring for this function.") First;
		const HatchGen_PointOnElement & First ();
		%feature("autodoc", "Args:
	None
Returns:
	HatchGen_PointOnElement

No detailed docstring for this function.") Last;
		const HatchGen_PointOnElement & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(HatchGen_PointsOnElement)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,HatchGen_PointsOnElement & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HatchGen_PointOnElement

No detailed docstring for this function.") Value;
		const HatchGen_PointOnElement & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(HatchGen_PointOnElement)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const HatchGen_PointOnElement & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HatchGen_PointOnElement

No detailed docstring for this function.") ChangeValue;
		HatchGen_PointOnElement & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") HatchGen_PointsOnElement::~HatchGen_PointsOnElement %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HatchGen_PointsOnElement {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HatchGen_PointsOnHatching;
class HatchGen_PointsOnHatching : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HatchGen_PointsOnHatching;
		 HatchGen_PointsOnHatching ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(HatchGen_PointsOnHatching)

Returns:
	HatchGen_PointsOnHatching

No detailed docstring for this function.") Assign;
		const HatchGen_PointsOnHatching & Assign (const HatchGen_PointsOnHatching & Other);
		%feature("autodoc", "Args:
	Other(HatchGen_PointsOnHatching)

Returns:
	HatchGen_PointsOnHatching

No detailed docstring for this function.") operator=;
		const HatchGen_PointsOnHatching & operator = (const HatchGen_PointsOnHatching & Other);
		%feature("autodoc", "Args:
	T(HatchGen_PointOnHatching)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const HatchGen_PointOnHatching & T);
		%feature("autodoc", "Args:
	S(HatchGen_PointsOnHatching)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (HatchGen_PointsOnHatching & S);
		%feature("autodoc", "Args:
	T(HatchGen_PointOnHatching)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const HatchGen_PointOnHatching & T);
		%feature("autodoc", "Args:
	S(HatchGen_PointsOnHatching)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (HatchGen_PointsOnHatching & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(HatchGen_PointOnHatching)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const HatchGen_PointOnHatching & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(HatchGen_PointsOnHatching)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,HatchGen_PointsOnHatching & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(HatchGen_PointOnHatching)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const HatchGen_PointOnHatching & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(HatchGen_PointsOnHatching)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,HatchGen_PointsOnHatching & S);
		%feature("autodoc", "Args:
	None
Returns:
	HatchGen_PointOnHatching

No detailed docstring for this function.") First;
		const HatchGen_PointOnHatching & First ();
		%feature("autodoc", "Args:
	None
Returns:
	HatchGen_PointOnHatching

No detailed docstring for this function.") Last;
		const HatchGen_PointOnHatching & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(HatchGen_PointsOnHatching)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,HatchGen_PointsOnHatching & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HatchGen_PointOnHatching

No detailed docstring for this function.") Value;
		const HatchGen_PointOnHatching & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(HatchGen_PointOnHatching)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const HatchGen_PointOnHatching & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HatchGen_PointOnHatching

No detailed docstring for this function.") ChangeValue;
		HatchGen_PointOnHatching & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") HatchGen_PointsOnHatching::~HatchGen_PointsOnHatching %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HatchGen_PointsOnHatching {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HatchGen_SequenceNodeOfDomains;
class HatchGen_SequenceNodeOfDomains : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(HatchGen_Domain)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") HatchGen_SequenceNodeOfDomains;
		 HatchGen_SequenceNodeOfDomains (const HatchGen_Domain & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	HatchGen_Domain

No detailed docstring for this function.") Value;
		HatchGen_Domain & Value ();
};


%feature("shadow") HatchGen_SequenceNodeOfDomains::~HatchGen_SequenceNodeOfDomains %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HatchGen_SequenceNodeOfDomains {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HatchGen_SequenceNodeOfDomains {
	Handle_HatchGen_SequenceNodeOfDomains GetHandle() {
	return *(Handle_HatchGen_SequenceNodeOfDomains*) &$self;
	}
};

%nodefaultctor Handle_HatchGen_SequenceNodeOfDomains;
class Handle_HatchGen_SequenceNodeOfDomains : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_HatchGen_SequenceNodeOfDomains();
        Handle_HatchGen_SequenceNodeOfDomains(const Handle_HatchGen_SequenceNodeOfDomains &aHandle);
        Handle_HatchGen_SequenceNodeOfDomains(const HatchGen_SequenceNodeOfDomains *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HatchGen_SequenceNodeOfDomains DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HatchGen_SequenceNodeOfDomains {
    HatchGen_SequenceNodeOfDomains* GetObject() {
    return (HatchGen_SequenceNodeOfDomains*)$self->Access();
    }
};
%feature("shadow") Handle_HatchGen_SequenceNodeOfDomains::~Handle_HatchGen_SequenceNodeOfDomains %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HatchGen_SequenceNodeOfDomains {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HatchGen_SequenceNodeOfPointsOnElement;
class HatchGen_SequenceNodeOfPointsOnElement : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(HatchGen_PointOnElement)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") HatchGen_SequenceNodeOfPointsOnElement;
		 HatchGen_SequenceNodeOfPointsOnElement (const HatchGen_PointOnElement & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	HatchGen_PointOnElement

No detailed docstring for this function.") Value;
		HatchGen_PointOnElement & Value ();
};


%feature("shadow") HatchGen_SequenceNodeOfPointsOnElement::~HatchGen_SequenceNodeOfPointsOnElement %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HatchGen_SequenceNodeOfPointsOnElement {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HatchGen_SequenceNodeOfPointsOnElement {
	Handle_HatchGen_SequenceNodeOfPointsOnElement GetHandle() {
	return *(Handle_HatchGen_SequenceNodeOfPointsOnElement*) &$self;
	}
};

%nodefaultctor Handle_HatchGen_SequenceNodeOfPointsOnElement;
class Handle_HatchGen_SequenceNodeOfPointsOnElement : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_HatchGen_SequenceNodeOfPointsOnElement();
        Handle_HatchGen_SequenceNodeOfPointsOnElement(const Handle_HatchGen_SequenceNodeOfPointsOnElement &aHandle);
        Handle_HatchGen_SequenceNodeOfPointsOnElement(const HatchGen_SequenceNodeOfPointsOnElement *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HatchGen_SequenceNodeOfPointsOnElement DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HatchGen_SequenceNodeOfPointsOnElement {
    HatchGen_SequenceNodeOfPointsOnElement* GetObject() {
    return (HatchGen_SequenceNodeOfPointsOnElement*)$self->Access();
    }
};
%feature("shadow") Handle_HatchGen_SequenceNodeOfPointsOnElement::~Handle_HatchGen_SequenceNodeOfPointsOnElement %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HatchGen_SequenceNodeOfPointsOnElement {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HatchGen_SequenceNodeOfPointsOnHatching;
class HatchGen_SequenceNodeOfPointsOnHatching : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(HatchGen_PointOnHatching)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") HatchGen_SequenceNodeOfPointsOnHatching;
		 HatchGen_SequenceNodeOfPointsOnHatching (const HatchGen_PointOnHatching & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	HatchGen_PointOnHatching

No detailed docstring for this function.") Value;
		HatchGen_PointOnHatching & Value ();
};


%feature("shadow") HatchGen_SequenceNodeOfPointsOnHatching::~HatchGen_SequenceNodeOfPointsOnHatching %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HatchGen_SequenceNodeOfPointsOnHatching {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HatchGen_SequenceNodeOfPointsOnHatching {
	Handle_HatchGen_SequenceNodeOfPointsOnHatching GetHandle() {
	return *(Handle_HatchGen_SequenceNodeOfPointsOnHatching*) &$self;
	}
};

%nodefaultctor Handle_HatchGen_SequenceNodeOfPointsOnHatching;
class Handle_HatchGen_SequenceNodeOfPointsOnHatching : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_HatchGen_SequenceNodeOfPointsOnHatching();
        Handle_HatchGen_SequenceNodeOfPointsOnHatching(const Handle_HatchGen_SequenceNodeOfPointsOnHatching &aHandle);
        Handle_HatchGen_SequenceNodeOfPointsOnHatching(const HatchGen_SequenceNodeOfPointsOnHatching *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HatchGen_SequenceNodeOfPointsOnHatching DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HatchGen_SequenceNodeOfPointsOnHatching {
    HatchGen_SequenceNodeOfPointsOnHatching* GetObject() {
    return (HatchGen_SequenceNodeOfPointsOnHatching*)$self->Access();
    }
};
%feature("shadow") Handle_HatchGen_SequenceNodeOfPointsOnHatching::~Handle_HatchGen_SequenceNodeOfPointsOnHatching %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HatchGen_SequenceNodeOfPointsOnHatching {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HatchGen_PointOnElement;
class HatchGen_PointOnElement : public HatchGen_IntersectionPoint {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

//!---Purpose; Creates an empty point on element") HatchGen_PointOnElement;
		 HatchGen_PointOnElement ();
		%feature("autodoc", "Args:
	Point(HatchGen_PointOnElement)

Returns:
	None

Creates a point from an other.") HatchGen_PointOnElement;
		 HatchGen_PointOnElement (const HatchGen_PointOnElement & Point);
		%feature("autodoc", "Args:
	Point(IntRes2d_IntersectionPoint)

Returns:
	None

Creates a point from an intersection point.") HatchGen_PointOnElement;
		 HatchGen_PointOnElement (const IntRes2d_IntersectionPoint & Point);
		%feature("autodoc", "Args:
	Type(HatchGen_IntersectionType)

Returns:
	None

Sets the intersection type at this point.") SetIntersectionType;
		void SetIntersectionType (const HatchGen_IntersectionType Type);
		%feature("autodoc", "Args:
	None
Returns:
	HatchGen_IntersectionType

Returns the intersection type at this point.") IntersectionType;
		HatchGen_IntersectionType IntersectionType ();
		%feature("autodoc", "Args:
	Point(HatchGen_PointOnElement)
	Confusion(Standard_Real)

Returns:
	Standard_Boolean

Tests if the point is identical to an other.  
         That is to say :  
           P1.myIndex  = P2.myIndex  
           Abs (P1.myParam - P2.myParam) <= Confusion  
           P1.myPosit  = P2.myPosit  
           P1.myBefore = P2.myBefore  
           P1.myAfter  = P2.myAfter  
           P1.mySegBeg = P2.mySegBeg  
           P1.mySegEnd = P2.mySegEnd  
           P1.myType   = P2.myType") IsIdentical;
		Standard_Boolean IsIdentical (const HatchGen_PointOnElement & Point,const Standard_Real Confusion);
		%feature("autodoc", "Args:
	Point(HatchGen_PointOnElement)
	Confusion(Standard_Real)

Returns:
	Standard_Boolean

Tests if the point is different from an other.") IsDifferent;
		Standard_Boolean IsDifferent (const HatchGen_PointOnElement & Point,const Standard_Real Confusion);
		%feature("autodoc", "Args:
	Index(Standard_Integer)=0

Returns:
	None

Dump of the point on element.") Dump;
		void Dump (const Standard_Integer Index = 0);
};


%feature("shadow") HatchGen_PointOnElement::~HatchGen_PointOnElement %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HatchGen_PointOnElement {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HatchGen_PointOnHatching;
class HatchGen_PointOnHatching : public HatchGen_IntersectionPoint {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty point.") HatchGen_PointOnHatching;
		 HatchGen_PointOnHatching ();
		%feature("autodoc", "Args:
	Point(HatchGen_PointOnHatching)

Returns:
	None

Creates a point from an other.") HatchGen_PointOnHatching;
		 HatchGen_PointOnHatching (const HatchGen_PointOnHatching & Point);
		%feature("autodoc", "Args:
	Point(IntRes2d_IntersectionPoint)

Returns:
	None

Creates a point from an intersection point.") HatchGen_PointOnHatching;
		 HatchGen_PointOnHatching (const IntRes2d_IntersectionPoint & Point);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

linux porting") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	Point(HatchGen_PointOnElement)
	Confusion(Standard_Real)

Returns:
	None

Adds a point on element to the point.") AddPoint;
		void AddPoint (const HatchGen_PointOnElement & Point,const Standard_Real Confusion);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of elements intersecting the  
         hatching at this point.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	HatchGen_PointOnElement

Returns the Index-th point on element of the point.  
         The exception OutOfRange is raised if  
         Index > NbPoints.") Point;
		const HatchGen_PointOnElement & Point (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

Removes the Index-th point on element of the point.  
         The exception OutOfRange is raised if  
         Index > NbPoints.") RemPoint;
		void RemPoint (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all the points on element of the point.") ClrPoints;
		void ClrPoints ();
		%feature("autodoc", "Args:
	Point(HatchGen_PointOnHatching)
	Confusion(Standard_Real)

Returns:
	Standard_Boolean

Tests if the point is lower than an other.  
         A point on hatching P1 is said to be lower than an  
         other P2 if :  
           P2.myParam - P1.myParam > Confusion") IsLower;
		Standard_Boolean IsLower (const HatchGen_PointOnHatching & Point,const Standard_Real Confusion);
		%feature("autodoc", "Args:
	Point(HatchGen_PointOnHatching)
	Confusion(Standard_Real)

Returns:
	Standard_Boolean

Tests if the  point is equal to an other.  
         A  point on hatching P1 is said to be equal to an  
         other P2 if :  
           | P2.myParam - P1.myParam | <= Confusion") IsEqual;
		Standard_Boolean IsEqual (const HatchGen_PointOnHatching & Point,const Standard_Real Confusion);
		%feature("autodoc", "Args:
	Point(HatchGen_PointOnHatching)
	Confusion(Standard_Real)

Returns:
	Standard_Boolean

Tests if the point is greater than an other.  
         A point on hatching P1 is said to be greater than an  
         other P2 if :  
           P1.myParam - P2.myParam > Confusion") IsGreater;
		Standard_Boolean IsGreater (const HatchGen_PointOnHatching & Point,const Standard_Real Confusion);
		%feature("autodoc", "Args:
	Index(Standard_Integer)=0

Returns:
	None

Dump of the point.") Dump;
		void Dump (const Standard_Integer Index = 0);
};


%feature("shadow") HatchGen_PointOnHatching::~HatchGen_PointOnHatching %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HatchGen_PointOnHatching {
	void _kill_pointed() {
		delete $self;
	}
};
