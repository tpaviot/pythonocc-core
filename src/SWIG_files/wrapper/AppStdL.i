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
%define APPSTDLDOCSTRING
"AppStdL module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_appstdl.html"
%enddef
%module (package="OCC.Core", docstring=APPSTDLDOCSTRING) AppStdL


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
#include<AppStdL_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDocStd_module.hxx>
#include<Resource_module.hxx>
#include<CDF_module.hxx>
#include<PCDM_module.hxx>
#include<LDOM_module.hxx>
#include<TDF_module.hxx>
#include<CDM_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TDocStd.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(AppStdL_Application)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************************
* class AppStdL_Application *
****************************/
class AppStdL_Application : public TDocStd_Application {
	public:
		/****************** ResourcesName ******************/
		%feature("compactdefaultargs") ResourcesName;
		%feature("autodoc", "* returns the file name which contains application resources
	:rtype: char *") ResourcesName;
		const char * ResourcesName ();

};


%make_alias(AppStdL_Application)

%extend AppStdL_Application {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
