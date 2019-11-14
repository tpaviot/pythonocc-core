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

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define XMLMDATASTDDOCSTRING
"XmlMDataStd module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_XmlMDataStd.html"
%enddef
%module (package="OCC.Core", docstring=XMLMDATASTDDOCSTRING) XmlMDataStd

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


%{
#include<XmlMDataStd_module.hxx>

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
%wrap_handle(XmlMDataStd_AsciiStringDriver)
%wrap_handle(XmlMDataStd_BooleanArrayDriver)
%wrap_handle(XmlMDataStd_BooleanListDriver)
%wrap_handle(XmlMDataStd_ByteArrayDriver)
%wrap_handle(XmlMDataStd_CommentDriver)
%wrap_handle(XmlMDataStd_DirectoryDriver)
%wrap_handle(XmlMDataStd_ExpressionDriver)
%wrap_handle(XmlMDataStd_ExtStringArrayDriver)
%wrap_handle(XmlMDataStd_ExtStringListDriver)
%wrap_handle(XmlMDataStd_IntPackedMapDriver)
%wrap_handle(XmlMDataStd_IntegerArrayDriver)
%wrap_handle(XmlMDataStd_IntegerDriver)
%wrap_handle(XmlMDataStd_IntegerListDriver)
%wrap_handle(XmlMDataStd_NameDriver)
%wrap_handle(XmlMDataStd_NamedDataDriver)
%wrap_handle(XmlMDataStd_NoteBookDriver)
%wrap_handle(XmlMDataStd_RealArrayDriver)
%wrap_handle(XmlMDataStd_RealDriver)
%wrap_handle(XmlMDataStd_RealListDriver)
%wrap_handle(XmlMDataStd_ReferenceArrayDriver)
%wrap_handle(XmlMDataStd_ReferenceListDriver)
%wrap_handle(XmlMDataStd_RelationDriver)
%wrap_handle(XmlMDataStd_TickDriver)
%wrap_handle(XmlMDataStd_TreeNodeDriver)
%wrap_handle(XmlMDataStd_UAttributeDriver)
%wrap_handle(XmlMDataStd_VariableDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%rename(xmlmdatastd) XmlMDataStd;
class XmlMDataStd {
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


%extend XmlMDataStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_AsciiStringDriver;
class XmlMDataStd_AsciiStringDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* persistent -> transient (retrieve)

	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* transient -> persistent (store)

	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
		%feature("compactdefaultargs") XmlMDataStd_AsciiStringDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_AsciiStringDriver;
		 XmlMDataStd_AsciiStringDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_AsciiStringDriver)

%extend XmlMDataStd_AsciiStringDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_BooleanArrayDriver;
class XmlMDataStd_BooleanArrayDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_BooleanArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_BooleanArrayDriver;
		 XmlMDataStd_BooleanArrayDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_BooleanArrayDriver)

%extend XmlMDataStd_BooleanArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_BooleanListDriver;
class XmlMDataStd_BooleanListDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_BooleanListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_BooleanListDriver;
		 XmlMDataStd_BooleanListDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_BooleanListDriver)

%extend XmlMDataStd_BooleanListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_ByteArrayDriver;
class XmlMDataStd_ByteArrayDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_ByteArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_ByteArrayDriver;
		 XmlMDataStd_ByteArrayDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_ByteArrayDriver)

%extend XmlMDataStd_ByteArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_CommentDriver;
class XmlMDataStd_CommentDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_CommentDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_CommentDriver;
		 XmlMDataStd_CommentDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_CommentDriver)

%extend XmlMDataStd_CommentDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_DirectoryDriver;
class XmlMDataStd_DirectoryDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_DirectoryDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_DirectoryDriver;
		 XmlMDataStd_DirectoryDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_DirectoryDriver)

%extend XmlMDataStd_DirectoryDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_ExpressionDriver;
class XmlMDataStd_ExpressionDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_ExpressionDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_ExpressionDriver;
		 XmlMDataStd_ExpressionDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_ExpressionDriver)

%extend XmlMDataStd_ExpressionDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_ExtStringArrayDriver;
class XmlMDataStd_ExtStringArrayDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_ExtStringArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_ExtStringArrayDriver;
		 XmlMDataStd_ExtStringArrayDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_ExtStringArrayDriver)

