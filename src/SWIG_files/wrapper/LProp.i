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
%define LPROPDOCSTRING
"LProp module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_lprop.html"
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
#include<GeomAbs_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import GeomAbs.i

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
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<LProp_CIType> LProp_SequenceOfCIType;
/* end typedefs declaration */

/*****************************
* class LProp_AnalyticCurInf *
*****************************/
class LProp_AnalyticCurInf {
	public:
		/****************** LProp_AnalyticCurInf ******************/
		/**** md5 signature: 9de12ef8d5db0001e2fa7ce01e701e3c ****/
		%feature("compactdefaultargs") LProp_AnalyticCurInf;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LProp_AnalyticCurInf;
		 LProp_AnalyticCurInf();

		/****************** Perform ******************/
		/**** md5 signature: 01f4e3cadaf6b2c8a8f2d693af66c125 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
T: GeomAbs_CurveType
UFirst: float
ULast: float
Result: LProp_CurAndInf

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const GeomAbs_CurveType T, const Standard_Real UFirst, const Standard_Real ULast, LProp_CurAndInf & Result);

};


%extend LProp_AnalyticCurInf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class LProp_CurAndInf *
************************/
class LProp_CurAndInf {
	public:
		/****************** LProp_CurAndInf ******************/
		/**** md5 signature: 85c542266e7272b195e0e3fb8f5234dc ****/
		%feature("compactdefaultargs") LProp_CurAndInf;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") LProp_CurAndInf;
		 LProp_CurAndInf();

		/****************** AddExtCur ******************/
		/**** md5 signature: 67bfbd091f41a325996083b02ceb306b ****/
		%feature("compactdefaultargs") AddExtCur;
		%feature("autodoc", "
Parameters
----------
Param: float
IsMin: bool

Return
-------
None

Description
-----------
No available documentation.
") AddExtCur;
		void AddExtCur(const Standard_Real Param, const Standard_Boolean IsMin);

		/****************** AddInflection ******************/
		/**** md5 signature: 9bc91f7af843b6b7d866668e1cfda6c4 ****/
		%feature("compactdefaultargs") AddInflection;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
None

Description
-----------
No available documentation.
") AddInflection;
		void AddInflection(const Standard_Real Param);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points. the points are stored to increasing parameter.
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Parameter ******************/
		/**** md5 signature: 4c21efa46e26472b743cb69dd5cd7987 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
float

Description
-----------
Returns the parameter of the nth point. raises if n not in the range [1,nbpoints()].
") Parameter;
		Standard_Real Parameter(const Standard_Integer N);

		/****************** Type ******************/
		/**** md5 signature: 8c342754ff31a2a8867996891924e0bb ****/
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
Returns - mincur if the nth parameter corresponds to a minimum of the radius of curvature. - maxcur if the nth parameter corresponds to a maximum of the radius of curvature. - inflection if the parameter corresponds to a point of inflection. raises if n not in the range [1,nbpoints()].
") Type;
		LProp_CIType Type(const Standard_Integer N);

};


%extend LProp_CurAndInf {
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
