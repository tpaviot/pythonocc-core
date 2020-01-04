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
%define BINMDFDOCSTRING
"BinMDF module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_binmdf.html"
%enddef
%module (package="OCC.Core", docstring=BINMDFDOCSTRING) BinMDF


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
#include<BinMDF_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<TDF_module.hxx>
#include<BinObjMgt_module.hxx>
#include<TCollection_module.hxx>
#include<Resource_module.hxx>
#include<TDF_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import Message.i
%import TDF.i
%import BinObjMgt.i
%import TCollection.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(BinMDF_ADriver)
%wrap_handle(BinMDF_ADriverTable)
%wrap_handle(BinMDF_ReferenceDriver)
%wrap_handle(BinMDF_TagSourceDriver)
/* end handles declaration */

/* templates */
%template(BinMDF_TypeIdMap) NCollection_DoubleMap <opencascade::handle <Standard_Type>, Standard_Integer , TColStd_MapTransientHasher , TColStd_MapIntegerHasher>;
%template(BinMDF_TypeADriverMap) NCollection_DataMap <opencascade::handle <Standard_Type>, opencascade::handle <BinMDF_ADriver>, TColStd_MapTransientHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DoubleMap <opencascade::handle <Standard_Type>, Standard_Integer , TColStd_MapTransientHasher , TColStd_MapIntegerHasher> BinMDF_TypeIdMap;
typedef NCollection_DoubleMap <opencascade::handle <Standard_Type>, Standard_Integer , TColStd_MapTransientHasher , TColStd_MapIntegerHasher>::Iterator BinMDF_DoubleMapIteratorOfTypeIdMap;
typedef NCollection_DataMap <opencascade::handle <Standard_Type>, opencascade::handle <BinMDF_ADriver>, TColStd_MapTransientHasher> BinMDF_TypeADriverMap;
typedef NCollection_DataMap <opencascade::handle <Standard_Type>, opencascade::handle <BinMDF_ADriver>, TColStd_MapTransientHasher>::Iterator BinMDF_DataMapIteratorOfTypeADriverMap;
typedef TColStd_DataMapOfAsciiStringInteger BinMDF_StringIdMap;
/* end typedefs declaration */

/***************
* class BinMDF *
***************/
%rename(binmdf) BinMDF;
class BinMDF {
	public:
		/****************** AddDrivers ******************/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "* Adds the attribute storage drivers to <aDriverTable>.
	:param aDriverTable:
	:type aDriverTable: BinMDF_ADriverTable
	:param aMsgDrv:
	:type aMsgDrv: Message_Messenger
	:rtype: void") AddDrivers;
		static void AddDrivers (const opencascade::handle<BinMDF_ADriverTable> & aDriverTable,const opencascade::handle<Message_Messenger> & aMsgDrv);

};


%extend BinMDF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BinMDF_ADriver *
***********************/
%nodefaultctor BinMDF_ADriver;
class BinMDF_ADriver : public Standard_Transient {
	public:
		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "* Creates a new attribute from TDF.
	:rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "* Translate the contents of <aSource> and put it into <aTarget>, using the relocation table <aRelocTable> to keep the sharings.
	:param aSource:
	:type aSource: BinObjMgt_Persistent
	:param aTarget:
	:type aTarget: TDF_Attribute
	:param aRelocTable:
	:type aRelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & aSource,const opencascade::handle<TDF_Attribute> & aTarget,BinObjMgt_RRelocationTable & aRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "* Translate the contents of <aSource> and put it into <aTarget>, using the relocation table <aRelocTable> to keep the sharings.
	:param aSource:
	:type aSource: TDF_Attribute
	:param aTarget:
	:type aTarget: BinObjMgt_Persistent
	:param aRelocTable:
	:type aRelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & aSource,BinObjMgt_Persistent & aTarget,BinObjMgt_SRelocationTable & aRelocTable);

		/****************** SourceType ******************/
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "* Returns the type of source object, inheriting from Attribute from TDF.
	:rtype: opencascade::handle<Standard_Type>") SourceType;
		const opencascade::handle<Standard_Type> & SourceType ();

		/****************** TypeName ******************/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "* Returns the type name of the attribute object
	:rtype: TCollection_AsciiString") TypeName;
		const TCollection_AsciiString & TypeName ();

};


