/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_binmdf.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i


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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BinMDF_ADriver)
%wrap_handle(BinMDF_ADriverTable)
%wrap_handle(BinMDF_DerivedDriver)
%wrap_handle(BinMDF_ReferenceDriver)
%wrap_handle(BinMDF_TagSourceDriver)
/* end handles declaration */

/* templates */
%template(BinMDF_TypeADriverMap) NCollection_DataMap<opencascade::handle<Standard_Type>,opencascade::handle<BinMDF_ADriver>>;
%template(BinMDF_TypeIdMap) NCollection_DoubleMap<opencascade::handle<Standard_Type>,Standard_Integer>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<opencascade::handle<Standard_Type>, opencascade::handle<BinMDF_ADriver>>::Iterator BinMDF_DataMapIteratorOfTypeADriverMap;
typedef NCollection_DoubleMap<opencascade::handle<Standard_Type>, Standard_Integer>::Iterator BinMDF_DoubleMapIteratorOfTypeIdMap;
typedef TColStd_DataMapOfAsciiStringInteger BinMDF_StringIdMap;
typedef NCollection_DataMap<opencascade::handle<Standard_Type>, opencascade::handle<BinMDF_ADriver>> BinMDF_TypeADriverMap;
typedef NCollection_DoubleMap<opencascade::handle<Standard_Type>, Standard_Integer> BinMDF_TypeIdMap;
/* end typedefs declaration */

