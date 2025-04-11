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
%define XMLMDFDOCSTRING
"XmlMDF module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_xmlmdf.html"
%enddef
%module (package="OCC.Core", docstring=XMLMDFDOCSTRING) XmlMDF


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
#include<XmlMDF_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<TDF_module.hxx>
#include<XmlObjMgt_module.hxx>
#include<TCollection_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Message.i
%import TDF.i
%import XmlObjMgt.i
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
%wrap_handle(XmlMDF_ADriver)
%wrap_handle(XmlMDF_ADriverTable)
%wrap_handle(XmlMDF_DerivedDriver)
%wrap_handle(XmlMDF_ReferenceDriver)
%wrap_handle(XmlMDF_TagSourceDriver)
/* end handles declaration */

/* templates */
%template(XmlMDF_MapOfDriver) NCollection_DataMap<TCollection_AsciiString,opencascade::handle<XmlMDF_ADriver>>;
%template(XmlMDF_TypeADriverMap) NCollection_DataMap<opencascade::handle<Standard_Type>,opencascade::handle<XmlMDF_ADriver>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TCollection_AsciiString, opencascade::handle<XmlMDF_ADriver>>::Iterator XmlMDF_DataMapIteratorOfMapOfDriver;
typedef NCollection_DataMap<opencascade::handle<Standard_Type>, opencascade::handle<XmlMDF_ADriver>>::Iterator XmlMDF_DataMapIteratorOfTypeADriverMap;
typedef NCollection_DataMap<TCollection_AsciiString, opencascade::handle<XmlMDF_ADriver>> XmlMDF_MapOfDriver;
typedef NCollection_DataMap<opencascade::handle<Standard_Type>, opencascade::handle<XmlMDF_ADriver>> XmlMDF_TypeADriverMap;
/* end typedefs declaration */

