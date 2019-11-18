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
%define INTRVDOCSTRING
"Intrv module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_intrv.html"
%enddef
%module (package="OCC.Core", docstring=INTRVDOCSTRING) Intrv


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
#include<Intrv_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
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

/* handles */
/* end handles declaration */

/* templates */
%template(Intrv_SequenceOfInterval) NCollection_Sequence <Intrv_Interval>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <Intrv_Interval> Intrv_SequenceOfInterval;
/* end typedefs declaration */

%nodefaultctor Intrv_Interval;
class Intrv_Interval {
	public:
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
		%feature("compactdefaultargs") CutAtEnd;
		%feature("autodoc", "	* <-----****+****  Old one **+**------> Tool for cutting <<< <<< <-----****+****  result

	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:rtype: None
") CutAtEnd;
		void CutAtEnd (const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("compactdefaultargs") CutAtStart;
		%feature("autodoc", "	* ****+****-----------> Old one <----------**+** Tool for cutting >>> >>> ****+****-----------> result

	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:rtype: None
") CutAtStart;
		void CutAtStart (const Standard_Real Start,const Standard_ShortReal TolStart);
		%feature("compactdefaultargs") End;
		%feature("autodoc", "	:rtype: float
") End;
		Standard_Real End ();
		%feature("compactdefaultargs") FuseAtEnd;
		%feature("autodoc", "	* <---------------------****+**** Old one <-----------------**+**  New one to fuse >>> >>> <---------------------****+**** result

	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:rtype: None
") FuseAtEnd;
		void FuseAtEnd (const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("compactdefaultargs") FuseAtStart;
		%feature("autodoc", "	* ****+****--------------------> Old one ****+****------------------------> New one to fuse <<< <<< ****+****------------------------> result

	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:rtype: None
") FuseAtStart;
		void FuseAtStart (const Standard_Real Start,const Standard_ShortReal TolStart);
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
		%feature("compactdefaultargs") IsAfter;
		%feature("autodoc", "	* True if me is After Other **-----------**** me ***----------------**  Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsAfter;
		Standard_Boolean IsAfter (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsBefore;
		%feature("autodoc", "	* True if me is Before Other ***----------------**  me **-----------**** Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsBefore;
		Standard_Boolean IsBefore (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsEnclosing;
		%feature("autodoc", "	* True if me is Enclosing Other ***----------------------------**** me ***------------------** Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsEnclosing;
		Standard_Boolean IsEnclosing (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsInside;
		%feature("autodoc", "	* True if me is Inside Other **-----------****  me ***--------------------------**  Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsInside;
		Standard_Boolean IsInside (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsJustAfter;
		%feature("autodoc", "	* True if me is just after Other ****-------****  me ***-----------**  Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsJustAfter;
		Standard_Boolean IsJustAfter (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsJustBefore;
		%feature("autodoc", "	* True if me is just before Other ***--------****   me ***-----------** Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsJustBefore;
		Standard_Boolean IsJustBefore (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsJustEnclosingAtEnd;
		%feature("autodoc", "	* True if me is just Enclosing Other at End ***----------------------------**** me ***-----------------****  Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsJustEnclosingAtEnd;
		Standard_Boolean IsJustEnclosingAtEnd (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsJustEnclosingAtStart;
		%feature("autodoc", "	* True if me is just Enclosing Other at start ***---------------------------**** me ***------------------** Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsJustEnclosingAtStart;
		Standard_Boolean IsJustEnclosingAtStart (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsJustOverlappingAtEnd;
		%feature("autodoc", "	* True if me is just overlapping Other at end ***-----------*  me ***------------------------** Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsJustOverlappingAtEnd;
		Standard_Boolean IsJustOverlappingAtEnd (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsJustOverlappingAtStart;
		%feature("autodoc", "	* True if me is just overlapping Other at start ***-----------***  me ***------------------------** Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsJustOverlappingAtStart;
		Standard_Boolean IsJustOverlappingAtStart (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsOverlappingAtEnd;
		%feature("autodoc", "	* True if me is overlapping Other at end ***-----------** me ***---------------***  Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsOverlappingAtEnd;
		Standard_Boolean IsOverlappingAtEnd (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsOverlappingAtStart;
		%feature("autodoc", "	* True if me is overlapping Other at start ***---------------***  me ***-----------** Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsOverlappingAtStart;
		Standard_Boolean IsOverlappingAtStart (const Intrv_Interval & Other);
		%feature("compactdefaultargs") IsProbablyEmpty;
		%feature("autodoc", "	* True if myStart+myTolStart > myEnd-myTolEnd or if myEnd+myTolEnd > myStart-myTolStart

	:rtype: bool
") IsProbablyEmpty;
		Standard_Boolean IsProbablyEmpty ();
		%feature("compactdefaultargs") IsSimilar;
		%feature("autodoc", "	* True if me and Other have the same bounds *----------------***  me ***-----------------**  Other

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: bool
") IsSimilar;
		Standard_Boolean IsSimilar (const Intrv_Interval & Other);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* True if me is Before Other **-----------**** Other ***-----*   Before ***------------*  JustBefore ***-----------------*  OverlappingAtStart ***--------------------------*  JustEnclosingAtEnd ***-------------------------------------* Enclosing ***----*  JustOverlappingAtStart ***-------------*  Similar ***------------------------* JustEnclosingAtStart ***-*  Inside ***------*  JustOverlappingAtEnd ***-----------------* OverlappingAtEnd ***--------* JustAfter ***---* After

	:param Other:
	:type Other: Intrv_Interval &
	:rtype: Intrv_Position
") Position;
		Intrv_Position Position (const Intrv_Interval & Other);
		%feature("compactdefaultargs") SetEnd;
		%feature("autodoc", "	:param End:
	:type End: float
	:param TolEnd:
	:type TolEnd: Standard_ShortReal
	:rtype: None
") SetEnd;
		void SetEnd (const Standard_Real End,const Standard_ShortReal TolEnd);
		%feature("compactdefaultargs") SetStart;
		%feature("autodoc", "	:param Start:
	:type Start: float
	:param TolStart:
	:type TolStart: Standard_ShortReal
	:rtype: None
") SetStart;
		void SetStart (const Standard_Real Start,const Standard_ShortReal TolStart);
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "	:rtype: float
") Start;
		Standard_Real Start ();
		%feature("compactdefaultargs") TolEnd;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") TolEnd;
		Standard_ShortReal TolEnd ();
		%feature("compactdefaultargs") TolStart;
		%feature("autodoc", "	:rtype: Standard_ShortReal
") TolStart;
		Standard_ShortReal TolStart ();
};


%extend Intrv_Interval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Intrv_Intervals;
class Intrv_Intervals {
	public:
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
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals ();
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
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Intrv_Interval
") Value;
		const Intrv_Interval & Value (const Standard_Integer Index);
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
};


%extend Intrv_Intervals {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
