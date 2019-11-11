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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define HATCHDOCSTRING
"Hatch module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_Hatch.html"
%enddef
%module (package="OCC.Core", docstring=HATCHDOCSTRING) Hatch

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include Hatch_headers.i

/* public enums */
enum Hatch_LineForm {
	Hatch_XLINE = 0,
	Hatch_YLINE = 1,
	Hatch_ANYLINE = 2,
};

/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(Hatch_SequenceOfLine) NCollection_Sequence <Hatch_Line>;
%template(Hatch_SequenceOfParameter) NCollection_Sequence <Hatch_Parameter>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <Hatch_Line> Hatch_SequenceOfLine;
typedef NCollection_Sequence <Hatch_Parameter> Hatch_SequenceOfParameter;
/* end typedefs declaration */

%nodefaultctor Hatch_Hatcher;
class Hatch_Hatcher {
	public:
		%feature("compactdefaultargs") AddLine;
		%feature("autodoc", "	* Add a line <L> to be trimmed. <T> the type is only kept from information. It is not used in the computation.

	:param L:
	:type L: gp_Lin2d
	:param T: default value is Hatch_ANYLINE
	:type T: Hatch_LineForm
	:rtype: None
") AddLine;
		void AddLine (const gp_Lin2d & L,const Hatch_LineForm T = Hatch_ANYLINE);
		%feature("compactdefaultargs") AddLine;
		%feature("autodoc", "	* Add an infinite line on direction <D> at distance <Dist> from the origin to be trimmed. <Dist> may be negative. //! If O is the origin of the 2D plane, and V the vector perpendicular to D (in the direct direction). //! A point P is on the line if : OP dot V = Dist The parameter of P on the line is OP dot D

	:param D:
	:type D: gp_Dir2d
	:param Dist:
	:type Dist: float
	:rtype: None
") AddLine;
		void AddLine (const gp_Dir2d & D,const Standard_Real Dist);
		%feature("compactdefaultargs") AddXLine;
		%feature("autodoc", "	* Add an infinite line parallel to the Y-axis at abciss <X>.

	:param X:
	:type X: float
	:rtype: None
") AddXLine;
		void AddXLine (const Standard_Real X);
		%feature("compactdefaultargs") AddYLine;
		%feature("autodoc", "	* Add an infinite line parallel to the X-axis at ordinate <Y>.

	:param Y:
	:type Y: float
	:rtype: None
") AddYLine;
		void AddYLine (const Standard_Real Y);
		%feature("compactdefaultargs") Coordinate;
		%feature("autodoc", "	* Returns the X or Y coordinate of the line of index <I> if it is a X or a Y line.

	:param I:
	:type I: int
	:rtype: float
") Coordinate;
		Standard_Real Coordinate (const Standard_Integer I);
		%feature("compactdefaultargs") End;
		%feature("autodoc", "	* Returns the last parameter of interval <J> on line <I>.

	:param I:
	:type I: int
	:param J:
	:type J: int
	:rtype: float
") End;
		Standard_Real End (const Standard_Integer I,const Standard_Integer J);
		%feature("compactdefaultargs") EndIndex;
		%feature("autodoc", "	* Returns the last Index and Par2 of interval <J> on line <I>.

	:param I:
	:type I: int
	:param J:
	:type J: int
	:param Index:
	:type Index: int &
	:param Par2:
	:type Par2: float &
	:rtype: None
") EndIndex;
		void EndIndex (const Standard_Integer I,const Standard_Integer J,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Hatch_Hatcher;
		%feature("autodoc", "	* Returns a empty hatcher. <Tol> is the tolerance for intersections.

	:param Tol:
	:type Tol: float
	:param Oriented: default value is Standard_True
	:type Oriented: bool
	:rtype: None
") Hatch_Hatcher;
		 Hatch_Hatcher (const Standard_Real Tol,const Standard_Boolean Oriented = Standard_True);
		%feature("compactdefaultargs") IsXLine;
		%feature("autodoc", "	* Returns True if the line of index <I> has a constant X value.

	:param I:
	:type I: int
	:rtype: bool
") IsXLine;
		Standard_Boolean IsXLine (const Standard_Integer I);
		%feature("compactdefaultargs") IsYLine;
		%feature("autodoc", "	* Returns True if the line of index <I> has a constant Y value.

	:param I:
	:type I: int
	:rtype: bool
") IsYLine;
		Standard_Boolean IsYLine (const Standard_Integer I);
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns the line of index <I>.

	:param I:
	:type I: int
	:rtype: gp_Lin2d
") Line;
		const gp_Lin2d  Line (const Standard_Integer I);
		%feature("compactdefaultargs") LineForm;
		%feature("autodoc", "	* Returns the type of the line of index <I>.

	:param I:
	:type I: int
	:rtype: Hatch_LineForm
") LineForm;
		Hatch_LineForm LineForm (const Standard_Integer I);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the total number of intervals on all the lines.

	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals on line of index <I>.

	:param I:
	:type I: int
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const Standard_Integer I);
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "	* Returns the number of lines.

	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "	* Returns the first parameter of interval <J> on line <I>.

	:param I:
	:type I: int
	:param J:
	:type J: int
	:rtype: float
") Start;
		Standard_Real Start (const Standard_Integer I,const Standard_Integer J);
		%feature("compactdefaultargs") StartIndex;
		%feature("autodoc", "	* Returns the first Index and Par2 of interval <J> on line <I>.

	:param I:
	:type I: int
	:param J:
	:type J: int
	:param Index:
	:type Index: int &
	:param Par2:
	:type Par2: float &
	:rtype: None
") StartIndex;
		void StartIndex (const Standard_Integer I,const Standard_Integer J,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") Tolerance;
		void Tolerance (const Standard_Real Tol);
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	* Trims the lines at intersections with <L>.

	:param L:
	:type L: gp_Lin2d
	:param Index: default value is 0
	:type Index: int
	:rtype: None
") Trim;
		void Trim (const gp_Lin2d & L,const Standard_Integer Index = 0);
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	* Trims the lines at intersections with <L> in the parameter range <Start>, <End>

	:param L:
	:type L: gp_Lin2d
	:param Start:
	:type Start: float
	:param End:
	:type End: float
	:param Index: default value is 0
	:type Index: int
	:rtype: None
") Trim;
		void Trim (const gp_Lin2d & L,const Standard_Real Start,const Standard_Real End,const Standard_Integer Index = 0);
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "	* Trims the line at intersection with the oriented segment P1,P2.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:param Index: default value is 0
	:type Index: int
	:rtype: None
") Trim;
		void Trim (const gp_Pnt2d & P1,const gp_Pnt2d & P2,const Standard_Integer Index = 0);
};


%extend Hatch_Hatcher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Hatch_Line;
class Hatch_Line {
	public:
		%feature("compactdefaultargs") AddIntersection;
		%feature("autodoc", "	* Insert a new intersection in the sorted list.

	:param Par1:
	:type Par1: float
	:param Start:
	:type Start: bool
	:param Index:
	:type Index: int
	:param Par2:
	:type Par2: float
	:param theToler:
	:type theToler: float
	:rtype: None
") AddIntersection;
		void AddIntersection (const Standard_Real Par1,const Standard_Boolean Start,const Standard_Integer Index,const Standard_Real Par2,const Standard_Real theToler);
		%feature("compactdefaultargs") Hatch_Line;
		%feature("autodoc", "	:rtype: None
") Hatch_Line;
		 Hatch_Line ();
		%feature("compactdefaultargs") Hatch_Line;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:param T:
	:type T: Hatch_LineForm
	:rtype: None
") Hatch_Line;
		 Hatch_Line (const gp_Lin2d & L,const Hatch_LineForm T);
};


%extend Hatch_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Hatch_Parameter;
class Hatch_Parameter {
	public:
		%feature("compactdefaultargs") Hatch_Parameter;
		%feature("autodoc", "	:rtype: None
") Hatch_Parameter;
		 Hatch_Parameter ();
		%feature("compactdefaultargs") Hatch_Parameter;
		%feature("autodoc", "	:param Par1:
	:type Par1: float
	:param Start:
	:type Start: bool
	:param Index: default value is 0
	:type Index: int
	:param Par2: default value is 0
	:type Par2: float
	:rtype: None
") Hatch_Parameter;
		 Hatch_Parameter (const Standard_Real Par1,const Standard_Boolean Start,const Standard_Integer Index = 0,const Standard_Real Par2 = 0);
};


%extend Hatch_Parameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
