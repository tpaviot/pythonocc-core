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
%module IntCurveSurface

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

%include IntCurveSurface_required_python_modules.i
%include IntCurveSurface_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum IntCurveSurface_TransitionOnCurve {
	IntCurveSurface_Tangent = 0,
	IntCurveSurface_In = 1,
	IntCurveSurface_Out = 2,
};

/* end public enums declaration */

%nodefaultctor IntCurveSurface_Intersection;
class IntCurveSurface_Intersection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns the <done> field.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of IntersectionPoint  
         if IsDone returns True.  
         else NotDone is raised.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntCurveSurface_IntersectionPoint

returns the IntersectionPoint of range <Index>  
         raises NotDone if the computation has failed or if  
         the computation has not been done  
         raises OutOfRange if Index is not in the range <1..NbPoints>") Point;
		const IntCurveSurface_IntersectionPoint & Point (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the number of IntersectionSegment  
         if IsDone returns True.  
         else NotDone is raised.") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntCurveSurface_IntersectionSegment

returns the IntersectionSegment of range <Index>  
         raises NotDone if the computation has failed or if  
         the computation has not been done  
         raises OutOfRange if Index is not in the range <1..NbSegment>") Segment;
		const IntCurveSurface_IntersectionSegment & Segment (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	None

Dump all the fields.") Dump;
		void Dump ();
};


%feature("shadow") IntCurveSurface_Intersection::~IntCurveSurface_Intersection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_Intersection {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurveSurface_IntersectionPoint;
class IntCurveSurface_IntersectionPoint {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty Constructor.") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint ();
		%feature("autodoc", "Args:
	P(gp_Pnt)
	USurf(Standard_Real)
	VSurf(Standard_Real)
	UCurv(Standard_Real)
	TrCurv(IntCurveSurface_TransitionOnCurve)

Returns:
	None

Create an IntersectionPoint.") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint (const gp_Pnt & P,const Standard_Real USurf,const Standard_Real VSurf,const Standard_Real UCurv,const IntCurveSurface_TransitionOnCurve TrCurv);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	USurf(Standard_Real)
	VSurf(Standard_Real)
	UCurv(Standard_Real)
	TrCurv(IntCurveSurface_TransitionOnCurve)

Returns:
	None

Set the fields of the current IntersectionPoint.") SetValues;
		void SetValues (const gp_Pnt & P,const Standard_Real USurf,const Standard_Real VSurf,const Standard_Real UCurv,const IntCurveSurface_TransitionOnCurve TrCurv);
		%feature("autodoc", "Args:
	P(gp_Pnt)
	USurf(Standard_Real)
	VSurf(Standard_Real)
	UCurv(Standard_Real)
	TrCurv(IntCurveSurface_TransitionOnCurve)

Returns:
	None

Get the fields of the current IntersectionPoint.") Values;
		void Values (gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,IntCurveSurface_TransitionOnCurve & TrCurv);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

returns the geometric point.") Pnt;
		const gp_Pnt & Pnt ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the U parameter on the surface.") U;
		Standard_Real U ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the V parameter on the surface.") V;
		Standard_Real V ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the parameter on the curve.") W;
		Standard_Real W ();
		%feature("autodoc", "Args:
	None
Returns:
	IntCurveSurface_TransitionOnCurve

returns the Transition of the point.") Transition;
		IntCurveSurface_TransitionOnCurve Transition ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Dump all the fields.") Dump;
		void Dump ();
};


%feature("shadow") IntCurveSurface_IntersectionPoint::~IntCurveSurface_IntersectionPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_IntersectionPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurveSurface_IntersectionSegment;
class IntCurveSurface_IntersectionSegment {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntCurveSurface_IntersectionSegment;
		 IntCurveSurface_IntersectionSegment ();
		%feature("autodoc", "Args:
	P1(IntCurveSurface_IntersectionPoint)
	P2(IntCurveSurface_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_IntersectionSegment;
		 IntCurveSurface_IntersectionSegment (const IntCurveSurface_IntersectionPoint & P1,const IntCurveSurface_IntersectionPoint & P2);
		%feature("autodoc", "Args:
	P1(IntCurveSurface_IntersectionPoint)
	P2(IntCurveSurface_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") SetValues;
		void SetValues (const IntCurveSurface_IntersectionPoint & P1,const IntCurveSurface_IntersectionPoint & P2);
		%feature("autodoc", "Args:
	P1(IntCurveSurface_IntersectionPoint)
	P2(IntCurveSurface_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") Values;
		void Values (IntCurveSurface_IntersectionPoint & P1,IntCurveSurface_IntersectionPoint & P2);
		%feature("autodoc", "Args:
	P1(IntCurveSurface_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") FirstPoint;
		void FirstPoint (IntCurveSurface_IntersectionPoint & P1);
		%feature("autodoc", "Args:
	P2(IntCurveSurface_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") SecondPoint;
		void SecondPoint (IntCurveSurface_IntersectionPoint & P2);
		%feature("autodoc", "Args:
	None
Returns:
	IntCurveSurface_IntersectionPoint

No detailed docstring for this function.") FirstPoint;
		const IntCurveSurface_IntersectionPoint & FirstPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	IntCurveSurface_IntersectionPoint

No detailed docstring for this function.") SecondPoint;
		const IntCurveSurface_IntersectionPoint & SecondPoint ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
};


%feature("shadow") IntCurveSurface_IntersectionSegment::~IntCurveSurface_IntersectionSegment %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_IntersectionSegment {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurveSurface_SequenceNodeOfSequenceOfPnt;
class IntCurveSurface_SequenceNodeOfSequenceOfPnt : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(IntCurveSurface_IntersectionPoint)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_SequenceNodeOfSequenceOfPnt;
		 IntCurveSurface_SequenceNodeOfSequenceOfPnt (const IntCurveSurface_IntersectionPoint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	IntCurveSurface_IntersectionPoint

No detailed docstring for this function.") Value;
		IntCurveSurface_IntersectionPoint & Value ();
};


%feature("shadow") IntCurveSurface_SequenceNodeOfSequenceOfPnt::~IntCurveSurface_SequenceNodeOfSequenceOfPnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_SequenceNodeOfSequenceOfPnt {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntCurveSurface_SequenceNodeOfSequenceOfPnt {
	Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt GetHandle() {
	return *(Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt*) &$self;
	}
};

%nodefaultctor Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt;
class Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt();
        Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt(const Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt &aHandle);
        Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt(const IntCurveSurface_SequenceNodeOfSequenceOfPnt *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt {
    IntCurveSurface_SequenceNodeOfSequenceOfPnt* GetObject() {
    return (IntCurveSurface_SequenceNodeOfSequenceOfPnt*)$self->Access();
    }
};
%feature("shadow") Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt::~Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntCurveSurface_SequenceNodeOfSequenceOfPnt {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntCurveSurface_SequenceNodeOfSequenceOfSeg;
class IntCurveSurface_SequenceNodeOfSequenceOfSeg : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(IntCurveSurface_IntersectionSegment)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_SequenceNodeOfSequenceOfSeg;
		 IntCurveSurface_SequenceNodeOfSequenceOfSeg (const IntCurveSurface_IntersectionSegment & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	IntCurveSurface_IntersectionSegment

No detailed docstring for this function.") Value;
		IntCurveSurface_IntersectionSegment & Value ();
};


%feature("shadow") IntCurveSurface_SequenceNodeOfSequenceOfSeg::~IntCurveSurface_SequenceNodeOfSequenceOfSeg %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_SequenceNodeOfSequenceOfSeg {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IntCurveSurface_SequenceNodeOfSequenceOfSeg {
	Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg GetHandle() {
	return *(Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg*) &$self;
	}
};

%nodefaultctor Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg;
class Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg();
        Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg(const Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg &aHandle);
        Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg(const IntCurveSurface_SequenceNodeOfSequenceOfSeg *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg {
    IntCurveSurface_SequenceNodeOfSequenceOfSeg* GetObject() {
    return (IntCurveSurface_SequenceNodeOfSequenceOfSeg*)$self->Access();
    }
};
%feature("shadow") Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg::~Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IntCurveSurface_SequenceNodeOfSequenceOfSeg {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IntCurveSurface_SequenceOfPnt;
class IntCurveSurface_SequenceOfPnt : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntCurveSurface_SequenceOfPnt;
		 IntCurveSurface_SequenceOfPnt ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IntCurveSurface_SequenceOfPnt)

Returns:
	IntCurveSurface_SequenceOfPnt

No detailed docstring for this function.") Assign;
		const IntCurveSurface_SequenceOfPnt & Assign (const IntCurveSurface_SequenceOfPnt & Other);
		%feature("autodoc", "Args:
	Other(IntCurveSurface_SequenceOfPnt)

Returns:
	IntCurveSurface_SequenceOfPnt

No detailed docstring for this function.") operator=;
		const IntCurveSurface_SequenceOfPnt & operator = (const IntCurveSurface_SequenceOfPnt & Other);
		%feature("autodoc", "Args:
	T(IntCurveSurface_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntCurveSurface_IntersectionPoint & T);
		%feature("autodoc", "Args:
	S(IntCurveSurface_SequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntCurveSurface_SequenceOfPnt & S);
		%feature("autodoc", "Args:
	T(IntCurveSurface_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntCurveSurface_IntersectionPoint & T);
		%feature("autodoc", "Args:
	S(IntCurveSurface_SequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntCurveSurface_SequenceOfPnt & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntCurveSurface_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntCurveSurface_IntersectionPoint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntCurveSurface_SequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntCurveSurface_SequenceOfPnt & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntCurveSurface_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntCurveSurface_IntersectionPoint & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntCurveSurface_SequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntCurveSurface_SequenceOfPnt & S);
		%feature("autodoc", "Args:
	None
Returns:
	IntCurveSurface_IntersectionPoint

No detailed docstring for this function.") First;
		const IntCurveSurface_IntersectionPoint & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntCurveSurface_IntersectionPoint

No detailed docstring for this function.") Last;
		const IntCurveSurface_IntersectionPoint & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IntCurveSurface_SequenceOfPnt)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IntCurveSurface_SequenceOfPnt & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntCurveSurface_IntersectionPoint

No detailed docstring for this function.") Value;
		const IntCurveSurface_IntersectionPoint & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(IntCurveSurface_IntersectionPoint)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const IntCurveSurface_IntersectionPoint & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntCurveSurface_IntersectionPoint

No detailed docstring for this function.") ChangeValue;
		IntCurveSurface_IntersectionPoint & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IntCurveSurface_SequenceOfPnt::~IntCurveSurface_SequenceOfPnt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_SequenceOfPnt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurveSurface_SequenceOfSeg;
class IntCurveSurface_SequenceOfSeg : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntCurveSurface_SequenceOfSeg;
		 IntCurveSurface_SequenceOfSeg ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IntCurveSurface_SequenceOfSeg)

Returns:
	IntCurveSurface_SequenceOfSeg

No detailed docstring for this function.") Assign;
		const IntCurveSurface_SequenceOfSeg & Assign (const IntCurveSurface_SequenceOfSeg & Other);
		%feature("autodoc", "Args:
	Other(IntCurveSurface_SequenceOfSeg)

Returns:
	IntCurveSurface_SequenceOfSeg

No detailed docstring for this function.") operator=;
		const IntCurveSurface_SequenceOfSeg & operator = (const IntCurveSurface_SequenceOfSeg & Other);
		%feature("autodoc", "Args:
	T(IntCurveSurface_IntersectionSegment)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const IntCurveSurface_IntersectionSegment & T);
		%feature("autodoc", "Args:
	S(IntCurveSurface_SequenceOfSeg)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IntCurveSurface_SequenceOfSeg & S);
		%feature("autodoc", "Args:
	T(IntCurveSurface_IntersectionSegment)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const IntCurveSurface_IntersectionSegment & T);
		%feature("autodoc", "Args:
	S(IntCurveSurface_SequenceOfSeg)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IntCurveSurface_SequenceOfSeg & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntCurveSurface_IntersectionSegment)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntCurveSurface_IntersectionSegment & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntCurveSurface_SequenceOfSeg)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntCurveSurface_SequenceOfSeg & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(IntCurveSurface_IntersectionSegment)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntCurveSurface_IntersectionSegment & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IntCurveSurface_SequenceOfSeg)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntCurveSurface_SequenceOfSeg & S);
		%feature("autodoc", "Args:
	None
Returns:
	IntCurveSurface_IntersectionSegment

No detailed docstring for this function.") First;
		const IntCurveSurface_IntersectionSegment & First ();
		%feature("autodoc", "Args:
	None
Returns:
	IntCurveSurface_IntersectionSegment

No detailed docstring for this function.") Last;
		const IntCurveSurface_IntersectionSegment & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IntCurveSurface_SequenceOfSeg)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IntCurveSurface_SequenceOfSeg & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntCurveSurface_IntersectionSegment

No detailed docstring for this function.") Value;
		const IntCurveSurface_IntersectionSegment & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(IntCurveSurface_IntersectionSegment)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const IntCurveSurface_IntersectionSegment & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	IntCurveSurface_IntersectionSegment

No detailed docstring for this function.") ChangeValue;
		IntCurveSurface_IntersectionSegment & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IntCurveSurface_SequenceOfSeg::~IntCurveSurface_SequenceOfSeg %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_SequenceOfSeg {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurveSurface_TheCSFunctionOfHInter;
class IntCurveSurface_TheCSFunctionOfHInter : public math_FunctionSetWithDerivatives {
	public:
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	C(Handle_Adaptor3d_HCurve)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_TheCSFunctionOfHInter;
		 IntCurveSurface_TheCSFunctionOfHInter (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "Args:
	X(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "Args:
	X(math_Vector)
	F(math_Vector)
	D(math_Matrix)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Point;
		const gp_Pnt & Point ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Root;
		Standard_Real Root ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") AuxillarSurface;
		const Handle_Adaptor3d_HSurface & AuxillarSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HCurve

No detailed docstring for this function.") AuxillarCurve;
		const Handle_Adaptor3d_HCurve & AuxillarCurve ();
};


%feature("shadow") IntCurveSurface_TheCSFunctionOfHInter::~IntCurveSurface_TheCSFunctionOfHInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_TheCSFunctionOfHInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurveSurface_TheExactHInter;
class IntCurveSurface_TheExactHInter {
	public:
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	W(Standard_Real)
	F(IntCurveSurface_TheCSFunctionOfHInter)
	TolTangency(Standard_Real)
	MarginCoef(Standard_Real)=0.0

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter (const Standard_Real U,const Standard_Real V,const Standard_Real W,const IntCurveSurface_TheCSFunctionOfHInter & F,const Standard_Real TolTangency,const Standard_Real MarginCoef = 0.0);
		%feature("autodoc", "Args:
	F(IntCurveSurface_TheCSFunctionOfHInter)
	TolTangency(Standard_Real)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter (const IntCurveSurface_TheCSFunctionOfHInter & F,const Standard_Real TolTangency);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	W(Standard_Real)
	Rsnld(math_FunctionSetRoot)
	u0(Standard_Real)
	v0(Standard_Real)
	u1(Standard_Real)
	v1(Standard_Real)
	w0(Standard_Real)
	w1(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Standard_Real U,const Standard_Real V,const Standard_Real W,math_FunctionSetRoot & Rsnld,const Standard_Real u0,const Standard_Real v0,const Standard_Real u1,const Standard_Real v1,const Standard_Real w0,const Standard_Real w1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Point;
		const gp_Pnt & Point ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ParameterOnCurve;
		Standard_Real ParameterOnCurve ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	None

No detailed docstring for this function.") ParameterOnSurface;
		void ParameterOnSurface (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	IntCurveSurface_TheCSFunctionOfHInter

No detailed docstring for this function.") Function;
		IntCurveSurface_TheCSFunctionOfHInter & Function ();
};


%feature("shadow") IntCurveSurface_TheExactHInter::~IntCurveSurface_TheExactHInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_TheExactHInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurveSurface_TheHCurveTool;
class IntCurveSurface_TheHCurveTool {
	public:
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static Standard_Real

No detailed docstring for this function.") FirstParameter;
		static Standard_Real FirstParameter (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static Standard_Real

No detailed docstring for this function.") LastParameter;
		static Standard_Real LastParameter (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		static GeomAbs_Shape Continuity (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	S(GeomAbs_Shape)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbIntervals;
		static Standard_Integer NbIntervals (const Handle_Adaptor3d_HCurve & C,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	static void

No detailed docstring for this function.") Intervals;
		static void Intervals (const Handle_Adaptor3d_HCurve & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsClosed;
		static Standard_Boolean IsClosed (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static Standard_Real

No detailed docstring for this function.") Period;
		static Standard_Real Period (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	U(Standard_Real)

Returns:
	static gp_Pnt

No detailed docstring for this function.") Value;
		static gp_Pnt Value (const Handle_Adaptor3d_HCurve & C,const Standard_Real U);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	static void

No detailed docstring for this function.") D0;
		static void D0 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D1;
		static void D1 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D2;
		static void D2 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	static void

No detailed docstring for this function.") D3;
		static void D3 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	static gp_Vec

No detailed docstring for this function.") DN;
		static gp_Vec DN (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	R3d(Standard_Real)

Returns:
	static Standard_Real

No detailed docstring for this function.") Resolution;
		static Standard_Real Resolution (const Handle_Adaptor3d_HCurve & C,const Standard_Real R3d);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static GeomAbs_CurveType

No detailed docstring for this function.") GetType;
		static GeomAbs_CurveType GetType (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static gp_Lin

No detailed docstring for this function.") Line;
		static gp_Lin Line (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static gp_Circ

No detailed docstring for this function.") Circle;
		static gp_Circ Circle (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static gp_Elips

No detailed docstring for this function.") Ellipse;
		static gp_Elips Ellipse (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static gp_Hypr

No detailed docstring for this function.") Hyperbola;
		static gp_Hypr Hyperbola (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static gp_Parab

No detailed docstring for this function.") Parabola;
		static gp_Parab Parabola (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static Handle_Geom_BezierCurve

No detailed docstring for this function.") Bezier;
		static Handle_Geom_BezierCurve Bezier (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)

Returns:
	static Handle_Geom_BSplineCurve

No detailed docstring for this function.") BSpline;
		static Handle_Geom_BSplineCurve BSpline (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	U0(Standard_Real)
	U1(Standard_Real)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSamples;
		static Standard_Integer NbSamples (const Handle_Adaptor3d_HCurve & C,const Standard_Real U0,const Standard_Real U1);
		%feature("autodoc", "Args:
	C(Handle_Adaptor3d_HCurve)
	U0(Standard_Real)
	U1(Standard_Real)
	Defl(Standard_Real)
	NbMin(Standard_Integer)
	Pars(Handle_TColStd_HArray1OfReal)

Returns:
	static void

No detailed docstring for this function.") SamplePars;
		static void SamplePars (const Handle_Adaptor3d_HCurve & C,const Standard_Real U0,const Standard_Real U1,const Standard_Real Defl,const Standard_Integer NbMin,Handle_TColStd_HArray1OfReal & Pars);
};


%feature("shadow") IntCurveSurface_TheHCurveTool::~IntCurveSurface_TheHCurveTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_TheHCurveTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurveSurface_TheInterferenceOfHInter;
class IntCurveSurface_TheInterferenceOfHInter : public Intf_Interference {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter ();
		%feature("autodoc", "Args:
	thePolyg(IntCurveSurface_ThePolygonOfHInter)
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "Args:
	theLin(gp_Lin)
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "Args:
	theLins(Intf_Array1OfLin)
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "Args:
	thePolyg(IntCurveSurface_ThePolygonOfHInter)
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "Args:
	theLin(gp_Lin)
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "Args:
	theLins(Intf_Array1OfLin)
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "Args:
	thePolyg(IntCurveSurface_ThePolygonOfHInter)
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)
	theBoundSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "Args:
	theLin(gp_Lin)
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)
	theBoundSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "Args:
	theLins(Intf_Array1OfLin)
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)
	theBoundSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "Args:
	thePolyg(IntCurveSurface_ThePolygonOfHInter)
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)
	theBoundSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "Args:
	theLin(gp_Lin)
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)
	theBoundSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "Args:
	theLins(Intf_Array1OfLin)
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)
	theBoundSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "Args:
	thePolyg(IntCurveSurface_ThePolygonOfHInter)
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)
	theBoundSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") Interference;
		void Interference (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "Args:
	thePolyg(IntCurveSurface_ThePolygonOfHInter)
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)

Returns:
	None

No detailed docstring for this function.") Interference;
		void Interference (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
};


%feature("shadow") IntCurveSurface_TheInterferenceOfHInter::~IntCurveSurface_TheInterferenceOfHInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_TheInterferenceOfHInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurveSurface_ThePolygonOfHInter;
class IntCurveSurface_ThePolygonOfHInter {
	public:
		%feature("autodoc", "Args:
	Curve(Handle_Adaptor3d_HCurve)
	NbPnt(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter (const Handle_Adaptor3d_HCurve & Curve,const Standard_Integer NbPnt);
		%feature("autodoc", "Args:
	Curve(Handle_Adaptor3d_HCurve)
	U1(Standard_Real)
	U2(Standard_Real)
	NbPnt(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter (const Handle_Adaptor3d_HCurve & Curve,const Standard_Real U1,const Standard_Real U2,const Standard_Integer NbPnt);
		%feature("autodoc", "Args:
	Curve(Handle_Adaptor3d_HCurve)
	Upars(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter (const Handle_Adaptor3d_HCurve & Curve,const TColStd_Array1OfReal & Upars);
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") Bounding;
		const Bnd_Box & Bounding ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation ();
		%feature("autodoc", "Args:
	x(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation (const Standard_Real x);
		%feature("autodoc", "Args:
	clos(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Closed;
		void Closed (const Standard_Boolean clos);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Closed;
		Standard_Boolean Closed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt

No detailed docstring for this function.") BeginOfSeg;
		const gp_Pnt & BeginOfSeg (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt

No detailed docstring for this function.") EndOfSeg;
		const gp_Pnt & EndOfSeg (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") InfParameter;
		Standard_Real InfParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") SupParameter;
		Standard_Real SupParameter ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	ParamOnLine(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve (const Standard_Integer Index,const Standard_Real ParamOnLine);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Dump;
		void Dump ();
};


%feature("shadow") IntCurveSurface_ThePolygonOfHInter::~IntCurveSurface_ThePolygonOfHInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_ThePolygonOfHInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurveSurface_ThePolygonToolOfHInter;
class IntCurveSurface_ThePolygonToolOfHInter {
	public:
		%feature("autodoc", "Args:
	thePolygon(IntCurveSurface_ThePolygonOfHInter)

Returns:
	static  Bnd_Box

No detailed docstring for this function.") Bounding;
		static const Bnd_Box & Bounding (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("autodoc", "Args:
	thePolygon(IntCurveSurface_ThePolygonOfHInter)

Returns:
	static Standard_Real

No detailed docstring for this function.") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("autodoc", "Args:
	thePolygon(IntCurveSurface_ThePolygonOfHInter)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") Closed;
		static Standard_Boolean Closed (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("autodoc", "Args:
	thePolygon(IntCurveSurface_ThePolygonOfHInter)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbSegments;
		static Standard_Integer NbSegments (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("autodoc", "Args:
	thePolygon(IntCurveSurface_ThePolygonOfHInter)
	Index(Standard_Integer)

Returns:
	static  gp_Pnt

No detailed docstring for this function.") BeginOfSeg;
		static const gp_Pnt & BeginOfSeg (const IntCurveSurface_ThePolygonOfHInter & thePolygon,const Standard_Integer Index);
		%feature("autodoc", "Args:
	thePolygon(IntCurveSurface_ThePolygonOfHInter)
	Index(Standard_Integer)

Returns:
	static  gp_Pnt

No detailed docstring for this function.") EndOfSeg;
		static const gp_Pnt & EndOfSeg (const IntCurveSurface_ThePolygonOfHInter & thePolygon,const Standard_Integer Index);
		%feature("autodoc", "Args:
	thePolygon(IntCurveSurface_ThePolygonOfHInter)

Returns:
	static void

No detailed docstring for this function.") Dump;
		static void Dump (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
};


%feature("shadow") IntCurveSurface_ThePolygonToolOfHInter::~IntCurveSurface_ThePolygonToolOfHInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_ThePolygonToolOfHInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurveSurface_ThePolyhedronToolOfHInter;
class IntCurveSurface_ThePolyhedronToolOfHInter {
	public:
		%feature("autodoc", "Args:
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)

Returns:
	static  Bnd_Box

No detailed docstring for this function.") Bounding;
		static const Bnd_Box & Bounding (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "Args:
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)

Returns:
	static  Handle_Bnd_HArray1OfBox

No detailed docstring for this function.") ComponentsBounding;
		static const Handle_Bnd_HArray1OfBox & ComponentsBounding (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "Args:
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)

Returns:
	static Standard_Real

No detailed docstring for this function.") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "Args:
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)

Returns:
	static Standard_Integer

No detailed docstring for this function.") NbTriangles;
		static Standard_Integer NbTriangles (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "Args:
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)
	Index(Standard_Integer)
	P1(Standard_Integer)
	P2(Standard_Integer)
	P3(Standard_Integer)

Returns:
	static void

No detailed docstring for this function.") Triangle;
		static void Triangle (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)
	Index(Standard_Integer)

Returns:
	static  gp_Pnt

No detailed docstring for this function.") Point;
		static const gp_Pnt & Point (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Index);
		%feature("autodoc", "Args:
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)
	Triang(Standard_Integer)
	Pivot(Standard_Integer)
	Pedge(Standard_Integer)
	TriCon(Standard_Integer)
	OtherP(Standard_Integer)

Returns:
	static Standard_Integer

No detailed docstring for this function.") TriConnex;
		static Standard_Integer TriConnex (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Triang,const Standard_Integer Pivot,const Standard_Integer Pedge,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)
	Index1(Standard_Integer)
	Index2(Standard_Integer)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") IsOnBound;
		static Standard_Boolean IsOnBound (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Index1,const Standard_Integer Index2);
		%feature("autodoc", "Args:
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)

Returns:
	static Standard_Real

No detailed docstring for this function.") GetBorderDeflection;
		static Standard_Real GetBorderDeflection (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "Args:
	thePolyh(IntCurveSurface_ThePolyhedronOfHInter)

Returns:
	static void

No detailed docstring for this function.") Dump;
		static void Dump (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
};


%feature("shadow") IntCurveSurface_ThePolyhedronToolOfHInter::~IntCurveSurface_ThePolyhedronToolOfHInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_ThePolyhedronToolOfHInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurveSurface_TheQuadCurvExactHInter;
class IntCurveSurface_TheQuadCurvExactHInter {
	public:
		%feature("autodoc", "Args:
	S(Handle_Adaptor3d_HSurface)
	C(Handle_Adaptor3d_HCurve)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_TheQuadCurvExactHInter;
		 IntCurveSurface_TheQuadCurvExactHInter (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbRoots;
		Standard_Integer NbRoots ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Root;
		Standard_Real Root (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Intervals;
		void Intervals (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") IntCurveSurface_TheQuadCurvExactHInter::~IntCurveSurface_TheQuadCurvExactHInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_TheQuadCurvExactHInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter;
class IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "Args:
	Q(IntSurf_Quadric)
	C(Handle_Adaptor3d_HCurve)

Returns:
	None

No detailed docstring for this function.") IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter;
		 IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter (const IntSurf_Quadric & Q,const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	F(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Value;
		Standard_Boolean Value (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Derivative;
		Standard_Boolean Derivative (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Param(Standard_Real)
	F(Standard_Real)
	D(Standard_Real)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Values;
		Standard_Boolean Values (const Standard_Real Param,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter::~IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IntCurveSurface_HInter;
class IntCurveSurface_HInter : public IntCurveSurface_Intersection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IntCurveSurface_HInter;
		 IntCurveSurface_HInter ();
		%feature("autodoc", "Args:
	Curve(Handle_Adaptor3d_HCurve)
	Surface(Handle_Adaptor3d_HSurface)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & Curve,const Handle_Adaptor3d_HSurface & Surface);
		%feature("autodoc", "Args:
	Curve(Handle_Adaptor3d_HCurve)
	Polygon(IntCurveSurface_ThePolygonOfHInter)
	Surface(Handle_Adaptor3d_HSurface)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & Curve,const IntCurveSurface_ThePolygonOfHInter & Polygon,const Handle_Adaptor3d_HSurface & Surface);
		%feature("autodoc", "Args:
	Curve(Handle_Adaptor3d_HCurve)
	ThePolygon(IntCurveSurface_ThePolygonOfHInter)
	Surface(Handle_Adaptor3d_HSurface)
	Polyhedron(IntCurveSurface_ThePolyhedronOfHInter)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & Curve,const IntCurveSurface_ThePolygonOfHInter & ThePolygon,const Handle_Adaptor3d_HSurface & Surface,const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron);
		%feature("autodoc", "Args:
	Curve(Handle_Adaptor3d_HCurve)
	ThePolygon(IntCurveSurface_ThePolygonOfHInter)
	Surface(Handle_Adaptor3d_HSurface)
	Polyhedron(IntCurveSurface_ThePolyhedronOfHInter)
	BndBSB(Bnd_BoundSortBox)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & Curve,const IntCurveSurface_ThePolygonOfHInter & ThePolygon,const Handle_Adaptor3d_HSurface & Surface,const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron,Bnd_BoundSortBox & BndBSB);
		%feature("autodoc", "Args:
	Curve(Handle_Adaptor3d_HCurve)
	Surface(Handle_Adaptor3d_HSurface)
	Polyhedron(IntCurveSurface_ThePolyhedronOfHInter)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & Curve,const Handle_Adaptor3d_HSurface & Surface,const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron);
};


%feature("shadow") IntCurveSurface_HInter::~IntCurveSurface_HInter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntCurveSurface_HInter {
	void _kill_pointed() {
		delete $self;
	}
};
