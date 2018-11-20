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
%define MMGTDOCSTRING
"-Purpose:
The package MMgt provides single class TShared which is second in hierarchy
of inheritance from Standard_Transient, kept for historic reasons
"
%enddef
%module (package="OCC.Core", docstring=MMGTDOCSTRING) MMgt

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


%include MMgt_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(MMgt_TShared)

%nodefaultctor MMgt_TShared;
class MMgt_TShared : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
};


%make_alias(MMgt_TShared)

%extend MMgt_TShared {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
