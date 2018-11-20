/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%define BINMDATASTDDOCSTRING
"Storage and Retrieval drivers for modelling attributes.
"
%enddef
%module (package="OCC.Core", docstring=BINMDATASTDDOCSTRING) BinMDataStd

#pragma SWIG nowarn=504,325,503

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


%include BinMDataStd_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(BinMDataStd_AsciiStringDriver)
%wrap_handle(BinMDataStd_BooleanArrayDriver)
%wrap_handle(BinMDataStd_BooleanListDriver)
%wrap_handle(BinMDataStd_ByteArrayDriver)
%wrap_handle(BinMDataStd_CommentDriver)
%wrap_handle(BinMDataStd_DirectoryDriver)
%wrap_handle(BinMDataStd_ExpressionDriver)
%wrap_handle(BinMDataStd_ExtStringArrayDriver)
%wrap_handle(BinMDataStd_ExtStringListDriver)
%wrap_handle(BinMDataStd_IntPackedMapDriver)
%wrap_handle(BinMDataStd_IntegerArrayDriver)
%wrap_handle(BinMDataStd_IntegerDriver)
%wrap_handle(BinMDataStd_IntegerListDriver)
%wrap_handle(BinMDataStd_NameDriver)
%wrap_handle(BinMDataStd_NamedDataDriver)
%wrap_handle(BinMDataStd_NoteBookDriver)
%wrap_handle(BinMDataStd_RealArrayDriver)
%wrap_handle(BinMDataStd_RealDriver)
%wrap_handle(BinMDataStd_RealListDriver)
%wrap_handle(BinMDataStd_ReferenceArrayDriver)
%wrap_handle(BinMDataStd_ReferenceListDriver)
%wrap_handle(BinMDataStd_RelationDriver)
%wrap_handle(BinMDataStd_TickDriver)
%wrap_handle(BinMDataStd_TreeNodeDriver)
%wrap_handle(BinMDataStd_UAttributeDriver)
%wrap_handle(BinMDataStd_VariableDriver)

%rename(binmdatastd) BinMDataStd;
class BinMDataStd {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute drivers to <theDriverTable>.

	:param theDriverTable:
	:type theDriverTable: Handle_BinMDF_ADriverTable &
	:param aMsgDrv:
	:type aMsgDrv: Handle_CDM_MessageDriver &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const Handle_BinMDF_ADriverTable & theDriverTable,const Handle_CDM_MessageDriver & aMsgDrv);
		%feature("compactdefaultargs") SetDocumentVersion;
		%feature("autodoc", "	:param DocVersion:
	:type DocVersion: int
	:rtype: void
") SetDocumentVersion;
		static void SetDocumentVersion (const Standard_Integer DocVersion);
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "	:rtype: int
") DocumentVersion;
		static Standard_Integer DocumentVersion ();
};


%extend BinMDataStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_AsciiStringDriver;
class BinMDataStd_AsciiStringDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_AsciiStringDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_AsciiStringDriver;
		 BinMDataStd_AsciiStringDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* persistent -> transient (retrieve)

	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* transient -> persistent (store)

	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_AsciiStringDriver)

%extend BinMDataStd_AsciiStringDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_BooleanArrayDriver;
class BinMDataStd_BooleanArrayDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_BooleanArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_BooleanArrayDriver;
		 BinMDataStd_BooleanArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_BooleanArrayDriver)

%extend BinMDataStd_BooleanArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_BooleanListDriver;
class BinMDataStd_BooleanListDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_BooleanListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_BooleanListDriver;
		 BinMDataStd_BooleanListDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_BooleanListDriver)

%extend BinMDataStd_BooleanListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_ByteArrayDriver;
class BinMDataStd_ByteArrayDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_ByteArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_ByteArrayDriver;
		 BinMDataStd_ByteArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_ByteArrayDriver)

%extend BinMDataStd_ByteArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_CommentDriver;
class BinMDataStd_CommentDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_CommentDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_CommentDriver;
		 BinMDataStd_CommentDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_CommentDriver)

%extend BinMDataStd_CommentDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_DirectoryDriver;
class BinMDataStd_DirectoryDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_DirectoryDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_DirectoryDriver;
		 BinMDataStd_DirectoryDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_DirectoryDriver)

%extend BinMDataStd_DirectoryDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_ExpressionDriver;
class BinMDataStd_ExpressionDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_ExpressionDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_ExpressionDriver;
		 BinMDataStd_ExpressionDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_ExpressionDriver)

