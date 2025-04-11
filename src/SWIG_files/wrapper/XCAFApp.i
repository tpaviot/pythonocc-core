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
%define XCAFAPPDOCSTRING
"XCAFApp module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_xcafapp.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<XCAFApp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDocStd_module.hxx>
#include<CDM_module.hxx>
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
%import CDM.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
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

        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** XCAFApp_Application::GetApplication ******/
		/****** md5 signature: 097aa584b7d888f94db50bb186c7ba88 ******/
		%feature("compactdefaultargs") GetApplication;
		%feature("autodoc", "Return
-------
opencascade::handle<XCAFApp_Application>

Description
-----------
Initializes (for the first time) and returns the static object (XCAFApp_Application) This is the only valid method to get XCAFApp_Application object, and it should be called at least once before any actions with documents in order to init application.
") GetApplication;
		static opencascade::handle<XCAFApp_Application> GetApplication();

		/****** XCAFApp_Application::InitDocument ******/
		/****** md5 signature: cb8b1250bf5bfec47bac72c3724adc69 ******/
		%feature("compactdefaultargs") InitDocument;
		%feature("autodoc", "
Parameters
----------
aDoc: CDM_Document

Return
-------
None

Description
-----------
Set XCAFDoc_DocumentTool attribute.
") InitDocument;
		virtual void InitDocument(const opencascade::handle<CDM_Document> & aDoc);

		/****** XCAFApp_Application::ResourcesName ******/
		/****** md5 signature: 96f8731792cfcab6c0cf55cdc1a09a9b ******/
		%feature("compactdefaultargs") ResourcesName;
		%feature("autodoc", "Return
-------
str

Description
-----------
methods from TDocStd_Application ================================.
") ResourcesName;
		virtual Standard_CString ResourcesName();

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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def XCAFApp_Application_GetApplication(*args):
	return XCAFApp_Application.GetApplication(*args)

}
