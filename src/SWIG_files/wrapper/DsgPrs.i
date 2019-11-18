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
%define DSGPRSDOCSTRING
"DsgPrs module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_dsgprs.html"
%enddef
%module (package="OCC.Core", docstring=DSGPRSDOCSTRING) DsgPrs


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
#include<DsgPrs_module.hxx>

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

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/* harray1 class */
/* harray2 class */
/* harray2 class */
