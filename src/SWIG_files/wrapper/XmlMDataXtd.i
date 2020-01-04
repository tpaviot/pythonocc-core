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
%define XMLMDATAXTDDOCSTRING
"XmlMDataXtd module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xmlmdataxtd.html"
%enddef
%module (package="OCC.Core", docstring=XMLMDATAXTDDOCSTRING) XmlMDataXtd


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
#include<XmlMDataXtd_module.hxx>

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
%wrap_handle(XmlMDataXtd_AxisDriver)
%wrap_handle(XmlMDataXtd_ConstraintDriver)
%wrap_handle(XmlMDataXtd_GeometryDriver)
%wrap_handle(XmlMDataXtd_PatternStdDriver)
%wrap_handle(XmlMDataXtd_PlacementDriver)
%wrap_handle(XmlMDataXtd_PlaneDriver)
%wrap_handle(XmlMDataXtd_PointDriver)
%wrap_handle(XmlMDataXtd_PositionDriver)
%wrap_handle(XmlMDataXtd_PresentationDriver)
%wrap_handle(XmlMDataXtd_ShapeDriver)
%wrap_handle(XmlMDataXtd_TriangulationDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/********************
* class XmlMDataXtd *
********************/
%rename(xmlmdataxtd) XmlMDataXtd;
class XmlMDataXtd {
	public:
		/****************** AddDrivers ******************/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "* Adds the attribute drivers to <aDriverTable>.
	:param aDriverTable:
	:type aDriverTable: XmlMDF_ADriverTable
	:param anMsgDrv:
	:type anMsgDrv: Message_Messenger
	:rtype: void") AddDrivers;
		static void AddDrivers (const opencascade::handle<XmlMDF_ADriverTable> & aDriverTable,const opencascade::handle<Message_Messenger> & anMsgDrv);

		/****************** DocumentVersion ******************/
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", ":rtype: int") DocumentVersion;
		static Standard_Integer DocumentVersion ();

		/****************** SetDocumentVersion ******************/
		%feature("compactdefaultargs") SetDocumentVersion;
		%feature("autodoc", ":param DocVersion:
	:type DocVersion: int
	:rtype: void") SetDocumentVersion;
		static void SetDocumentVersion (const Standard_Integer DocVersion);

};


%extend XmlMDataXtd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class XmlMDataXtd_AxisDriver *
*******************************/
class XmlMDataXtd_AxisDriver : public XmlMDF_ADriver {
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

		/****************** XmlMDataXtd_AxisDriver ******************/
		%feature("compactdefaultargs") XmlMDataXtd_AxisDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") XmlMDataXtd_AxisDriver;
		 XmlMDataXtd_AxisDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlMDataXtd_AxisDriver)

%extend XmlMDataXtd_AxisDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class XmlMDataXtd_ConstraintDriver *
*************************************/
class XmlMDataXtd_ConstraintDriver : public XmlMDF_ADriver {
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

		/****************** XmlMDataXtd_ConstraintDriver ******************/
		%feature("compactdefaultargs") XmlMDataXtd_ConstraintDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") XmlMDataXtd_ConstraintDriver;
		 XmlMDataXtd_ConstraintDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlMDataXtd_ConstraintDriver)

%extend XmlMDataXtd_ConstraintDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class XmlMDataXtd_GeometryDriver *
***********************************/
class XmlMDataXtd_GeometryDriver : public XmlMDF_ADriver {
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

		/****************** XmlMDataXtd_GeometryDriver ******************/
		%feature("compactdefaultargs") XmlMDataXtd_GeometryDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") XmlMDataXtd_GeometryDriver;
		 XmlMDataXtd_GeometryDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlMDataXtd_GeometryDriver)

%extend XmlMDataXtd_GeometryDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class XmlMDataXtd_PatternStdDriver *
*************************************/
class XmlMDataXtd_PatternStdDriver : public XmlMDF_ADriver {
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

		/****************** XmlMDataXtd_PatternStdDriver ******************/
		%feature("compactdefaultargs") XmlMDataXtd_PatternStdDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") XmlMDataXtd_PatternStdDriver;
		 XmlMDataXtd_PatternStdDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlMDataXtd_PatternStdDriver)

%extend XmlMDataXtd_PatternStdDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class XmlMDataXtd_PlacementDriver *
************************************/
class XmlMDataXtd_PlacementDriver : public XmlMDF_ADriver {
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

		/****************** XmlMDataXtd_PlacementDriver ******************/
		%feature("compactdefaultargs") XmlMDataXtd_PlacementDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") XmlMDataXtd_PlacementDriver;
		 XmlMDataXtd_PlacementDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlMDataXtd_PlacementDriver)

%extend XmlMDataXtd_PlacementDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class XmlMDataXtd_PlaneDriver *
********************************/
class XmlMDataXtd_PlaneDriver : public XmlMDF_ADriver {
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

		/****************** XmlMDataXtd_PlaneDriver ******************/
		%feature("compactdefaultargs") XmlMDataXtd_PlaneDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") XmlMDataXtd_PlaneDriver;
		 XmlMDataXtd_PlaneDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlMDataXtd_PlaneDriver)

%extend XmlMDataXtd_PlaneDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class XmlMDataXtd_PointDriver *
********************************/
class XmlMDataXtd_PointDriver : public XmlMDF_ADriver {
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

		/****************** XmlMDataXtd_PointDriver ******************/
		%feature("compactdefaultargs") XmlMDataXtd_PointDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") XmlMDataXtd_PointDriver;
		 XmlMDataXtd_PointDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlMDataXtd_PointDriver)

%extend XmlMDataXtd_PointDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class XmlMDataXtd_PositionDriver *
***********************************/
class XmlMDataXtd_PositionDriver : public XmlMDF_ADriver {
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

		/****************** XmlMDataXtd_PositionDriver ******************/
		%feature("compactdefaultargs") XmlMDataXtd_PositionDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") XmlMDataXtd_PositionDriver;
		 XmlMDataXtd_PositionDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlMDataXtd_PositionDriver)

%extend XmlMDataXtd_PositionDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class XmlMDataXtd_PresentationDriver *
***************************************/
class XmlMDataXtd_PresentationDriver : public XmlMDF_ADriver {
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

		/****************** XmlMDataXtd_PresentationDriver ******************/
		%feature("compactdefaultargs") XmlMDataXtd_PresentationDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") XmlMDataXtd_PresentationDriver;
		 XmlMDataXtd_PresentationDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlMDataXtd_PresentationDriver)

%extend XmlMDataXtd_PresentationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class XmlMDataXtd_ShapeDriver *
********************************/
class XmlMDataXtd_ShapeDriver : public XmlMDF_ADriver {
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

		/****************** XmlMDataXtd_ShapeDriver ******************/
		%feature("compactdefaultargs") XmlMDataXtd_ShapeDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") XmlMDataXtd_ShapeDriver;
		 XmlMDataXtd_ShapeDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlMDataXtd_ShapeDriver)

%extend XmlMDataXtd_ShapeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class XmlMDataXtd_TriangulationDriver *
****************************************/
class XmlMDataXtd_TriangulationDriver : public XmlMDF_ADriver {
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

		/****************** XmlMDataXtd_TriangulationDriver ******************/
		%feature("compactdefaultargs") XmlMDataXtd_TriangulationDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") XmlMDataXtd_TriangulationDriver;
		 XmlMDataXtd_TriangulationDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

};


%make_alias(XmlMDataXtd_TriangulationDriver)

%extend XmlMDataXtd_TriangulationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
