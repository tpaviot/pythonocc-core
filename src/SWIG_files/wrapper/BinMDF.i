/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_binmdf.html"
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
%include ../common/ArrayMacros.i


%{
#include<BinMDF_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<TDF_module.hxx>
#include<BinObjMgt_module.hxx>
#include<TColStd_module.hxx>
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
%import Message.i
%import TDF.i
%import BinObjMgt.i
%import TColStd.i
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
%ignore NCollection_DataMap<TCollection_AsciiString,int>::Items;
%ignore NCollection_DataMap<TCollection_AsciiString,int>::KeyValues;
%template(BinMDF_StringIdMap) NCollection_DataMap<TCollection_AsciiString,int>;
%ignore NCollection_DataMap<opencascade::handle<Standard_Type>,opencascade::handle<BinMDF_ADriver>>::Items;
%ignore NCollection_DataMap<opencascade::handle<Standard_Type>,opencascade::handle<BinMDF_ADriver>>::KeyValues;
%template(BinMDF_TypeADriverMap) NCollection_DataMap<opencascade::handle<Standard_Type>,opencascade::handle<BinMDF_ADriver>>;
%template(BinMDF_TypeIdMap) NCollection_DoubleMap<opencascade::handle<Standard_Type>,int>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<opencascade::handle<Standard_Type>, opencascade::handle<BinMDF_ADriver>>::Iterator BinMDF_DataMapIteratorOfTypeADriverMap;
typedef NCollection_DoubleMap<opencascade::handle<Standard_Type>, int>::Iterator BinMDF_DoubleMapIteratorOfTypeIdMap;
typedef NCollection_DataMap<TCollection_AsciiString, int> BinMDF_StringIdMap;
typedef NCollection_DataMap<opencascade::handle<Standard_Type>, opencascade::handle<BinMDF_ADriver>> BinMDF_TypeADriverMap;
typedef NCollection_DoubleMap<opencascade::handle<Standard_Type>, int> BinMDF_TypeIdMap;
/* end typedefs declaration */

/***************
* class BinMDF *
***************/
%rename(binmdf) BinMDF;
class BinMDF {
	public:
		/****** BinMDF::AddDrivers ******/
		/****** md5 signature: 9b16e0c464e556dc0dccd242954afcdf ******/
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
Adds the attribute storage drivers to <aDriverTable>.
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
		/****** BinMDF_ADriver::MessageDriver ******/
		/****** md5 signature: a2961f713aaae0ef5d0be03881abc817 ******/
		%feature("compactdefaultargs") MessageDriver;
		%feature("autodoc", "Return
-------
opencascade::handle<Message_Messenger>

Description
-----------
Returns the current message driver of this driver.
") MessageDriver;
		const opencascade::handle<Message_Messenger> & MessageDriver();

		/****** BinMDF_ADriver::NewEmpty ******/
		/****** md5 signature: 537251aec6cd2736ac1f1abe6868dc70 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Creates a new attribute from TDF.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDF_ADriver::Paste ******/
		/****** md5 signature: 52b1f9a9390c6a1fa7cdc08e93b83098 ******/
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
Translate the contents of <aSource> and put it into <aTarget>, using the relocation table <aRelocTable> to keep the sharings.
") Paste;
		virtual bool Paste(const BinObjMgt_Persistent & aSource, const opencascade::handle<TDF_Attribute> & aTarget, BinObjMgt_RRelocationTable & aRelocTable);

		/****** BinMDF_ADriver::Paste ******/
		/****** md5 signature: b712061bbc2b6958e4e7d4fa8610f076 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
aSource: TDF_Attribute
aTarget: BinObjMgt_Persistent
aRelocTable: TColStd_IndexedMapOfTransient

Return
-------
None

Description
-----------
Translate the contents of <aSource> and put it into <aTarget>, using the relocation table <aRelocTable> to keep the sharings.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & aSource, BinObjMgt_Persistent & aTarget, TColStd_IndexedMapOfTransient & aRelocTable);

		/****** BinMDF_ADriver::SourceType ******/
		/****** md5 signature: b701df1c50a5570aedd2a6108c7e2344 ******/
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the type of source object, inheriting from Attribute from TDF.
") SourceType;
		virtual const opencascade::handle<Standard_Type> & SourceType();

		/****** BinMDF_ADriver::TypeName ******/
		/****** md5 signature: 191a1aa753fb8d39d56bcfd7505ea0e7 ******/
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
		/****** BinMDF_ADriverTable::BinMDF_ADriverTable ******/
		/****** md5 signature: 708f7239ec8de4f8ee5349a3633a9833 ******/
		%feature("compactdefaultargs") BinMDF_ADriverTable;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BinMDF_ADriverTable;
		 BinMDF_ADriverTable();

		/****** BinMDF_ADriverTable::AddDerivedDriver ******/
		/****** md5 signature: d785bc7c368abacc51e9bcd52083ce5c ******/
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
Adds a translation driver for the derived attribute. The base driver must be already added. 
Parameter theInstance is newly created attribute, detached from any label.
") AddDerivedDriver;
		void AddDerivedDriver(const opencascade::handle<TDF_Attribute> & theInstance);

		/****** BinMDF_ADriverTable::AddDerivedDriver ******/
		/****** md5 signature: 944f5ff20c65a0836cecdb2f1b18b87d ******/
		%feature("compactdefaultargs") AddDerivedDriver;
		%feature("autodoc", "
Parameters
----------
theDerivedType: char *

Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Adds a translation driver for the derived attribute. The base driver must be already added. 
Parameter theDerivedType is registered attribute type using IMPLEMENT_DERIVED_ATTRIBUTE macro.
") AddDerivedDriver;
		const opencascade::handle<Standard_Type> & AddDerivedDriver(const char * theDerivedType);

		/****** BinMDF_ADriverTable::AddDriver ******/
		/****** md5 signature: b535a4822476bdd281f04ff4cdbaa916 ******/
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
Adds a translation driver <theDriver>.
") AddDriver;
		void AddDriver(const opencascade::handle<BinMDF_ADriver> & theDriver);

		/****** BinMDF_ADriverTable::AssignIds ******/
		/****** md5 signature: 01a0fa09e95057677539e8fd343c6d05 ******/
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
Assigns the IDs to the drivers of the given Types. It uses indices in the map as IDs. Useful in storage procedure.
") AssignIds;
		void AssignIds(const TColStd_IndexedMapOfTransient & theTypes);

		/****** BinMDF_ADriverTable::AssignIds ******/
		/****** md5 signature: 64aad9b1cb5880336f7be044133245ab ******/
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
Assigns the IDs to the drivers of the given Type Names; It uses indices in the sequence as IDs. Useful in retrieval procedure.
") AssignIds;
		void AssignIds(const TColStd_SequenceOfAsciiString & theTypeNames);

		/****** BinMDF_ADriverTable::GetDriver ******/
		/****** md5 signature: 4e4dbe91b9b851121893298cd99ea5a2 ******/
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
Gets a driver <theDriver> according to <theType>. Returns Type ID if the driver was assigned an ID; 0 otherwise.
") GetDriver;
		int GetDriver(const opencascade::handle<Standard_Type> & theType, opencascade::handle<BinMDF_ADriver> & theDriver);

		/****** BinMDF_ADriverTable::GetDriver ******/
		/****** md5 signature: 29b95c24b56d7bba60d6d2bdf78a1e13 ******/
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
Returns a driver according to <theTypeId>. Returns null handle if a driver is not found.
") GetDriver;
		opencascade::handle<BinMDF_ADriver> GetDriver(const int theTypeId);

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
		/****** BinMDF_DerivedDriver::BinMDF_DerivedDriver ******/
		/****** md5 signature: 577f5e9f1d04d82bf9ec7dbed2fcf96c ******/
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
Creates a derivative persistence driver for theDerivative attribute by reusage of theBaseDriver 
Parameter theDerivative an instance of the attribute, just created, detached from any label 
Parameter theBaseDriver a driver of the base attribute, called by Paste methods.
") BinMDF_DerivedDriver;
		 BinMDF_DerivedDriver(const opencascade::handle<TDF_Attribute> & theDerivative, const opencascade::handle<BinMDF_ADriver> & theBaseDriver);

		/****** BinMDF_DerivedDriver::NewEmpty ******/
		/****** md5 signature: 20840845e8bb6dddd2769aa3f6b04b87 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Creates a new instance of the derivative attribute.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDF_DerivedDriver::Paste ******/
		/****** md5 signature: 969f62b513710cc4cdc6afe7187806b5 ******/
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
		bool Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****** BinMDF_DerivedDriver::Paste ******/
		/****** md5 signature: d9bb9a8a704a41de11723bedd6cae443 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: TColStd_IndexedMapOfTransient

Return
-------
None

Description
-----------
Reuses the base driver to store the base fields.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, TColStd_IndexedMapOfTransient & theRelocTable);

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
		/****** BinMDF_ReferenceDriver::BinMDF_ReferenceDriver ******/
		/****** md5 signature: 990a6786e7b4b68ec20bccf69c3d344a ******/
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

		/****** BinMDF_ReferenceDriver::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDF_ReferenceDriver::Paste ******/
		/****** md5 signature: 32b49ae1c49643472e4ce889e46d08ee ******/
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
		bool Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDF_ReferenceDriver::Paste ******/
		/****** md5 signature: b4a5612f14dec93753f599f4c4e34fd2 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: TColStd_IndexedMapOfTransient

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, TColStd_IndexedMapOfTransient & RelocTable);

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
		/****** BinMDF_TagSourceDriver::BinMDF_TagSourceDriver ******/
		/****** md5 signature: acbec121f684354773d49a7bad54d867 ******/
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

		/****** BinMDF_TagSourceDriver::NewEmpty ******/
		/****** md5 signature: 4ebad80fa2cacb9f9e231bbb83a29a98 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDF_TagSourceDriver::Paste ******/
		/****** md5 signature: 32b49ae1c49643472e4ce889e46d08ee ******/
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
		bool Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDF_TagSourceDriver::Paste ******/
		/****** md5 signature: b4a5612f14dec93753f599f4c4e34fd2 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: TColStd_IndexedMapOfTransient

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, TColStd_IndexedMapOfTransient & RelocTable);

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
}
/* deprecated methods */
%pythoncode {
@deprecated
def binmdf_AddDrivers(*args):
	return binmdf.AddDrivers(*args)

}
