/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BinMDF_ADriver)
%wrap_handle(BinMDF_ADriverTable)
%wrap_handle(BinMDF_ReferenceDriver)
%wrap_handle(BinMDF_TagSourceDriver)
/* end handles declaration */

/* templates */
%template(BinMDF_TypeADriverMap) NCollection_DataMap<opencascade::handle<Standard_Type>,opencascade::handle<BinMDF_ADriver>,TColStd_MapTransientHasher>;
%template(BinMDF_TypeIdMap) NCollection_DoubleMap<opencascade::handle<Standard_Type>,Standard_Integer,TColStd_MapTransientHasher,TColStd_MapIntegerHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<opencascade::handle<Standard_Type>, opencascade::handle<BinMDF_ADriver>, TColStd_MapTransientHasher>::Iterator BinMDF_DataMapIteratorOfTypeADriverMap;
typedef NCollection_DoubleMap<opencascade::handle<Standard_Type>, Standard_Integer, TColStd_MapTransientHasher, TColStd_MapIntegerHasher>::Iterator BinMDF_DoubleMapIteratorOfTypeIdMap;
typedef TColStd_DataMapOfAsciiStringInteger BinMDF_StringIdMap;
typedef NCollection_DataMap<opencascade::handle<Standard_Type>, opencascade::handle<BinMDF_ADriver>, TColStd_MapTransientHasher> BinMDF_TypeADriverMap;
typedef NCollection_DoubleMap<opencascade::handle<Standard_Type>, Standard_Integer, TColStd_MapTransientHasher, TColStd_MapIntegerHasher> BinMDF_TypeIdMap;
/* end typedefs declaration */

/***************
* class BinMDF *
***************/
%rename(binmdf) BinMDF;
class BinMDF {
	public:
		/****************** AddDrivers ******************/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "Adds the attribute storage drivers to <adrivertable>.

Parameters
----------
aDriverTable: BinMDF_ADriverTable
aMsgDrv: Message_Messenger

Returns
-------
None
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
		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Creates a new attribute from tdf.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "Translate the contents of <asource> and put it into <atarget>, using the relocation table <areloctable> to keep the sharings.

Parameters
----------
aSource: BinObjMgt_Persistent
aTarget: TDF_Attribute
aRelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & aSource, const opencascade::handle<TDF_Attribute> & aTarget, BinObjMgt_RRelocationTable & aRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "Translate the contents of <asource> and put it into <atarget>, using the relocation table <areloctable> to keep the sharings.

Parameters
----------
aSource: TDF_Attribute
aTarget: BinObjMgt_Persistent
aRelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & aSource, BinObjMgt_Persistent & aTarget, BinObjMgt_SRelocationTable & aRelocTable);

		/****************** SourceType ******************/
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "Returns the type of source object, inheriting from attribute from tdf.

Returns
-------
opencascade::handle<Standard_Type>
") SourceType;
		const opencascade::handle<Standard_Type> & SourceType();

		/****************** TypeName ******************/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "Returns the type name of the attribute object.

Returns
-------
TCollection_AsciiString
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
		%feature("compactdefaultargs") BinMDF_ADriverTable;
		%feature("autodoc", "Constructor.

Returns
-------
None
") BinMDF_ADriverTable;
		 BinMDF_ADriverTable();

		/****************** AddDriver ******************/
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "Adds a translation driver <thedriver>.

Parameters
----------
theDriver: BinMDF_ADriver

Returns
-------
None
") AddDriver;
		void AddDriver(const opencascade::handle<BinMDF_ADriver> & theDriver);

		/****************** AssignIds ******************/
		%feature("compactdefaultargs") AssignIds;
		%feature("autodoc", "Assigns the ids to the drivers of the given types. it uses indices in the map as ids. useful in storage procedure.

Parameters
----------
theTypes: TColStd_IndexedMapOfTransient

Returns
-------
None
") AssignIds;
		void AssignIds(const TColStd_IndexedMapOfTransient & theTypes);

		/****************** AssignIds ******************/
		%feature("compactdefaultargs") AssignIds;
		%feature("autodoc", "Assigns the ids to the drivers of the given type names; it uses indices in the sequence as ids. useful in retrieval procedure.

Parameters
----------
theTypeNames: TColStd_SequenceOfAsciiString

Returns
-------
None
") AssignIds;
		void AssignIds(const TColStd_SequenceOfAsciiString & theTypeNames);

		/****************** GetDriver ******************/
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "Gets a driver <thedriver> according to <thetype>. returns type id if the driver was assigned an id; 0 otherwise.

Parameters
----------
theType: Standard_Type
theDriver: BinMDF_ADriver

Returns
-------
int
") GetDriver;
		Standard_Integer GetDriver(const opencascade::handle<Standard_Type> & theType, opencascade::handle<BinMDF_ADriver> & theDriver);

		/****************** GetDriver ******************/
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "Returns a driver according to <thetypeid>. returns null handle if a driver is not found.

Parameters
----------
theTypeId: int

Returns
-------
opencascade::handle<BinMDF_ADriver>
") GetDriver;
		opencascade::handle<BinMDF_ADriver> GetDriver(const Standard_Integer theTypeId);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") BinMDF_ReferenceDriver;
		 BinMDF_ReferenceDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: BinObjMgt_Persistent
Target: TDF_Attribute
RelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
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
		%feature("compactdefaultargs") BinMDF_TagSourceDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") BinMDF_TagSourceDriver;
		 BinMDF_TagSourceDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: BinObjMgt_Persistent
Target: TDF_Attribute
RelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
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
