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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
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