%make_alias(BinMDF_ADriver)

%extend BinMDF_ADriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BinMDF_ADriverTable *
****************************/
class BinMDF_ADriverTable : public Standard_Transient {
	public:
		/****************** AddDriver ******************/
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "* Adds a translation driver <theDriver>.
	:param theDriver:
	:type theDriver: BinMDF_ADriver
	:rtype: None") AddDriver;
		void AddDriver (const opencascade::handle<BinMDF_ADriver> & theDriver);

		/****************** AssignIds ******************/
		%feature("compactdefaultargs") AssignIds;
		%feature("autodoc", "* Assigns the IDs to the drivers of the given Types. It uses indices in the map as IDs. Useful in storage procedure.
	:param theTypes:
	:type theTypes: TColStd_IndexedMapOfTransient
	:rtype: None") AssignIds;
		void AssignIds (const TColStd_IndexedMapOfTransient & theTypes);

		/****************** AssignIds ******************/
		%feature("compactdefaultargs") AssignIds;
		%feature("autodoc", "* Assigns the IDs to the drivers of the given Type Names; It uses indices in the sequence as IDs. Useful in retrieval procedure.
	:param theTypeNames:
	:type theTypeNames: TColStd_SequenceOfAsciiString
	:rtype: None") AssignIds;
		void AssignIds (const TColStd_SequenceOfAsciiString & theTypeNames);

		/****************** BinMDF_ADriverTable ******************/
		%feature("compactdefaultargs") BinMDF_ADriverTable;
		%feature("autodoc", "* Constructor
	:rtype: None") BinMDF_ADriverTable;
		 BinMDF_ADriverTable ();

		/****************** GetDriver ******************/
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "* Gets a driver <theDriver> according to <theType>. Returns Type ID if the driver was assigned an ID; 0 otherwise.
	:param theType:
	:type theType: Standard_Type
	:param theDriver:
	:type theDriver: BinMDF_ADriver
	:rtype: int") GetDriver;
		Standard_Integer GetDriver (const opencascade::handle<Standard_Type> & theType,opencascade::handle<BinMDF_ADriver> & theDriver);

		/****************** GetDriver ******************/
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "* Returns a driver according to <theTypeId>. Returns null handle if a driver is not found
	:param theTypeId:
	:type theTypeId: int
	:rtype: opencascade::handle<BinMDF_ADriver>") GetDriver;
		opencascade::handle<BinMDF_ADriver> GetDriver (const Standard_Integer theTypeId);

};


%make_alias(BinMDF_ADriverTable)

%extend BinMDF_ADriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BinMDF_ReferenceDriver *
*******************************/
class BinMDF_ReferenceDriver : public BinMDF_ADriver {
	public:
		/****************** BinMDF_ReferenceDriver ******************/
		%feature("compactdefaultargs") BinMDF_ReferenceDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") BinMDF_ReferenceDriver;
		 BinMDF_ReferenceDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: BinObjMgt_Persistent
	:param Target:
	:type Target: TDF_Attribute
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,BinObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: TDF_Attribute
	:param Target:
	:type Target: BinObjMgt_Persistent
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDF_ReferenceDriver)

%extend BinMDF_ReferenceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BinMDF_TagSourceDriver *
*******************************/
class BinMDF_TagSourceDriver : public BinMDF_ADriver {
	public:
		/****************** BinMDF_TagSourceDriver ******************/
		%feature("compactdefaultargs") BinMDF_TagSourceDriver;
		%feature("autodoc", ":param theMessageDriver:
	:type theMessageDriver: Message_Messenger
	:rtype: None") BinMDF_TagSourceDriver;
		 BinMDF_TagSourceDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: BinObjMgt_Persistent
	:param Target:
	:type Target: TDF_Attribute
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable
	:rtype: bool") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const opencascade::handle<TDF_Attribute> & Target,BinObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Source:
	:type Source: TDF_Attribute
	:param Target:
	:type Target: BinObjMgt_Persistent
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDF_TagSourceDriver)

%extend BinMDF_TagSourceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
