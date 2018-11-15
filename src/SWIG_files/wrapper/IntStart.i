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
%define INTSTARTDOCSTRING
"This package provides generic algorithms to
find specific points (points on boundaries
and points inside a surface) used as starting
points for marching algorithms.

-Level: Internal

All the methods of the classes of this package are Internal.

"
%enddef
%module (package="OCC.Core", docstring=INTSTARTDOCSTRING) IntStart

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


%include IntStart_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(IntStart_SITopolTool)

%nodefaultctor IntStart_SITopolTool;
class IntStart_SITopolTool : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: TopAbs_State
") Classify;
		virtual TopAbs_State Classify (const gp_Pnt2d & P,const Standard_Real Tol);
};


%make_alias(IntStart_SITopolTool)

%extend IntStart_SITopolTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
