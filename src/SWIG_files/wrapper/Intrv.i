/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") Intrv

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include Intrv_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

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
		%feature("compactdefaultargs") Intrv_Interval;
		%feature("autodoc", "	:rtype: None
") Intrv_Interval;
		 Intrv_Interval ();
		%feature("compactdefaultargs") Intrv_Interval;
		%feature("autodoc", "	:param Start:
	:type Start: float
	:param End:
	:type End: float
	:rtype: None
") Intrv_Interval;
		 Intrv_Interval (const Standard_Real Start,const Standard_Real End);
		%feature("compactdefaultargs") Intrv_Interval;
		%feature("autodoc", "	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:rtype: None
") Intrv_Interval;
		 Intrv_Interval (const Standard_Real Start,const Standard_ShortReal TolStart,const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "	:rtype: float
") Start;
		Standard_Real Start ();
		%feature("compactdefaultargs") End;
		%feature("autodoc", "	:rtype: float
") End;
		Standard_Real End ();
		%feature("compactdefaultargs") TolStart;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") TolStart;
		Standard_ShortReal TolStart ();
		%feature("compactdefaultargs") TolEnd;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") TolEnd;
		Standard_ShortReal TolEnd ();
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	:param Start:
	:type Start: float &
	:param TolStart:
	:type TolStart: Standard_ShortReal &
	:param End:
	:type End: float &
	:param TolEnd:
	:type TolEnd: Standard_ShortReal &
	:rtype: None
") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_ShortReal & TolStart,Standard_Real &OutValue,Standard_ShortReal & TolEnd);
		%feature("compactdefaultargs") SetStart;
		%feature("autodoc", "	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:rtype: None
") SetStart;
		void SetStart (const Standard_Real Start,const Standard_ShortReal TolStart);
		%feature("compactdefaultargs") FuseAtStart;
		%feature("autodoc", "	* ****+****--------------------> Old one ****+****------------------------> New one to fuse <<< <<< ****+****------------------------> result

	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:rtype: None
") FuseAtStart;
		void FuseAtStart (const Standard_Real Start,const Standard_ShortReal TolStart);
		%feature("compactdefaultargs") CutAtStart;
		%feature("autodoc", "	* ****+****-----------> Old one <----------**+** Tool for cutting >>> >>> ****+****-----------> result

	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:rtype: None
") CutAtStart;
		void CutAtStart (const Standard_Real Start,const Standard_ShortReal TolStart);
		%feature("compactdefaultargs") SetEnd;
		%feature("autodoc", "	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:rtype: None
") SetEnd;
		void SetEnd (const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("compactdefaultargs") FuseAtEnd;
		%feature("autodoc", "	* <---------------------****+**** Old one <-----------------**+**  New one to fuse >>> >>> <---------------------****+**** result

	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:rtype: None
") FuseAtEnd;
		void FuseAtEnd (const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("compactdefaultargs") CutAtEnd;
		%feature("autodoc", "	* <-----****+****  Old one **+**------> Tool for cutting <<< <<< <-----****+****  result

	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:rtype: None
") CutAtEnd;
		void CutAtEnd (const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("compactdefaultargs") IsProbablyEmpty;
		%feature("autodoc", "	* True if myStart+myTolStart > myEnd-myTolEnd or if myEnd+myTolEnd > myStart-myTolStart

	:rtype: bool
") IsProbablyEmpty;
		Standard_Boolean IsProbablyEmpty ();
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* True if me is Before Other **-----------**** Other ***-----*   Before ***------------*  JustBefore ***-----------------*  OverlappingAtStart ***--------------------------*  JustEnclosingAtEnd ***-------------------------------------* Enclosing ***----*  JustOverlappingAtStart ***-------------*  Similar ***------------------------* JustEnclosingAtStart ***-*  Inside ***------*  JustOverlappingAtEnd ***-----------------* OverlappingAtEnd ***--------* JustAfter ***---* After

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: Intrv_Position
") Position;
		Intrv_Position Position (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsBefore;
		%feature("autodoc", "	* True if me is Before Other ***----------------**  me **-----------**** Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsBefore;
		Standard_Boolean IsBefore (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsAfter;
		%feature("autodoc", "	* True if me is After Other **-----------**** me ***----------------**  Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsAfter;
		Standard_Boolean IsAfter (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsInside;
		%feature("autodoc", "	* True if me is Inside Other **-----------****  me ***--------------------------**  Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsInside;
		Standard_Boolean IsInside (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsEnclosing;
		%feature("autodoc", "	* True if me is Enclosing Other ***----------------------------**** me ***------------------** Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsEnclosing;
		Standard_Boolean IsEnclosing (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsJustEnclosingAtStart;
		%feature("autodoc", "	* True if me is just Enclosing Other at start ***---------------------------**** me ***------------------** Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsJustEnclosingAtStart;
		Standard_Boolean IsJustEnclosingAtStart (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsJustEnclosingAtEnd;
		%feature("autodoc", "	* True if me is just Enclosing Other at End ***----------------------------**** me ***-----------------****  Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsJustEnclosingAtEnd;
		Standard_Boolean IsJustEnclosingAtEnd (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsJustBefore;
		%feature("autodoc", "	* True if me is just before Other ***--------****   me ***-----------** Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsJustBefore;
		Standard_Boolean IsJustBefore (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsJustAfter;
		%feature("autodoc", "	* True if me is just after Other ****-------****  me ***-----------**  Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsJustAfter;
		Standard_Boolean IsJustAfter (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsOverlappingAtStart;
		%feature("autodoc", "	* True if me is overlapping Other at start ***---------------***  me ***-----------** Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsOverlappingAtStart;
		Standard_Boolean IsOverlappingAtStart (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsOverlappingAtEnd;
		%feature("autodoc", "	* True if me is overlapping Other at end ***-----------** me ***---------------***  Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsOverlappingAtEnd;
		Standard_Boolean IsOverlappingAtEnd (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsJustOverlappingAtStart;
		%feature("autodoc", "	* True if me is just overlapping Other at start ***-----------***  me ***------------------------** Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsJustOverlappingAtStart;
		Standard_Boolean IsJustOverlappingAtStart (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsJustOverlappingAtEnd;
		%feature("autodoc", "	* True if me is just overlapping Other at end ***-----------*  me ***------------------------** Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsJustOverlappingAtEnd;
		Standard_Boolean IsJustOverlappingAtEnd (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsSimilar;
		%feature("autodoc", "	* True if me and Other have the same bounds *----------------***  me ***-----------------**  Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsSimilar;
		Standard_Boolean IsSimilar (const Intrv_Interval & Other);
};


%extend Intrv_Interval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Intrv_Intervals;
class Intrv_Intervals {
	public:
		%feature("compactdefaultargs") Intrv_Intervals;
		%feature("autodoc", "	* Creates a void sequence of intervals.

	:rtype: None
") Intrv_Intervals;
		 Intrv_Intervals ();
		%feature("compactdefaultargs") Intrv_Intervals;
		%feature("autodoc", "	* Creates a sequence of one interval.

	:param Int:
	:type Int: Intrv_Interval &
	:rtype: None
") Intrv_Intervals;
		 Intrv_Intervals (const Intrv_Interval & Int);
		%feature("compactdefaultargs") Intrv_Intervals;
		%feature("autodoc", "	* Creates by copying an existing sequence of intervals.

	:param Int:
	:type Int: Intrv_Intervals &
	:rtype: None
") Intrv_Intervals;
		 Intrv_Intervals (const Intrv_Intervals & Int);
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "	* Intersects the intervals with the interval <Tool>.

	:param Tool:
	:type Tool: Intrv_Interval &
	:rtype: None
") Intersect;
		void Intersect (const Intrv_Interval & Tool);
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "	* Intersects the intervals with the intervals in the sequence <Tool>.

	:param Tool:
	:type Tool: Intrv_Intervals &
	:rtype: None
") Intersect;
		void Intersect (const Intrv_Intervals & Tool);
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	:param Tool:
	:type Tool: Intrv_Interval &
	:rtype: None
") Subtract;
		void Subtract (const Intrv_Interval & Tool);
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	:param Tool:
	:type Tool: Intrv_Intervals &
	:rtype: None
") Subtract;
		void Subtract (const Intrv_Intervals & Tool);
		%feature("compactdefaultargs") Unite;
		%feature("autodoc", "	:param Tool:
	:type Tool: Intrv_Interval &
	:rtype: None
") Unite;
		void Unite (const Intrv_Interval & Tool);
		%feature("compactdefaultargs") Unite;
		%feature("autodoc", "	:param Tool:
	:type Tool: Intrv_Intervals &
	:rtype: None
") Unite;
		void Unite (const Intrv_Intervals & Tool);
		%feature("compactdefaultargs") XUnite;
		%feature("autodoc", "	:param Tool:
	:type Tool: Intrv_Interval &
	:rtype: None
") XUnite;
		void XUnite (const Intrv_Interval & Tool);
		%feature("compactdefaultargs") XUnite;
		%feature("autodoc", "	:param Tool:
	:type Tool: Intrv_Intervals &
	:rtype: None
") XUnite;
		void XUnite (const Intrv_Intervals & Tool);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Intrv_Interval
") Value;
		const Intrv_Interval & Value (const Standard_Integer Index);
};


%extend Intrv_Intervals {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Intrv_SequenceNodeOfSequenceOfInterval;
class Intrv_SequenceNodeOfSequenceOfInterval : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") Intrv_SequenceNodeOfSequenceOfInterval;
		%feature("autodoc", "	:param I:
	:type I: Intrv_Interval &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") Intrv_SequenceNodeOfSequenceOfInterval;
		 Intrv_SequenceNodeOfSequenceOfInterval (const Intrv_Interval & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Intrv_Interval
") Value;
		Intrv_Interval & Value ();
};


%extend Intrv_SequenceNodeOfSequenceOfInterval {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Intrv_SequenceNodeOfSequenceOfInterval(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Intrv_SequenceNodeOfSequenceOfInterval::Handle_Intrv_SequenceNodeOfSequenceOfInterval %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Intrv_SequenceNodeOfSequenceOfInterval* _get_reference() {
    return (Intrv_SequenceNodeOfSequenceOfInterval*)$self->Access();
    }
};

%extend Handle_Intrv_SequenceNodeOfSequenceOfInterval {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Intrv_SequenceNodeOfSequenceOfInterval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Intrv_SequenceOfInterval;
class Intrv_SequenceOfInterval : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") Intrv_SequenceOfInterval;
		%feature("autodoc", "	:rtype: None
") Intrv_SequenceOfInterval;
		 Intrv_SequenceOfInterval ();
		%feature("compactdefaultargs") Intrv_SequenceOfInterval;
		%feature("autodoc", "	:param Other:
	:type Other: Intrv_SequenceOfInterval &
	:rtype: None
") Intrv_SequenceOfInterval;
		 Intrv_SequenceOfInterval (const Intrv_SequenceOfInterval & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Intrv_SequenceOfInterval &
	:rtype: Intrv_SequenceOfInterval
") Assign;
		const Intrv_SequenceOfInterval & Assign (const Intrv_SequenceOfInterval & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Intrv_SequenceOfInterval &
	:rtype: Intrv_SequenceOfInterval
") operator =;
		const Intrv_SequenceOfInterval & operator = (const Intrv_SequenceOfInterval & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Intrv_Interval &
	:rtype: None
") Append;
		void Append (const Intrv_Interval & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: Intrv_SequenceOfInterval &
	:rtype: None
") Append;
		void Append (Intrv_SequenceOfInterval & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Intrv_Interval &
	:rtype: None
") Prepend;
		void Prepend (const Intrv_Interval & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: Intrv_SequenceOfInterval &
	:rtype: None
") Prepend;
		void Prepend (Intrv_SequenceOfInterval & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Intrv_Interval &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Intrv_Interval & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Intrv_SequenceOfInterval &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,Intrv_SequenceOfInterval & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Intrv_Interval &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Intrv_Interval & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: Intrv_SequenceOfInterval &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,Intrv_SequenceOfInterval & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Intrv_Interval
") First;
		const Intrv_Interval & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Intrv_Interval
") Last;
		const Intrv_Interval & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: Intrv_SequenceOfInterval &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,Intrv_SequenceOfInterval & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Intrv_Interval
") Value;
		const Intrv_Interval & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Intrv_Interval &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Intrv_Interval & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Intrv_Interval
") ChangeValue;
		Intrv_Interval & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend Intrv_SequenceOfInterval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