/***************
* class BinMDF *
***************/
%rename(binmdf) BinMDF;
class BinMDF {
	public:
		/****************** AddDrivers ******************/
		/**** md5 signature: 9b16e0c464e556dc0dccd242954afcdf ****/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "
Parameters
----------
aDriverTable: BinMDF_ADriverTable
aMsgDrv: Message_Messenger

Return
-------
None

Description
-----------
Adds the attribute storage drivers to <adrivertable>.
") AddDrivers;
		static void AddDrivers(const opencascade::handle<BinMDF_ADriverTable> & aDriverTable, const opencascade::handle<Message_Messenger> & aMsgDrv);

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
		/****************** MessageDriver ******************/
		/**** md5 signature: a2961f713aaae0ef5d0be03881abc817 ****/
		%feature("compactdefaultargs") MessageDriver;
		%feature("autodoc", "Return
-------
opencascade::handle<Message_Messenger>

Description
-----------
Returns the current message driver of this driver.
") MessageDriver;
		const opencascade::handle<Message_Messenger> & MessageDriver();

		/****************** NewEmpty ******************/
		/**** md5 signature: 537251aec6cd2736ac1f1abe6868dc70 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Creates a new attribute from tdf.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: dc52286c6599841f40e4bb4abe81b8f2 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
aSource: BinObjMgt_Persistent
aTarget: TDF_Attribute
aRelocTable: BinObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
Translate the contents of <asource> and put it into <atarget>, using the relocation table <areloctable> to keep the sharings.
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & aSource, const opencascade::handle<TDF_Attribute> & aTarget, BinObjMgt_RRelocationTable & aRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 1c4ffe71c04d38a5ec160acbf17fa51f ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
aSource: TDF_Attribute
aTarget: BinObjMgt_Persistent
aRelocTable: BinObjMgt_SRelocationTable

Return
-------
None

Description
-----------
Translate the contents of <asource> and put it into <atarget>, using the relocation table <areloctable> to keep the sharings.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & aSource, BinObjMgt_Persistent & aTarget, BinObjMgt_SRelocationTable & aRelocTable);

		/****************** SourceType ******************/
		/**** md5 signature: b701df1c50a5570aedd2a6108c7e2344 ****/
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the type of source object, inheriting from attribute from tdf.
") SourceType;
		virtual const opencascade::handle<Standard_Type> & SourceType();

		/****************** TypeName ******************/
		/**** md5 signature: 191a1aa753fb8d39d56bcfd7505ea0e7 ****/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the type name of the attribute object.
") TypeName;
		const TCollection_AsciiString & TypeName();

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
		/****************** BinMDF_ADriverTable ******************/
		/**** md5 signature: 708f7239ec8de4f8ee5349a3633a9833 ****/
		%feature("compactdefaultargs") BinMDF_ADriverTable;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BinMDF_ADriverTable;
		 BinMDF_ADriverTable();

		/****************** AddDerivedDriver ******************/
		/**** md5 signature: d785bc7c368abacc51e9bcd52083ce5c ****/
		%feature("compactdefaultargs") AddDerivedDriver;
		%feature("autodoc", "
Parameters
----------
theInstance: TDF_Attribute

Return
-------
None

Description
-----------
Adds a translation driver for the derived attribute. the base driver must be already added. @param theinstance is newly created attribute, detached from any label.
") AddDerivedDriver;
		void AddDerivedDriver(const opencascade::handle<TDF_Attribute> & theInstance);

		/****************** AddDerivedDriver ******************/
		/**** md5 signature: c08557200bb111bac7324de5048e9e2d ****/
		%feature("compactdefaultargs") AddDerivedDriver;
		%feature("autodoc", "
Parameters
----------
theDerivedType: str

Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Adds a translation driver for the derived attribute. the base driver must be already added. @param thederivedtype is registered attribute type using implement_derived_attribute macro.
") AddDerivedDriver;
		const opencascade::handle<Standard_Type> & AddDerivedDriver(Standard_CString theDerivedType);

		/****************** AddDriver ******************/
		/**** md5 signature: b535a4822476bdd281f04ff4cdbaa916 ****/
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "
Parameters
----------
theDriver: BinMDF_ADriver

Return
-------
None

Description
-----------
Adds a translation driver <thedriver>.
") AddDriver;
		void AddDriver(const opencascade::handle<BinMDF_ADriver> & theDriver);

		/****************** AssignIds ******************/
		/**** md5 signature: fdb45c5b6ad6a92c237fc9cc5b5155a5 ****/
		%feature("compactdefaultargs") AssignIds;
		%feature("autodoc", "
Parameters
----------
theTypes: TColStd_IndexedMapOfTransient

Return
-------
None

Description
-----------
Assigns the ids to the drivers of the given types. it uses indices in the map as ids. useful in storage procedure.
") AssignIds;
		void AssignIds(const TColStd_IndexedMapOfTransient & theTypes);

		/****************** AssignIds ******************/
		/**** md5 signature: 152071a03ba941c15bd9ea23f8a6c564 ****/
		%feature("compactdefaultargs") AssignIds;
		%feature("autodoc", "
Parameters
----------
theTypeNames: TColStd_SequenceOfAsciiString

Return
-------
None

Description
-----------
Assigns the ids to the drivers of the given type names; it uses indices in the sequence as ids. useful in retrieval procedure.
") AssignIds;
		void AssignIds(const TColStd_SequenceOfAsciiString & theTypeNames);

		/****************** GetDriver ******************/
		/**** md5 signature: ecb31de6ad1797d5b75ad695a4fc66d2 ****/
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "
Parameters
----------
theType: Standard_Type
theDriver: BinMDF_ADriver

Return
-------
int

Description
-----------
Gets a driver <thedriver> according to <thetype>. returns type id if the driver was assigned an id; 0 otherwise.
") GetDriver;
		Standard_Integer GetDriver(const opencascade::handle<Standard_Type> & theType, opencascade::handle<BinMDF_ADriver> & theDriver);

		/****************** GetDriver ******************/
		/**** md5 signature: fe72078ff43a559946a9375193758316 ****/
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "
Parameters
----------
theTypeId: int

Return
-------
opencascade::handle<BinMDF_ADriver>

Description
-----------
Returns a driver according to <thetypeid>. returns null handle if a driver is not found.
") GetDriver;
		opencascade::handle<BinMDF_ADriver> GetDriver(const Standard_Integer theTypeId);

};


%make_alias(BinMDF_ADriverTable)

%extend BinMDF_ADriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BinMDF_DerivedDriver *
*****************************/
class BinMDF_DerivedDriver : public BinMDF_ADriver {
	public:
		/****************** BinMDF_DerivedDriver ******************/
		/**** md5 signature: 577f5e9f1d04d82bf9ec7dbed2fcf96c ****/
		%feature("compactdefaultargs") BinMDF_DerivedDriver;
		%feature("autodoc", "
Parameters
----------
theDerivative: TDF_Attribute
theBaseDriver: BinMDF_ADriver

Return
-------
None

Description
-----------
Creates a derivative persistence driver for thederivative attribute by reusage of thebasedriver @param thederivative an instance of the attribute, just created, detached from any label @param thebasedriver a driver of the base attribute, called by paste methods.
") BinMDF_DerivedDriver;
		 BinMDF_DerivedDriver(const opencascade::handle<TDF_Attribute> & theDerivative, const opencascade::handle<BinMDF_ADriver> & theBaseDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 9fd03ebf4c88d0fd3efd748ca3107174 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Creates a new instance of the derivative attribute.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 94d718490cdbfada5fccaa9591bd47ee ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
Reuses the base driver to read the base fields.
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 0c0cb5d03ba18d9ed340ec21f9be4994 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Return
-------
None

Description
-----------
Reuses the base driver to store the base fields.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMDF_DerivedDriver)

%extend BinMDF_DerivedDriver {
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
		/**** md5 signature: 990a6786e7b4b68ec20bccf69c3d344a ****/
		%feature("compactdefaultargs") BinMDF_ReferenceDriver;
		%feature("autodoc", "
Parameters
----------
theMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinMDF_ReferenceDriver;
		 BinMDF_ReferenceDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: BinObjMgt_Persistent
Target: TDF_Attribute
RelocTable: BinObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		/**** md5 signature: da6a0a35498ea18a652c6a19d6364015 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: BinObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

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
		/**** md5 signature: acbec121f684354773d49a7bad54d867 ****/
		%feature("compactdefaultargs") BinMDF_TagSourceDriver;
		%feature("autodoc", "
Parameters
----------
theMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinMDF_TagSourceDriver;
		 BinMDF_TagSourceDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 3bca84cbb3164ee155cf7623ceb16244 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: BinObjMgt_Persistent
Target: TDF_Attribute
RelocTable: BinObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 67b435110398ae49c79b33db64bbe228 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: BinObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

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
/* class aliases */
%pythoncode {
BinMDF_StringIdMap=OCC.Core.TColStd.TColStd_DataMapOfAsciiStringInteger
}
/* deprecated methods */
%pythoncode {
@deprecated
def binmdf_AddDrivers(*args):
	return binmdf.AddDrivers(*args)

}
