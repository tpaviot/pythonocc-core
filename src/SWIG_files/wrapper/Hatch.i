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
		/****************** Hatch_Hatcher ******************/
		/**** md5 signature: d395499112cd28c88e4eddb5713555a6 ****/
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
		/**** md5 signature: 720175f49380e09aee880a8101acb044 ****/
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
		/**** md5 signature: f40d2833cfc430da0e88e10f4bafef3f ****/
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
		/**** md5 signature: 52a11d1ceeb71074c42a74015839394d ****/
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
		/**** md5 signature: 36dd30ef9783a0306c8273e14d041c6a ****/
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
		/**** md5 signature: a4ed3e8a9b3842494d91918e867e381a ****/
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
		/**** md5 signature: 1ae7240e5faefda9500881fbcd2d7ec1 ****/
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
		/**** md5 signature: b03fb22715da6d8d61da7498659d47c8 ****/
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
		/**** md5 signature: b95d7cb31aff0361916e25ff3e597fd1 ****/
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
		/**** md5 signature: 00bbe7b90307533a3d38791515766482 ****/
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
		/**** md5 signature: 83cf55d529a6032edfa2e7d2dd7644ea ****/
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
		/**** md5 signature: 7aa197af0eec341ff33ce63228e0cac4 ****/
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
		/**** md5 signature: 64f54fde4d9752772b52d73d27261bcb ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the total number of intervals on all the lines.

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals();

		/****************** NbIntervals ******************/
		/**** md5 signature: 2945c8ac61bfd6b7594dfa01cee5db59 ****/
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
		/**** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ****/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the number of lines.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** Start ******************/
		/**** md5 signature: a9df30c4eb851eb81f6bb337e176c9c2 ****/
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
		/**** md5 signature: 5ef6400ae991fd8aa0e85f07f54ea1f3 ****/
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
		/**** md5 signature: e925b87131cc380a2e6cb497cb7384fa ****/
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
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Trim ******************/
		/**** md5 signature: 9acaec07120f7a151b61492b1600653e ****/
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
		/**** md5 signature: 508564c16d3953ace4590eddbaef08e0 ****/
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
		/**** md5 signature: a67cb5966d23f51bc126fde37cd80cb3 ****/
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
		/**** md5 signature: feaa03088344f8c62f0993bba88798bc ****/
		%feature("compactdefaultargs") Hatch_Line;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Hatch_Line;
		 Hatch_Line();

		/****************** Hatch_Line ******************/
		/**** md5 signature: 12499e1ee40695dd98f4e6192fbc960f ****/
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
		/**** md5 signature: d65db84de12b8735127f3d06058e363d ****/
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
		/**** md5 signature: 64f98df1cee870ef727b8b99a7de4201 ****/
		%feature("compactdefaultargs") Hatch_Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Hatch_Parameter;
		 Hatch_Parameter();

		/****************** Hatch_Parameter ******************/
		/**** md5 signature: 15f3c9cdad607e8b534236ee9aaf1f70 ****/
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
