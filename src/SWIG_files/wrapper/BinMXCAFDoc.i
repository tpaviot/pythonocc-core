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
%define BINMXCAFDOCDOCSTRING
"BinMXCAFDoc module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_binmxcafdoc.html"
%enddef
%module (package="OCC.Core", docstring=BINMXCAFDOCDOCSTRING) BinMXCAFDoc


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
#include<BinMXCAFDoc_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BinMDF_module.hxx>
#include<Message_module.hxx>
#include<TDF_module.hxx>
#include<BinObjMgt_module.hxx>
#include<BinTools_module.hxx>
#include<TopLoc_module.hxx>
#include<Resource_module.hxx>
#include<Geom_module.hxx>
#include<TopoDS_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<XCAFView_module.hxx>
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
%import BinTools.i
%import TopLoc.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(BinMXCAFDoc_AreaDriver)
%wrap_handle(BinMXCAFDoc_AssemblyItemRefDriver)
%wrap_handle(BinMXCAFDoc_CentroidDriver)
%wrap_handle(BinMXCAFDoc_ClippingPlaneToolDriver)
%wrap_handle(BinMXCAFDoc_ColorDriver)
%wrap_handle(BinMXCAFDoc_ColorToolDriver)
%wrap_handle(BinMXCAFDoc_DatumDriver)
%wrap_handle(BinMXCAFDoc_DimTolDriver)
%wrap_handle(BinMXCAFDoc_DimTolToolDriver)
%wrap_handle(BinMXCAFDoc_DimensionDriver)
%wrap_handle(BinMXCAFDoc_DocumentToolDriver)
%wrap_handle(BinMXCAFDoc_GeomToleranceDriver)
%wrap_handle(BinMXCAFDoc_GraphNodeDriver)
%wrap_handle(BinMXCAFDoc_LayerToolDriver)
%wrap_handle(BinMXCAFDoc_LocationDriver)
%wrap_handle(BinMXCAFDoc_MaterialDriver)
%wrap_handle(BinMXCAFDoc_MaterialToolDriver)
%wrap_handle(BinMXCAFDoc_NoteDriver)
%wrap_handle(BinMXCAFDoc_NotesToolDriver)
%wrap_handle(BinMXCAFDoc_ShapeToolDriver)
%wrap_handle(BinMXCAFDoc_ViewDriver)
%wrap_handle(BinMXCAFDoc_ViewToolDriver)
%wrap_handle(BinMXCAFDoc_VolumeDriver)
%wrap_handle(BinMXCAFDoc_NoteBinDataDriver)
%wrap_handle(BinMXCAFDoc_NoteCommentDriver)
%wrap_handle(BinMXCAFDoc_NoteBalloonDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/********************
* class BinMXCAFDoc *
********************/
%rename(binmxcafdoc) BinMXCAFDoc;
class BinMXCAFDoc {
	public:
		/****************** AddDrivers ******************/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "* Adds the attribute drivers to <theDriverTable>.
	:param theDriverTable:
	:type theDriverTable: BinMDF_ADriverTable
	:param theMsgDrv:
	:type theMsgDrv: Message_Messenger
	:rtype: void") AddDrivers;
		static void AddDrivers (const opencascade::handle<BinMDF_ADriverTable> & theDriverTable,const opencascade::handle<Message_Messenger> & theMsgDrv);

};


%extend BinMXCAFDoc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BinMXCAFDoc_AreaDriver *
*******************************/
class BinMXCAFDoc_AreaDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_AreaDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_AreaDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_AreaDriver;
		 BinMXCAFDoc_AreaDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_AreaDriver)

%extend BinMXCAFDoc_AreaDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class BinMXCAFDoc_AssemblyItemRefDriver *
******************************************/
class BinMXCAFDoc_AssemblyItemRefDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_AssemblyItemRefDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_AssemblyItemRefDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_AssemblyItemRefDriver;
		 BinMXCAFDoc_AssemblyItemRefDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_AssemblyItemRefDriver)

%extend BinMXCAFDoc_AssemblyItemRefDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BinMXCAFDoc_CentroidDriver *
***********************************/
class BinMXCAFDoc_CentroidDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_CentroidDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_CentroidDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_CentroidDriver;
		 BinMXCAFDoc_CentroidDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_CentroidDriver)

