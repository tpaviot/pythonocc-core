/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_hatch.html"
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
		/****** md5 signature: d395499112cd28c88e4eddb5713555a6 ******/
		%feature("compactdefaultargs") Hatch_Hatcher;
		%feature("autodoc", "
Parameters
----------
Tol: float
Oriented: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Returns a empty hatcher. <Tol> is the tolerance for intersections.
") Hatch_Hatcher;
		 Hatch_Hatcher(const Standard_Real Tol, const Standard_Boolean Oriented = Standard_True);

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
		/****** md5 signature: f40d2833cfc430da0e88e10f4bafef3f ******/
		%feature("compactdefaultargs") AddLine;
		%feature("autodoc", "
Parameters
----------
D: gp_Dir2d
Dist: float

Return
-------
None

Description
-----------
Add an infinite line on direction <D> at distance <Dist> from the origin to be trimmed. <Dist> may be negative. //! If O is the origin of the 2D plane, and V the vector perpendicular to D (in the direct direction). //! A point P is on the line if: OP dot V = Dist The parameter of P on the line is OP dot D.
") AddLine;
		void AddLine(const gp_Dir2d & D, const Standard_Real Dist);

		/****** Hatch_Hatcher::AddXLine ******/
		/****** md5 signature: 52a11d1ceeb71074c42a74015839394d ******/
		%feature("compactdefaultargs") AddXLine;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
None

Description
-----------
Add an infinite line parallel to the Y-axis at abciss <X>.
") AddXLine;
		void AddXLine(const Standard_Real X);

		/****** Hatch_Hatcher::AddYLine ******/
		/****** md5 signature: 36dd30ef9783a0306c8273e14d041c6a ******/
		%feature("compactdefaultargs") AddYLine;
		%feature("autodoc", "
Parameters
----------
Y: float

Return
-------
None

Description
-----------
Add an infinite line parallel to the X-axis at ordinate <Y>.
") AddYLine;
		void AddYLine(const Standard_Real Y);

		/****** Hatch_Hatcher::Coordinate ******/
		/****** md5 signature: a4ed3e8a9b3842494d91918e867e381a ******/
		%feature("compactdefaultargs") Coordinate;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
float

Description
-----------
Returns the X or Y coordinate of the line of index <I> if it is a X or a Y line.
") Coordinate;
		Standard_Real Coordinate(const Standard_Integer I);

		/****** Hatch_Hatcher::End ******/
		/****** md5 signature: 1ae7240e5faefda9500881fbcd2d7ec1 ******/
		%feature("compactdefaultargs") End;
		%feature("autodoc", "
Parameters
----------
I: int
J: int

Return
-------
float

Description
-----------
Returns the last parameter of interval <J> on line <I>.
") End;
		Standard_Real End(const Standard_Integer I, const Standard_Integer J);

		/****** Hatch_Hatcher::EndIndex ******/
		/****** md5 signature: b03fb22715da6d8d61da7498659d47c8 ******/
		%feature("compactdefaultargs") EndIndex;
		%feature("autodoc", "
Parameters
----------
I: int
J: int

Return
-------
Index: int
Par2: float

Description
-----------
Returns the last Index and Par2 of interval <J> on line <I>.
") EndIndex;
		void EndIndex(const Standard_Integer I, const Standard_Integer J, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** Hatch_Hatcher::IsXLine ******/
		/****** md5 signature: b95d7cb31aff0361916e25ff3e597fd1 ******/
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
		Standard_Boolean IsXLine(const Standard_Integer I);

		/****** Hatch_Hatcher::IsYLine ******/
		/****** md5 signature: 00bbe7b90307533a3d38791515766482 ******/
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
		Standard_Boolean IsYLine(const Standard_Integer I);

		/****** Hatch_Hatcher::Line ******/
		/****** md5 signature: 83cf55d529a6032edfa2e7d2dd7644ea ******/
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
		const gp_Lin2d Line(const Standard_Integer I);

		/****** Hatch_Hatcher::LineForm ******/
		/****** md5 signature: 7aa197af0eec341ff33ce63228e0cac4 ******/
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
		Hatch_LineForm LineForm(const Standard_Integer I);

		/****** Hatch_Hatcher::NbIntervals ******/
		/****** md5 signature: 64f54fde4d9752772b52d73d27261bcb ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the total number of intervals on all the lines.
") NbIntervals;
		Standard_Integer NbIntervals();

		/****** Hatch_Hatcher::NbIntervals ******/
		/****** md5 signature: 2945c8ac61bfd6b7594dfa01cee5db59 ******/
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
		Standard_Integer NbIntervals(const Standard_Integer I);

		/****** Hatch_Hatcher::NbLines ******/
		/****** md5 signature: 4f8001fdc02f82f8f981f090a37ac7d4 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of lines.
") NbLines;
		Standard_Integer NbLines();

		/****** Hatch_Hatcher::Start ******/
		/****** md5 signature: a9df30c4eb851eb81f6bb337e176c9c2 ******/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "
Parameters
----------
I: int
J: int

Return
-------
float

Description
-----------
Returns the first parameter of interval <J> on line <I>.
") Start;
		Standard_Real Start(const Standard_Integer I, const Standard_Integer J);

		/****** Hatch_Hatcher::StartIndex ******/
		/****** md5 signature: 5ef6400ae991fd8aa0e85f07f54ea1f3 ******/
		%feature("compactdefaultargs") StartIndex;
		%feature("autodoc", "
Parameters
----------
I: int
J: int

Return
-------
Index: int
Par2: float

Description
-----------
Returns the first Index and Par2 of interval <J> on line <I>.
") StartIndex;
		void StartIndex(const Standard_Integer I, const Standard_Integer J, Standard_Integer &OutValue, Standard_Real &OutValue);

		/****** Hatch_Hatcher::Tolerance ******/
		/****** md5 signature: e925b87131cc380a2e6cb497cb7384fa ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Tolerance;
		void Tolerance(const Standard_Real Tol);

		/****** Hatch_Hatcher::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		Standard_Real Tolerance();

		/****** Hatch_Hatcher::Trim ******/
		/****** md5 signature: 9acaec07120f7a151b61492b1600653e ******/
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
		void Trim(const gp_Lin2d & L, const Standard_Integer Index = 0);

		/****** Hatch_Hatcher::Trim ******/
		/****** md5 signature: 508564c16d3953ace4590eddbaef08e0 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
Start: float
End: float
Index: int (optional, default to 0)

Return
-------
None

Description
-----------
Trims the lines at intersections with <L> in the parameter range <Start>, <End>.
") Trim;
		void Trim(const gp_Lin2d & L, const Standard_Real Start, const Standard_Real End, const Standard_Integer Index = 0);

		/****** Hatch_Hatcher::Trim ******/
		/****** md5 signature: a67cb5966d23f51bc126fde37cd80cb3 ******/
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
		/****** md5 signature: d65db84de12b8735127f3d06058e363d ******/
		%feature("compactdefaultargs") AddIntersection;
		%feature("autodoc", "
Parameters
----------
Par1: float
Start: bool
Index: int
Par2: float
theToler: float

Return
-------
None

Description
-----------
Insert a new intersection in the sorted list.
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
		/****** md5 signature: 15f3c9cdad607e8b534236ee9aaf1f70 ******/
		%feature("compactdefaultargs") Hatch_Parameter;
		%feature("autodoc", "
Parameters
----------
Par1: float
Start: bool
Index: int (optional, default to 0)
Par2: float (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
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
/* class aliases */
%pythoncode {
}
