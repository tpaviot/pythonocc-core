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
%define GCCENTDOCSTRING
"GccEnt module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_gccent.html"
%enddef
%module (package="OCC.Core", docstring=GCCENTDOCSTRING) GccEnt


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
#include<GccEnt_module.hxx>

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
from OCC.Core.Exception import *
};

/* public enums */
enum GccEnt_Position {
	GccEnt_unqualified = 0,
	GccEnt_enclosing = 1,
	GccEnt_enclosed = 2,
	GccEnt_outside = 3,
	GccEnt_noqualifier = 4,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class GccEnt_Position:
	GccEnt_unqualified = 0
	GccEnt_enclosing = 1
	GccEnt_enclosed = 2
	GccEnt_outside = 3
	GccEnt_noqualifier = 4
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(GccEnt_Array1OfPosition) NCollection_Array1<GccEnt_Position>;

%extend NCollection_Array1<GccEnt_Position> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<GccEnt_Position> GccEnt_Array1OfPosition;
/* end typedefs declaration */

/***************
* class GccEnt *
***************/
%rename(gccent) GccEnt;
class GccEnt {
	public:
		/****************** Enclosed ******************/
		%feature("compactdefaultargs") Enclosed;
		%feature("autodoc", "Constructs a qualified line, so that the solution computed by a construction algorithm using the qualified circle or line is enclosed by the circle or line.

Parameters
----------
Obj: gp_Lin2d

Returns
-------
GccEnt_QualifiedLin
") Enclosed;
		static GccEnt_QualifiedLin Enclosed(const gp_Lin2d & Obj);

		/****************** Enclosed ******************/
		%feature("compactdefaultargs") Enclosed;
		%feature("autodoc", "Constructs a qualified circle so that the solution computed by a construction algorithm using the qualified circle or line is enclosed by the circle or line.

Parameters
----------
Obj: gp_Circ2d

Returns
-------
GccEnt_QualifiedCirc
") Enclosed;
		static GccEnt_QualifiedCirc Enclosed(const gp_Circ2d & Obj);

		/****************** Enclosing ******************/
		%feature("compactdefaultargs") Enclosing;
		%feature("autodoc", "Constructs such a qualified circle that the solution computed by a construction algorithm using the qualified circle encloses the circle.

Parameters
----------
Obj: gp_Circ2d

Returns
-------
GccEnt_QualifiedCirc
") Enclosing;
		static GccEnt_QualifiedCirc Enclosing(const gp_Circ2d & Obj);

		/****************** Outside ******************/
		%feature("compactdefaultargs") Outside;
		%feature("autodoc", "Constructs a qualified line, so that the solution computed by a construction algorithm using the qualified circle or line and the circle or line are external to one another.

Parameters
----------
Obj: gp_Lin2d

Returns
-------
GccEnt_QualifiedLin
") Outside;
		static GccEnt_QualifiedLin Outside(const gp_Lin2d & Obj);

		/****************** Outside ******************/
		%feature("compactdefaultargs") Outside;
		%feature("autodoc", "Constructs a qualified circle so that the solution computed by a construction algorithm using the qualified circle or line and the circle or line are external to one another.

Parameters
----------
Obj: gp_Circ2d

Returns
-------
GccEnt_QualifiedCirc
") Outside;
		static GccEnt_QualifiedCirc Outside(const gp_Circ2d & Obj);

		/****************** PositionFromString ******************/
		%feature("compactdefaultargs") PositionFromString;
		%feature("autodoc", "Returns the position from the given string identifier (using case-insensitive comparison). @param thepositionstring string identifier returns position or gccent_unqualified if string identifier is invalid.

Parameters
----------
thePositionString: char *

Returns
-------
GccEnt_Position
") PositionFromString;
		static GccEnt_Position PositionFromString(const char * thePositionString);

		/****************** PositionFromString ******************/
		%feature("compactdefaultargs") PositionFromString;
		%feature("autodoc", "Determines the position from the given string identifier (using case-insensitive comparison). @param thepositionstring string identifier @param theposition detected shape type returns true if string identifier is known.

Parameters
----------
thePositionString: char *
thePosition: GccEnt_Position

Returns
-------
bool
") PositionFromString;
		static Standard_Boolean PositionFromString(const char * thePositionString, GccEnt_Position & thePosition);

		/****************** PositionToString ******************/
		%feature("compactdefaultargs") PositionToString;
		%feature("autodoc", "Returns the string name for a given position. @param theposition position type returns string identifier from the list unqualified enclosing enclosed outside noqualifier.

Parameters
----------
thePosition: GccEnt_Position

Returns
-------
char *
") PositionToString;
		static const char * PositionToString(GccEnt_Position thePosition);

		/****************** Unqualified ******************/
		%feature("compactdefaultargs") Unqualified;
		%feature("autodoc", "Constructs a qualified line, so that the relative position to the circle or line of the solution computed by a construction algorithm using the qualified circle or line is not qualified, i.e. all solutions apply.

Parameters
----------
Obj: gp_Lin2d

Returns
-------
GccEnt_QualifiedLin
") Unqualified;
		static GccEnt_QualifiedLin Unqualified(const gp_Lin2d & Obj);

		/****************** Unqualified ******************/
		%feature("compactdefaultargs") Unqualified;
		%feature("autodoc", "Constructs a qualified circle so that the relative position to the circle or line of the solution computed by a construction algorithm using the qualified circle or line is not qualified, i.e. all solutions apply.

Parameters
----------
Obj: gp_Circ2d

Returns
-------
GccEnt_QualifiedCirc
") Unqualified;
		static GccEnt_QualifiedCirc Unqualified(const gp_Circ2d & Obj);

};


%extend GccEnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GccEnt_QualifiedCirc *
*****************************/
class GccEnt_QualifiedCirc {
	public:
		/****************** GccEnt_QualifiedCirc ******************/
		%feature("compactdefaultargs") GccEnt_QualifiedCirc;
		%feature("autodoc", "Constructs a qualified circle by assigning the qualifier qualifier to the circle qualified. qualifier may be: - gccent_enclosing if the solution computed by a construction algorithm using the qualified circle encloses the circle, or - gccent_enclosed if the solution is enclosed by the circle, or - gccent_outside if both the solution and the circle are external to one another, or - gccent_unqualified if all solutions apply.

Parameters
----------
Qualified: gp_Circ2d
Qualifier: GccEnt_Position

Returns
-------
None
") GccEnt_QualifiedCirc;
		 GccEnt_QualifiedCirc(const gp_Circ2d & Qualified, const GccEnt_Position Qualifier);

		/****************** IsEnclosed ******************/
		%feature("compactdefaultargs") IsEnclosed;
		%feature("autodoc", "Returns true if the solution computed by a construction algorithm using this qualified circle is enclosed by the circle.

Returns
-------
bool
") IsEnclosed;
		Standard_Boolean IsEnclosed();

		/****************** IsEnclosing ******************/
		%feature("compactdefaultargs") IsEnclosing;
		%feature("autodoc", "Returns true if the solution computed by a construction algorithm using this qualified circle encloses the circle.

Returns
-------
bool
") IsEnclosing;
		Standard_Boolean IsEnclosing();

		/****************** IsOutside ******************/
		%feature("compactdefaultargs") IsOutside;
		%feature("autodoc", "Returns true if both the solution computed by a construction algorithm using this qualified circle and the circle are external to one another.

Returns
-------
bool
") IsOutside;
		Standard_Boolean IsOutside();

		/****************** IsUnqualified ******************/
		%feature("compactdefaultargs") IsUnqualified;
		%feature("autodoc", "Returns true if the circ2d is unqualified and false in the other cases.

Returns
-------
bool
") IsUnqualified;
		Standard_Boolean IsUnqualified();

		/****************** Qualified ******************/
		%feature("compactdefaultargs") Qualified;
		%feature("autodoc", "Returns a 2d circle to which the qualifier is assigned.

Returns
-------
gp_Circ2d
") Qualified;
		gp_Circ2d Qualified();

		/****************** Qualifier ******************/
		%feature("compactdefaultargs") Qualifier;
		%feature("autodoc", "Returns - the qualifier of this qualified circle, if it is enclosing, enclosed or outside, or - gccent_noqualifier if it is unqualified.

Returns
-------
GccEnt_Position
") Qualifier;
		GccEnt_Position Qualifier();

};


%extend GccEnt_QualifiedCirc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GccEnt_QualifiedLin *
****************************/
class GccEnt_QualifiedLin {
	public:
		/****************** GccEnt_QualifiedLin ******************/
		%feature("compactdefaultargs") GccEnt_QualifiedLin;
		%feature("autodoc", "Constructs a qualified line by assigning the qualifier qualifier to the line qualified. qualifier may be: - gccent_enclosed if the solution is enclosed by the line, or - gccent_outside if both the solution and the line are external to one another, or - gccent_unqualified if all solutions apply. note : the interior of a line is defined as the left-hand side of the line in relation to its orientation.

Parameters
----------
Qualified: gp_Lin2d
Qualifier: GccEnt_Position

Returns
-------
None
") GccEnt_QualifiedLin;
		 GccEnt_QualifiedLin(const gp_Lin2d & Qualified, const GccEnt_Position Qualifier);

		/****************** IsEnclosed ******************/
		%feature("compactdefaultargs") IsEnclosed;
		%feature("autodoc", "Returns true if the solution is enclosed in the lin2d and false in the other cases.

Returns
-------
bool
") IsEnclosed;
		Standard_Boolean IsEnclosed();

		/****************** IsOutside ******************/
		%feature("compactdefaultargs") IsOutside;
		%feature("autodoc", "Returns true if the solution is outside the lin2d and false in the other cases.

Returns
-------
bool
") IsOutside;
		Standard_Boolean IsOutside();

		/****************** IsUnqualified ******************/
		%feature("compactdefaultargs") IsUnqualified;
		%feature("autodoc", "Returns true if the solution is unqualified and false in the other cases.

Returns
-------
bool
") IsUnqualified;
		Standard_Boolean IsUnqualified();

		/****************** Qualified ******************/
		%feature("compactdefaultargs") Qualified;
		%feature("autodoc", "Returns a 2d line to which the qualifier is assigned.

Returns
-------
gp_Lin2d
") Qualified;
		gp_Lin2d Qualified();

		/****************** Qualifier ******************/
		%feature("compactdefaultargs") Qualifier;
		%feature("autodoc", "Returns the qualifier of this qualified line, if it is 'enclosed' or 'outside', or - gccent_noqualifier if it is unqualified.

Returns
-------
GccEnt_Position
") Qualifier;
		GccEnt_Position Qualifier();

};


%extend GccEnt_QualifiedLin {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
