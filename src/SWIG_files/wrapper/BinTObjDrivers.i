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
%define BINTOBJDRIVERSDOCSTRING
"BinTObjDrivers module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_bintobjdrivers.html"
%enddef
%module (package="OCC.Core", docstring=BINTOBJDRIVERSDOCSTRING) BinTObjDrivers


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
#include<BinTObjDrivers_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BinMDF_module.hxx>
#include<Message_module.hxx>
#include<TDocStd_module.hxx>
#include<BinLDrivers_module.hxx>
#include<TDF_module.hxx>
#include<BinObjMgt_module.hxx>
#include<Resource_module.hxx>
#include<PCDM_module.hxx>
#include<LDOM_module.hxx>
#include<CDF_module.hxx>
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
%import TDocStd.i
%import BinLDrivers.i
%import TDF.i
%import BinObjMgt.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(BinTObjDrivers_DocumentRetrievalDriver)
%wrap_handle(BinTObjDrivers_DocumentStorageDriver)
%wrap_handle(BinTObjDrivers_IntSparseArrayDriver)
%wrap_handle(BinTObjDrivers_ModelDriver)
%wrap_handle(BinTObjDrivers_ObjectDriver)
%wrap_handle(BinTObjDrivers_ReferenceDriver)
%wrap_handle(BinTObjDrivers_XYZDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%rename(bintobjdrivers) BinTObjDrivers;
%nodefaultctor BinTObjDrivers;
class BinTObjDrivers {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	:param aDriverTable:
	:type aDriverTable: opencascade::handle<BinMDF_ADriverTable> &
	:param aMsgDrv:
	:type aMsgDrv: opencascade::handle<Message_Messenger> &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const opencascade::handle<BinMDF_ADriverTable> & aDriverTable,const opencascade::handle<Message_Messenger> & aMsgDrv);
		%feature("compactdefaultargs") DefineFormat;
		%feature("autodoc", "	* Defines format 'TObjBin' and registers its read and write drivers in the specified application

	:param theApp:
	:type theApp: opencascade::handle<TDocStd_Application> &
	:rtype: void
") DefineFormat;
		static void DefineFormat (const opencascade::handle<TDocStd_Application> & theApp);
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "	:param aGUID:
	:type aGUID: Standard_GUID &
	:rtype: opencascade::handle<Standard_Transient>
") Factory;
		static const opencascade::handle<Standard_Transient> & Factory (const Standard_GUID & aGUID);
};


%extend BinTObjDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinTObjDrivers_DocumentRetrievalDriver;
class BinTObjDrivers_DocumentRetrievalDriver : public BinLDrivers_DocumentRetrievalDriver {
	public:
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: opencascade::handle<Message_Messenger> &
	:rtype: opencascade::handle<BinMDF_ADriverTable>
") AttributeDrivers;
		virtual opencascade::handle<BinMDF_ADriverTable> AttributeDrivers (const opencascade::handle<Message_Messenger> & theMsgDriver);
		%feature("compactdefaultargs") BinTObjDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "	:rtype: None
") BinTObjDrivers_DocumentRetrievalDriver;
		 BinTObjDrivers_DocumentRetrievalDriver ();
};


%make_alias(BinTObjDrivers_DocumentRetrievalDriver)

%extend BinTObjDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinTObjDrivers_DocumentStorageDriver;
class BinTObjDrivers_DocumentStorageDriver : public BinLDrivers_DocumentStorageDriver {
	public:
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: opencascade::handle<Message_Messenger> &
	:rtype: opencascade::handle<BinMDF_ADriverTable>
") AttributeDrivers;
		virtual opencascade::handle<BinMDF_ADriverTable> AttributeDrivers (const opencascade::handle<Message_Messenger> & theMsgDriver);
		%feature("compactdefaultargs") BinTObjDrivers_DocumentStorageDriver;
		%feature("autodoc", "	:rtype: None
") BinTObjDrivers_DocumentStorageDriver;
		 BinTObjDrivers_DocumentStorageDriver ();
};


%make_alias(BinTObjDrivers_DocumentStorageDriver)

%extend BinTObjDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinTObjDrivers_IntSparseArrayDriver;
class BinTObjDrivers_IntSparseArrayDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinTObjDrivers_IntSparseArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinTObjDrivers_IntSparseArrayDriver;
		 BinTObjDrivers_IntSparseArrayDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinTObjDrivers_IntSparseArrayDriver)

%extend BinTObjDrivers_IntSparseArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinTObjDrivers_ModelDriver;
class BinTObjDrivers_ModelDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinTObjDrivers_ModelDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinTObjDrivers_ModelDriver;
		 BinTObjDrivers_ModelDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinTObjDrivers_ModelDriver)

%extend BinTObjDrivers_ModelDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinTObjDrivers_ObjectDriver;
class BinTObjDrivers_ObjectDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinTObjDrivers_ObjectDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinTObjDrivers_ObjectDriver;
		 BinTObjDrivers_ObjectDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinTObjDrivers_ObjectDriver)

%extend BinTObjDrivers_ObjectDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinTObjDrivers_ReferenceDriver;
class BinTObjDrivers_ReferenceDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinTObjDrivers_ReferenceDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinTObjDrivers_ReferenceDriver;
		 BinTObjDrivers_ReferenceDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: opencascade::handle<TDF_Attribute> &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: opencascade::handle<TDF_Attribute> &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%make_alias(BinTObjDrivers_ReferenceDriver)

%extend BinTObjDrivers_ReferenceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinTObjDrivers_XYZDriver;
class BinTObjDrivers_XYZDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinTObjDrivers_XYZDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") BinTObjDrivers_XYZDriver;
		 BinTObjDrivers_XYZDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%make_alias(BinTObjDrivers_XYZDriver)

%extend BinTObjDrivers_XYZDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