%extend BinMDataStd_ExpressionDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_ExtStringArrayDriver;
class BinMDataStd_ExtStringArrayDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_ExtStringArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_ExtStringArrayDriver;
		 BinMDataStd_ExtStringArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_ExtStringArrayDriver)

%extend BinMDataStd_ExtStringArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_ExtStringListDriver;
class BinMDataStd_ExtStringListDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_ExtStringListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_ExtStringListDriver;
		 BinMDataStd_ExtStringListDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_ExtStringListDriver)

%extend BinMDataStd_ExtStringListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_IntPackedMapDriver;
class BinMDataStd_IntPackedMapDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_IntPackedMapDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_IntPackedMapDriver;
		 BinMDataStd_IntPackedMapDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* persistent -> transient (retrieve)

	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* transient -> persistent (store)

	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_IntPackedMapDriver)

%extend BinMDataStd_IntPackedMapDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_IntegerArrayDriver;
class BinMDataStd_IntegerArrayDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_IntegerArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_IntegerArrayDriver;
		 BinMDataStd_IntegerArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_IntegerArrayDriver)

%extend BinMDataStd_IntegerArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_IntegerDriver;
class BinMDataStd_IntegerDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_IntegerDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_IntegerDriver;
		 BinMDataStd_IntegerDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_IntegerDriver)

%extend BinMDataStd_IntegerDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_IntegerListDriver;
class BinMDataStd_IntegerListDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_IntegerListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_IntegerListDriver;
		 BinMDataStd_IntegerListDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_IntegerListDriver)

%extend BinMDataStd_IntegerListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_NameDriver;
class BinMDataStd_NameDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_NameDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_NameDriver;
		 BinMDataStd_NameDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* persistent -> transient (retrieve)

	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* transient -> persistent (store)

	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_NameDriver)

%extend BinMDataStd_NameDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_NamedDataDriver;
class BinMDataStd_NamedDataDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_NamedDataDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_NamedDataDriver;
		 BinMDataStd_NamedDataDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_NamedDataDriver)

%extend BinMDataStd_NamedDataDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_NoteBookDriver;
class BinMDataStd_NoteBookDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_NoteBookDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_NoteBookDriver;
		 BinMDataStd_NoteBookDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_NoteBookDriver)

%extend BinMDataStd_NoteBookDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_RealArrayDriver;
class BinMDataStd_RealArrayDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_RealArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_RealArrayDriver;
		 BinMDataStd_RealArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_RealArrayDriver)

%extend BinMDataStd_RealArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_RealDriver;
class BinMDataStd_RealDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_RealDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_RealDriver;
		 BinMDataStd_RealDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_RealDriver)

%extend BinMDataStd_RealDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_RealListDriver;
class BinMDataStd_RealListDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_RealListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_RealListDriver;
		 BinMDataStd_RealListDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_RealListDriver)

%extend BinMDataStd_RealListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_ReferenceArrayDriver;
class BinMDataStd_ReferenceArrayDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_ReferenceArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_ReferenceArrayDriver;
		 BinMDataStd_ReferenceArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_ReferenceArrayDriver)

%extend BinMDataStd_ReferenceArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_ReferenceListDriver;
class BinMDataStd_ReferenceListDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_ReferenceListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_ReferenceListDriver;
		 BinMDataStd_ReferenceListDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_ReferenceListDriver)

%extend BinMDataStd_ReferenceListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_RelationDriver;
class BinMDataStd_RelationDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_RelationDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_RelationDriver;
		 BinMDataStd_RelationDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_RelationDriver)

%extend BinMDataStd_RelationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_TickDriver;
class BinMDataStd_TickDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_TickDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_TickDriver;
		 BinMDataStd_TickDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_TickDriver)

%extend BinMDataStd_TickDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_TreeNodeDriver;
class BinMDataStd_TreeNodeDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_TreeNodeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_TreeNodeDriver;
		 BinMDataStd_TreeNodeDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_TreeNodeDriver)

%extend BinMDataStd_TreeNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_UAttributeDriver;
class BinMDataStd_UAttributeDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_UAttributeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_UAttributeDriver;
		 BinMDataStd_UAttributeDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_UAttributeDriver)

%extend BinMDataStd_UAttributeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_VariableDriver;
class BinMDataStd_VariableDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_VariableDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_VariableDriver;
		 BinMDataStd_VariableDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinMDataStd_VariableDriver)

%extend BinMDataStd_VariableDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
