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
%define BINMFUNCTIONDOCSTRING
"BinMFunction module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_binmfunction.html"
%enddef
%module (package="OCC.Core", docstring=BINMFUNCTIONDOCSTRING) BinMFunction


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
#include<BinMFunction_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BinMDF_module.hxx>
#include<Message_module.hxx>
#include<TDF_module.hxx>
#include<BinObjMgt_module.hxx>
#include<Resource_module.hxx>
#include<TDF_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BinMDF.i
%import Message.i
%import TDF.i
%import BinObjMgt.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(BinMFunction_FunctionDriver)
%wrap_handle(BinMFunction_GraphNodeDriver)
%wrap_handle(BinMFunction_ScopeDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************
* class BinMFunction *
*********************/
%rename(binmfunction) BinMFunction;
class BinMFunction {
	public:
		/****************** AddDrivers ******************/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "* Adds the attribute drivers to <theDriverTable>.
	:param theDriverTable:
	:type theDriverTable: BinMDF_ADriverTable
	:param aMsgDrv:
	:type aMsgDrv: Message_Messenger
	:rtype: void") AddDrivers;
		static void AddDrivers (const opencascade::handle<BinMDF_ADriverTable> & theDriverTable,const opencascade::handle<Message_Messenger> & aMsgDrv);

};


%extend BinMFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BinMFunction_FunctionDriver *
************************************/
class BinMFunction_FunctionDriver : public BinMDF_ADriver {
	public:
		/****************** BinMFunction_FunctionDriver ******************/
		%feature("compactdefaultargs") BinMFunction_FunctionDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") BinMFunction_FunctionDriver;
		 BinMFunction_FunctionDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: BinObjMgt_Persistent
	:param Target:
	:type Target: TDF_Attribute
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,BinObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: TDF_Attribute
	:param Target:
	:type Target: BinObjMgt_Persistent
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMFunction_FunctionDriver)

%extend BinMFunction_FunctionDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BinMFunction_GraphNodeDriver *
*************************************/
class BinMFunction_GraphNodeDriver : public BinMDF_ADriver {
	public:
		/****************** BinMFunction_GraphNodeDriver ******************/
		%feature("compactdefaultargs") BinMFunction_GraphNodeDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") BinMFunction_GraphNodeDriver;
		 BinMFunction_GraphNodeDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: BinObjMgt_Persistent
	:param Target:
	:type Target: TDF_Attribute
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,BinObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: TDF_Attribute
	:param Target:
	:type Target: BinObjMgt_Persistent
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMFunction_GraphNodeDriver)

%extend BinMFunction_GraphNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BinMFunction_ScopeDriver *
*********************************/
class BinMFunction_ScopeDriver : public BinMDF_ADriver {
	public:
		/****************** BinMFunction_ScopeDriver ******************/
		%feature("compactdefaultargs") BinMFunction_ScopeDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") BinMFunction_ScopeDriver;
		 BinMFunction_ScopeDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: BinObjMgt_Persistent
	:param Target:
	:type Target: TDF_Attribute
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,BinObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: TDF_Attribute
	:param Target:
	:type Target: BinObjMgt_Persistent
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMFunction_ScopeDriver)

%extend BinMFunction_ScopeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