%extend BinMXCAFDoc_CentroidDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class BinMXCAFDoc_ClippingPlaneToolDriver *
********************************************/
class BinMXCAFDoc_ClippingPlaneToolDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_ClippingPlaneToolDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_ClippingPlaneToolDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_ClippingPlaneToolDriver;
		 BinMXCAFDoc_ClippingPlaneToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_ClippingPlaneToolDriver)

%extend BinMXCAFDoc_ClippingPlaneToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BinMXCAFDoc_ColorDriver *
********************************/
class BinMXCAFDoc_ColorDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_ColorDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_ColorDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_ColorDriver;
		 BinMXCAFDoc_ColorDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_ColorDriver)

%extend BinMXCAFDoc_ColorDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BinMXCAFDoc_ColorToolDriver *
************************************/
class BinMXCAFDoc_ColorToolDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_ColorToolDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_ColorToolDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_ColorToolDriver;
		 BinMXCAFDoc_ColorToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_ColorToolDriver)

%extend BinMXCAFDoc_ColorToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BinMXCAFDoc_DatumDriver *
********************************/
class BinMXCAFDoc_DatumDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_DatumDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_DatumDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_DatumDriver;
		 BinMXCAFDoc_DatumDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_DatumDriver)

%extend BinMXCAFDoc_DatumDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BinMXCAFDoc_DimTolDriver *
*********************************/
class BinMXCAFDoc_DimTolDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_DimTolDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_DimTolDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_DimTolDriver;
		 BinMXCAFDoc_DimTolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_DimTolDriver)

%extend BinMXCAFDoc_DimTolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BinMXCAFDoc_DimTolToolDriver *
*************************************/
class BinMXCAFDoc_DimTolToolDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_DimTolToolDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_DimTolToolDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_DimTolToolDriver;
		 BinMXCAFDoc_DimTolToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_DimTolToolDriver)

%extend BinMXCAFDoc_DimTolToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BinMXCAFDoc_DimensionDriver *
************************************/
class BinMXCAFDoc_DimensionDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_DimensionDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_DimensionDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_DimensionDriver;
		 BinMXCAFDoc_DimensionDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_DimensionDriver)

%extend BinMXCAFDoc_DimensionDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BinMXCAFDoc_DocumentToolDriver *
***************************************/
class BinMXCAFDoc_DocumentToolDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_DocumentToolDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_DocumentToolDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_DocumentToolDriver;
		 BinMXCAFDoc_DocumentToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_DocumentToolDriver)

%extend BinMXCAFDoc_DocumentToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class BinMXCAFDoc_GeomToleranceDriver *
****************************************/
class BinMXCAFDoc_GeomToleranceDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_GeomToleranceDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_GeomToleranceDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_GeomToleranceDriver;
		 BinMXCAFDoc_GeomToleranceDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_GeomToleranceDriver)

%extend BinMXCAFDoc_GeomToleranceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BinMXCAFDoc_GraphNodeDriver *
************************************/
class BinMXCAFDoc_GraphNodeDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_GraphNodeDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_GraphNodeDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_GraphNodeDriver;
		 BinMXCAFDoc_GraphNodeDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_GraphNodeDriver)

%extend BinMXCAFDoc_GraphNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BinMXCAFDoc_LayerToolDriver *
************************************/
class BinMXCAFDoc_LayerToolDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_LayerToolDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_LayerToolDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_LayerToolDriver;
		 BinMXCAFDoc_LayerToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_LayerToolDriver)

%extend BinMXCAFDoc_LayerToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BinMXCAFDoc_LocationDriver *
***********************************/
class BinMXCAFDoc_LocationDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_LocationDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_LocationDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_LocationDriver;
		 BinMXCAFDoc_LocationDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

		/****************** SetSharedLocations ******************/
		%feature("compactdefaultargs") SetSharedLocations;
		%feature("autodoc", ":param theLocations:
	:type theLocations: BinTools_LocationSetPtr
	:rtype: None") SetSharedLocations;
		void SetSharedLocations (const BinTools_LocationSetPtr & theLocations);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theLoc:
	:type theLoc: TopLoc_Location
	:param theMap:
	:type theMap: BinObjMgt_RRelocationTable
	:rtype: bool") Translate;
		Standard_Boolean Translate (const BinObjMgt_Persistent & theSource,TopLoc_Location & theLoc,BinObjMgt_RRelocationTable & theMap);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "* Translate transient location to storable
	:param theLoc:
	:type theLoc: TopLoc_Location
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theMap:
	:type theMap: BinObjMgt_SRelocationTable
	:rtype: None") Translate;
		void Translate (const TopLoc_Location & theLoc,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theMap);

};


