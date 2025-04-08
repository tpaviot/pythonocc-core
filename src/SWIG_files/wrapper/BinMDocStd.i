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
%define BINMDOCSTDDOCSTRING
"BinMDocStd module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_binmdocstd.html"
%enddef
%module (package="OCC.Core", docstring=BINMDOCSTDDOCSTRING) BinMDocStd


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
#include<BinMDocStd_module.hxx>

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
%wrap_handle(BinMDocStd_XLinkDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*******************
* class BinMDocStd *
*******************/
%rename(binmdocstd) BinMDocStd;
class BinMDocStd {
	public:
		/****** BinMDocStd::AddDrivers ******/
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


%extend BinMDocStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BinMDocStd_XLinkDriver *
*******************************/
class BinMDocStd_XLinkDriver : public BinMDF_ADriver {
	public:
		/****** BinMDocStd_XLinkDriver::BinMDocStd_XLinkDriver ******/
		/****** md5 signature: a5195ef2d9e329387cf15b5356a946a2 ******/
		%feature("compactdefaultargs") BinMDocStd_XLinkDriver;
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
") BinMDocStd_XLinkDriver;
		 BinMDocStd_XLinkDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDocStd_XLinkDriver::NewEmpty ******/
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

		/****** BinMDocStd_XLinkDriver::Paste ******/
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

		/****** BinMDocStd_XLinkDriver::Paste ******/
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


%make_alias(BinMDocStd_XLinkDriver)

%extend BinMDocStd_XLinkDriver {
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
def binmdocstd_AddDrivers(*args):
	return binmdocstd.AddDrivers(*args)

}
