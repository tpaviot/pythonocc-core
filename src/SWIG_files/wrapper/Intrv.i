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
%define INTRVDOCSTRING
"Intrv module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_intrv.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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

/* python proxy classes for enums */
%pythoncode {

class Intrv_Position(IntEnum):
	Intrv_Before = 0
	Intrv_JustBefore = 1
	Intrv_OverlappingAtStart = 2
	Intrv_JustEnclosingAtEnd = 3
	Intrv_Enclosing = 4
	Intrv_JustOverlappingAtStart = 5
	Intrv_Similar = 6
	Intrv_JustEnclosingAtStart = 7
	Intrv_Inside = 8
	Intrv_JustOverlappingAtEnd = 9
	Intrv_OverlappingAtEnd = 10
	Intrv_JustAfter = 11
	Intrv_After = 12
Intrv_Before = Intrv_Position.Intrv_Before
Intrv_JustBefore = Intrv_Position.Intrv_JustBefore
Intrv_OverlappingAtStart = Intrv_Position.Intrv_OverlappingAtStart
Intrv_JustEnclosingAtEnd = Intrv_Position.Intrv_JustEnclosingAtEnd
Intrv_Enclosing = Intrv_Position.Intrv_Enclosing
Intrv_JustOverlappingAtStart = Intrv_Position.Intrv_JustOverlappingAtStart
Intrv_Similar = Intrv_Position.Intrv_Similar
Intrv_JustEnclosingAtStart = Intrv_Position.Intrv_JustEnclosingAtStart
Intrv_Inside = Intrv_Position.Intrv_Inside
Intrv_JustOverlappingAtEnd = Intrv_Position.Intrv_JustOverlappingAtEnd
Intrv_OverlappingAtEnd = Intrv_Position.Intrv_OverlappingAtEnd
Intrv_JustAfter = Intrv_Position.Intrv_JustAfter
Intrv_After = Intrv_Position.Intrv_After
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(Intrv_SequenceOfInterval) NCollection_Sequence<Intrv_Interval>;

%extend NCollection_Sequence<Intrv_Interval> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<Intrv_Interval> Intrv_SequenceOfInterval;
/* end typedefs declaration */

/***********************
* class Intrv_Interval *
***********************/
class Intrv_Interval {
	public:
		/****** Intrv_Interval::Intrv_Interval ******/
		/****** md5 signature: 33d6cc10bb2975b436aa245b8092498b ******/
		%feature("compactdefaultargs") Intrv_Interval;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Intrv_Interval;
		 Intrv_Interval();

		/****** Intrv_Interval::Intrv_Interval ******/
		/****** md5 signature: 192d2bc86ca0e7d69d0ba556fd35a1b4 ******/
		%feature("compactdefaultargs") Intrv_Interval;
		%feature("autodoc", "
Parameters
----------
Start: double
End: double

Return
-------
None

Description
-----------
No available documentation.
") Intrv_Interval;
		 Intrv_Interval(const double Start, const double End);

		/****** Intrv_Interval::Intrv_Interval ******/
		/****** md5 signature: f6a4c0a48f9b6e67c0131ef49e0b4fa2 ******/
		%feature("compactdefaultargs") Intrv_Interval;
		%feature("autodoc", "
Parameters
----------
Start: double
TolStart: float
End: double
TolEnd: float

Return
-------
None

Description
-----------
No available documentation.
") Intrv_Interval;
		 Intrv_Interval(const double Start, const float TolStart, const double End, const float TolEnd);

		/****** Intrv_Interval::Bounds ******/
		/****** md5 signature: 517a7b5969811a4375c082a21190b548 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
Start: double
TolStart: float
End: double
TolEnd: float

Description
-----------
No available documentation.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_ShortReal &OutValue, Standard_Real &OutValue, Standard_ShortReal &OutValue);

		/****** Intrv_Interval::CutAtEnd ******/
		/****** md5 signature: bb8aa1881aa1caabd0fe29c44337ef5d ******/
		%feature("compactdefaultargs") CutAtEnd;
		%feature("autodoc", "
Parameters
----------
End: double
TolEnd: float

Return
-------
None

Description
-----------
<-----****+****  Old one **+**------> Tool for cutting <<< <<< <-----****+****  result.
") CutAtEnd;
		void CutAtEnd(const double End, const float TolEnd);

		/****** Intrv_Interval::CutAtStart ******/
		/****** md5 signature: cbab180f1f5e1be731836cae9ec1cd3d ******/
		%feature("compactdefaultargs") CutAtStart;
		%feature("autodoc", "
Parameters
----------
Start: double
TolStart: float

Return
-------
None

Description
-----------
****+****-----------> Old one <----------**+** Tool for cutting >>> >>> ****+****-----------> result.
") CutAtStart;
		void CutAtStart(const double Start, const float TolStart);

		/****** Intrv_Interval::End ******/
		/****** md5 signature: 14f50ea44ab4607ed4b66a8c87b46b6c ******/
		%feature("compactdefaultargs") End;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") End;
		double End();

		/****** Intrv_Interval::FuseAtEnd ******/
		/****** md5 signature: a8e756540dc74541cf2573e6d713b7c9 ******/
		%feature("compactdefaultargs") FuseAtEnd;
		%feature("autodoc", "
Parameters
----------
End: double
TolEnd: float

Return
-------
None

Description
-----------
<---------------------****+**** Old one <-----------------**+**  New one to fuse >>> >>> <---------------------****+**** result.
") FuseAtEnd;
		void FuseAtEnd(const double End, const float TolEnd);

		/****** Intrv_Interval::FuseAtStart ******/
		/****** md5 signature: 5d1135faa510c6b56ad1520b43732cd9 ******/
		%feature("compactdefaultargs") FuseAtStart;
		%feature("autodoc", "
Parameters
----------
Start: double
TolStart: float

Return
-------
None

Description
-----------
****+****--------------------> Old one ****+****------------------------> New one to fuse <<< <<< ****+****------------------------> result.
") FuseAtStart;
		void FuseAtStart(const double Start, const float TolStart);

		/****** Intrv_Interval::IsAfter ******/
		/****** md5 signature: f35d7ce1d1471567ec745578d44b6923 ******/
		%feature("compactdefaultargs") IsAfter;
		%feature("autodoc", "
Parameters
----------
Other: Intrv_Interval

Return
-------
bool

Description
-----------
True if me is After Other **-----------**** me ***----------------**  Other.
") IsAfter;
		bool IsAfter(const Intrv_Interval & Other);

		/****** Intrv_Interval::IsBefore ******/
		/****** md5 signature: 031ad9fbc7b758d60b8f5b51b2ffbdc6 ******/
		%feature("compactdefaultargs") IsBefore;
		%feature("autodoc", "
Parameters
----------
Other: Intrv_Interval

Return
-------
bool

Description
-----------
True if me is Before Other ***----------------**  me **-----------**** Other.
") IsBefore;
		bool IsBefore(const Intrv_Interval & Other);

		/****** Intrv_Interval::IsEnclosing ******/
		/****** md5 signature: b31553538c00c827b5922c73c02ffc80 ******/
		%feature("compactdefaultargs") IsEnclosing;
		%feature("autodoc", "
Parameters
----------
Other: Intrv_Interval

Return
-------
bool

Description
-----------
True if me is Enclosing Other ***----------------------------**** me ***------------------** Other.
") IsEnclosing;
		bool IsEnclosing(const Intrv_Interval & Other);

		/****** Intrv_Interval::IsInside ******/
		/****** md5 signature: 3a13e873ca29f7863c6d6bb9e050a6e4 ******/
		%feature("compactdefaultargs") IsInside;
		%feature("autodoc", "
Parameters
----------
Other: Intrv_Interval

Return
-------
bool

Description
-----------
True if me is Inside Other **-----------****  me ***--------------------------**  Other.
") IsInside;
		bool IsInside(const Intrv_Interval & Other);

		/****** Intrv_Interval::IsJustAfter ******/
		/****** md5 signature: 851e12b2efde5aea16855c284e9e61f1 ******/
		%feature("compactdefaultargs") IsJustAfter;
		%feature("autodoc", "
Parameters
----------
Other: Intrv_Interval

Return
-------
bool

Description
-----------
True if me is just after Other ****-------****  me ***-----------**  Other.
") IsJustAfter;
		bool IsJustAfter(const Intrv_Interval & Other);

		/****** Intrv_Interval::IsJustBefore ******/
		/****** md5 signature: bd1466556b48dd521bf198c70babe6fb ******/
		%feature("compactdefaultargs") IsJustBefore;
		%feature("autodoc", "
Parameters
----------
Other: Intrv_Interval

Return
-------
bool

Description
-----------
True if me is just before Other ***--------****   me ***-----------** Other.
") IsJustBefore;
		bool IsJustBefore(const Intrv_Interval & Other);

		/****** Intrv_Interval::IsJustEnclosingAtEnd ******/
		/****** md5 signature: a428df5ee775e738dde3a642c6ede17c ******/
		%feature("compactdefaultargs") IsJustEnclosingAtEnd;
		%feature("autodoc", "
Parameters
----------
Other: Intrv_Interval

Return
-------
bool

Description
-----------
True if me is just Enclosing Other at End ***----------------------------**** me ***-----------------****  Other.
") IsJustEnclosingAtEnd;
		bool IsJustEnclosingAtEnd(const Intrv_Interval & Other);

		/****** Intrv_Interval::IsJustEnclosingAtStart ******/
		/****** md5 signature: 22daefe44196c8f8ca025039a845a615 ******/
		%feature("compactdefaultargs") IsJustEnclosingAtStart;
		%feature("autodoc", "
Parameters
----------
Other: Intrv_Interval

Return
-------
bool

Description
-----------
True if me is just Enclosing Other at start ***---------------------------**** me ***------------------** Other.
") IsJustEnclosingAtStart;
		bool IsJustEnclosingAtStart(const Intrv_Interval & Other);

		/****** Intrv_Interval::IsJustOverlappingAtEnd ******/
		/****** md5 signature: 8653edec9a6555aac700282ee0ead744 ******/
		%feature("compactdefaultargs") IsJustOverlappingAtEnd;
		%feature("autodoc", "
Parameters
----------
Other: Intrv_Interval

Return
-------
bool

Description
-----------
True if me is just overlapping Other at end ***-----------*  me ***------------------------** Other.
") IsJustOverlappingAtEnd;
		bool IsJustOverlappingAtEnd(const Intrv_Interval & Other);

		/****** Intrv_Interval::IsJustOverlappingAtStart ******/
		/****** md5 signature: 5b89491a125cbab716746fbd7d99e6e7 ******/
		%feature("compactdefaultargs") IsJustOverlappingAtStart;
		%feature("autodoc", "
Parameters
----------
Other: Intrv_Interval

Return
-------
bool

Description
-----------
True if me is just overlapping Other at start ***-----------***  me ***------------------------** Other.
") IsJustOverlappingAtStart;
		bool IsJustOverlappingAtStart(const Intrv_Interval & Other);

		/****** Intrv_Interval::IsOverlappingAtEnd ******/
		/****** md5 signature: 1a13de6fe4e032e09aeb30023d83bfc2 ******/
		%feature("compactdefaultargs") IsOverlappingAtEnd;
		%feature("autodoc", "
Parameters
----------
Other: Intrv_Interval

Return
-------
bool

Description
-----------
True if me is overlapping Other at end ***-----------** me ***---------------***  Other.
") IsOverlappingAtEnd;
		bool IsOverlappingAtEnd(const Intrv_Interval & Other);

		/****** Intrv_Interval::IsOverlappingAtStart ******/
		/****** md5 signature: efe3f70e69ef549c4b7cd02a823eb92e ******/
		%feature("compactdefaultargs") IsOverlappingAtStart;
		%feature("autodoc", "
Parameters
----------
Other: Intrv_Interval

Return
-------
bool

Description
-----------
True if me is overlapping Other at start ***---------------***  me ***-----------** Other.
") IsOverlappingAtStart;
		bool IsOverlappingAtStart(const Intrv_Interval & Other);

		/****** Intrv_Interval::IsProbablyEmpty ******/
		/****** md5 signature: 960e4c811233aa8a7264e85ebfa40547 ******/
		%feature("compactdefaultargs") IsProbablyEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if myStart+myTolStart > myEnd-myTolEnd or if myEnd+myTolEnd > myStart-myTolStart.
") IsProbablyEmpty;
		bool IsProbablyEmpty();

		/****** Intrv_Interval::IsSimilar ******/
		/****** md5 signature: 4c171a2731c1efc6b43ef5b3fa02a5d1 ******/
		%feature("compactdefaultargs") IsSimilar;
		%feature("autodoc", "
Parameters
----------
Other: Intrv_Interval

Return
-------
bool

Description
-----------
True if me and Other have the same bounds *----------------***  me ***-----------------**  Other.
") IsSimilar;
		bool IsSimilar(const Intrv_Interval & Other);

		/****** Intrv_Interval::Position ******/
		/****** md5 signature: 23b3dced13e904e86be9a11b268d2a4d ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "
Parameters
----------
Other: Intrv_Interval

Return
-------
Intrv_Position

Description
-----------
True if me is Before Other **-----------**** Other ***-----*   Before ***------------*  JustBefore ***-----------------*  OverlappingAtStart ***--------------------------*  JustEnclosingAtEnd ***-------------------------------------* Enclosing ***----*  JustOverlappingAtStart ***-------------*  Similar ***------------------------* JustEnclosingAtStart ***-*  Inside ***------*  JustOverlappingAtEnd ***-----------------* OverlappingAtEnd ***--------* JustAfter ***---* After.
") Position;
		Intrv_Position Position(const Intrv_Interval & Other);

		/****** Intrv_Interval::SetEnd ******/
		/****** md5 signature: 258d58121ba7381610c1f3c8536febc4 ******/
		%feature("compactdefaultargs") SetEnd;
		%feature("autodoc", "
Parameters
----------
End: double
TolEnd: float

Return
-------
None

Description
-----------
No available documentation.
") SetEnd;
		void SetEnd(const double End, const float TolEnd);

		/****** Intrv_Interval::SetStart ******/
		/****** md5 signature: f97fedb50beed3e225748435cc6d38ee ******/
		%feature("compactdefaultargs") SetStart;
		%feature("autodoc", "
Parameters
----------
Start: double
TolStart: float

Return
-------
None

Description
-----------
No available documentation.
") SetStart;
		void SetStart(const double Start, const float TolStart);

		/****** Intrv_Interval::Start ******/
		/****** md5 signature: 2ccaa09966dadabb655ba2c0f6f07f02 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Start;
		double Start();

		/****** Intrv_Interval::TolEnd ******/
		/****** md5 signature: ff9ae7a74ad8693460a8ef18c530458d ******/
		%feature("compactdefaultargs") TolEnd;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") TolEnd;
		float TolEnd();

		/****** Intrv_Interval::TolStart ******/
		/****** md5 signature: 1deb621af8e3b3dbb2024a9373a80a37 ******/
		%feature("compactdefaultargs") TolStart;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") TolStart;
		float TolStart();

};


%extend Intrv_Interval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Intrv_Intervals *
************************/
class Intrv_Intervals {
	public:
		/****** Intrv_Intervals::Intrv_Intervals ******/
		/****** md5 signature: be6232adefab507170d08ff623c85cfd ******/
		%feature("compactdefaultargs") Intrv_Intervals;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a void sequence of intervals.
") Intrv_Intervals;
		 Intrv_Intervals();

		/****** Intrv_Intervals::Intrv_Intervals ******/
		/****** md5 signature: c12cf3acf1772c29dd9b7848f7f4fd49 ******/
		%feature("compactdefaultargs") Intrv_Intervals;
		%feature("autodoc", "
Parameters
----------
Int: Intrv_Interval

Return
-------
None

Description
-----------
Creates a sequence of one interval.
") Intrv_Intervals;
		 Intrv_Intervals(const Intrv_Interval & Int);

		/****** Intrv_Intervals::Intersect ******/
		/****** md5 signature: e12a005317201bc1bd17d62e86f0673e ******/
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "
Parameters
----------
Tool: Intrv_Interval

Return
-------
None

Description
-----------
Intersects the intervals with the interval <Tool>.
") Intersect;
		void Intersect(const Intrv_Interval & Tool);

		/****** Intrv_Intervals::Intersect ******/
		/****** md5 signature: 691a0590e25f134c38c8690782055db9 ******/
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "
Parameters
----------
Tool: Intrv_Intervals

Return
-------
None

Description
-----------
Intersects the intervals with the intervals in the sequence <Tool>.
") Intersect;
		void Intersect(const Intrv_Intervals & Tool);

		/****** Intrv_Intervals::NbIntervals ******/
		/****** md5 signature: 487b014b9cd194c58d109502ca451d5e ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbIntervals;
		int NbIntervals();

		/****** Intrv_Intervals::Subtract ******/
		/****** md5 signature: 84d450900772c0ab496765aa3b97e5e0 ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
Tool: Intrv_Interval

Return
-------
None

Description
-----------
No available documentation.
") Subtract;
		void Subtract(const Intrv_Interval & Tool);

		/****** Intrv_Intervals::Subtract ******/
		/****** md5 signature: 2fed38f550387f5eaeecc8b41a3d89dd ******/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
Tool: Intrv_Intervals

Return
-------
None

Description
-----------
No available documentation.
") Subtract;
		void Subtract(const Intrv_Intervals & Tool);

		/****** Intrv_Intervals::Unite ******/
		/****** md5 signature: 0d5f961c161ee90870ec4968fb8da826 ******/
		%feature("compactdefaultargs") Unite;
		%feature("autodoc", "
Parameters
----------
Tool: Intrv_Interval

Return
-------
None

Description
-----------
No available documentation.
") Unite;
		void Unite(const Intrv_Interval & Tool);

		/****** Intrv_Intervals::Unite ******/
		/****** md5 signature: e14122155e21a0b69837acc9ae886d66 ******/
		%feature("compactdefaultargs") Unite;
		%feature("autodoc", "
Parameters
----------
Tool: Intrv_Intervals

Return
-------
None

Description
-----------
No available documentation.
") Unite;
		void Unite(const Intrv_Intervals & Tool);

		/****** Intrv_Intervals::Value ******/
		/****** md5 signature: 3c8c1bb6f7513efff984f47eced98da8 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
Intrv_Interval

Description
-----------
No available documentation.
") Value;
		const Intrv_Interval & Value(const int Index);

		/****** Intrv_Intervals::XUnite ******/
		/****** md5 signature: 1b9a7792b19b82175cf1ec256710edea ******/
		%feature("compactdefaultargs") XUnite;
		%feature("autodoc", "
Parameters
----------
Tool: Intrv_Interval

Return
-------
None

Description
-----------
No available documentation.
") XUnite;
		void XUnite(const Intrv_Interval & Tool);

		/****** Intrv_Intervals::XUnite ******/
		/****** md5 signature: 0ec9c3d932976dd5752f27da217001f3 ******/
		%feature("compactdefaultargs") XUnite;
		%feature("autodoc", "
Parameters
----------
Tool: Intrv_Intervals

Return
-------
None

Description
-----------
No available documentation.
") XUnite;
		void XUnite(const Intrv_Intervals & Tool);

};


%extend Intrv_Intervals {
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
