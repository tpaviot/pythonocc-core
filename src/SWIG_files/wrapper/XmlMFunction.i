/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define XMLMFUNCTIONDOCSTRING
"XmlMFunction module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_xmlmfunction.html"
%enddef
%module (package="OCC.Core", docstring=XMLMFUNCTIONDOCSTRING) XmlMFunction


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
#include<XmlMFunction_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<XmlMDF_module.hxx>
#include<Message_module.hxx>
#include<TDF_module.hxx>
#include<XmlObjMgt_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import XmlMDF.i
%import Message.i
%import TDF.i
%import XmlObjMgt.i

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
%wrap_handle(XmlMFunction_FunctionDriver)
%wrap_handle(XmlMFunction_GraphNodeDriver)
%wrap_handle(XmlMFunction_ScopeDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************
* class XmlMFunction *
*********************/
%rename(xmlmfunction) XmlMFunction;
class XmlMFunction {
	public:
		/****** XmlMFunction::AddDrivers ******/
		/****** md5 signature: a036f2e24a6710bf8e540cdbbab785d0 ******/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "
Parameters
----------
aDriverTable: XmlMDF_ADriverTable
theMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
Adds the attribute storage drivers to <aDriverTable>.
") AddDrivers;
		static void AddDrivers(const opencascade::handle<XmlMDF_ADriverTable> & aDriverTable, const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%extend XmlMFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class XmlMFunction_FunctionDriver *
************************************/
class XmlMFunction_FunctionDriver : public XmlMDF_ADriver {
	public:
		/****** XmlMFunction_FunctionDriver::XmlMFunction_FunctionDriver ******/
		/****** md5 signature: 399dad60b017a274b8ca66ed3af63b30 ******/
		%feature("compactdefaultargs") XmlMFunction_FunctionDriver;
		%feature("autodoc", "
Parameters
----------
theMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") XmlMFunction_FunctionDriver;
		 XmlMFunction_FunctionDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** XmlMFunction_FunctionDriver::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XmlMFunction_FunctionDriver::Paste ******/
		/****** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****** XmlMFunction_FunctionDriver::Paste ******/
		/****** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

};


%make_alias(XmlMFunction_FunctionDriver)

%extend XmlMFunction_FunctionDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class XmlMFunction_GraphNodeDriver *
*************************************/
class XmlMFunction_GraphNodeDriver : public XmlMDF_ADriver {
	public:
		/****** XmlMFunction_GraphNodeDriver::XmlMFunction_GraphNodeDriver ******/
		/****** md5 signature: 9cd47c46764696dde19d029238c470ea ******/
		%feature("compactdefaultargs") XmlMFunction_GraphNodeDriver;
		%feature("autodoc", "
Parameters
----------
theMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") XmlMFunction_GraphNodeDriver;
		 XmlMFunction_GraphNodeDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** XmlMFunction_GraphNodeDriver::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XmlMFunction_GraphNodeDriver::Paste ******/
		/****** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****** XmlMFunction_GraphNodeDriver::Paste ******/
		/****** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

};


%make_alias(XmlMFunction_GraphNodeDriver)

%extend XmlMFunction_GraphNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class XmlMFunction_ScopeDriver *
*********************************/
class XmlMFunction_ScopeDriver : public XmlMDF_ADriver {
	public:
		/****** XmlMFunction_ScopeDriver::XmlMFunction_ScopeDriver ******/
		/****** md5 signature: b9b77b3a146d359abf52f95093576417 ******/
		%feature("compactdefaultargs") XmlMFunction_ScopeDriver;
		%feature("autodoc", "
Parameters
----------
theMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") XmlMFunction_ScopeDriver;
		 XmlMFunction_ScopeDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** XmlMFunction_ScopeDriver::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XmlMFunction_ScopeDriver::Paste ******/
		/****** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****** XmlMFunction_ScopeDriver::Paste ******/
		/****** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

};


%make_alias(XmlMFunction_ScopeDriver)

%extend XmlMFunction_ScopeDriver {
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
def xmlmfunction_AddDrivers(*args):
	return xmlmfunction.AddDrivers(*args)

}
