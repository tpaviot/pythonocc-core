/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
%define XMLTOBJDRIVERSDOCSTRING
"XmlTObjDrivers module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_xmltobjdrivers.html"
%enddef
%module (package="OCC.Core", docstring=XMLTOBJDRIVERSDOCSTRING) XmlTObjDrivers


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


%{
#include<XmlTObjDrivers_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<XmlMDF_module.hxx>
#include<Message_module.hxx>
#include<TDocStd_module.hxx>
#include<XmlLDrivers_module.hxx>
#include<TCollection_module.hxx>
#include<TDF_module.hxx>
#include<XmlObjMgt_module.hxx>
#include<Resource_module.hxx>
#include<PCDM_module.hxx>
#include<CDF_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import XmlMDF.i
%import Message.i
%import TDocStd.i
%import XmlLDrivers.i
%import TCollection.i
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
%wrap_handle(XmlTObjDrivers_DocumentRetrievalDriver)
%wrap_handle(XmlTObjDrivers_DocumentStorageDriver)
%wrap_handle(XmlTObjDrivers_IntSparseArrayDriver)
%wrap_handle(XmlTObjDrivers_ModelDriver)
%wrap_handle(XmlTObjDrivers_ObjectDriver)
%wrap_handle(XmlTObjDrivers_ReferenceDriver)
%wrap_handle(XmlTObjDrivers_XYZDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***********************
* class XmlTObjDrivers *
***********************/
%rename(xmltobjdrivers) XmlTObjDrivers;
class XmlTObjDrivers {
	public:
		/****************** AddDrivers ******************/
		/**** md5 signature: 831746c79de4e4f242f5fd72f43b291b ****/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "
Parameters
----------
aDriverTable: XmlMDF_ADriverTable
anMsgDrv: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") AddDrivers;
		static void AddDrivers(const opencascade::handle<XmlMDF_ADriverTable> & aDriverTable, const opencascade::handle<Message_Messenger> & anMsgDrv);

		/****************** DefineFormat ******************/
		/**** md5 signature: 2ae4ef4b935d04445595a5553ed3615b ****/
		%feature("compactdefaultargs") DefineFormat;
		%feature("autodoc", "
Parameters
----------
theApp: TDocStd_Application

Return
-------
None

Description
-----------
Defines format 'tobjxml' and registers its read and write drivers in the specified application.
") DefineFormat;
		static void DefineFormat(const opencascade::handle<TDocStd_Application> & theApp);

		/****************** Factory ******************/
		/**** md5 signature: 3da280e6bb218a5037c98dc98a4e3815 ****/
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "
Parameters
----------
aGUID: Standard_GUID

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns a driver corresponding to <aguid>. used for plugin.
") Factory;
		static const opencascade::handle<Standard_Transient> & Factory(const Standard_GUID & aGUID);

};


%extend XmlTObjDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class XmlTObjDrivers_DocumentRetrievalDriver *
***********************************************/
class XmlTObjDrivers_DocumentRetrievalDriver : public XmlLDrivers_DocumentRetrievalDriver {
	public:
		/****************** XmlTObjDrivers_DocumentRetrievalDriver ******************/
		/**** md5 signature: 4cc3cc7048f3c6736a45f944ec96cbc2 ****/
		%feature("compactdefaultargs") XmlTObjDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XmlTObjDrivers_DocumentRetrievalDriver;
		 XmlTObjDrivers_DocumentRetrievalDriver();

		/****************** AttributeDrivers ******************/
		/**** md5 signature: 8f96c34c95c7e9b565e8874b99e9133c ****/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
opencascade::handle<XmlMDF_ADriverTable>

Description
-----------
No available documentation.
") AttributeDrivers;
		virtual opencascade::handle<XmlMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

};


%make_alias(XmlTObjDrivers_DocumentRetrievalDriver)

%extend XmlTObjDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class XmlTObjDrivers_DocumentStorageDriver *
*********************************************/
class XmlTObjDrivers_DocumentStorageDriver : public XmlLDrivers_DocumentStorageDriver {
	public:
		/****************** XmlTObjDrivers_DocumentStorageDriver ******************/
		/**** md5 signature: d8ca387403924c8c88a96bece3464537 ****/
		%feature("compactdefaultargs") XmlTObjDrivers_DocumentStorageDriver;
		%feature("autodoc", "
Parameters
----------
theCopyright: str

Return
-------
None

Description
-----------
No available documentation.
") XmlTObjDrivers_DocumentStorageDriver;
		 XmlTObjDrivers_DocumentStorageDriver(TCollection_ExtendedString theCopyright);

		/****************** AttributeDrivers ******************/
		/**** md5 signature: 8f96c34c95c7e9b565e8874b99e9133c ****/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
opencascade::handle<XmlMDF_ADriverTable>

Description
-----------
No available documentation.
") AttributeDrivers;
		virtual opencascade::handle<XmlMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

};


%make_alias(XmlTObjDrivers_DocumentStorageDriver)

%extend XmlTObjDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class XmlTObjDrivers_IntSparseArrayDriver *
********************************************/
class XmlTObjDrivers_IntSparseArrayDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlTObjDrivers_IntSparseArrayDriver ******************/
		/**** md5 signature: 1a0c59f26ec5ccb25c4dd3c25e5facdc ****/
		%feature("compactdefaultargs") XmlTObjDrivers_IntSparseArrayDriver;
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
") XmlTObjDrivers_IntSparseArrayDriver;
		 XmlTObjDrivers_IntSparseArrayDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 031c6cb06a428765ac4d078be7d14cf9 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: f2623a6490ed13129844514bdeadf8d1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(XmlTObjDrivers_IntSparseArrayDriver)

%extend XmlTObjDrivers_IntSparseArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class XmlTObjDrivers_ModelDriver *
***********************************/
class XmlTObjDrivers_ModelDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlTObjDrivers_ModelDriver ******************/
		/**** md5 signature: 082846bc7db4fcd0440659d00adb9a1d ****/
		%feature("compactdefaultargs") XmlTObjDrivers_ModelDriver;
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
") XmlTObjDrivers_ModelDriver;
		 XmlTObjDrivers_ModelDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ****/
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

		/****************** Paste ******************/
		/**** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ****/
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


%make_alias(XmlTObjDrivers_ModelDriver)

%extend XmlTObjDrivers_ModelDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class XmlTObjDrivers_ObjectDriver *
************************************/
class XmlTObjDrivers_ObjectDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlTObjDrivers_ObjectDriver ******************/
		/**** md5 signature: 5832825f7645f44418ab8cdbecf2d0c4 ****/
		%feature("compactdefaultargs") XmlTObjDrivers_ObjectDriver;
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
") XmlTObjDrivers_ObjectDriver;
		 XmlTObjDrivers_ObjectDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ****/
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

		/****************** Paste ******************/
		/**** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ****/
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


%make_alias(XmlTObjDrivers_ObjectDriver)

%extend XmlTObjDrivers_ObjectDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class XmlTObjDrivers_ReferenceDriver *
***************************************/
class XmlTObjDrivers_ReferenceDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlTObjDrivers_ReferenceDriver ******************/
		/**** md5 signature: b4b2b7fcb744d30a5358207694bee8b3 ****/
		%feature("compactdefaultargs") XmlTObjDrivers_ReferenceDriver;
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
") XmlTObjDrivers_ReferenceDriver;
		 XmlTObjDrivers_ReferenceDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ****/
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

		/****************** Paste ******************/
		/**** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ****/
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


%make_alias(XmlTObjDrivers_ReferenceDriver)

%extend XmlTObjDrivers_ReferenceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class XmlTObjDrivers_XYZDriver *
*********************************/
class XmlTObjDrivers_XYZDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlTObjDrivers_XYZDriver ******************/
		/**** md5 signature: 3e6d6346e2283fb10c6db7ed61738274 ****/
		%feature("compactdefaultargs") XmlTObjDrivers_XYZDriver;
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
") XmlTObjDrivers_XYZDriver;
		 XmlTObjDrivers_XYZDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ****/
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

		/****************** Paste ******************/
		/**** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ****/
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


%make_alias(XmlTObjDrivers_XYZDriver)

%extend XmlTObjDrivers_XYZDriver {
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
def xmltobjdrivers_AddDrivers(*args):
	return xmltobjdrivers.AddDrivers(*args)

@deprecated
def xmltobjdrivers_DefineFormat(*args):
	return xmltobjdrivers.DefineFormat(*args)

@deprecated
def xmltobjdrivers_Factory(*args):
	return xmltobjdrivers.Factory(*args)

}
