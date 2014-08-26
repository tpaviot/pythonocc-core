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
%module Intrv

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

%include Intrv_required_python_modules.i
%include Intrv_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum Intrv_Position {
	Intrv_Before = 0,
	Intrv_JustBefore = 1,
	Intrv_OverlappingAtStart = 2,
	Intrv_JustEnclosingAtEnd = 3,
	Intrv_Enclosing = 4,
	Intrv_JustOverlappingAtStart = 5,
	Intrv_Similar = 6,
	Intrv_JustEnclosingAtStart = 7,
	Intrv_Inside = 8,
	Intrv_JustOverlappingAtEnd = 9,
	Intrv_OverlappingAtEnd = 10,
	Intrv_JustAfter = 11,
	Intrv_After = 12,
};

/* end public enums declaration */

%nodefaultctor Intrv_Interval;
class Intrv_Interval {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Intrv_Interval;
		 Intrv_Interval ();
		%feature("autodoc", "Args:
	Start(Standard_Real)
	End(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Intrv_Interval;
		 Intrv_Interval (const Standard_Real Start,const Standard_Real End);
		%feature("autodoc", "Args:
	Start(Standard_Real)
	TolStart(Standard_ShortReal)
	End(Standard_Real)
	TolEnd(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") Intrv_Interval;
		 Intrv_Interval (const Standard_Real Start,const Standard_ShortReal TolStart,const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Start;
		Standard_Real Start ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") End;
		Standard_Real End ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") TolStart;
		Standard_ShortReal TolStart ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_ShortReal

No detailed docstring for this function.") TolEnd;
		Standard_ShortReal TolEnd ();
		%feature("autodoc", "Args:
	Start(Standard_Real)
	TolStart(Standard_ShortReal)
	End(Standard_Real)
	TolEnd(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_ShortReal & TolStart,Standard_Real &OutValue,Standard_ShortReal & TolEnd);
		%feature("autodoc", "Args:
	Start(Standard_Real)
	TolStart(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") SetStart;
		void SetStart (const Standard_Real Start,const Standard_ShortReal TolStart);
		%feature("autodoc", "Args:
	Start(Standard_Real)
	TolStart(Standard_ShortReal)

Returns:
	None

****+****-------------------->      Old one  
        ****+****------------------------>      New one to fuse  
        <<<     <<<  
        ****+****------------------------>      result") FuseAtStart;
		void FuseAtStart (const Standard_Real Start,const Standard_ShortReal TolStart);
		%feature("autodoc", "Args:
	Start(Standard_Real)
	TolStart(Standard_ShortReal)

Returns:
	None

****+****----------->      Old one  
        <----------**+**                        Tool for cutting  
                   >>>     >>>  
                     ****+****----------->      result") CutAtStart;
		void CutAtStart (const Standard_Real Start,const Standard_ShortReal TolStart);
		%feature("autodoc", "Args:
	End(Standard_Real)
	TolEnd(Standard_ShortReal)

Returns:
	None

No detailed docstring for this function.") SetEnd;
		void SetEnd (const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("autodoc", "Args:
	End(Standard_Real)
	TolEnd(Standard_ShortReal)

Returns:
	None

<---------------------****+****      Old one  
        <-----------------**+**              New one to fuse  
                            >>>     >>>  
        <---------------------****+****      result") FuseAtEnd;
		void FuseAtEnd (const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("autodoc", "Args:
	End(Standard_Real)
	TolEnd(Standard_ShortReal)

Returns:
	None

<-----****+****                      Old one  
                    **+**------>             Tool for cutting  
              <<<     <<<  
        <-----****+****                      result") CutAtEnd;
		void CutAtEnd (const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if myStart+myTolStart > myEnd-myTolEnd  
           or if myEnd+myTolEnd > myStart-myTolStart") IsProbablyEmpty;
		Standard_Boolean IsProbablyEmpty ();
		%feature("autodoc", "Args:
	Other(Intrv_Interval)

Returns:
	Intrv_Position

True if me is Before Other  
                **-----------****             Other  
  ***-----*                                   Before  
  ***------------*                            JustBefore  
  ***-----------------*                       OverlappingAtStart  
  ***--------------------------*              JustEnclosingAtEnd  
  ***-------------------------------------*   Enclosing  
               ***----*                       JustOverlappingAtStart  
               ***-------------*              Similar  
               ***------------------------*   JustEnclosingAtStart  
                      ***-*                   Inside  
                      ***------*              JustOverlappingAtEnd  
                      ***-----------------*   OverlappingAtEnd  
                               ***--------*   JustAfter  
                                    ***---*   After") Position;
		Intrv_Position Position (const Intrv_Interval & Other);
		%feature("autodoc", "Args:
	Other(Intrv_Interval)

Returns:
	Standard_Boolean

True if me is Before Other  
         ***----------------**                              me  
                                 **-----------****          Other") IsBefore;
		Standard_Boolean IsBefore (const Intrv_Interval & Other);
		%feature("autodoc", "Args:
	Other(Intrv_Interval)

Returns:
	Standard_Boolean

True if me is After Other  
                                 **-----------****          me  
         ***----------------**                              Other") IsAfter;
		Standard_Boolean IsAfter (const Intrv_Interval & Other);
		%feature("autodoc", "Args:
	Other(Intrv_Interval)

Returns:
	Standard_Boolean

True if me is Inside Other  
                 **-----------****                          me  
         ***--------------------------**                    Other") IsInside;
		Standard_Boolean IsInside (const Intrv_Interval & Other);
		%feature("autodoc", "Args:
	Other(Intrv_Interval)

Returns:
	Standard_Boolean

True if me is Enclosing Other  
       ***----------------------------****                  me  
             ***------------------**                        Other") IsEnclosing;
		Standard_Boolean IsEnclosing (const Intrv_Interval & Other);
		%feature("autodoc", "Args:
	Other(Intrv_Interval)

Returns:
	Standard_Boolean

True if me is just Enclosing Other at start  
              ***---------------------------****            me  
             ***------------------**                        Other") IsJustEnclosingAtStart;
		Standard_Boolean IsJustEnclosingAtStart (const Intrv_Interval & Other);
		%feature("autodoc", "Args:
	Other(Intrv_Interval)

Returns:
	Standard_Boolean

True if me is just Enclosing Other at End  
       ***----------------------------****                  me  
                 ***-----------------****                   Other") IsJustEnclosingAtEnd;
		Standard_Boolean IsJustEnclosingAtEnd (const Intrv_Interval & Other);
		%feature("autodoc", "Args:
	Other(Intrv_Interval)

Returns:
	Standard_Boolean

True if me is just before Other  
       ***--------****                                      me  
                    ***-----------**                        Other") IsJustBefore;
		Standard_Boolean IsJustBefore (const Intrv_Interval & Other);
		%feature("autodoc", "Args:
	Other(Intrv_Interval)

Returns:
	Standard_Boolean

True if me is just after Other  
                    ****-------****                         me  
       ***-----------**                                     Other") IsJustAfter;
		Standard_Boolean IsJustAfter (const Intrv_Interval & Other);
		%feature("autodoc", "Args:
	Other(Intrv_Interval)

Returns:
	Standard_Boolean

True if me is overlapping Other at start  
       ***---------------***                                me  
                    ***-----------**                        Other") IsOverlappingAtStart;
		Standard_Boolean IsOverlappingAtStart (const Intrv_Interval & Other);
		%feature("autodoc", "Args:
	Other(Intrv_Interval)

Returns:
	Standard_Boolean

True if me is overlapping Other at end  
                    ***-----------**                        me  
       ***---------------***                                Other") IsOverlappingAtEnd;
		Standard_Boolean IsOverlappingAtEnd (const Intrv_Interval & Other);
		%feature("autodoc", "Args:
	Other(Intrv_Interval)

Returns:
	Standard_Boolean

True if me is just overlapping Other at start  
       ***-----------***                                    me  
       ***------------------------**                        Other") IsJustOverlappingAtStart;
		Standard_Boolean IsJustOverlappingAtStart (const Intrv_Interval & Other);
		%feature("autodoc", "Args:
	Other(Intrv_Interval)

Returns:
	Standard_Boolean

True if me is just overlapping Other at end  
                    ***-----------*                         me  
       ***------------------------**                        Other") IsJustOverlappingAtEnd;
		Standard_Boolean IsJustOverlappingAtEnd (const Intrv_Interval & Other);
		%feature("autodoc", "Args:
	Other(Intrv_Interval)

Returns:
	Standard_Boolean

True if me and Other have the same bounds  
        *----------------***                                me  
       ***-----------------**                               Other") IsSimilar;
		Standard_Boolean IsSimilar (const Intrv_Interval & Other);
};


%feature("shadow") Intrv_Interval::~Intrv_Interval %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intrv_Interval {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Intrv_Intervals;
class Intrv_Intervals {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a void sequence of intervals.") Intrv_Intervals;
		 Intrv_Intervals ();
		%feature("autodoc", "Args:
	Int(Intrv_Interval)

Returns:
	None

Creates a sequence of one interval.") Intrv_Intervals;
		 Intrv_Intervals (const Intrv_Interval & Int);
		%feature("autodoc", "Args:
	Int(Intrv_Intervals)

Returns:
	None

Creates   by   copying  an   existing  sequence of  
         intervals.") Intrv_Intervals;
		 Intrv_Intervals (const Intrv_Intervals & Int);
		%feature("autodoc", "Args:
	Tool(Intrv_Interval)

Returns:
	None

Intersects the intervals with the interval <Tool>.") Intersect;
		void Intersect (const Intrv_Interval & Tool);
		%feature("autodoc", "Args:
	Tool(Intrv_Intervals)

Returns:
	None

Intersects the intervals with the intervals in the  
         sequence  <Tool>.") Intersect;
		void Intersect (const Intrv_Intervals & Tool);
		%feature("autodoc", "Args:
	Tool(Intrv_Interval)

Returns:
	None

No detailed docstring for this function.") Subtract;
		void Subtract (const Intrv_Interval & Tool);
		%feature("autodoc", "Args:
	Tool(Intrv_Intervals)

Returns:
	None

No detailed docstring for this function.") Subtract;
		void Subtract (const Intrv_Intervals & Tool);
		%feature("autodoc", "Args:
	Tool(Intrv_Interval)

Returns:
	None

No detailed docstring for this function.") Unite;
		void Unite (const Intrv_Interval & Tool);
		%feature("autodoc", "Args:
	Tool(Intrv_Intervals)

Returns:
	None

No detailed docstring for this function.") Unite;
		void Unite (const Intrv_Intervals & Tool);
		%feature("autodoc", "Args:
	Tool(Intrv_Interval)

Returns:
	None

No detailed docstring for this function.") XUnite;
		void XUnite (const Intrv_Interval & Tool);
		%feature("autodoc", "Args:
	Tool(Intrv_Intervals)

Returns:
	None

No detailed docstring for this function.") XUnite;
		void XUnite (const Intrv_Intervals & Tool);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Intrv_Interval

No detailed docstring for this function.") Value;
		const Intrv_Interval & Value (const Standard_Integer Index);
};


%feature("shadow") Intrv_Intervals::~Intrv_Intervals %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intrv_Intervals {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Intrv_SequenceNodeOfSequenceOfInterval;
class Intrv_SequenceNodeOfSequenceOfInterval : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Intrv_Interval)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") Intrv_SequenceNodeOfSequenceOfInterval;
		 Intrv_SequenceNodeOfSequenceOfInterval (const Intrv_Interval & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Intrv_Interval

No detailed docstring for this function.") Value;
		Intrv_Interval & Value ();
};


%feature("shadow") Intrv_SequenceNodeOfSequenceOfInterval::~Intrv_SequenceNodeOfSequenceOfInterval %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intrv_SequenceNodeOfSequenceOfInterval {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Intrv_SequenceNodeOfSequenceOfInterval {
	Handle_Intrv_SequenceNodeOfSequenceOfInterval GetHandle() {
	return *(Handle_Intrv_SequenceNodeOfSequenceOfInterval*) &$self;
	}
};

%nodefaultctor Handle_Intrv_SequenceNodeOfSequenceOfInterval;
class Handle_Intrv_SequenceNodeOfSequenceOfInterval : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_Intrv_SequenceNodeOfSequenceOfInterval();
        Handle_Intrv_SequenceNodeOfSequenceOfInterval(const Handle_Intrv_SequenceNodeOfSequenceOfInterval &aHandle);
        Handle_Intrv_SequenceNodeOfSequenceOfInterval(const Intrv_SequenceNodeOfSequenceOfInterval *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Intrv_SequenceNodeOfSequenceOfInterval DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Intrv_SequenceNodeOfSequenceOfInterval {
    Intrv_SequenceNodeOfSequenceOfInterval* GetObject() {
    return (Intrv_SequenceNodeOfSequenceOfInterval*)$self->Access();
    }
};
%feature("shadow") Handle_Intrv_SequenceNodeOfSequenceOfInterval::~Handle_Intrv_SequenceNodeOfSequenceOfInterval %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Intrv_SequenceNodeOfSequenceOfInterval {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Intrv_SequenceOfInterval;
class Intrv_SequenceOfInterval : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Intrv_SequenceOfInterval;
		 Intrv_SequenceOfInterval ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(Intrv_SequenceOfInterval)

Returns:
	Intrv_SequenceOfInterval

No detailed docstring for this function.") Assign;
		const Intrv_SequenceOfInterval & Assign (const Intrv_SequenceOfInterval & Other);
		%feature("autodoc", "Args:
	Other(Intrv_SequenceOfInterval)

Returns:
	Intrv_SequenceOfInterval

No detailed docstring for this function.") operator=;
		const Intrv_SequenceOfInterval & operator = (const Intrv_SequenceOfInterval & Other);
		%feature("autodoc", "Args:
	T(Intrv_Interval)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Intrv_Interval & T);
		%feature("autodoc", "Args:
	S(Intrv_SequenceOfInterval)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (Intrv_SequenceOfInterval & S);
		%feature("autodoc", "Args:
	T(Intrv_Interval)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Intrv_Interval & T);
		%feature("autodoc", "Args:
	S(Intrv_SequenceOfInterval)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (Intrv_SequenceOfInterval & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Intrv_Interval)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Intrv_Interval & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Intrv_SequenceOfInterval)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Intrv_SequenceOfInterval & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Intrv_Interval)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Intrv_Interval & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(Intrv_SequenceOfInterval)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Intrv_SequenceOfInterval & S);
		%feature("autodoc", "Args:
	None
Returns:
	Intrv_Interval

No detailed docstring for this function.") First;
		const Intrv_Interval & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Intrv_Interval

No detailed docstring for this function.") Last;
		const Intrv_Interval & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(Intrv_SequenceOfInterval)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,Intrv_SequenceOfInterval & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Intrv_Interval

No detailed docstring for this function.") Value;
		const Intrv_Interval & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Intrv_Interval)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Intrv_Interval & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Intrv_Interval

No detailed docstring for this function.") ChangeValue;
		Intrv_Interval & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") Intrv_SequenceOfInterval::~Intrv_SequenceOfInterval %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Intrv_SequenceOfInterval {
	void _kill_pointed() {
		delete $self;
	}
};
