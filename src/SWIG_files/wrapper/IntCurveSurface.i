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
%module (package="OCC") IntCurveSurface

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
		%feature("autodoc", "	* returns the <done> field.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* returns the number of IntersectionPoint if IsDone returns True. else NotDone is raised.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "	* returns the IntersectionPoint of range <Index> raises NotDone if the computation has failed or if the computation has not been done raises OutOfRange if Index is not in the range <1..NbPoints>

	:param Index:
	:type Index: Standard_Integer
	:rtype: IntCurveSurface_IntersectionPoint
") Point;
		const IntCurveSurface_IntersectionPoint & Point (const Standard_Integer Index);
		%feature("autodoc", "	* returns the number of IntersectionSegment if IsDone returns True. else NotDone is raised.

	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "	* returns the IntersectionSegment of range <Index> raises NotDone if the computation has failed or if the computation has not been done raises OutOfRange if Index is not in the range <1..NbSegment>

	:param Index:
	:type Index: Standard_Integer
	:rtype: IntCurveSurface_IntersectionSegment
") Segment;
		const IntCurveSurface_IntersectionSegment & Segment (const Standard_Integer Index);
		%feature("autodoc", "	* Dump all the fields.

	:rtype: None
") Dump;
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
		%feature("autodoc", "	* Empty Constructor.

	:rtype: None
") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint ();
		%feature("autodoc", "	* Create an IntersectionPoint.

	:param P:
	:type P: gp_Pnt
	:param USurf:
	:type USurf: float
	:param VSurf:
	:type VSurf: float
	:param UCurv:
	:type UCurv: float
	:param TrCurv:
	:type TrCurv: IntCurveSurface_TransitionOnCurve
	:rtype: None
") IntCurveSurface_IntersectionPoint;
		 IntCurveSurface_IntersectionPoint (const gp_Pnt & P,const Standard_Real USurf,const Standard_Real VSurf,const Standard_Real UCurv,const IntCurveSurface_TransitionOnCurve TrCurv);
		%feature("autodoc", "	* Set the fields of the current IntersectionPoint.

	:param P:
	:type P: gp_Pnt
	:param USurf:
	:type USurf: float
	:param VSurf:
	:type VSurf: float
	:param UCurv:
	:type UCurv: float
	:param TrCurv:
	:type TrCurv: IntCurveSurface_TransitionOnCurve
	:rtype: None
") SetValues;
		void SetValues (const gp_Pnt & P,const Standard_Real USurf,const Standard_Real VSurf,const Standard_Real UCurv,const IntCurveSurface_TransitionOnCurve TrCurv);
		%feature("autodoc", "	* Get the fields of the current IntersectionPoint.

	:param P:
	:type P: gp_Pnt
	:param USurf:
	:type USurf: float &
	:param VSurf:
	:type VSurf: float &
	:param UCurv:
	:type UCurv: float &
	:param TrCurv:
	:type TrCurv: IntCurveSurface_TransitionOnCurve &
	:rtype: None
") Values;
		void Values (gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,IntCurveSurface_TransitionOnCurve & TrCurv);
		%feature("autodoc", "	* returns the geometric point.

	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt ();
		%feature("autodoc", "	* returns the U parameter on the surface.

	:rtype: float
") U;
		Standard_Real U ();
		%feature("autodoc", "	* returns the V parameter on the surface.

	:rtype: float
") V;
		Standard_Real V ();
		%feature("autodoc", "	* returns the parameter on the curve.

	:rtype: float
") W;
		Standard_Real W ();
		%feature("autodoc", "	* returns the Transition of the point.

	:rtype: IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition ();
		%feature("autodoc", "	* Dump all the fields.

	:rtype: None
") Dump;
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
		%feature("autodoc", "	:rtype: None
") IntCurveSurface_IntersectionSegment;
		 IntCurveSurface_IntersectionSegment ();
		%feature("autodoc", "	:param P1:
	:type P1: IntCurveSurface_IntersectionPoint &
	:param P2:
	:type P2: IntCurveSurface_IntersectionPoint &
	:rtype: None
") IntCurveSurface_IntersectionSegment;
		 IntCurveSurface_IntersectionSegment (const IntCurveSurface_IntersectionPoint & P1,const IntCurveSurface_IntersectionPoint & P2);
		%feature("autodoc", "	:param P1:
	:type P1: IntCurveSurface_IntersectionPoint &
	:param P2:
	:type P2: IntCurveSurface_IntersectionPoint &
	:rtype: None
") SetValues;
		void SetValues (const IntCurveSurface_IntersectionPoint & P1,const IntCurveSurface_IntersectionPoint & P2);
		%feature("autodoc", "	:param P1:
	:type P1: IntCurveSurface_IntersectionPoint &
	:param P2:
	:type P2: IntCurveSurface_IntersectionPoint &
	:rtype: None
") Values;
		void Values (IntCurveSurface_IntersectionPoint & P1,IntCurveSurface_IntersectionPoint & P2);
		%feature("autodoc", "	:param P1:
	:type P1: IntCurveSurface_IntersectionPoint &
	:rtype: None
") FirstPoint;
		void FirstPoint (IntCurveSurface_IntersectionPoint & P1);
		%feature("autodoc", "	:param P2:
	:type P2: IntCurveSurface_IntersectionPoint &
	:rtype: None
") SecondPoint;
		void SecondPoint (IntCurveSurface_IntersectionPoint & P2);
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionPoint
") FirstPoint;
		const IntCurveSurface_IntersectionPoint & FirstPoint ();
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionPoint
") SecondPoint;
		const IntCurveSurface_IntersectionPoint & SecondPoint ();
		%feature("autodoc", "	:rtype: None
") Dump;
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
		%feature("autodoc", "	:param I:
	:type I: IntCurveSurface_IntersectionPoint &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntCurveSurface_SequenceNodeOfSequenceOfPnt;
		 IntCurveSurface_SequenceNodeOfSequenceOfPnt (const IntCurveSurface_IntersectionPoint & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionPoint
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: IntCurveSurface_IntersectionSegment &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IntCurveSurface_SequenceNodeOfSequenceOfSeg;
		 IntCurveSurface_SequenceNodeOfSequenceOfSeg (const IntCurveSurface_IntersectionSegment & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionSegment
") Value;
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
		%feature("autodoc", "	:rtype: None
") IntCurveSurface_SequenceOfPnt;
		 IntCurveSurface_SequenceOfPnt ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: IntCurveSurface_SequenceOfPnt &
	:rtype: IntCurveSurface_SequenceOfPnt
") Assign;
		const IntCurveSurface_SequenceOfPnt & Assign (const IntCurveSurface_SequenceOfPnt & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntCurveSurface_SequenceOfPnt &
	:rtype: IntCurveSurface_SequenceOfPnt
") operator=;
		const IntCurveSurface_SequenceOfPnt & operator = (const IntCurveSurface_SequenceOfPnt & Other);
		%feature("autodoc", "	:param T:
	:type T: IntCurveSurface_IntersectionPoint &
	:rtype: None
") Append;
		void Append (const IntCurveSurface_IntersectionPoint & T);
		%feature("autodoc", "	:param S:
	:type S: IntCurveSurface_SequenceOfPnt &
	:rtype: None
") Append;
		void Append (IntCurveSurface_SequenceOfPnt & S);
		%feature("autodoc", "	:param T:
	:type T: IntCurveSurface_IntersectionPoint &
	:rtype: None
") Prepend;
		void Prepend (const IntCurveSurface_IntersectionPoint & T);
		%feature("autodoc", "	:param S:
	:type S: IntCurveSurface_SequenceOfPnt &
	:rtype: None
") Prepend;
		void Prepend (IntCurveSurface_SequenceOfPnt & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntCurveSurface_IntersectionPoint &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntCurveSurface_IntersectionPoint & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntCurveSurface_SequenceOfPnt &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntCurveSurface_SequenceOfPnt & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntCurveSurface_IntersectionPoint &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntCurveSurface_IntersectionPoint & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntCurveSurface_SequenceOfPnt &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntCurveSurface_SequenceOfPnt & S);
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionPoint
") First;
		const IntCurveSurface_IntersectionPoint & First ();
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionPoint
") Last;
		const IntCurveSurface_IntersectionPoint & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: IntCurveSurface_SequenceOfPnt &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntCurveSurface_SequenceOfPnt & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntCurveSurface_IntersectionPoint
") Value;
		const IntCurveSurface_IntersectionPoint & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: IntCurveSurface_IntersectionPoint &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntCurveSurface_IntersectionPoint & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntCurveSurface_IntersectionPoint
") ChangeValue;
		IntCurveSurface_IntersectionPoint & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	:rtype: None
") IntCurveSurface_SequenceOfSeg;
		 IntCurveSurface_SequenceOfSeg ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param Other:
	:type Other: IntCurveSurface_SequenceOfSeg &
	:rtype: IntCurveSurface_SequenceOfSeg
") Assign;
		const IntCurveSurface_SequenceOfSeg & Assign (const IntCurveSurface_SequenceOfSeg & Other);
		%feature("autodoc", "	:param Other:
	:type Other: IntCurveSurface_SequenceOfSeg &
	:rtype: IntCurveSurface_SequenceOfSeg
") operator=;
		const IntCurveSurface_SequenceOfSeg & operator = (const IntCurveSurface_SequenceOfSeg & Other);
		%feature("autodoc", "	:param T:
	:type T: IntCurveSurface_IntersectionSegment &
	:rtype: None
") Append;
		void Append (const IntCurveSurface_IntersectionSegment & T);
		%feature("autodoc", "	:param S:
	:type S: IntCurveSurface_SequenceOfSeg &
	:rtype: None
") Append;
		void Append (IntCurveSurface_SequenceOfSeg & S);
		%feature("autodoc", "	:param T:
	:type T: IntCurveSurface_IntersectionSegment &
	:rtype: None
") Prepend;
		void Prepend (const IntCurveSurface_IntersectionSegment & T);
		%feature("autodoc", "	:param S:
	:type S: IntCurveSurface_SequenceOfSeg &
	:rtype: None
") Prepend;
		void Prepend (IntCurveSurface_SequenceOfSeg & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntCurveSurface_IntersectionSegment &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const IntCurveSurface_IntersectionSegment & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntCurveSurface_SequenceOfSeg &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IntCurveSurface_SequenceOfSeg & S);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param T:
	:type T: IntCurveSurface_IntersectionSegment &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const IntCurveSurface_IntersectionSegment & T);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param S:
	:type S: IntCurveSurface_SequenceOfSeg &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IntCurveSurface_SequenceOfSeg & S);
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionSegment
") First;
		const IntCurveSurface_IntersectionSegment & First ();
		%feature("autodoc", "	:rtype: IntCurveSurface_IntersectionSegment
") Last;
		const IntCurveSurface_IntersectionSegment & Last ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Sub:
	:type Sub: IntCurveSurface_SequenceOfSeg &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IntCurveSurface_SequenceOfSeg & Sub);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntCurveSurface_IntersectionSegment
") Value;
		const IntCurveSurface_IntersectionSegment & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param I:
	:type I: IntCurveSurface_IntersectionSegment &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const IntCurveSurface_IntersectionSegment & I);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: IntCurveSurface_IntersectionSegment
") ChangeValue;
		IntCurveSurface_IntersectionSegment & ChangeValue (const Standard_Integer Index);
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
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") IntCurveSurface_TheCSFunctionOfHInter;
		 IntCurveSurface_TheCSFunctionOfHInter (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:rtype: int
") NbVariables;
		Standard_Integer NbVariables ();
		%feature("autodoc", "	:rtype: int
") NbEquations;
		Standard_Integer NbEquations ();
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:rtype: bool
") Value;
		Standard_Boolean Value (const math_Vector & X,math_Vector & F);
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Derivatives;
		Standard_Boolean Derivatives (const math_Vector & X,math_Matrix & D);
		%feature("autodoc", "	:param X:
	:type X: math_Vector &
	:param F:
	:type F: math_Vector &
	:param D:
	:type D: math_Matrix &
	:rtype: bool
") Values;
		Standard_Boolean Values (const math_Vector & X,math_Vector & F,math_Matrix & D);
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("autodoc", "	:rtype: float
") Root;
		Standard_Real Root ();
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") AuxillarSurface;
		const Handle_Adaptor3d_HSurface & AuxillarSurface ();
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HCurve
") AuxillarCurve;
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
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param F:
	:type F: IntCurveSurface_TheCSFunctionOfHInter &
	:param TolTangency:
	:type TolTangency: float
	:param MarginCoef: default value is 0.0
	:type MarginCoef: float
	:rtype: None
") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter (const Standard_Real U,const Standard_Real V,const Standard_Real W,const IntCurveSurface_TheCSFunctionOfHInter & F,const Standard_Real TolTangency,const Standard_Real MarginCoef = 0.0);
		%feature("autodoc", "	:param F:
	:type F: IntCurveSurface_TheCSFunctionOfHInter &
	:param TolTangency:
	:type TolTangency: float
	:rtype: None
") IntCurveSurface_TheExactHInter;
		 IntCurveSurface_TheExactHInter (const IntCurveSurface_TheCSFunctionOfHInter & F,const Standard_Real TolTangency);
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:param W:
	:type W: float
	:param Rsnld:
	:type Rsnld: math_FunctionSetRoot &
	:param u0:
	:type u0: float
	:param v0:
	:type v0: float
	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param w0:
	:type w0: float
	:param w1:
	:type w1: float
	:rtype: None
") Perform;
		void Perform (const Standard_Real U,const Standard_Real V,const Standard_Real W,math_FunctionSetRoot & Rsnld,const Standard_Real u0,const Standard_Real v0,const Standard_Real u1,const Standard_Real v1,const Standard_Real w0,const Standard_Real w1);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: gp_Pnt
") Point;
		const gp_Pnt  Point ();
		%feature("autodoc", "	:rtype: float
") ParameterOnCurve;
		Standard_Real ParameterOnCurve ();
		%feature("autodoc", "	:param U:
	:type U: float &
	:param V:
	:type V: float &
	:rtype: None
") ParameterOnSurface;
		void ParameterOnSurface (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: IntCurveSurface_TheCSFunctionOfHInter
") Function;
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
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const Handle_Adaptor3d_HCurve & C,const GeomAbs_Shape S);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		static void Intervals (const Handle_Adaptor3d_HCurve & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: bool
") IsPeriodic;
		static Standard_Boolean IsPeriodic (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: float
") Period;
		static Standard_Real Period (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const Handle_Adaptor3d_HCurve & C,const Standard_Real U);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") D0;
		static void D0 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: void
") D3;
		static void D3 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		static Standard_Real Resolution (const Handle_Adaptor3d_HCurve & C,const Standard_Real R3d);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: GeomAbs_CurveType
") GetType;
		static GeomAbs_CurveType GetType (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: gp_Lin
") Line;
		static gp_Lin Line (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: gp_Circ
") Circle;
		static gp_Circ Circle (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: gp_Elips
") Ellipse;
		static gp_Elips Ellipse (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: gp_Hypr
") Hyperbola;
		static gp_Hypr Hyperbola (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: gp_Parab
") Parabola;
		static gp_Parab Parabola (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: Handle_Geom_BezierCurve
") Bezier;
		static Handle_Geom_BezierCurve Bezier (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		static Handle_Geom_BSplineCurve BSpline (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:rtype: int
") NbSamples;
		static Standard_Integer NbSamples (const Handle_Adaptor3d_HCurve & C,const Standard_Real U0,const Standard_Real U1);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:param Defl:
	:type Defl: float
	:param NbMin:
	:type NbMin: Standard_Integer
	:param Pars:
	:type Pars: Handle_TColStd_HArray1OfReal &
	:rtype: void
") SamplePars;
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
		%feature("autodoc", "	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter ();
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Perform;
		void Perform (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Perform;
		void Perform (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") IntCurveSurface_TheInterferenceOfHInter;
		 IntCurveSurface_TheInterferenceOfHInter (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "	:param theLin:
	:type theLin: gp_Lin
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & theLin,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "	:param theLins:
	:type theLins: Intf_Array1OfLin &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const Intf_Array1OfLin & theLins,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param theBoundSB:
	:type theBoundSB: Bnd_BoundSortBox &
	:rtype: None
") Interference;
		void Interference (const IntCurveSurface_ThePolygonOfHInter & thePolyg,const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,Bnd_BoundSortBox & theBoundSB);
		%feature("autodoc", "	:param thePolyg:
	:type thePolyg: IntCurveSurface_ThePolygonOfHInter &
	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Interference;
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
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param NbPnt:
	:type NbPnt: Standard_Integer
	:rtype: None
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter (const Handle_Adaptor3d_HCurve & Curve,const Standard_Integer NbPnt);
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param NbPnt:
	:type NbPnt: Standard_Integer
	:rtype: None
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter (const Handle_Adaptor3d_HCurve & Curve,const Standard_Real U1,const Standard_Real U2,const Standard_Integer NbPnt);
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param Upars:
	:type Upars: TColStd_Array1OfReal &
	:rtype: None
") IntCurveSurface_ThePolygonOfHInter;
		 IntCurveSurface_ThePolygonOfHInter (const Handle_Adaptor3d_HCurve & Curve,const TColStd_Array1OfReal & Upars);
		%feature("autodoc", "	:rtype: Bnd_Box
") Bounding;
		const Bnd_Box & Bounding ();
		%feature("autodoc", "	:rtype: float
") DeflectionOverEstimation;
		Standard_Real DeflectionOverEstimation ();
		%feature("autodoc", "	:param x:
	:type x: float
	:rtype: None
") SetDeflectionOverEstimation;
		void SetDeflectionOverEstimation (const Standard_Real x);
		%feature("autodoc", "	:param clos:
	:type clos: bool
	:rtype: None
") Closed;
		void Closed (const Standard_Boolean clos);
		%feature("autodoc", "	:rtype: bool
") Closed;
		Standard_Boolean Closed ();
		%feature("autodoc", "	:rtype: int
") NbSegments;
		Standard_Integer NbSegments ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Pnt
") BeginOfSeg;
		const gp_Pnt  BeginOfSeg (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Pnt
") EndOfSeg;
		const gp_Pnt  EndOfSeg (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: float
") InfParameter;
		Standard_Real InfParameter ();
		%feature("autodoc", "	:rtype: float
") SupParameter;
		Standard_Real SupParameter ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param ParamOnLine:
	:type ParamOnLine: float
	:rtype: float
") ApproxParamOnCurve;
		Standard_Real ApproxParamOnCurve (const Standard_Integer Index,const Standard_Real ParamOnLine);
		%feature("autodoc", "	:rtype: None
") Dump;
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
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:rtype: Bnd_Box
") Bounding;
		static const Bnd_Box & Bounding (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:rtype: float
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:rtype: bool
") Closed;
		static Standard_Boolean Closed (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:rtype: int
") NbSegments;
		static Standard_Integer NbSegments (const IntCurveSurface_ThePolygonOfHInter & thePolygon);
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Pnt
") BeginOfSeg;
		static const gp_Pnt  BeginOfSeg (const IntCurveSurface_ThePolygonOfHInter & thePolygon,const Standard_Integer Index);
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Pnt
") EndOfSeg;
		static const gp_Pnt  EndOfSeg (const IntCurveSurface_ThePolygonOfHInter & thePolygon,const Standard_Integer Index);
		%feature("autodoc", "	:param thePolygon:
	:type thePolygon: IntCurveSurface_ThePolygonOfHInter &
	:rtype: void
") Dump;
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
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: Bnd_Box
") Bounding;
		static const Bnd_Box & Bounding (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: Handle_Bnd_HArray1OfBox
") ComponentsBounding;
		static const Handle_Bnd_HArray1OfBox & ComponentsBounding (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: float
") DeflectionOverEstimation;
		static Standard_Real DeflectionOverEstimation (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: int
") NbTriangles;
		static Standard_Integer NbTriangles (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param Index:
	:type Index: Standard_Integer
	:param P1:
	:type P1: Standard_Integer &
	:param P2:
	:type P2: Standard_Integer &
	:param P3:
	:type P3: Standard_Integer &
	:rtype: void
") Triangle;
		static void Triangle (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param Index:
	:type Index: Standard_Integer
	:rtype: gp_Pnt
") Point;
		static const gp_Pnt  Point (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Index);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param Triang:
	:type Triang: Standard_Integer
	:param Pivot:
	:type Pivot: Standard_Integer
	:param Pedge:
	:type Pedge: Standard_Integer
	:param TriCon:
	:type TriCon: Standard_Integer &
	:param OtherP:
	:type OtherP: Standard_Integer &
	:rtype: int
") TriConnex;
		static Standard_Integer TriConnex (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Triang,const Standard_Integer Pivot,const Standard_Integer Pedge,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:param Index1:
	:type Index1: Standard_Integer
	:param Index2:
	:type Index2: Standard_Integer
	:rtype: bool
") IsOnBound;
		static Standard_Boolean IsOnBound (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh,const Standard_Integer Index1,const Standard_Integer Index2);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: float
") GetBorderDeflection;
		static Standard_Real GetBorderDeflection (const IntCurveSurface_ThePolyhedronOfHInter & thePolyh);
		%feature("autodoc", "	:param thePolyh:
	:type thePolyh: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: void
") Dump;
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
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") IntCurveSurface_TheQuadCurvExactHInter;
		 IntCurveSurface_TheQuadCurvExactHInter (const Handle_Adaptor3d_HSurface & S,const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	:rtype: int
") NbRoots;
		Standard_Integer NbRoots ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: float
") Root;
		Standard_Real Root (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:rtype: None
") Intervals;
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
		%feature("autodoc", "	:param Q:
	:type Q: IntSurf_Quadric &
	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter;
		 IntCurveSurface_TheQuadCurvFuncOfTheQuadCurvExactHInter (const IntSurf_Quadric & Q,const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real Param,Standard_Real &OutValue);
		%feature("autodoc", "	:param Param:
	:type Param: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
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
		%feature("autodoc", "	:rtype: None
") IntCurveSurface_HInter;
		 IntCurveSurface_HInter ();
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & Curve,const Handle_Adaptor3d_HSurface & Surface);
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param Polygon:
	:type Polygon: IntCurveSurface_ThePolygonOfHInter &
	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & Curve,const IntCurveSurface_ThePolygonOfHInter & Polygon,const Handle_Adaptor3d_HSurface & Surface);
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param ThePolygon:
	:type ThePolygon: IntCurveSurface_ThePolygonOfHInter &
	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:param Polyhedron:
	:type Polyhedron: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & Curve,const IntCurveSurface_ThePolygonOfHInter & ThePolygon,const Handle_Adaptor3d_HSurface & Surface,const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron);
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param ThePolygon:
	:type ThePolygon: IntCurveSurface_ThePolygonOfHInter &
	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:param Polyhedron:
	:type Polyhedron: IntCurveSurface_ThePolyhedronOfHInter &
	:param BndBSB:
	:type BndBSB: Bnd_BoundSortBox &
	:rtype: None
") Perform;
		void Perform (const Handle_Adaptor3d_HCurve & Curve,const IntCurveSurface_ThePolygonOfHInter & ThePolygon,const Handle_Adaptor3d_HSurface & Surface,const IntCurveSurface_ThePolyhedronOfHInter & Polyhedron,Bnd_BoundSortBox & BndBSB);
		%feature("autodoc", "	:param Curve:
	:type Curve: Handle_Adaptor3d_HCurve &
	:param Surface:
	:type Surface: Handle_Adaptor3d_HSurface &
	:param Polyhedron:
	:type Polyhedron: IntCurveSurface_ThePolyhedronOfHInter &
	:rtype: None
") Perform;
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
