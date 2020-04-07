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
%define HATCHDOCSTRING
"Hatch module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_hatch.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
%template(Hatch_SequenceOfParameter) NCollection_Sequence<Hatch_Parameter>;
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
		/****************** Hatch_Hatcher ******************/
		%feature("compactdefaultargs") Hatch_Hatcher;
		%feature("autodoc", "Returns a empty hatcher. <tol> is the tolerance for intersections.

Parameters
----------
Tol: float
Oriented: bool,optional
	default value is Standard_True

Returns
-------
None
") Hatch_Hatcher;
		 Hatch_Hatcher(const Standard_Real Tol, const Standard_Boolean Oriented = Standard_True);

		/****************** AddLine ******************/
		%feature("compactdefaultargs") AddLine;
		%feature("autodoc", "Add a line <l> to be trimmed. <t> the type is only kept from information. it is not used in the computation.

Parameters
----------
L: gp_Lin2d
T: Hatch_LineForm,optional
	default value is Hatch_ANYLINE

Returns
-------
None
") AddLine;
		void AddLine(const gp_Lin2d & L, const Hatch_LineForm T = Hatch_ANYLINE);

		/****************** AddLine ******************/
		%feature("compactdefaultargs") AddLine;
		%feature("autodoc", "Add an infinite line on direction <d> at distance <dist> from the origin to be trimmed. <dist> may be negative. //! if o is the origin of the 2d plane, and v the vector perpendicular to d (in the direct direction). //! a point p is on the line if : op dot v = dist the parameter of p on the line is op dot d.

Parameters
----------
D: gp_Dir2d
Dist: float

Returns
-------
None
") AddLine;
		void AddLine(const gp_Dir2d & D, const Standard_Real Dist);

		/****************** AddXLine ******************/
		%feature("compactdefaultargs") AddXLine;
		%feature("autodoc", "Add an infinite line parallel to the y-axis at abciss <x>.

Parameters
----------
X: float

Returns
-------
None
") AddXLine;
		void AddXLine(const Standard_Real X);

		/****************** AddYLine ******************/
		%feature("compactdefaultargs") AddYLine;
		%feature("autodoc", "Add an infinite line parallel to the x-axis at ordinate <y>.

Parameters
----------
Y: float

Returns
-------
None
") AddYLine;
		void AddYLine(const Standard_Real Y);

		/****************** Coordinate ******************/
		%feature("compactdefaultargs") Coordinate;
		%feature("autodoc", "Returns the x or y coordinate of the line of index <i> if it is a x or a y line.

Parameters
----------
I: int

Returns
-------
float
") Coordinate;
		Standard_Real Coordinate(const Standard_Integer I);

		/****************** End ******************/
		%feature("compactdefaultargs") End;
		%feature("autodoc", "Returns the last parameter of interval <j> on line <i>.

Parameters
----------
I: int
J: int

Returns
-------
float
") End;
		Standard_Real End(const Standard_Integer I, const Standard_Integer J);

		/****************** EndIndex ******************/
		%feature("compactdefaultargs") EndIndex;
		%feature("autodoc", "Returns the last index and par2 of interval <j> on line <i>.

Parameters
----------
I: int
J: int

Returns
-------
Index: int
Par2: float
") EndIndex;
		void EndIndex(const Standard_Integer I, const Standard_Integer J, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** IsXLine ******************/
		%feature("compactdefaultargs") IsXLine;
		%feature("autodoc", "Returns true if the line of index <i> has a constant x value.

Parameters
----------
I: int

Returns
-------
bool
") IsXLine;
		Standard_Boolean IsXLine(const Standard_Integer I);

		/****************** IsYLine ******************/
		%feature("compactdefaultargs") IsYLine;
		%feature("autodoc", "Returns true if the line of index <i> has a constant y value.

Parameters
----------
I: int

Returns
-------
bool
") IsYLine;
		Standard_Boolean IsYLine(const Standard_Integer I);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns the line of index <i>.

Parameters
----------
I: int

Returns
-------
gp_Lin2d
") Line;
		const gp_Lin2d Line(const Standard_Integer I);

		/****************** LineForm ******************/
		%feature("compactdefaultargs") LineForm;
		%feature("autodoc", "Returns the type of the line of index <i>.

Parameters
----------
I: int

Returns
-------
Hatch_LineForm
") LineForm;
		Hatch_LineForm LineForm(const Standard_Integer I);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the total number of intervals on all the lines.

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals on line of index <i>.

Parameters
----------
I: int

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const Standard_Integer I);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of lines.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Returns the first parameter of interval <j> on line <i>.

Parameters
----------
I: int
J: int

Returns
-------
float
") Start;
		Standard_Real Start(const Standard_Integer I, const Standard_Integer J);

		/****************** StartIndex ******************/
		%feature("compactdefaultargs") StartIndex;
		%feature("autodoc", "Returns the first index and par2 of interval <j> on line <i>.

Parameters
----------
I: int
J: int

Returns
-------
Index: int
Par2: float
") StartIndex;
		void StartIndex(const Standard_Integer I, const Standard_Integer J, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
") Tolerance;
		void Tolerance(const Standard_Real Tol);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Trims the lines at intersections with <l>.

Parameters
----------
L: gp_Lin2d
Index: int,optional
	default value is 0

Returns
-------
None
") Trim;
		void Trim(const gp_Lin2d & L, const Standard_Integer Index = 0);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Trims the lines at intersections with <l> in the parameter range <start>, <end>.

Parameters
----------
L: gp_Lin2d
Start: float
End: float
Index: int,optional
	default value is 0

Returns
-------
None
") Trim;
		void Trim(const gp_Lin2d & L, const Standard_Real Start, const Standard_Real End, const Standard_Integer Index = 0);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Trims the line at intersection with the oriented segment p1,p2.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d
Index: int,optional
	default value is 0

Returns
-------
None
") Trim;
		void Trim(const gp_Pnt2d & P1, const gp_Pnt2d & P2, const Standard_Integer Index = 0);

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
		/****************** Hatch_Line ******************/
		%feature("compactdefaultargs") Hatch_Line;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Hatch_Line;
		 Hatch_Line();

		/****************** Hatch_Line ******************/
		%feature("compactdefaultargs") Hatch_Line;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: gp_Lin2d
T: Hatch_LineForm

Returns
-------
None
") Hatch_Line;
		 Hatch_Line(const gp_Lin2d & L, const Hatch_LineForm T);

		/****************** AddIntersection ******************/
		%feature("compactdefaultargs") AddIntersection;
		%feature("autodoc", "Insert a new intersection in the sorted list.

Parameters
----------
Par1: float
Start: bool
Index: int
Par2: float
theToler: float

Returns
-------
None
") AddIntersection;
		void AddIntersection(const Standard_Real Par1, const Standard_Boolean Start, const Standard_Integer Index, const Standard_Real Par2, const Standard_Real theToler);

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
		/****************** Hatch_Parameter ******************/
		%feature("compactdefaultargs") Hatch_Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Hatch_Parameter;
		 Hatch_Parameter();

		/****************** Hatch_Parameter ******************/
		%feature("compactdefaultargs") Hatch_Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
Par1: float
Start: bool
Index: int,optional
	default value is 0
Par2: float,optional
	default value is 0

Returns
-------
None
") Hatch_Parameter;
		 Hatch_Parameter(const Standard_Real Par1, const Standard_Boolean Start, const Standard_Integer Index = 0, const Standard_Real Par2 = 0);

};


%extend Hatch_Parameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
