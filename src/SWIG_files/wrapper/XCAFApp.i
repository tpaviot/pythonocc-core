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
%define XCAFAPPDOCSTRING
"XCAFApp module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xcafapp.html"
%enddef
%module (package="OCC.Core", docstring=XCAFAPPDOCSTRING) XCAFApp


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
#include<XCAFApp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDocStd_module.hxx>
#include<CDF_module.hxx>
#include<CDM_module.hxx>
#include<PCDM_module.hxx>
#include<LDOM_module.hxx>
#include<TDF_module.hxx>
#include<Resource_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TDocStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(XCAFApp_Application)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************************
* class XCAFApp_Application *
****************************/
%nodefaultctor XCAFApp_Application;
class XCAFApp_Application : public TDocStd_Application {
	public:
		/****************** GetApplication ******************/
		/**** md5 signature: 097aa584b7d888f94db50bb186c7ba88 ****/
		%feature("compactdefaultargs") GetApplication;
		%feature("autodoc", "Initializes (for the first time) and returns the static object (xcafapp_application) this is the only valid method to get xcafapp_application object, and it should be called at least once before any actions with documents in order to init application.

Returns
-------
opencascade::handle<XCAFApp_Application>
") GetApplication;
		static opencascade::handle<XCAFApp_Application> GetApplication();

		/****************** InitDocument ******************/
		/**** md5 signature: ba05c2f32b1b5c164fe28e112cc836ce ****/
		%feature("compactdefaultargs") InitDocument;
		%feature("autodoc", "Set xcafdoc_documenttool attribute.

Parameters
----------
aDoc: TDocStd_Document

Returns
-------
None
") InitDocument;
		virtual void InitDocument(const opencascade::handle<TDocStd_Document> & aDoc);

		/****************** ResourcesName ******************/
		/**** md5 signature: 96f8731792cfcab6c0cf55cdc1a09a9b ****/
		%feature("compactdefaultargs") ResourcesName;
		%feature("autodoc", "Methods from tdocstd_application ================================.

Returns
-------
char *
") ResourcesName;
		virtual const char * ResourcesName();

};


%make_alias(XCAFApp_Application)

%extend XCAFApp_Application {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
