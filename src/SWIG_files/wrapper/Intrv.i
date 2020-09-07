/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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

/* python proy classes for enums */
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
		/****************** Intrv_Interval ******************/
		/**** md5 signature: 33d6cc10bb2975b436aa245b8092498b ****/
		%feature("compactdefaultargs") Intrv_Interval;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Intrv_Interval;
		 Intrv_Interval();

		/****************** Intrv_Interval ******************/
		/**** md5 signature: 3673b33b4bbde60fc105ef0711659d29 ****/
		%feature("compactdefaultargs") Intrv_Interval;
		%feature("autodoc", "No available documentation.

Parameters
----------
Start: float
End: float

Returns
-------
None
") Intrv_Interval;
		 Intrv_Interval(const Standard_Real Start, const Standard_Real End);

		/****************** Intrv_Interval ******************/
		/**** md5 signature: 1cb5dba0db82fe9550ea330f07af1759 ****/
		%feature("compactdefaultargs") Intrv_Interval;
		%feature("autodoc", "No available documentation.

Parameters
----------
Start: float
TolStart: Standard_ShortReal
End: float
TolEnd: Standard_ShortReal

Returns
-------
None
") Intrv_Interval;
		 Intrv_Interval(const Standard_Real Start, const Standard_ShortReal TolStart, const Standard_Real End, const Standard_ShortReal TolEnd);

		/****************** Bounds ******************/
		/**** md5 signature: 891abb34b04a15a8931783d3c3440916 ****/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
TolStart: Standard_ShortReal
TolEnd: Standard_ShortReal

Returns
-------
Start: float
End: float
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_ShortReal & TolStart, Standard_Real &OutValue, Standard_ShortReal & TolEnd);

		/****************** CutAtEnd ******************/
		/**** md5 signature: 016f363129bd1797c683a8d0f6c91793 ****/
		%feature("compactdefaultargs") CutAtEnd;
		%feature("autodoc", "<-----****+****  old one **+**------> tool for cutting <<< <<< <-----****+****  result.

Parameters
----------
End: float
TolEnd: Standard_ShortReal

Returns
-------
None
") CutAtEnd;
		void CutAtEnd(const Standard_Real End, const Standard_ShortReal TolEnd);

		/****************** CutAtStart ******************/
		/**** md5 signature: b230d89b1ea891f35fb7591edf3e10ca ****/
		%feature("compactdefaultargs") CutAtStart;
		%feature("autodoc", "****+****-----------> old one <----------**+** tool for cutting >>> >>> ****+****-----------> result.

Parameters
----------
Start: float
TolStart: Standard_ShortReal

Returns
-------
None
") CutAtStart;
		void CutAtStart(const Standard_Real Start, const Standard_ShortReal TolStart);

		/****************** End ******************/
		/**** md5 signature: 2be3dc76a1b5b647442c292ec6dd93e3 ****/
		%feature("compactdefaultargs") End;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") End;
		Standard_Real End();

		/****************** FuseAtEnd ******************/
		/**** md5 signature: f45c70a3da084801256aa753e442ce89 ****/
		%feature("compactdefaultargs") FuseAtEnd;
		%feature("autodoc", "<---------------------****+**** old one <-----------------**+**  new one to fuse >>> >>> <---------------------****+**** result.

Parameters
----------
End: float
TolEnd: Standard_ShortReal

Returns
-------
None
") FuseAtEnd;
		void FuseAtEnd(const Standard_Real End, const Standard_ShortReal TolEnd);

		/****************** FuseAtStart ******************/
		/**** md5 signature: 23ad6ee7ce2bfdcf69a06789a622cc7d ****/
		%feature("compactdefaultargs") FuseAtStart;
		%feature("autodoc", "****+****--------------------> old one ****+****------------------------> new one to fuse <<< <<< ****+****------------------------> result.

Parameters
----------
Start: float
TolStart: Standard_ShortReal

Returns
-------
None
") FuseAtStart;
		void FuseAtStart(const Standard_Real Start, const Standard_ShortReal TolStart);

		/****************** IsAfter ******************/
		/**** md5 signature: 15efede7ef840b503c8c599701a17050 ****/
		%feature("compactdefaultargs") IsAfter;
		%feature("autodoc", "True if me is after other **-----------**** me ***----------------**  other.

Parameters
----------
Other: Intrv_Interval

Returns
-------
bool
") IsAfter;
		Standard_Boolean IsAfter(const Intrv_Interval & Other);

		/****************** IsBefore ******************/
		/**** md5 signature: cac693f4ba643a40db02bebb58a30eee ****/
		%feature("compactdefaultargs") IsBefore;
		%feature("autodoc", "True if me is before other ***----------------**  me **-----------**** other.

Parameters
----------
Other: Intrv_Interval

Returns
-------
bool
") IsBefore;
		Standard_Boolean IsBefore(const Intrv_Interval & Other);

		/****************** IsEnclosing ******************/
		/**** md5 signature: 3236b77fa5c340b28d1405358457ca41 ****/
		%feature("compactdefaultargs") IsEnclosing;
		%feature("autodoc", "True if me is enclosing other ***----------------------------**** me ***------------------** other.

Parameters
----------
Other: Intrv_Interval

Returns
-------
bool
") IsEnclosing;
		Standard_Boolean IsEnclosing(const Intrv_Interval & Other);

		/****************** IsInside ******************/
		/**** md5 signature: 051f8a2b719124d352598312c6cec8ad ****/
		%feature("compactdefaultargs") IsInside;
		%feature("autodoc", "True if me is inside other **-----------****  me ***--------------------------**  other.

Parameters
----------
Other: Intrv_Interval

Returns
-------
bool
") IsInside;
		Standard_Boolean IsInside(const Intrv_Interval & Other);

		/****************** IsJustAfter ******************/
		/**** md5 signature: 10c4d1f99eb68de8d0bd2e7fa34e4f79 ****/
		%feature("compactdefaultargs") IsJustAfter;
		%feature("autodoc", "True if me is just after other ****-------****  me ***-----------**  other.

Parameters
----------
Other: Intrv_Interval

Returns
-------
bool
") IsJustAfter;
		Standard_Boolean IsJustAfter(const Intrv_Interval & Other);

		/****************** IsJustBefore ******************/
		/**** md5 signature: 8fb5c54a872f6646238c379940a13c45 ****/
		%feature("compactdefaultargs") IsJustBefore;
		%feature("autodoc", "True if me is just before other ***--------****   me ***-----------** other.

Parameters
----------
Other: Intrv_Interval

Returns
-------
bool
") IsJustBefore;
		Standard_Boolean IsJustBefore(const Intrv_Interval & Other);

		/****************** IsJustEnclosingAtEnd ******************/
		/**** md5 signature: 2d8c5266845cdc63b3edd3e247aa1ce1 ****/
		%feature("compactdefaultargs") IsJustEnclosingAtEnd;
		%feature("autodoc", "True if me is just enclosing other at end ***----------------------------**** me ***-----------------****  other.

Parameters
----------
Other: Intrv_Interval

Returns
-------
bool
") IsJustEnclosingAtEnd;
		Standard_Boolean IsJustEnclosingAtEnd(const Intrv_Interval & Other);

		/****************** IsJustEnclosingAtStart ******************/
		/**** md5 signature: 7406c71c8b68a10c0a74cd3df1d49015 ****/
		%feature("compactdefaultargs") IsJustEnclosingAtStart;
		%feature("autodoc", "True if me is just enclosing other at start ***---------------------------**** me ***------------------** other.

Parameters
----------
Other: Intrv_Interval

Returns
-------
bool
") IsJustEnclosingAtStart;
		Standard_Boolean IsJustEnclosingAtStart(const Intrv_Interval & Other);

		/****************** IsJustOverlappingAtEnd ******************/
		/**** md5 signature: 6edf743e69c8c25097a558b2042e9878 ****/
		%feature("compactdefaultargs") IsJustOverlappingAtEnd;
		%feature("autodoc", "True if me is just overlapping other at end ***-----------*  me ***------------------------** other.

Parameters
----------
Other: Intrv_Interval

Returns
-------
bool
") IsJustOverlappingAtEnd;
		Standard_Boolean IsJustOverlappingAtEnd(const Intrv_Interval & Other);

		/****************** IsJustOverlappingAtStart ******************/
		/**** md5 signature: 53976ced8ef2bbdc1ff57ca774a2f1b3 ****/
		%feature("compactdefaultargs") IsJustOverlappingAtStart;
		%feature("autodoc", "True if me is just overlapping other at start ***-----------***  me ***------------------------** other.

Parameters
----------
Other: Intrv_Interval

Returns
-------
bool
") IsJustOverlappingAtStart;
		Standard_Boolean IsJustOverlappingAtStart(const Intrv_Interval & Other);

		/****************** IsOverlappingAtEnd ******************/
		/**** md5 signature: 148aedd16da51bf75cbfa6e0b6d360ab ****/
		%feature("compactdefaultargs") IsOverlappingAtEnd;
		%feature("autodoc", "True if me is overlapping other at end ***-----------** me ***---------------***  other.

Parameters
----------
Other: Intrv_Interval

Returns
-------
bool
") IsOverlappingAtEnd;
		Standard_Boolean IsOverlappingAtEnd(const Intrv_Interval & Other);

		/****************** IsOverlappingAtStart ******************/
		/**** md5 signature: 91dc4cddd79f7690ee2f35ceac6d4e9c ****/
		%feature("compactdefaultargs") IsOverlappingAtStart;
		%feature("autodoc", "True if me is overlapping other at start ***---------------***  me ***-----------** other.

Parameters
----------
Other: Intrv_Interval

Returns
-------
bool
") IsOverlappingAtStart;
		Standard_Boolean IsOverlappingAtStart(const Intrv_Interval & Other);

		/****************** IsProbablyEmpty ******************/
		/**** md5 signature: f37bd5da2664f5887417aeba55f7d543 ****/
		%feature("compactdefaultargs") IsProbablyEmpty;
		%feature("autodoc", "True if mystart+mytolstart > myend-mytolend or if myend+mytolend > mystart-mytolstart.

Returns
-------
bool
") IsProbablyEmpty;
		Standard_Boolean IsProbablyEmpty();

		/****************** IsSimilar ******************/
		/**** md5 signature: cf48d62ba6acc5986b1162c14628137b ****/
		%feature("compactdefaultargs") IsSimilar;
		%feature("autodoc", "True if me and other have the same bounds *----------------***  me ***-----------------**  other.

Parameters
----------
Other: Intrv_Interval

Returns
-------
bool
") IsSimilar;
		Standard_Boolean IsSimilar(const Intrv_Interval & Other);

		/****************** Position ******************/
		/**** md5 signature: 23b3dced13e904e86be9a11b268d2a4d ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "True if me is before other **-----------**** other ***-----*   before ***------------*  justbefore ***-----------------*  overlappingatstart ***--------------------------*  justenclosingatend ***-------------------------------------* enclosing ***----*  justoverlappingatstart ***-------------*  similar ***------------------------* justenclosingatstart ***-*  inside ***------*  justoverlappingatend ***-----------------* overlappingatend ***--------* justafter ***---* after.

Parameters
----------
Other: Intrv_Interval

Returns
-------
Intrv_Position
") Position;
		Intrv_Position Position(const Intrv_Interval & Other);

		/****************** SetEnd ******************/
		/**** md5 signature: a369402cbf509247465aad466c905c23 ****/
		%feature("compactdefaultargs") SetEnd;
		%feature("autodoc", "No available documentation.

Parameters
----------
End: float
TolEnd: Standard_ShortReal

Returns
-------
None
") SetEnd;
		void SetEnd(const Standard_Real End, const Standard_ShortReal TolEnd);

		/****************** SetStart ******************/
		/**** md5 signature: f854b17e8c6e6fc2e07c0e4ce9d3c29a ****/
		%feature("compactdefaultargs") SetStart;
		%feature("autodoc", "No available documentation.

Parameters
----------
Start: float
TolStart: Standard_ShortReal

Returns
-------
None
") SetStart;
		void SetStart(const Standard_Real Start, const Standard_ShortReal TolStart);

		/****************** Start ******************/
		/**** md5 signature: 3435834d1b536f94af7747405588cfdd ****/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Start;
		Standard_Real Start();

		/****************** TolEnd ******************/
		/**** md5 signature: 0ba4e5e42f27ac97ac757f85ad4c5fb2 ****/
		%feature("compactdefaultargs") TolEnd;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_ShortReal
") TolEnd;
		Standard_ShortReal TolEnd();

		/****************** TolStart ******************/
		/**** md5 signature: 83b2da6f9993863c462fec9a2c7d8591 ****/
		%feature("compactdefaultargs") TolStart;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_ShortReal
") TolStart;
		Standard_ShortReal TolStart();

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
		/****************** Intrv_Intervals ******************/
		/**** md5 signature: be6232adefab507170d08ff623c85cfd ****/
		%feature("compactdefaultargs") Intrv_Intervals;
		%feature("autodoc", "Creates a void sequence of intervals.

Returns
-------
None
") Intrv_Intervals;
		 Intrv_Intervals();

		/****************** Intrv_Intervals ******************/
		/**** md5 signature: c12cf3acf1772c29dd9b7848f7f4fd49 ****/
		%feature("compactdefaultargs") Intrv_Intervals;
		%feature("autodoc", "Creates a sequence of one interval.

Parameters
----------
Int: Intrv_Interval

Returns
-------
None
") Intrv_Intervals;
		 Intrv_Intervals(const Intrv_Interval & Int);

		/****************** Intrv_Intervals ******************/
		/**** md5 signature: 4d384c9d768b34a6520cc907b05c5001 ****/
		%feature("compactdefaultargs") Intrv_Intervals;
		%feature("autodoc", "Creates by copying an existing sequence of intervals.

Parameters
----------
Int: Intrv_Intervals

Returns
-------
None
") Intrv_Intervals;
		 Intrv_Intervals(const Intrv_Intervals & Int);

		/****************** Intersect ******************/
		/**** md5 signature: e12a005317201bc1bd17d62e86f0673e ****/
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "Intersects the intervals with the interval <tool>.

Parameters
----------
Tool: Intrv_Interval

Returns
-------
None
") Intersect;
		void Intersect(const Intrv_Interval & Tool);

		/****************** Intersect ******************/
		/**** md5 signature: 691a0590e25f134c38c8690782055db9 ****/
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "Intersects the intervals with the intervals in the sequence <tool>.

Parameters
----------
Tool: Intrv_Intervals

Returns
-------
None
") Intersect;
		void Intersect(const Intrv_Intervals & Tool);

		/****************** NbIntervals ******************/
		/**** md5 signature: 64f54fde4d9752772b52d73d27261bcb ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals();

		/****************** Subtract ******************/
		/**** md5 signature: 84d450900772c0ab496765aa3b97e5e0 ****/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tool: Intrv_Interval

Returns
-------
None
") Subtract;
		void Subtract(const Intrv_Interval & Tool);

		/****************** Subtract ******************/
		/**** md5 signature: 2fed38f550387f5eaeecc8b41a3d89dd ****/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tool: Intrv_Intervals

Returns
-------
None
") Subtract;
		void Subtract(const Intrv_Intervals & Tool);

		/****************** Unite ******************/
		/**** md5 signature: 0d5f961c161ee90870ec4968fb8da826 ****/
		%feature("compactdefaultargs") Unite;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tool: Intrv_Interval

Returns
-------
None
") Unite;
		void Unite(const Intrv_Interval & Tool);

		/****************** Unite ******************/
		/**** md5 signature: e14122155e21a0b69837acc9ae886d66 ****/
		%feature("compactdefaultargs") Unite;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tool: Intrv_Intervals

Returns
-------
None
") Unite;
		void Unite(const Intrv_Intervals & Tool);

		/****************** Value ******************/
		/**** md5 signature: f71fcd7e5d1f4f7275e8da12794f644f ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
Intrv_Interval
") Value;
		const Intrv_Interval & Value(const Standard_Integer Index);

		/****************** XUnite ******************/
		/**** md5 signature: 1b9a7792b19b82175cf1ec256710edea ****/
		%feature("compactdefaultargs") XUnite;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tool: Intrv_Interval

Returns
-------
None
") XUnite;
		void XUnite(const Intrv_Interval & Tool);

		/****************** XUnite ******************/
		/**** md5 signature: 0ec9c3d932976dd5752f27da217001f3 ****/
		%feature("compactdefaultargs") XUnite;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tool: Intrv_Intervals

Returns
-------
None
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
