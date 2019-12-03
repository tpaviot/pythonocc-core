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
		%feature("compactdefaultargs") GetApplication;
		%feature("autodoc", "* Initializes (for the first time) and returns the static object (XCAFApp_Application) This is the only valid method to get XCAFApp_Application object, and it should be called at least once before any actions with documents in order to init application
	:rtype: opencascade::handle<XCAFApp_Application>") GetApplication;
		static opencascade::handle<XCAFApp_Application> GetApplication ();

		/****************** InitDocument ******************/
		%feature("compactdefaultargs") InitDocument;
		%feature("autodoc", "* Set XCAFDoc_DocumentTool attribute
	:param aDoc:
	:type aDoc: TDocStd_Document
	:rtype: void") InitDocument;
		virtual void InitDocument (const opencascade::handle<TDocStd_Document> & aDoc);

		/****************** ResourcesName ******************/
		%feature("compactdefaultargs") ResourcesName;
		%feature("autodoc", "* methods from TDocStd_Application ================================
	:rtype: char *") ResourcesName;
		virtual const char * ResourcesName ();

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
