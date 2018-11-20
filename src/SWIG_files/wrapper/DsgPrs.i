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
%define DSGPRSDOCSTRING
"Describes Standard Presentations for DsgIHM objects
"
%enddef
%module (package="OCC.Core", docstring=DSGPRSDOCSTRING) DsgPrs

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


%include DsgPrs_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum DsgPrs_ArrowSide {
	DsgPrs_AS_NONE = 0,
	DsgPrs_AS_FIRSTAR = 1,
	DsgPrs_AS_LASTAR = 2,
	DsgPrs_AS_BOTHAR = 3,
	DsgPrs_AS_FIRSTPT = 4,
	DsgPrs_AS_LASTPT = 5,
	DsgPrs_AS_BOTHPT = 6,
	DsgPrs_AS_FIRSTAR_LASTPT = 7,
	DsgPrs_AS_FIRSTPT_LASTAR = 8,
};

/* end public enums declaration */

