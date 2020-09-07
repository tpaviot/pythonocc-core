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
%define XMLMXCAFDOCDOCSTRING
"XmlMXCAFDoc module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xmlmxcafdoc.html"
%enddef
%module (package="OCC.Core", docstring=XMLMXCAFDOCDOCSTRING) XmlMXCAFDoc


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
#include<XmlMXCAFDoc_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<XmlMDF_module.hxx>
#include<Message_module.hxx>
#include<TDF_module.hxx>
#include<XmlObjMgt_module.hxx>
#include<TopTools_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<Resource_module.hxx>
#include<TopoDS_module.hxx>
#include<XCAFDimTolObjects_module.hxx>
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
%import TopTools.i
%import TopLoc.i

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
%wrap_handle(XmlMXCAFDoc_AreaDriver)
%wrap_handle(XmlMXCAFDoc_AssemblyItemRefDriver)
%wrap_handle(XmlMXCAFDoc_CentroidDriver)
%wrap_handle(XmlMXCAFDoc_ClippingPlaneToolDriver)
%wrap_handle(XmlMXCAFDoc_ColorDriver)
%wrap_handle(XmlMXCAFDoc_ColorToolDriver)
%wrap_handle(XmlMXCAFDoc_DatumDriver)
%wrap_handle(XmlMXCAFDoc_DimTolDriver)
%wrap_handle(XmlMXCAFDoc_DimTolToolDriver)
%wrap_handle(XmlMXCAFDoc_DocumentToolDriver)
%wrap_handle(XmlMXCAFDoc_GraphNodeDriver)
%wrap_handle(XmlMXCAFDoc_LayerToolDriver)
%wrap_handle(XmlMXCAFDoc_LocationDriver)
%wrap_handle(XmlMXCAFDoc_MaterialDriver)
%wrap_handle(XmlMXCAFDoc_MaterialToolDriver)
%wrap_handle(XmlMXCAFDoc_NoteDriver)
%wrap_handle(XmlMXCAFDoc_NotesToolDriver)
%wrap_handle(XmlMXCAFDoc_ShapeToolDriver)
%wrap_handle(XmlMXCAFDoc_ViewToolDriver)
%wrap_handle(XmlMXCAFDoc_VolumeDriver)
%wrap_handle(XmlMXCAFDoc_NoteBinDataDriver)
%wrap_handle(XmlMXCAFDoc_NoteCommentDriver)
%wrap_handle(XmlMXCAFDoc_NoteBalloonDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/********************
* class XmlMXCAFDoc *
********************/
%rename(xmlmxcafdoc) XmlMXCAFDoc;
class XmlMXCAFDoc {
	public:
		/****************** AddDrivers ******************/
		/**** md5 signature: 831746c79de4e4f242f5fd72f43b291b ****/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "Adds the attribute drivers to <adrivertable>.

Parameters
----------
aDriverTable: XmlMDF_ADriverTable
anMsgDrv: Message_Messenger

Returns
-------
None
") AddDrivers;
		static void AddDrivers(const opencascade::handle<XmlMDF_ADriverTable> & aDriverTable, const opencascade::handle<Message_Messenger> & anMsgDrv);

};


%extend XmlMXCAFDoc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class XmlMXCAFDoc_AreaDriver *
*******************************/
class XmlMXCAFDoc_AreaDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_AreaDriver ******************/
		/**** md5 signature: fb7496c1cad67c19591a6ed150c5be5b ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_AreaDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_AreaDriver;
		 XmlMXCAFDoc_AreaDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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


%make_alias(XmlMXCAFDoc_AreaDriver)

%extend XmlMXCAFDoc_AreaDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class XmlMXCAFDoc_AssemblyItemRefDriver *
******************************************/
class XmlMXCAFDoc_AssemblyItemRefDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_AssemblyItemRefDriver ******************/
		/**** md5 signature: 1bd9fbb82415b4111cd32958b6c0ea4e ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_AssemblyItemRefDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_AssemblyItemRefDriver;
		 XmlMXCAFDoc_AssemblyItemRefDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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
		/**** md5 signature: 031c6cb06a428765ac4d078be7d14cf9 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: f2623a6490ed13129844514bdeadf8d1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(XmlMXCAFDoc_AssemblyItemRefDriver)

%extend XmlMXCAFDoc_AssemblyItemRefDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class XmlMXCAFDoc_CentroidDriver *
***********************************/
class XmlMXCAFDoc_CentroidDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_CentroidDriver ******************/
		/**** md5 signature: ded4fdde04410ae6479ef338dbe7d0b6 ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_CentroidDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_CentroidDriver;
		 XmlMXCAFDoc_CentroidDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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


%make_alias(XmlMXCAFDoc_CentroidDriver)

%extend XmlMXCAFDoc_CentroidDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class XmlMXCAFDoc_ClippingPlaneToolDriver *
********************************************/
class XmlMXCAFDoc_ClippingPlaneToolDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_ClippingPlaneToolDriver ******************/
		/**** md5 signature: e9c907c8bf021517b266f9552bc35d8b ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_ClippingPlaneToolDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_ClippingPlaneToolDriver;
		 XmlMXCAFDoc_ClippingPlaneToolDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 175da9d64d03984ff0a1e9404e96e330 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 9c9a6281aaafe1c72d86f4bb8a4e351c ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(XmlMXCAFDoc_ClippingPlaneToolDriver)

%extend XmlMXCAFDoc_ClippingPlaneToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class XmlMXCAFDoc_ColorDriver *
********************************/
class XmlMXCAFDoc_ColorDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_ColorDriver ******************/
		/**** md5 signature: 582369606f68dcfdaadd7faa0348aff2 ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_ColorDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_ColorDriver;
		 XmlMXCAFDoc_ColorDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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


%make_alias(XmlMXCAFDoc_ColorDriver)

%extend XmlMXCAFDoc_ColorDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class XmlMXCAFDoc_ColorToolDriver *
************************************/
class XmlMXCAFDoc_ColorToolDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_ColorToolDriver ******************/
		/**** md5 signature: 9a94fff28a5724390566f3289d75ecec ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_ColorToolDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_ColorToolDriver;
		 XmlMXCAFDoc_ColorToolDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 175da9d64d03984ff0a1e9404e96e330 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 9c9a6281aaafe1c72d86f4bb8a4e351c ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(XmlMXCAFDoc_ColorToolDriver)

%extend XmlMXCAFDoc_ColorToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class XmlMXCAFDoc_DatumDriver *
********************************/
class XmlMXCAFDoc_DatumDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_DatumDriver ******************/
		/**** md5 signature: a8c75922610cc7a92b9ba2ff17fe33d3 ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_DatumDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_DatumDriver;
		 XmlMXCAFDoc_DatumDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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


%make_alias(XmlMXCAFDoc_DatumDriver)

%extend XmlMXCAFDoc_DatumDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class XmlMXCAFDoc_DimTolDriver *
*********************************/
class XmlMXCAFDoc_DimTolDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_DimTolDriver ******************/
		/**** md5 signature: fdb6fcf7b04e7df0485d0bec056f902e ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_DimTolDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_DimTolDriver;
		 XmlMXCAFDoc_DimTolDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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


%make_alias(XmlMXCAFDoc_DimTolDriver)

%extend XmlMXCAFDoc_DimTolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class XmlMXCAFDoc_DimTolToolDriver *
*************************************/
class XmlMXCAFDoc_DimTolToolDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_DimTolToolDriver ******************/
		/**** md5 signature: c39c81bfaa94dcaddbcc06eeb04f3ace ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_DimTolToolDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_DimTolToolDriver;
		 XmlMXCAFDoc_DimTolToolDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 175da9d64d03984ff0a1e9404e96e330 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 9c9a6281aaafe1c72d86f4bb8a4e351c ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(XmlMXCAFDoc_DimTolToolDriver)

%extend XmlMXCAFDoc_DimTolToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class XmlMXCAFDoc_DocumentToolDriver *
***************************************/
class XmlMXCAFDoc_DocumentToolDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_DocumentToolDriver ******************/
		/**** md5 signature: 86b84bfef20adf1a285f18ed90dcd5ea ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_DocumentToolDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_DocumentToolDriver;
		 XmlMXCAFDoc_DocumentToolDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 175da9d64d03984ff0a1e9404e96e330 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 9c9a6281aaafe1c72d86f4bb8a4e351c ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(XmlMXCAFDoc_DocumentToolDriver)

%extend XmlMXCAFDoc_DocumentToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class XmlMXCAFDoc_GraphNodeDriver *
************************************/
class XmlMXCAFDoc_GraphNodeDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_GraphNodeDriver ******************/
		/**** md5 signature: 7b493d1c7a1f2bcb101bbb306799dc9d ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_GraphNodeDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_GraphNodeDriver;
		 XmlMXCAFDoc_GraphNodeDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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


%make_alias(XmlMXCAFDoc_GraphNodeDriver)

%extend XmlMXCAFDoc_GraphNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class XmlMXCAFDoc_LayerToolDriver *
************************************/
class XmlMXCAFDoc_LayerToolDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_LayerToolDriver ******************/
		/**** md5 signature: dfb3ef7f88c8b010208ca144619c08b5 ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_LayerToolDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_LayerToolDriver;
		 XmlMXCAFDoc_LayerToolDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 175da9d64d03984ff0a1e9404e96e330 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 9c9a6281aaafe1c72d86f4bb8a4e351c ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(XmlMXCAFDoc_LayerToolDriver)

%extend XmlMXCAFDoc_LayerToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class XmlMXCAFDoc_LocationDriver *
***********************************/
class XmlMXCAFDoc_LocationDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_LocationDriver ******************/
		/**** md5 signature: 64b7580e254b44dcc890d9cae11207cf ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_LocationDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_LocationDriver;
		 XmlMXCAFDoc_LocationDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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

		/****************** SetSharedLocations ******************/
		/**** md5 signature: a44f5149107074dcb2288dcdd6cb592f ****/
		%feature("compactdefaultargs") SetSharedLocations;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLocations: TopTools_LocationSetPtr

Returns
-------
None
") SetSharedLocations;
		void SetSharedLocations(const TopTools_LocationSetPtr & theLocations);

		/****************** Translate ******************/
		/**** md5 signature: 9a55ec44d63aa21534da3a7da21a6dc8 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Translate a non storable location to a storable location.

Parameters
----------
theLoc: TopLoc_Location
theParent: XmlObjMgt_Element
theMap: XmlObjMgt_SRelocationTable

Returns
-------
None
") Translate;
		void Translate(const TopLoc_Location & theLoc, XmlObjMgt_Element & theParent, XmlObjMgt_SRelocationTable & theMap);

		/****************** Translate ******************/
		/**** md5 signature: 18f87bb5a780957e9812c0ee18c23c53 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Translate a storable location to a non storable location.

Parameters
----------
theParent: XmlObjMgt_Element
theLoc: TopLoc_Location
theMap: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Translate;
		Standard_Boolean Translate(const XmlObjMgt_Element & theParent, TopLoc_Location & theLoc, XmlObjMgt_RRelocationTable & theMap);

};


%make_alias(XmlMXCAFDoc_LocationDriver)

%extend XmlMXCAFDoc_LocationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class XmlMXCAFDoc_MaterialDriver *
***********************************/
class XmlMXCAFDoc_MaterialDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_MaterialDriver ******************/
		/**** md5 signature: d0f1d3ceb2e5a199f0f5801ec658028b ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_MaterialDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_MaterialDriver;
		 XmlMXCAFDoc_MaterialDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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


%make_alias(XmlMXCAFDoc_MaterialDriver)

%extend XmlMXCAFDoc_MaterialDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class XmlMXCAFDoc_MaterialToolDriver *
***************************************/
class XmlMXCAFDoc_MaterialToolDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_MaterialToolDriver ******************/
		/**** md5 signature: 2d66ed18e48940d972b9adb7f184cde7 ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_MaterialToolDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_MaterialToolDriver;
		 XmlMXCAFDoc_MaterialToolDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 175da9d64d03984ff0a1e9404e96e330 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 9c9a6281aaafe1c72d86f4bb8a4e351c ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(XmlMXCAFDoc_MaterialToolDriver)

%extend XmlMXCAFDoc_MaterialToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class XmlMXCAFDoc_NoteDriver *
*******************************/
%nodefaultctor XmlMXCAFDoc_NoteDriver;
class XmlMXCAFDoc_NoteDriver : public XmlMDF_ADriver {
	public:
		/****************** Paste ******************/
		/**** md5 signature: 031c6cb06a428765ac4d078be7d14cf9 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: f2623a6490ed13129844514bdeadf8d1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(XmlMXCAFDoc_NoteDriver)

%extend XmlMXCAFDoc_NoteDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class XmlMXCAFDoc_NotesToolDriver *
************************************/
class XmlMXCAFDoc_NotesToolDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_NotesToolDriver ******************/
		/**** md5 signature: 44d8ad48a8451d2bbf2d237da7ade6f0 ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_NotesToolDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_NotesToolDriver;
		 XmlMXCAFDoc_NotesToolDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

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
		/**** md5 signature: 031c6cb06a428765ac4d078be7d14cf9 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: f2623a6490ed13129844514bdeadf8d1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(XmlMXCAFDoc_NotesToolDriver)

%extend XmlMXCAFDoc_NotesToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class XmlMXCAFDoc_ShapeToolDriver *
************************************/
class XmlMXCAFDoc_ShapeToolDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_ShapeToolDriver ******************/
		/**** md5 signature: 0e00dd8438efe057b3a8ad0d3951cc5d ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_ShapeToolDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_ShapeToolDriver;
		 XmlMXCAFDoc_ShapeToolDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 175da9d64d03984ff0a1e9404e96e330 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 9c9a6281aaafe1c72d86f4bb8a4e351c ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(XmlMXCAFDoc_ShapeToolDriver)

%extend XmlMXCAFDoc_ShapeToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class XmlMXCAFDoc_ViewToolDriver *
***********************************/
class XmlMXCAFDoc_ViewToolDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_ViewToolDriver ******************/
		/**** md5 signature: d9cfb4bfb10d9afad4367d2fa8903fa3 ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_ViewToolDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_ViewToolDriver;
		 XmlMXCAFDoc_ViewToolDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 175da9d64d03984ff0a1e9404e96e330 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 9c9a6281aaafe1c72d86f4bb8a4e351c ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(XmlMXCAFDoc_ViewToolDriver)

%extend XmlMXCAFDoc_ViewToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class XmlMXCAFDoc_VolumeDriver *
*********************************/
class XmlMXCAFDoc_VolumeDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMXCAFDoc_VolumeDriver ******************/
		/**** md5 signature: fee36f16ef204ae3d9ec377ddbc22254 ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_VolumeDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_VolumeDriver;
		 XmlMXCAFDoc_VolumeDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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


%make_alias(XmlMXCAFDoc_VolumeDriver)

%extend XmlMXCAFDoc_VolumeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class XmlMXCAFDoc_NoteBinDataDriver *
**************************************/
class XmlMXCAFDoc_NoteBinDataDriver : public XmlMXCAFDoc_NoteDriver {
	public:
		/****************** XmlMXCAFDoc_NoteBinDataDriver ******************/
		/**** md5 signature: ddf8ab0fea2aea3bd21259438dae5994 ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_NoteBinDataDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_NoteBinDataDriver;
		 XmlMXCAFDoc_NoteBinDataDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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
		/**** md5 signature: 031c6cb06a428765ac4d078be7d14cf9 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: f2623a6490ed13129844514bdeadf8d1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(XmlMXCAFDoc_NoteBinDataDriver)

%extend XmlMXCAFDoc_NoteBinDataDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class XmlMXCAFDoc_NoteCommentDriver *
**************************************/
class XmlMXCAFDoc_NoteCommentDriver : public XmlMXCAFDoc_NoteDriver {
	public:
		/****************** XmlMXCAFDoc_NoteCommentDriver ******************/
		/**** md5 signature: ecd7cd0a2c6b4d57556056897f52cc3a ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_NoteCommentDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_NoteCommentDriver;
		 XmlMXCAFDoc_NoteCommentDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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
		/**** md5 signature: 031c6cb06a428765ac4d078be7d14cf9 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: f2623a6490ed13129844514bdeadf8d1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(XmlMXCAFDoc_NoteCommentDriver)

%extend XmlMXCAFDoc_NoteCommentDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class XmlMXCAFDoc_NoteBalloonDriver *
**************************************/
class XmlMXCAFDoc_NoteBalloonDriver : public XmlMXCAFDoc_NoteCommentDriver {
	public:
		/****************** XmlMXCAFDoc_NoteBalloonDriver ******************/
		/**** md5 signature: 313f478f81ea3a04744df5289718c467 ****/
		%feature("compactdefaultargs") XmlMXCAFDoc_NoteBalloonDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMXCAFDoc_NoteBalloonDriver;
		 XmlMXCAFDoc_NoteBalloonDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

};


%make_alias(XmlMXCAFDoc_NoteBalloonDriver)

%extend XmlMXCAFDoc_NoteBalloonDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