/***************
* class XmlMDF *
***************/
%rename(xmlmdf) XmlMDF;
class XmlMDF {
	public:
		/****** XmlMDF::AddDrivers ******/
		/****** md5 signature: a036f2e24a6710bf8e540cdbbab785d0 ******/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "
Parameters
----------
aDriverTable: XmlMDF_ADriverTable
theMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
Adds the attribute storage drivers to <aDriverSeq>.
") AddDrivers;
		static void AddDrivers(const opencascade::handle<XmlMDF_ADriverTable> & aDriverTable, const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** XmlMDF::FromTo ******/
		/****** md5 signature: a3040a924b785778b3b8d9cd67f304da ******/
		%feature("compactdefaultargs") FromTo;
		%feature("autodoc", "
Parameters
----------
aSource: TDF_Data
aTarget: XmlObjMgt_Element
aReloc: XmlObjMgt_SRelocationTable
aDrivers: XmlMDF_ADriverTable
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Translates a transient <aSource> into a persistent <aTarget>.
") FromTo;
		static void FromTo(const opencascade::handle<TDF_Data> & aSource, XmlObjMgt_Element & aTarget, XmlObjMgt_SRelocationTable & aReloc, const opencascade::handle<XmlMDF_ADriverTable> & aDrivers, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** XmlMDF::FromTo ******/
		/****** md5 signature: 43d72ef2a4051857449b6205abaf10a8 ******/
		%feature("compactdefaultargs") FromTo;
		%feature("autodoc", "
Parameters
----------
aSource: XmlObjMgt_Element
aTarget: TDF_Data
aReloc: XmlObjMgt_RRelocationTable
aDrivers: XmlMDF_ADriverTable
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Translates a persistent <aSource> into a transient <aTarget>. Returns True if completed successfully (False on error).
") FromTo;
		static Standard_Boolean FromTo(const XmlObjMgt_Element & aSource, opencascade::handle<TDF_Data> & aTarget, XmlObjMgt_RRelocationTable & aReloc, const opencascade::handle<XmlMDF_ADriverTable> & aDrivers, const Message_ProgressRange & theRange = Message_ProgressRange());

};


%extend XmlMDF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class XmlMDF_ADriver *
***********************/
%nodefaultctor XmlMDF_ADriver;
class XmlMDF_ADriver : public Standard_Transient {
	public:
		/****** XmlMDF_ADriver::MessageDriver ******/
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

		/****** XmlMDF_ADriver::Namespace ******/
		/****** md5 signature: ed4e20f1f838f6275fc120673f93975a ******/
		%feature("compactdefaultargs") Namespace;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the namespace string.
") Namespace;
		const TCollection_AsciiString & Namespace();

		/****** XmlMDF_ADriver::NewEmpty ******/
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

		/****** XmlMDF_ADriver::Paste ******/
		/****** md5 signature: 9ba11d4291f863a0ebfa7adc5ddc82da ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
aSource: XmlObjMgt_Persistent
aTarget: TDF_Attribute
aRelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
Translate the contents of <aSource> and put it into <aTarget>, using the relocation table <aRelocTable> to keep the sharings.
") Paste;
		virtual Standard_Boolean Paste(const XmlObjMgt_Persistent & aSource, const opencascade::handle<TDF_Attribute> & aTarget, XmlObjMgt_RRelocationTable & aRelocTable);

		/****** XmlMDF_ADriver::Paste ******/
		/****** md5 signature: 52806332c1e637e234838754c7c1b878 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
aSource: TDF_Attribute
aTarget: XmlObjMgt_Persistent
aRelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
Translate the contents of <aSource> and put it into <aTarget>, using the relocation table <aRelocTable> to keep the sharings.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & aSource, XmlObjMgt_Persistent & aTarget, XmlObjMgt_SRelocationTable & aRelocTable);

		/****** XmlMDF_ADriver::SourceType ******/
		/****** md5 signature: 32631522887e31f15896a5cd3347c279 ******/
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
Returns the type of source object, inheriting from Attribute from TDF.
") SourceType;
		virtual opencascade::handle<Standard_Type> SourceType();

		/****** XmlMDF_ADriver::TypeName ******/
		/****** md5 signature: 191a1aa753fb8d39d56bcfd7505ea0e7 ******/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the full XML tag name (including NS prefix).
") TypeName;
		const TCollection_AsciiString & TypeName();

		/****** XmlMDF_ADriver::VersionNumber ******/
		/****** md5 signature: debfb90d077419555d82ec5a7fb62cea ******/
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the version number from which the driver is available.
") VersionNumber;
		virtual Standard_Integer VersionNumber();

};


%make_alias(XmlMDF_ADriver)

%extend XmlMDF_ADriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class XmlMDF_ADriverTable *
****************************/
class XmlMDF_ADriverTable : public Standard_Transient {
	public:
		/****** XmlMDF_ADriverTable::XmlMDF_ADriverTable ******/
		/****** md5 signature: 019227b2f290ebee141aefb3a01e3eae ******/
		%feature("compactdefaultargs") XmlMDF_ADriverTable;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a mutable ADriverTable from XmlMDF.
") XmlMDF_ADriverTable;
		 XmlMDF_ADriverTable();

		/****** XmlMDF_ADriverTable::AddDerivedDriver ******/
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

		/****** XmlMDF_ADriverTable::AddDerivedDriver ******/
		/****** md5 signature: c08557200bb111bac7324de5048e9e2d ******/
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
Adds a translation driver for the derived attribute. The base driver must be already added. 
Parameter theDerivedType is registered attribute type using IMPLEMENT_DERIVED_ATTRIBUTE macro.
") AddDerivedDriver;
		const opencascade::handle<Standard_Type> & AddDerivedDriver(Standard_CString theDerivedType);

		/****** XmlMDF_ADriverTable::AddDriver ******/
		/****** md5 signature: a1862a3b70afac69a2082adfc7eb62a0 ******/
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "
Parameters
----------
anHDriver: XmlMDF_ADriver

Return
-------
None

Description
-----------
Sets a translation driver: <aDriver>.
") AddDriver;
		void AddDriver(const opencascade::handle<XmlMDF_ADriver> & anHDriver);

		/****** XmlMDF_ADriverTable::CreateDrvMap ******/
		/****** md5 signature: 2f3bf75f266927cb151a797b3ee15dcf ******/
		%feature("compactdefaultargs") CreateDrvMap;
		%feature("autodoc", "
Parameters
----------
theDriverMap: XmlMDF_MapOfDriver

Return
-------
None

Description
-----------
Fills the map by all registered drivers.
") CreateDrvMap;
		void CreateDrvMap(XmlMDF_MapOfDriver & theDriverMap);

		/****** XmlMDF_ADriverTable::GetDriver ******/
		/****** md5 signature: 82134288246a0f36c04a3a279ed39cd1 ******/
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "
Parameters
----------
theType: Standard_Type
theDriver: XmlMDF_ADriver

Return
-------
bool

Description
-----------
Gets a driver <aDriver> according to <aType> //! Returns True if a driver is found; false otherwise.
") GetDriver;
		Standard_Boolean GetDriver(const opencascade::handle<Standard_Type> & theType, opencascade::handle<XmlMDF_ADriver> & theDriver);

};


%make_alias(XmlMDF_ADriverTable)

%extend XmlMDF_ADriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class XmlMDF_DerivedDriver *
*****************************/
class XmlMDF_DerivedDriver : public XmlMDF_ADriver {
	public:
		/****** XmlMDF_DerivedDriver::XmlMDF_DerivedDriver ******/
		/****** md5 signature: 9fd7a0ae1dfaceed6d0fe854211abbae ******/
		%feature("compactdefaultargs") XmlMDF_DerivedDriver;
		%feature("autodoc", "
Parameters
----------
theDerivative: TDF_Attribute
theBaseDriver: XmlMDF_ADriver

Return
-------
None

Description
-----------
Creates a derivative persistence driver for theDerivative attribute by reusage of theBaseDriver 
Parameter theDerivative an instance of the attribute, just created, detached from any label 
Parameter theBaseDriver a driver of the base attribute, called by Paste methods.
") XmlMDF_DerivedDriver;
		 XmlMDF_DerivedDriver(const opencascade::handle<TDF_Attribute> & theDerivative, const opencascade::handle<XmlMDF_ADriver> & theBaseDriver);

		/****** XmlMDF_DerivedDriver::NewEmpty ******/
		/****** md5 signature: 9fd03ebf4c88d0fd3efd748ca3107174 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Creates a new instance of the derivative attribute.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XmlMDF_DerivedDriver::Paste ******/
		/****** md5 signature: ec1aa8d8f44b52c462ccfb619b2ab8c7 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
Reuses the base driver to read the base fields.
") Paste;
		virtual Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****** XmlMDF_DerivedDriver::Paste ******/
		/****** md5 signature: 50bb20461c6c07de84069a8198f95fcd ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
Reuses the base driver to store the base fields.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

		/****** XmlMDF_DerivedDriver::TypeName ******/
		/****** md5 signature: 33bd6dc5f76c10259f99124470e7cb5c ******/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns the full XML tag name (including NS prefix).
") TypeName;
		const TCollection_AsciiString & TypeName();

};


%make_alias(XmlMDF_DerivedDriver)

%extend XmlMDF_DerivedDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class XmlMDF_ReferenceDriver *
*******************************/
class XmlMDF_ReferenceDriver : public XmlMDF_ADriver {
	public:
		/****** XmlMDF_ReferenceDriver::XmlMDF_ReferenceDriver ******/
		/****** md5 signature: b53c8eb2906d5bbe7f077cd2090ccdd0 ******/
		%feature("compactdefaultargs") XmlMDF_ReferenceDriver;
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
") XmlMDF_ReferenceDriver;
		 XmlMDF_ReferenceDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** XmlMDF_ReferenceDriver::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XmlMDF_ReferenceDriver::Paste ******/
		/****** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****** XmlMDF_ReferenceDriver::Paste ******/
		/****** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

};


%make_alias(XmlMDF_ReferenceDriver)

%extend XmlMDF_ReferenceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class XmlMDF_TagSourceDriver *
*******************************/
class XmlMDF_TagSourceDriver : public XmlMDF_ADriver {
	public:
		/****** XmlMDF_TagSourceDriver::XmlMDF_TagSourceDriver ******/
		/****** md5 signature: c41a1e34cf012a6f231ee5225f896395 ******/
		%feature("compactdefaultargs") XmlMDF_TagSourceDriver;
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
") XmlMDF_TagSourceDriver;
		 XmlMDF_TagSourceDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** XmlMDF_TagSourceDriver::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** XmlMDF_TagSourceDriver::Paste ******/
		/****** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****** XmlMDF_TagSourceDriver::Paste ******/
		/****** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

};


%make_alias(XmlMDF_TagSourceDriver)

%extend XmlMDF_TagSourceDriver {
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
def xmlmdf_AddDrivers(*args):
	return xmlmdf.AddDrivers(*args)

@deprecated
def xmlmdf_FromTo(*args):
	return xmlmdf.FromTo(*args)

@deprecated
def xmlmdf_FromTo(*args):
	return xmlmdf.FromTo(*args)

}
