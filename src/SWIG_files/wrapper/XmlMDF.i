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
%define XMLMDFDOCSTRING
"XmlMDF module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xmlmdf.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(XmlMDF_ADriver)
%wrap_handle(XmlMDF_ADriverTable)
%wrap_handle(XmlMDF_ReferenceDriver)
%wrap_handle(XmlMDF_TagSourceDriver)
/* end handles declaration */

/* templates */
%template(XmlMDF_MapOfDriver) NCollection_DataMap<TCollection_AsciiString,opencascade::handle<XmlMDF_ADriver>,TCollection_AsciiString>;
%template(XmlMDF_TypeADriverMap) NCollection_DataMap<opencascade::handle<Standard_Type>,opencascade::handle<XmlMDF_ADriver>,TColStd_MapTransientHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<TCollection_AsciiString, opencascade::handle<XmlMDF_ADriver>, TCollection_AsciiString>::Iterator XmlMDF_DataMapIteratorOfMapOfDriver;
typedef NCollection_DataMap<opencascade::handle<Standard_Type>, opencascade::handle<XmlMDF_ADriver>, TColStd_MapTransientHasher>::Iterator XmlMDF_DataMapIteratorOfTypeADriverMap;
typedef NCollection_DataMap<TCollection_AsciiString, opencascade::handle<XmlMDF_ADriver>, TCollection_AsciiString> XmlMDF_MapOfDriver;
typedef NCollection_DataMap<opencascade::handle<Standard_Type>, opencascade::handle<XmlMDF_ADriver>, TColStd_MapTransientHasher> XmlMDF_TypeADriverMap;
/* end typedefs declaration */

/***************
* class XmlMDF *
***************/
%rename(xmlmdf) XmlMDF;
class XmlMDF {
	public:
		/****************** AddDrivers ******************/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "Adds the attribute storage drivers to <adriverseq>.

Parameters
----------
aDriverTable: XmlMDF_ADriverTable
theMessageDriver: Message_Messenger

Returns
-------
None
") AddDrivers;
		static void AddDrivers(const opencascade::handle<XmlMDF_ADriverTable> & aDriverTable, const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** FromTo ******************/
		%feature("compactdefaultargs") FromTo;
		%feature("autodoc", "Translates a transient <asource> into a persistent <atarget>.

Parameters
----------
aSource: TDF_Data
aTarget: XmlObjMgt_Element
aReloc: XmlObjMgt_SRelocationTable
aDrivers: XmlMDF_ADriverTable

Returns
-------
None
") FromTo;
		static void FromTo(const opencascade::handle<TDF_Data> & aSource, XmlObjMgt_Element & aTarget, XmlObjMgt_SRelocationTable & aReloc, const opencascade::handle<XmlMDF_ADriverTable> & aDrivers);

		/****************** FromTo ******************/
		%feature("compactdefaultargs") FromTo;
		%feature("autodoc", "Translates a persistent <asource> into a transient <atarget>. returns true if completed successfully (false on error).

Parameters
----------
aSource: XmlObjMgt_Element
aTarget: TDF_Data
aReloc: XmlObjMgt_RRelocationTable
aDrivers: XmlMDF_ADriverTable

Returns
-------
bool
") FromTo;
		static Standard_Boolean FromTo(const XmlObjMgt_Element & aSource, opencascade::handle<TDF_Data> & aTarget, XmlObjMgt_RRelocationTable & aReloc, const opencascade::handle<XmlMDF_ADriverTable> & aDrivers);

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
aSource: XmlObjMgt_Persistent
aTarget: TDF_Attribute
aRelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const XmlObjMgt_Persistent & aSource, const opencascade::handle<TDF_Attribute> & aTarget, XmlObjMgt_RRelocationTable & aRelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "Translate the contents of <asource> and put it into <atarget>, using the relocation table <areloctable> to keep the sharings.

Parameters
----------
aSource: TDF_Attribute
aTarget: XmlObjMgt_Persistent
aRelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & aSource, XmlObjMgt_Persistent & aTarget, XmlObjMgt_SRelocationTable & aRelocTable);

		/****************** SourceType ******************/
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "Returns the type of source object, inheriting from attribute from tdf.

Returns
-------
opencascade::handle<Standard_Type>
") SourceType;
		opencascade::handle<Standard_Type> SourceType();

		/****************** TypeName ******************/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "Returns the full xml tag name (including ns prefix).

Returns
-------
TCollection_AsciiString
") TypeName;
		const TCollection_AsciiString & TypeName();

		/****************** VersionNumber ******************/
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "Returns the version number from which the driver is available.

Returns
-------
int
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
		/****************** XmlMDF_ADriverTable ******************/
		%feature("compactdefaultargs") XmlMDF_ADriverTable;
		%feature("autodoc", "Creates a mutable adrivertable from xmlmdf.

Returns
-------
None
") XmlMDF_ADriverTable;
		 XmlMDF_ADriverTable();

		/****************** AddDriver ******************/
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "Sets a translation driver: <adriver>.

Parameters
----------
anHDriver: XmlMDF_ADriver

Returns
-------
None
") AddDriver;
		void AddDriver(const opencascade::handle<XmlMDF_ADriver> & anHDriver);

		/****************** GetDriver ******************/
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "Gets a driver <adriver> according to <atype> //! returns true if a driver is found; false otherwise.

Parameters
----------
aType: Standard_Type
anHDriver: XmlMDF_ADriver

Returns
-------
bool
") GetDriver;
		Standard_Boolean GetDriver(const opencascade::handle<Standard_Type> & aType, opencascade::handle<XmlMDF_ADriver> & anHDriver);

		/****************** GetDrivers ******************/
		%feature("compactdefaultargs") GetDrivers;
		%feature("autodoc", "Gets a map of drivers.

Returns
-------
XmlMDF_TypeADriverMap
") GetDrivers;
		const XmlMDF_TypeADriverMap & GetDrivers();

};


%make_alias(XmlMDF_ADriverTable)

%extend XmlMDF_ADriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class XmlMDF_ReferenceDriver *
*******************************/
class XmlMDF_ReferenceDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMDF_ReferenceDriver ******************/
		%feature("compactdefaultargs") XmlMDF_ReferenceDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMDF_ReferenceDriver;
		 XmlMDF_ReferenceDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
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
		/****************** XmlMDF_TagSourceDriver ******************/
		%feature("compactdefaultargs") XmlMDF_TagSourceDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMessageDriver: Message_Messenger

Returns
-------
None
") XmlMDF_TagSourceDriver;
		 XmlMDF_TagSourceDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Returns
-------
None
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
