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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- time : 2019-11-03 11:38:44
- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define XMLMXCAFDOCDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=XMLMXCAFDOCDOCSTRING) XmlMXCAFDoc

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include XmlMXCAFDoc_headers.i

/* public enums */
/* end public enums declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

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

%rename(xmlmxcafdoc) XmlMXCAFDoc;
class XmlMXCAFDoc {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute drivers to <aDriverTable>.

	:param aDriverTable:
	:type aDriverTable: opencascade::handle<XmlMDF_ADriverTable> &
	:param anMsgDrv:
	:type anMsgDrv: opencascade::handle<Message_Messenger> &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const opencascade::handle<XmlMDF_ADriverTable> & aDriverTable,const opencascade::handle<Message_Messenger> & anMsgDrv);
};


%extend XmlMXCAFDoc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_AreaDriver;
class XmlMXCAFDoc_AreaDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_AreaDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_AreaDriver;
		 XmlMXCAFDoc_AreaDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMXCAFDoc_AreaDriver)

%extend XmlMXCAFDoc_AreaDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_AssemblyItemRefDriver;
class XmlMXCAFDoc_AssemblyItemRefDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_AssemblyItemRefDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_AssemblyItemRefDriver;
		 XmlMXCAFDoc_AssemblyItemRefDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMXCAFDoc_AssemblyItemRefDriver)

%extend XmlMXCAFDoc_AssemblyItemRefDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_CentroidDriver;
class XmlMXCAFDoc_CentroidDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_CentroidDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_CentroidDriver;
		 XmlMXCAFDoc_CentroidDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMXCAFDoc_CentroidDriver)

%extend XmlMXCAFDoc_CentroidDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_ClippingPlaneToolDriver;
class XmlMXCAFDoc_ClippingPlaneToolDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_ClippingPlaneToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_ClippingPlaneToolDriver;
		 XmlMXCAFDoc_ClippingPlaneToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);
};


%make_alias(XmlMXCAFDoc_ClippingPlaneToolDriver)

%extend XmlMXCAFDoc_ClippingPlaneToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_ColorDriver;
class XmlMXCAFDoc_ColorDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_ColorDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_ColorDriver;
		 XmlMXCAFDoc_ColorDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMXCAFDoc_ColorDriver)

%extend XmlMXCAFDoc_ColorDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_ColorToolDriver;
class XmlMXCAFDoc_ColorToolDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_ColorToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_ColorToolDriver;
		 XmlMXCAFDoc_ColorToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);
};


%make_alias(XmlMXCAFDoc_ColorToolDriver)

%extend XmlMXCAFDoc_ColorToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_DatumDriver;
class XmlMXCAFDoc_DatumDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_DatumDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_DatumDriver;
		 XmlMXCAFDoc_DatumDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMXCAFDoc_DatumDriver)

%extend XmlMXCAFDoc_DatumDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_DimTolDriver;
class XmlMXCAFDoc_DimTolDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_DimTolDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_DimTolDriver;
		 XmlMXCAFDoc_DimTolDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMXCAFDoc_DimTolDriver)

%extend XmlMXCAFDoc_DimTolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_DimTolToolDriver;
class XmlMXCAFDoc_DimTolToolDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_DimTolToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_DimTolToolDriver;
		 XmlMXCAFDoc_DimTolToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);
};


%make_alias(XmlMXCAFDoc_DimTolToolDriver)

%extend XmlMXCAFDoc_DimTolToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_DocumentToolDriver;
class XmlMXCAFDoc_DocumentToolDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_DocumentToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_DocumentToolDriver;
		 XmlMXCAFDoc_DocumentToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);
};


%make_alias(XmlMXCAFDoc_DocumentToolDriver)

%extend XmlMXCAFDoc_DocumentToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_GraphNodeDriver;
class XmlMXCAFDoc_GraphNodeDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_GraphNodeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_GraphNodeDriver;
		 XmlMXCAFDoc_GraphNodeDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMXCAFDoc_GraphNodeDriver)

%extend XmlMXCAFDoc_GraphNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_LayerToolDriver;
class XmlMXCAFDoc_LayerToolDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_LayerToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_LayerToolDriver;
		 XmlMXCAFDoc_LayerToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);
};


%make_alias(XmlMXCAFDoc_LayerToolDriver)

%extend XmlMXCAFDoc_LayerToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_LocationDriver;
class XmlMXCAFDoc_LocationDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
		%feature("compactdefaultargs") SetSharedLocations;
		%feature("autodoc", "	:param theLocations:
	:type theLocations: TopTools_LocationSetPtr &
	:rtype: None
") SetSharedLocations;
		void SetSharedLocations (const TopTools_LocationSetPtr & theLocations);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Translate a non storable Location to a storable Location.

	:param theLoc:
	:type theLoc: TopLoc_Location &
	:param theParent:
	:type theParent: XmlObjMgt_Element &
	:param theMap:
	:type theMap: XmlObjMgt_SRelocationTable &
	:rtype: None
") Translate;
		void Translate (const TopLoc_Location & theLoc,XmlObjMgt_Element & theParent,XmlObjMgt_SRelocationTable & theMap);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Translate a storable Location to a non storable Location.

	:param theParent:
	:type theParent: XmlObjMgt_Element &
	:param theLoc:
	:type theLoc: TopLoc_Location &
	:param theMap:
	:type theMap: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Translate;
		Standard_Boolean Translate (const XmlObjMgt_Element & theParent,TopLoc_Location & theLoc,XmlObjMgt_RRelocationTable & theMap);
		%feature("compactdefaultargs") XmlMXCAFDoc_LocationDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_LocationDriver;
		 XmlMXCAFDoc_LocationDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMXCAFDoc_LocationDriver)

%extend XmlMXCAFDoc_LocationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_MaterialDriver;
class XmlMXCAFDoc_MaterialDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_MaterialDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_MaterialDriver;
		 XmlMXCAFDoc_MaterialDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMXCAFDoc_MaterialDriver)

%extend XmlMXCAFDoc_MaterialDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_MaterialToolDriver;
class XmlMXCAFDoc_MaterialToolDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_MaterialToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_MaterialToolDriver;
		 XmlMXCAFDoc_MaterialToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);
};


%make_alias(XmlMXCAFDoc_MaterialToolDriver)

%extend XmlMXCAFDoc_MaterialToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_NoteDriver;
class XmlMXCAFDoc_NoteDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(XmlMXCAFDoc_NoteDriver)

%extend XmlMXCAFDoc_NoteDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_NotesToolDriver;
class XmlMXCAFDoc_NotesToolDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_NotesToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_NotesToolDriver;
		 XmlMXCAFDoc_NotesToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);
};


%make_alias(XmlMXCAFDoc_NotesToolDriver)

%extend XmlMXCAFDoc_NotesToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_ShapeToolDriver;
class XmlMXCAFDoc_ShapeToolDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_ShapeToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_ShapeToolDriver;
		 XmlMXCAFDoc_ShapeToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);
};


%make_alias(XmlMXCAFDoc_ShapeToolDriver)

%extend XmlMXCAFDoc_ShapeToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_ViewToolDriver;
class XmlMXCAFDoc_ViewToolDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_ViewToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_ViewToolDriver;
		 XmlMXCAFDoc_ViewToolDriver (const opencascade::handle<Message_Messenger> & theMsgDriver);
};


%make_alias(XmlMXCAFDoc_ViewToolDriver)

%extend XmlMXCAFDoc_ViewToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_VolumeDriver;
class XmlMXCAFDoc_VolumeDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_VolumeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_VolumeDriver;
		 XmlMXCAFDoc_VolumeDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMXCAFDoc_VolumeDriver)

%extend XmlMXCAFDoc_VolumeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_NoteBinDataDriver;
class XmlMXCAFDoc_NoteBinDataDriver : public XmlMXCAFDoc_NoteDriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_NoteBinDataDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_NoteBinDataDriver;
		 XmlMXCAFDoc_NoteBinDataDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMXCAFDoc_NoteBinDataDriver)

%extend XmlMXCAFDoc_NoteBinDataDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_NoteCommentDriver;
class XmlMXCAFDoc_NoteCommentDriver : public XmlMXCAFDoc_NoteDriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") XmlMXCAFDoc_NoteCommentDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_NoteCommentDriver;
		 XmlMXCAFDoc_NoteCommentDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMXCAFDoc_NoteCommentDriver)

%extend XmlMXCAFDoc_NoteCommentDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMXCAFDoc_NoteBalloonDriver;
class XmlMXCAFDoc_NoteBalloonDriver : public XmlMXCAFDoc_NoteCommentDriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") XmlMXCAFDoc_NoteBalloonDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMXCAFDoc_NoteBalloonDriver;
		 XmlMXCAFDoc_NoteBalloonDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMXCAFDoc_NoteBalloonDriver)

%extend XmlMXCAFDoc_NoteBalloonDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
