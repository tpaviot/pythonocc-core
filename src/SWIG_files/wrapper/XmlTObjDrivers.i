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
%define XMLTOBJDRIVERSDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=XMLTOBJDRIVERSDOCSTRING) XmlTObjDrivers

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


%include XmlTObjDrivers_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(XmlTObjDrivers_DocumentRetrievalDriver)
%wrap_handle(XmlTObjDrivers_DocumentStorageDriver)
%wrap_handle(XmlTObjDrivers_IntSparseArrayDriver)
%wrap_handle(XmlTObjDrivers_ModelDriver)
%wrap_handle(XmlTObjDrivers_ObjectDriver)
%wrap_handle(XmlTObjDrivers_ReferenceDriver)
%wrap_handle(XmlTObjDrivers_XYZDriver)

%rename(xmltobjdrivers) XmlTObjDrivers;
%nodefaultctor XmlTObjDrivers;
class XmlTObjDrivers {
	public:
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "	:param aGUID:
	:type aGUID: Standard_GUID &
	:rtype: Handle_Standard_Transient
") Factory;
		static Handle_Standard_Transient Factory (const Standard_GUID & aGUID);
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	:param aDriverTable:
	:type aDriverTable: Handle_XmlMDF_ADriverTable &
	:param anMsgDrv:
	:type anMsgDrv: Handle_CDM_MessageDriver &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const Handle_XmlMDF_ADriverTable & aDriverTable,const Handle_CDM_MessageDriver & anMsgDrv);
};


%extend XmlTObjDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlTObjDrivers_DocumentRetrievalDriver;
class XmlTObjDrivers_DocumentRetrievalDriver : public XmlLDrivers_DocumentRetrievalDriver {
	public:
		%feature("compactdefaultargs") XmlTObjDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "	:rtype: None
") XmlTObjDrivers_DocumentRetrievalDriver;
		 XmlTObjDrivers_DocumentRetrievalDriver ();
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_XmlMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_XmlMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%make_alias(XmlTObjDrivers_DocumentRetrievalDriver)

%extend XmlTObjDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlTObjDrivers_DocumentStorageDriver;
class XmlTObjDrivers_DocumentStorageDriver : public XmlLDrivers_DocumentStorageDriver {
	public:
		%feature("compactdefaultargs") XmlTObjDrivers_DocumentStorageDriver;
		%feature("autodoc", "	:param theCopyright:
	:type theCopyright: TCollection_ExtendedString &
	:rtype: None
") XmlTObjDrivers_DocumentStorageDriver;
		 XmlTObjDrivers_DocumentStorageDriver (const TCollection_ExtendedString & theCopyright);
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_XmlMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_XmlMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%make_alias(XmlTObjDrivers_DocumentStorageDriver)

%extend XmlTObjDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlTObjDrivers_IntSparseArrayDriver;
class XmlTObjDrivers_IntSparseArrayDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlTObjDrivers_IntSparseArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlTObjDrivers_IntSparseArrayDriver;
		 XmlTObjDrivers_IntSparseArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(XmlTObjDrivers_IntSparseArrayDriver)

%extend XmlTObjDrivers_IntSparseArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlTObjDrivers_ModelDriver;
class XmlTObjDrivers_ModelDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlTObjDrivers_ModelDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlTObjDrivers_ModelDriver;
		 XmlTObjDrivers_ModelDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
};


%make_alias(XmlTObjDrivers_ModelDriver)

%extend XmlTObjDrivers_ModelDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlTObjDrivers_ObjectDriver;
class XmlTObjDrivers_ObjectDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlTObjDrivers_ObjectDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlTObjDrivers_ObjectDriver;
		 XmlTObjDrivers_ObjectDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
};


%make_alias(XmlTObjDrivers_ObjectDriver)

%extend XmlTObjDrivers_ObjectDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlTObjDrivers_ReferenceDriver;
class XmlTObjDrivers_ReferenceDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlTObjDrivers_ReferenceDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlTObjDrivers_ReferenceDriver;
		 XmlTObjDrivers_ReferenceDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
};


%make_alias(XmlTObjDrivers_ReferenceDriver)

%extend XmlTObjDrivers_ReferenceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlTObjDrivers_XYZDriver;
class XmlTObjDrivers_XYZDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlTObjDrivers_XYZDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlTObjDrivers_XYZDriver;
		 XmlTObjDrivers_XYZDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
};


%make_alias(XmlTObjDrivers_XYZDriver)

%extend XmlTObjDrivers_XYZDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
