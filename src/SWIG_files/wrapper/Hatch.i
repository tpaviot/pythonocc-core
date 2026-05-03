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
%define HATCHDOCSTRING
"Hatch module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_hatch.html"
%enddef
%module (package="OCC.Core", docstring=HATCHDOCSTRING) Hatch


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
#include<Hatch_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Hatch_LineForm {
	Hatch_XLINE = 0,
	Hatch_YLINE = 1,
	Hatch_ANYLINE = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Hatch_LineForm(IntEnum):
	Hatch_XLINE = 0
	Hatch_YLINE = 1
	Hatch_ANYLINE = 2
Hatch_XLINE = Hatch_LineForm.Hatch_XLINE
Hatch_YLINE = Hatch_LineForm.Hatch_YLINE
Hatch_ANYLINE = Hatch_LineForm.Hatch_ANYLINE
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(Hatch_SequenceOfLine) NCollection_Sequence<Hatch_Line>;

%extend NCollection_Sequence<Hatch_Line> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(Hatch_SequenceOfParameter) NCollection_Sequence<Hatch_Parameter>;

%extend NCollection_Sequence<Hatch_Parameter> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<Hatch_Line> Hatch_SequenceOfLine;
typedef NCollection_Sequence<Hatch_Parameter> Hatch_SequenceOfParameter;
/* end typedefs declaration */

