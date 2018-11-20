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
%define PFUNCTIONDOCSTRING
""
%enddef
%module (package="OCC.Core", docstring=PFUNCTIONDOCSTRING) PFunction

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


%include PFunction_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */


%nodefaultctor PFunction_Function;
class PFunction_Function : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PFunction_Function;
		%feature("autodoc", "	:rtype: None
") PFunction_Function;
		 PFunction_Function ();
		%feature("compactdefaultargs") SetDriverGUID;
		%feature("autodoc", "	:param driverGUID:
	:type driverGUID: Standard_GUID &
	:rtype: None
") SetDriverGUID;
		void SetDriverGUID (const Standard_GUID & driverGUID);
		%feature("compactdefaultargs") GetDriverGUID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetDriverGUID;
		Standard_GUID GetDriverGUID ();
		%feature("compactdefaultargs") GetFailure;
		%feature("autodoc", "	:rtype: int
") GetFailure;
		Standard_Integer GetFailure ();
		%feature("compactdefaultargs") SetFailure;
		%feature("autodoc", "	:param mode:
	:type mode: int
	:rtype: None
") SetFailure;
		void SetFailure (const Standard_Integer mode);
		%feature("compactdefaultargs") PFunction_Function;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PFunction_Function;
		 PFunction_Function (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPFunction_FunctionmyDriverGUID;
		%feature("autodoc", "	:rtype: Standard_GUID
") _CSFDB_GetPFunction_FunctionmyDriverGUID;
		const Standard_GUID & _CSFDB_GetPFunction_FunctionmyDriverGUID ();
		%feature("compactdefaultargs") _CSFDB_GetPFunction_FunctionmyFailure;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPFunction_FunctionmyFailure;
		Standard_Integer _CSFDB_GetPFunction_FunctionmyFailure ();
		%feature("compactdefaultargs") _CSFDB_SetPFunction_FunctionmyFailure;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPFunction_FunctionmyFailure;
		void _CSFDB_SetPFunction_FunctionmyFailure (const Standard_Integer p);
};


%extend PFunction_Function {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