%make_alias(BinMXCAFDoc_LocationDriver)

%extend BinMXCAFDoc_LocationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BinMXCAFDoc_MaterialDriver *
***********************************/
class BinMXCAFDoc_MaterialDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_MaterialDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_MaterialDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_MaterialDriver;
		 BinMXCAFDoc_MaterialDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_MaterialDriver)

%extend BinMXCAFDoc_MaterialDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BinMXCAFDoc_MaterialToolDriver *
***************************************/
class BinMXCAFDoc_MaterialToolDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_MaterialToolDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_MaterialToolDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_MaterialToolDriver;
		 BinMXCAFDoc_MaterialToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_MaterialToolDriver)

%extend BinMXCAFDoc_MaterialToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BinMXCAFDoc_NoteDriver *
*******************************/
%nodefaultctor BinMXCAFDoc_NoteDriver;
class BinMXCAFDoc_NoteDriver : public BinMDF_ADriver {
	public:
		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_NoteDriver)

%extend BinMXCAFDoc_NoteDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BinMXCAFDoc_NotesToolDriver *
************************************/
class BinMXCAFDoc_NotesToolDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_NotesToolDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_NotesToolDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_NotesToolDriver;
		 BinMXCAFDoc_NotesToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_NotesToolDriver)

%extend BinMXCAFDoc_NotesToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BinMXCAFDoc_ShapeToolDriver *
************************************/
class BinMXCAFDoc_ShapeToolDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_ShapeToolDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_ShapeToolDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_ShapeToolDriver;
		 BinMXCAFDoc_ShapeToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_ShapeToolDriver)

%extend BinMXCAFDoc_ShapeToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BinMXCAFDoc_ViewDriver *
*******************************/
class BinMXCAFDoc_ViewDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_ViewDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_ViewDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_ViewDriver;
		 BinMXCAFDoc_ViewDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_ViewDriver)

%extend BinMXCAFDoc_ViewDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BinMXCAFDoc_ViewToolDriver *
***********************************/
class BinMXCAFDoc_ViewToolDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_ViewToolDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_ViewToolDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_ViewToolDriver;
		 BinMXCAFDoc_ViewToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_ViewToolDriver)

%extend BinMXCAFDoc_ViewToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BinMXCAFDoc_VolumeDriver *
*********************************/
class BinMXCAFDoc_VolumeDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_VolumeDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_VolumeDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_VolumeDriver;
		 BinMXCAFDoc_VolumeDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_VolumeDriver)

%extend BinMXCAFDoc_VolumeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BinMXCAFDoc_NoteBinDataDriver *
**************************************/
class BinMXCAFDoc_NoteBinDataDriver : public BinMXCAFDoc_NoteDriver {
	public:
		/****************** BinMXCAFDoc_NoteBinDataDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_NoteBinDataDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_NoteBinDataDriver;
		 BinMXCAFDoc_NoteBinDataDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_NoteBinDataDriver)

%extend BinMXCAFDoc_NoteBinDataDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BinMXCAFDoc_NoteCommentDriver *
**************************************/
class BinMXCAFDoc_NoteCommentDriver : public BinMXCAFDoc_NoteDriver {
	public:
		/****************** BinMXCAFDoc_NoteCommentDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_NoteCommentDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_NoteCommentDriver;
		 BinMXCAFDoc_NoteCommentDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: BinObjMgt_Persistent
	:param theTarget:
	:type theTarget: TDF_Attribute
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param theSource:
	:type theSource: TDF_Attribute
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_NoteCommentDriver)

%extend BinMXCAFDoc_NoteCommentDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BinMXCAFDoc_NoteBalloonDriver *
**************************************/
class BinMXCAFDoc_NoteBalloonDriver : public BinMXCAFDoc_NoteCommentDriver {
	public:
		/****************** BinMXCAFDoc_NoteBalloonDriver ******************/
		%feature("compactdefaultargs") BinMXCAFDoc_NoteBalloonDriver;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: None") BinMXCAFDoc_NoteBalloonDriver;
		 BinMXCAFDoc_NoteBalloonDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

};


%make_alias(BinMXCAFDoc_NoteBalloonDriver)

%extend BinMXCAFDoc_NoteBalloonDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