/**********************
* class Hatch_Hatcher *
**********************/
class Hatch_Hatcher {
	public:
		/****** Hatch_Hatcher::Hatch_Hatcher ******/
		/****** md5 signature: c62941f2baf8fc62536731dab059f1e4 ******/
		%feature("compactdefaultargs") Hatch_Hatcher;
		%feature("autodoc", "
Parameters
----------
Tol: double
Oriented: bool (optional, default to true)

Return
-------
None

Description
-----------
Returns an empty hatcher. <Tol> is the tolerance for intersections.
") Hatch_Hatcher;
		 Hatch_Hatcher(const double Tol, const bool Oriented = true);

		/****** Hatch_Hatcher::AddLine ******/
		/****** md5 signature: 720175f49380e09aee880a8101acb044 ******/
		%feature("compactdefaultargs") AddLine;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
T: Hatch_LineForm (optional, default to Hatch_ANYLINE)

Return
-------
None

Description
-----------
Add a line <L> to be trimmed. <T> the type is only kept from information. It is not used in the computation.
") AddLine;
		void AddLine(const gp_Lin2d & L, const Hatch_LineForm T = Hatch_ANYLINE);

		/****** Hatch_Hatcher::AddLine ******/
		/****** md5 signature: 995a96177012b7b33dc74acdf45c5cae ******/
		%feature("compactdefaultargs") AddLine;
		%feature("autodoc", "
Parameters
----------
D: gp_Dir2d
Dist: double

Return
-------
None

Description
-----------
Add an infinite line on direction <D> at distance <Dist> from the origin to be trimmed. <Dist> may be negative. //! If O is the origin of the 2D plane, and V the vector perpendicular to D (in the direct direction). //! A point P is on the line if: OP dot V = Dist The parameter of P on the line is OP dot D.
") AddLine;
		void AddLine(const gp_Dir2d & D, const double Dist);

		/****** Hatch_Hatcher::AddXLine ******/
		/****** md5 signature: 693f8c0d24bbc6bea0ce44797def1ff3 ******/
		%feature("compactdefaultargs") AddXLine;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
None

Description
-----------
Add an infinite line parallel to the Y-axis at abciss <X>.
") AddXLine;
		void AddXLine(const double X);

		/****** Hatch_Hatcher::AddYLine ******/
		/****** md5 signature: c14077ec87809f5f2a1eae39cb399197 ******/
		%feature("compactdefaultargs") AddYLine;
		%feature("autodoc", "
Parameters
----------
Y: double

Return
-------
None

Description
-----------
Add an infinite line parallel to the X-axis at ordinate <Y>.
") AddYLine;
		void AddYLine(const double Y);

		/****** Hatch_Hatcher::Coordinate ******/
		/****** md5 signature: dc910dd0ae5ccce5d4a205ecda8952d2 ******/
		%feature("compactdefaultargs") Coordinate;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
double

Description
-----------
Returns the X or Y coordinate of the line of index <I> if it is a X or a Y line.
") Coordinate;
		double Coordinate(const int I);

		/****** Hatch_Hatcher::End ******/
		/****** md5 signature: c4db48619201057014a501887b017c9a ******/
		%feature("compactdefaultargs") End;
		%feature("autodoc", "
Parameters
----------
I: int
J: int

Return
-------
double

Description
-----------
Returns the last parameter of interval <J> on line <I>.
") End;
		double End(const int I, const int J);

		/****** Hatch_Hatcher::EndIndex ******/
		/****** md5 signature: 236e6f3ab11657d8da99f774b5980868 ******/
		%feature("compactdefaultargs") EndIndex;
		%feature("autodoc", "
Parameters
----------
I: int
J: int

Return
-------
Index: int
Par2: double

Description
-----------
Returns the last Index and Par2 of interval <J> on line <I>.
") EndIndex;
		void EndIndex(const int I, const int J, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** Hatch_Hatcher::IsXLine ******/
		/****** md5 signature: e55d095aed2695e1da22f251f678eb5e ******/
		%feature("compactdefaultargs") IsXLine;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
Returns True if the line of index <I> has a constant X value.
") IsXLine;
		bool IsXLine(const int I);

		/****** Hatch_Hatcher::IsYLine ******/
		/****** md5 signature: bcd28c56261b06f568057bb36fb048f3 ******/
		%feature("compactdefaultargs") IsYLine;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
Returns True if the line of index <I> has a constant Y value.
") IsYLine;
		bool IsYLine(const int I);

		/****** Hatch_Hatcher::Line ******/
		/****** md5 signature: 41c8d2949e2bacd4b7228d970cbd74c6 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
gp_Lin2d

Description
-----------
Returns the line of index <I>.
") Line;
		const gp_Lin2d Line(const int I);

		/****** Hatch_Hatcher::LineForm ******/
		/****** md5 signature: 31ba28aaae89bc4dff5ddd26008f9e47 ******/
		%feature("compactdefaultargs") LineForm;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
Hatch_LineForm

Description
-----------
Returns the type of the line of index <I>.
") LineForm;
		Hatch_LineForm LineForm(const int I);

		/****** Hatch_Hatcher::NbIntervals ******/
		/****** md5 signature: 487b014b9cd194c58d109502ca451d5e ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the total number of intervals on all the lines.
") NbIntervals;
		int NbIntervals();

		/****** Hatch_Hatcher::NbIntervals ******/
		/****** md5 signature: c893359e61ea676d25a373e08d58ea99 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
int

Description
-----------
Returns the number of intervals on line of index <I>.
") NbIntervals;
		int NbIntervals(const int I);

		/****** Hatch_Hatcher::NbLines ******/
		/****** md5 signature: 7c1b53177daa19e8eec95fb1ac3b65c8 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of lines.
") NbLines;
		int NbLines();

		/****** Hatch_Hatcher::Start ******/
		/****** md5 signature: 3df8661e0f1ec00502ea54225e69b30c ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "
Parameters
----------
I: int
J: int

Return
-------
double

Description
-----------
Returns the first parameter of interval <J> on line <I>.
") Start;
		double Start(const int I, const int J);

		/****** Hatch_Hatcher::StartIndex ******/
		/****** md5 signature: fe1ba8519c2b6bfb15b846067d96eb61 ******/
		%feature("compactdefaultargs") StartIndex;
		%feature("autodoc", "
Parameters
----------
I: int
J: int

Return
-------
Index: int
Par2: double

Description
-----------
Returns the first Index and Par2 of interval <J> on line <I>.
") StartIndex;
		void StartIndex(const int I, const int J, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** Hatch_Hatcher::Tolerance ******/
		/****** md5 signature: c1c7212071b7d95bf782fac6a420fcbb ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Tolerance;
		void Tolerance(const double Tol);

		/****** Hatch_Hatcher::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Tolerance;
		double Tolerance();

		/****** Hatch_Hatcher::Trim ******/
		/****** md5 signature: 56d1c1fa463f15848c256f3c6ba452ac ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
Index: int (optional, default to 0)

Return
-------
None

Description
-----------
Trims the lines at intersections with <L>.
") Trim;
		void Trim(const gp_Lin2d & L, const int Index = 0);

		/****** Hatch_Hatcher::Trim ******/
		/****** md5 signature: c111b483dd4a8eae230daf9a4972f67c ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
Start: double
End: double
Index: int (optional, default to 0)

Return
-------
None

Description
-----------
Trims the lines at intersections with <L> in the parameter range <Start>, <End>.
") Trim;
		void Trim(const gp_Lin2d & L, const double Start, const double End, const int Index = 0);

		/****** Hatch_Hatcher::Trim ******/
		/****** md5 signature: cf03ad35d7bc9ec4046953d88111d3b4 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d
Index: int (optional, default to 0)

Return
-------
None

Description
-----------
Trims the line at intersection with the oriented segment P1,P2.
") Trim;
		void Trim(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const int Index = 0);

};


%extend Hatch_Hatcher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Hatch_Line *
*******************/
class Hatch_Line {
	public:
		/****** Hatch_Line::Hatch_Line ******/
		/****** md5 signature: feaa03088344f8c62f0993bba88798bc ******/
		%feature("compactdefaultargs") Hatch_Line;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Hatch_Line;
		 Hatch_Line();

		/****** Hatch_Line::Hatch_Line ******/
		/****** md5 signature: 12499e1ee40695dd98f4e6192fbc960f ******/
		%feature("compactdefaultargs") Hatch_Line;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
T: Hatch_LineForm

Return
-------
None

Description
-----------
No available documentation.
") Hatch_Line;
		 Hatch_Line(const gp_Lin2d & L, const Hatch_LineForm T);

		/****** Hatch_Line::AddIntersection ******/
		/****** md5 signature: 0e3beb66d47b6bc2250c92e57d561d17 ******/
		%feature("compactdefaultargs") AddIntersection;
		%feature("autodoc", "
Parameters
----------
Par1: double
Start: bool
Index: int
Par2: double
theToler: double

Return
-------
None

Description
-----------
Insert a new intersection in the sorted list.
") AddIntersection;
		void AddIntersection(const double Par1, const bool Start, const int Index, const double Par2, const double theToler);

};


%extend Hatch_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Hatch_Parameter *
************************/
class Hatch_Parameter {
	public:
		/****** Hatch_Parameter::Hatch_Parameter ******/
		/****** md5 signature: 64f98df1cee870ef727b8b99a7de4201 ******/
		%feature("compactdefaultargs") Hatch_Parameter;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Hatch_Parameter;
		 Hatch_Parameter();

		/****** Hatch_Parameter::Hatch_Parameter ******/
		/****** md5 signature: b092041a58769b2945e6f4e60bf83cda ******/
		%feature("compactdefaultargs") Hatch_Parameter;
		%feature("autodoc", "
Parameters
----------
Par1: double
Start: bool
Index: int (optional, default to 0)
Par2: double (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Hatch_Parameter;
		 Hatch_Parameter(const double Par1, const bool Start, const int Index = 0, const double Par2 = 0);

};


%extend Hatch_Parameter {
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
