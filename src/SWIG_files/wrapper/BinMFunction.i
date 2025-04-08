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
%define BINMFUNCTIONDOCSTRING
"BinMFunction module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_binmfunction.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
		/****** BinMFunction::AddDrivers ******/
		/****** md5 signature: 3b175e0207523895c819eaf3e413231f ******/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "
Parameters
----------
theDriverTable: BinMDF_ADriverTable
aMsgDrv: Message_Messenger

Return
-------
None

Description
-----------
Adds the attribute drivers to <theDriverTable>.
") AddDrivers;
		static void AddDrivers(const opencascade::handle<BinMDF_ADriverTable> & theDriverTable, const opencascade::handle<Message_Messenger> & aMsgDrv);

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
		/****** BinMFunction_FunctionDriver::BinMFunction_FunctionDriver ******/
		/****** md5 signature: 62e3dca3fe9441ad4071a2e87b264bd7 ******/
		%feature("compactdefaultargs") BinMFunction_FunctionDriver;
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
") BinMFunction_FunctionDriver;
		 BinMFunction_FunctionDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMFunction_FunctionDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMFunction_FunctionDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: BinObjMgt_Persistent
Target: TDF_Attribute
RelocTable: BinObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMFunction_FunctionDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: BinObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

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
		/****** BinMFunction_GraphNodeDriver::BinMFunction_GraphNodeDriver ******/
		/****** md5 signature: 923faf68df17a842690d977b6ae24d6f ******/
		%feature("compactdefaultargs") BinMFunction_GraphNodeDriver;
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
") BinMFunction_GraphNodeDriver;
		 BinMFunction_GraphNodeDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMFunction_GraphNodeDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMFunction_GraphNodeDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: BinObjMgt_Persistent
Target: TDF_Attribute
RelocTable: BinObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMFunction_GraphNodeDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: BinObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

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
		/****** BinMFunction_ScopeDriver::BinMFunction_ScopeDriver ******/
		/****** md5 signature: 3a3db8642700bda1d342da8279bc36cf ******/
		%feature("compactdefaultargs") BinMFunction_ScopeDriver;
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
") BinMFunction_ScopeDriver;
		 BinMFunction_ScopeDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMFunction_ScopeDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMFunction_ScopeDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: BinObjMgt_Persistent
Target: TDF_Attribute
RelocTable: BinObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMFunction_ScopeDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: BinObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def binmfunction_AddDrivers(*args):
	return binmfunction.AddDrivers(*args)

}
