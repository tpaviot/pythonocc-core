/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%define INTIMPDOCSTRING
"
"
%enddef
%module (package="OCC.Core", docstring=INTIMPDOCSTRING) IntImp

#pragma SWIG nowarn=504,325,503

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


%include IntImp_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum IntImp_ConstIsoparametric {
	IntImp_UIsoparametricOnCaro1 = 0,
	IntImp_VIsoparametricOnCaro1 = 1,
	IntImp_UIsoparametricOnCaro2 = 2,
	IntImp_VIsoparametricOnCaro2 = 3,
};

/* end public enums declaration */


