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
%define XMLMFUNCTIONDOCSTRING
"XmlMFunction module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xmlmfunction.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
/* public enums */
/* end public enums declaration */

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
		/****************** AddDrivers ******************/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "* Adds the attribute storage drivers to <aDriverTable>.
	:param aDriverTable:
	:type aDriverTable: XmlMDF_ADriverTable
	:param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: void") AddDrivers;
		static void AddDrivers (const opencascade::handle<XmlMDF_ADriverTable> & aDriverTable,const opencascade::handle<Message_Messenger> & theMessageDriver);

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
		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: XmlObjMgt_Persistent
	:param Target:
	:type Target: TDF_Attribute
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable
	:rtype: bool") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: TDF_Attribute
	:param Target:
	:type Target: XmlObjMgt_Persistent
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);

		/****************** XmlMFunction_FunctionDriver ******************/
		%feature("compactdefaultargs") XmlMFunction_FunctionDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") XmlMFunction_FunctionDriver;
		 XmlMFunction_FunctionDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

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
		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: XmlObjMgt_Persistent
	:param Target:
	:type Target: TDF_Attribute
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable
	:rtype: bool") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: TDF_Attribute
	:param Target:
	:type Target: XmlObjMgt_Persistent
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);

		/****************** XmlMFunction_GraphNodeDriver ******************/
		%feature("compactdefaultargs") XmlMFunction_GraphNodeDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") XmlMFunction_GraphNodeDriver;
		 XmlMFunction_GraphNodeDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

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
		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: XmlObjMgt_Persistent
	:param Target:
	:type Target: TDF_Attribute
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable
	:rtype: bool") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: TDF_Attribute
	:param Target:
	:type Target: XmlObjMgt_Persistent
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);

		/****************** XmlMFunction_ScopeDriver ******************/
		%feature("compactdefaultargs") XmlMFunction_ScopeDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") XmlMFunction_ScopeDriver;
		 XmlMFunction_ScopeDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

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