%extend XmlMDataStd_ExtStringArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_ExtStringListDriver;
class XmlMDataStd_ExtStringListDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_ExtStringListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_ExtStringListDriver;
		 XmlMDataStd_ExtStringListDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_ExtStringListDriver)

%extend XmlMDataStd_ExtStringListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_IntPackedMapDriver;
class XmlMDataStd_IntPackedMapDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* persistent -> transient (retrieve)

	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* transient -> persistent (store)

	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
		%feature("compactdefaultargs") XmlMDataStd_IntPackedMapDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_IntPackedMapDriver;
		 XmlMDataStd_IntPackedMapDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_IntPackedMapDriver)

%extend XmlMDataStd_IntPackedMapDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_IntegerArrayDriver;
class XmlMDataStd_IntegerArrayDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_IntegerArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_IntegerArrayDriver;
		 XmlMDataStd_IntegerArrayDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_IntegerArrayDriver)

%extend XmlMDataStd_IntegerArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_IntegerDriver;
class XmlMDataStd_IntegerDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_IntegerDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_IntegerDriver;
		 XmlMDataStd_IntegerDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_IntegerDriver)

%extend XmlMDataStd_IntegerDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_IntegerListDriver;
class XmlMDataStd_IntegerListDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_IntegerListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_IntegerListDriver;
		 XmlMDataStd_IntegerListDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_IntegerListDriver)

%extend XmlMDataStd_IntegerListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_NameDriver;
class XmlMDataStd_NameDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_NameDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_NameDriver;
		 XmlMDataStd_NameDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_NameDriver)

%extend XmlMDataStd_NameDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_NamedDataDriver;
class XmlMDataStd_NamedDataDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_NamedDataDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_NamedDataDriver;
		 XmlMDataStd_NamedDataDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_NamedDataDriver)

%extend XmlMDataStd_NamedDataDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_NoteBookDriver;
class XmlMDataStd_NoteBookDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_NoteBookDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_NoteBookDriver;
		 XmlMDataStd_NoteBookDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_NoteBookDriver)

%extend XmlMDataStd_NoteBookDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_RealArrayDriver;
class XmlMDataStd_RealArrayDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_RealArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_RealArrayDriver;
		 XmlMDataStd_RealArrayDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_RealArrayDriver)

%extend XmlMDataStd_RealArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_RealDriver;
class XmlMDataStd_RealDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_RealDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_RealDriver;
		 XmlMDataStd_RealDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_RealDriver)

%extend XmlMDataStd_RealDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_RealListDriver;
class XmlMDataStd_RealListDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_RealListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_RealListDriver;
		 XmlMDataStd_RealListDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_RealListDriver)

%extend XmlMDataStd_RealListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_ReferenceArrayDriver;
class XmlMDataStd_ReferenceArrayDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_ReferenceArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_ReferenceArrayDriver;
		 XmlMDataStd_ReferenceArrayDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_ReferenceArrayDriver)

%extend XmlMDataStd_ReferenceArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_ReferenceListDriver;
class XmlMDataStd_ReferenceListDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_ReferenceListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_ReferenceListDriver;
		 XmlMDataStd_ReferenceListDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_ReferenceListDriver)

%extend XmlMDataStd_ReferenceListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_RelationDriver;
class XmlMDataStd_RelationDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_RelationDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_RelationDriver;
		 XmlMDataStd_RelationDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_RelationDriver)

%extend XmlMDataStd_RelationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_TickDriver;
class XmlMDataStd_TickDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_TickDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_TickDriver;
		 XmlMDataStd_TickDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_TickDriver)

%extend XmlMDataStd_TickDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_TreeNodeDriver;
class XmlMDataStd_TreeNodeDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_TreeNodeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_TreeNodeDriver;
		 XmlMDataStd_TreeNodeDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_TreeNodeDriver)

%extend XmlMDataStd_TreeNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_UAttributeDriver;
class XmlMDataStd_UAttributeDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_UAttributeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_UAttributeDriver;
		 XmlMDataStd_UAttributeDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_UAttributeDriver)

%extend XmlMDataStd_UAttributeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_VariableDriver;
class XmlMDataStd_VariableDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDataStd_VariableDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDataStd_VariableDriver;
		 XmlMDataStd_VariableDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDataStd_VariableDriver)

%extend XmlMDataStd_VariableDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
