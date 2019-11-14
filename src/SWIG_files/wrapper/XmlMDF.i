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

%define XMLMDFDOCSTRING
"XmlMDF module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_XmlMDF.html"
%enddef
%module (package="OCC.Core", docstring=XMLMDFDOCSTRING) XmlMDF

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
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(XmlMDF_ADriver)
%wrap_handle(XmlMDF_ADriverTable)
%wrap_handle(XmlMDF_ReferenceDriver)
%wrap_handle(XmlMDF_TagSourceDriver)
/* end handles declaration */

/* templates */
%template(XmlMDF_MapOfDriver) NCollection_DataMap <TCollection_AsciiString , opencascade::handle <XmlMDF_ADriver>, TCollection_AsciiString>;
%template(XmlMDF_TypeADriverMap) NCollection_DataMap <opencascade::handle <Standard_Type>, opencascade::handle <XmlMDF_ADriver>, TColStd_MapTransientHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <TCollection_AsciiString , opencascade::handle <XmlMDF_ADriver>, TCollection_AsciiString> XmlMDF_MapOfDriver;
typedef NCollection_DataMap <TCollection_AsciiString , opencascade::handle <XmlMDF_ADriver>, TCollection_AsciiString>::Iterator XmlMDF_DataMapIteratorOfMapOfDriver;
typedef NCollection_DataMap <opencascade::handle <Standard_Type>, opencascade::handle <XmlMDF_ADriver>, TColStd_MapTransientHasher> XmlMDF_TypeADriverMap;
typedef NCollection_DataMap <opencascade::handle <Standard_Type>, opencascade::handle <XmlMDF_ADriver>, TColStd_MapTransientHasher>::Iterator XmlMDF_DataMapIteratorOfTypeADriverMap;
/* end typedefs declaration */

%rename(xmlmdf) XmlMDF;
class XmlMDF {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute storage drivers to <aDriverSeq>.

	:param aDriverTable:
	:type aDriverTable: opencascade::handle<XmlMDF_ADriverTable> &
	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const opencascade::handle<XmlMDF_ADriverTable> & aDriverTable,const opencascade::handle<Message_Messenger> & theMessageDriver);
		%feature("compactdefaultargs") FromTo;
		%feature("autodoc", "	* Translates a transient <aSource> into a persistent <aTarget>.

	:param aSource:
	:type aSource: opencascade::handle<TDF_Data> &
	:param aTarget:
	:type aTarget: XmlObjMgt_Element &
	:param aReloc:
	:type aReloc: XmlObjMgt_SRelocationTable &
	:param aDrivers:
	:type aDrivers: opencascade::handle<XmlMDF_ADriverTable> &
	:rtype: void
") FromTo;
		static void FromTo (const opencascade::handle<TDF_Data> & aSource,XmlObjMgt_Element & aTarget,XmlObjMgt_SRelocationTable & aReloc,const opencascade::handle<XmlMDF_ADriverTable> & aDrivers);
		%feature("compactdefaultargs") FromTo;
		%feature("autodoc", "	* Translates a persistent <aSource> into a transient <aTarget>. Returns True if completed successfully (False on error)

	:param aSource:
	:type aSource: XmlObjMgt_Element &
	:param aTarget:
	:type aTarget: opencascade::handle<TDF_Data> &
	:param aReloc:
	:type aReloc: XmlObjMgt_RRelocationTable &
	:param aDrivers:
	:type aDrivers: opencascade::handle<XmlMDF_ADriverTable> &
	:rtype: bool
") FromTo;
		static Standard_Boolean FromTo (const XmlObjMgt_Element & aSource,opencascade::handle<TDF_Data> & aTarget,XmlObjMgt_RRelocationTable & aReloc,const opencascade::handle<XmlMDF_ADriverTable> & aDrivers);
};


%extend XmlMDF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDF_ADriver;
class XmlMDF_ADriver : public Standard_Transient {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Creates a new attribute from TDF.

	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* Translate the contents of <aSource> and put it into <aTarget>, using the relocation table <aRelocTable> to keep the sharings.

	:param aSource:
	:type aSource: XmlObjMgt_Persistent &
	:param aTarget:
	:type aTarget: opencascade::handle<TDF_Attribute> &
	:param aRelocTable:
	:type aRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const XmlObjMgt_Persistent & aSource,const opencascade::handle<TDF_Attribute> & aTarget,XmlObjMgt_RRelocationTable & aRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* Translate the contents of <aSource> and put it into <aTarget>, using the relocation table <aRelocTable> to keep the sharings.

	:param aSource:
	:type aSource: opencascade::handle<TDF_Attribute> &
	:param aTarget:
	:type aTarget: XmlObjMgt_Persistent &
	:param aRelocTable:
	:type aRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & aSource,XmlObjMgt_Persistent & aTarget,XmlObjMgt_SRelocationTable & aRelocTable);
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type of source object, inheriting from Attribute from TDF.

	:rtype: opencascade::handle<Standard_Type>
") SourceType;
		opencascade::handle<Standard_Type> SourceType ();
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "	* Returns the full XML tag name (including NS prefix)

	:rtype: TCollection_AsciiString
") TypeName;
		const TCollection_AsciiString & TypeName ();
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available.

	:rtype: int
") VersionNumber;
		virtual Standard_Integer VersionNumber ();
};


%make_alias(XmlMDF_ADriver)

%extend XmlMDF_ADriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDF_ADriverTable;
class XmlMDF_ADriverTable : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "	* Sets a translation driver: <aDriver>.

	:param anHDriver:
	:type anHDriver: opencascade::handle<XmlMDF_ADriver> &
	:rtype: None
") AddDriver;
		void AddDriver (const opencascade::handle<XmlMDF_ADriver> & anHDriver);
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "	* Gets a driver <aDriver> according to <aType> //! Returns True if a driver is found; false otherwise.

	:param aType:
	:type aType: opencascade::handle<Standard_Type> &
	:param anHDriver:
	:type anHDriver: opencascade::handle<XmlMDF_ADriver> &
	:rtype: bool
") GetDriver;
		Standard_Boolean GetDriver (const opencascade::handle<Standard_Type> & aType,opencascade::handle<XmlMDF_ADriver> & anHDriver);
		%feature("compactdefaultargs") GetDrivers;
		%feature("autodoc", "	* Gets a map of drivers.

	:rtype: XmlMDF_TypeADriverMap
") GetDrivers;
		const XmlMDF_TypeADriverMap & GetDrivers ();
		%feature("compactdefaultargs") XmlMDF_ADriverTable;
		%feature("autodoc", "	* Creates a mutable ADriverTable from XmlMDF.

	:rtype: None
") XmlMDF_ADriverTable;
		 XmlMDF_ADriverTable ();
};


%make_alias(XmlMDF_ADriverTable)

%extend XmlMDF_ADriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDF_ReferenceDriver;
class XmlMDF_ReferenceDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDF_ReferenceDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDF_ReferenceDriver;
		 XmlMDF_ReferenceDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDF_ReferenceDriver)

%extend XmlMDF_ReferenceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDF_TagSourceDriver;
class XmlMDF_TagSourceDriver : public XmlMDF_ADriver {
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
		%feature("compactdefaultargs") XmlMDF_TagSourceDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMDF_TagSourceDriver;
		 XmlMDF_TagSourceDriver (const opencascade::handle<Message_Messenger> & theMessageDriver);
};


%make_alias(XmlMDF_TagSourceDriver)

%extend XmlMDF_TagSourceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
