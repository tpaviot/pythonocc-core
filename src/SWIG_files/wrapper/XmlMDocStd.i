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
%define XMLMDOCSTDDOCSTRING
"XmlMDocStd module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xmlmdocstd.html"
%enddef
%module (package="OCC.Core", docstring=XMLMDOCSTDDOCSTRING) XmlMDocStd


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
#include<XmlMDocStd_module.hxx>

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

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(XmlMDocStd_XLinkDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*******************
* class XmlMDocStd *
*******************/
%rename(xmlmdocstd) XmlMDocStd;
class XmlMDocStd {
	public:
		/****************** AddDrivers ******************/
		/**** md5 signature: a036f2e24a6710bf8e540cdbbab785d0 ****/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "Adds the attribute drivers to <adrivertable>.

Parameters
----------
aDriverTable: XmlMDF_ADriverTable
theMessageDriver: Message_Messenger

Returns
-------
None
") AddDrivers;
		static void AddDrivers(const opencascade::handle<XmlMDF_ADriverTable> & aDriverTable, const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%extend XmlMDocStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class XmlMDocStd_XLinkDriver *
*******************************/
class XmlMDocStd_XLinkDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMDocStd_XLinkDriver ******************/
		/**** md5 signature: 3b002c49904579fe30462df9b4202f0f ****/
		%feature("compactdefaultargs") XmlMDocStd_XLinkDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMDocStd_XLinkDriver;
		 XmlMDocStd_XLinkDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		/**** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

};


%make_alias(XmlMDocStd_XLinkDriver)

%extend XmlMDocStd_XLinkDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
