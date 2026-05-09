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
%define LPROPDOCSTRING
"LProp module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_lprop.html"
%enddef
%module (package="OCC.Core", docstring=LPROPDOCSTRING) LProp


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
#include<LProp_module.hxx>

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
enum LProp_CIType {
	LProp_Inflection = 0,
	LProp_MinCur = 1,
	LProp_MaxCur = 2,
};

enum LProp_Status {
	LProp_Undecided = 0,
	LProp_Undefined = 1,
	LProp_Defined = 2,
	LProp_Computed = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class LProp_CIType(IntEnum):
	LProp_Inflection = 0
	LProp_MinCur = 1
	LProp_MaxCur = 2
LProp_Inflection = LProp_CIType.LProp_Inflection
LProp_MinCur = LProp_CIType.LProp_MinCur
LProp_MaxCur = LProp_CIType.LProp_MaxCur

class LProp_Status(IntEnum):
	LProp_Undecided = 0
	LProp_Undefined = 1
	LProp_Defined = 2
	LProp_Computed = 3
LProp_Undecided = LProp_Status.LProp_Undecided
LProp_Undefined = LProp_Status.LProp_Undefined
LProp_Defined = LProp_Status.LProp_Defined
LProp_Computed = LProp_Status.LProp_Computed
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(LProp_SequenceOfCIType) NCollection_Sequence<LProp_CIType>;

%extend NCollection_Sequence<LProp_CIType> {
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
typedef NCollection_Sequence<LProp_CIType> LProp_SequenceOfCIType;
/* end typedefs declaration */

/*********************
* class DirectAccess *
*********************/
/************************
* class LProp_CurAndInf *
************************/
class LProp_CurAndInf {
	public:
		/****** LProp_CurAndInf::LProp_CurAndInf ******/
		/****** md5 signature: 85c542266e7272b195e0e3fb8f5234dc ******/
		%feature("compactdefaultargs") LProp_CurAndInf;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LProp_CurAndInf;
		 LProp_CurAndInf();

		/****** LProp_CurAndInf::AddExtCur ******/
		/****** md5 signature: c4c1e59ad5812a97c70089a3763fbda7 ******/
		%feature("compactdefaultargs") AddExtCur;
		%feature("autodoc", "
Parameters
----------
Param: double
IsMin: bool

Return
-------
None

Description
-----------
No available documentation.
") AddExtCur;
		void AddExtCur(const double Param, const bool IsMin);

		/****** LProp_CurAndInf::AddInflection ******/
		/****** md5 signature: 9383ef95751ef93aef79b01777d41578 ******/
		%feature("compactdefaultargs") AddInflection;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
None

Description
-----------
No available documentation.
") AddInflection;
		void AddInflection(const double Param);

		/****** LProp_CurAndInf::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** LProp_CurAndInf::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		bool IsEmpty();

		/****** LProp_CurAndInf::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points. The Points are stored to increasing parameter.
") NbPoints;
		int NbPoints();

		/****** LProp_CurAndInf::Parameter ******/
		/****** md5 signature: bb135c0e557abe93caffd1756d3fc952 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the parameter of the Nth point. raises if N not in the range [1,NbPoints()].
") Parameter;
		double Parameter(const int N);

		/****** LProp_CurAndInf::Type ******/
		/****** md5 signature: 3f35607062b6088759735ec559d4de20 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
LProp_CIType

Description
-----------
Returns - MinCur if the Nth parameter corresponds to a minimum of the radius of curvature. - MaxCur if the Nth parameter corresponds to a maximum of the radius of curvature. - Inflection if the parameter corresponds to a point of inflection. raises if N not in the range [1,NbPoints()].
") Type;
		LProp_CIType Type(const int N);

};


%extend LProp_CurAndInf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class ToolAccess *
*******************/
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
