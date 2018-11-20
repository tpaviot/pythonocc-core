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
%define XMLMDFDOCSTRING
"This package provides classes and methods to
translate a transient DF into a persistent one and
vice versa.

Driver

A driver is a tool used to translate a transient
attribute into a persistent one and vice versa.

Driver Table

A driver table is an object building links between
object types and object drivers. In the
translation process, a driver table is asked to
give a translation driver for each current object
to be translated.
"
%enddef
%module (package="OCC.Core", docstring=XMLMDFDOCSTRING) XmlMDF

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


%include XmlMDF_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(XmlMDF_ADriver)
%wrap_handle(XmlMDF_ADriverTable)
%wrap_handle(XmlMDF_DataMapNodeOfMapOfDriver)
%wrap_handle(XmlMDF_DataMapNodeOfTypeADriverMap)
%wrap_handle(XmlMDF_ReferenceDriver)
%wrap_handle(XmlMDF_TagSourceDriver)

%rename(xmlmdf) XmlMDF;
class XmlMDF {
	public:
		%feature("compactdefaultargs") FromTo;
		%feature("autodoc", "	* Translates a transient <aSource> into a persistent <aTarget>.

	:param aSource:
	:type aSource: Handle_TDF_Data &
	:param aTarget:
	:type aTarget: XmlObjMgt_Element &
	:param aReloc:
	:type aReloc: XmlObjMgt_SRelocationTable &
	:param aDrivers:
	:type aDrivers: Handle_XmlMDF_ADriverTable &
	:rtype: void
") FromTo;
		static void FromTo (const Handle_TDF_Data & aSource,XmlObjMgt_Element & aTarget,XmlObjMgt_SRelocationTable & aReloc,const Handle_XmlMDF_ADriverTable & aDrivers);
		%feature("compactdefaultargs") FromTo;
		%feature("autodoc", "	* Translates a persistent <aSource> into a transient <aTarget>. Returns True if completed successfully (False on error)

	:param aSource:
	:type aSource: XmlObjMgt_Element &
	:param aTarget:
	:type aTarget: Handle_TDF_Data &
	:param aReloc:
	:type aReloc: XmlObjMgt_RRelocationTable &
	:param aDrivers:
	:type aDrivers: Handle_XmlMDF_ADriverTable &
	:rtype: bool
") FromTo;
		static Standard_Boolean FromTo (const XmlObjMgt_Element & aSource,Handle_TDF_Data & aTarget,XmlObjMgt_RRelocationTable & aReloc,const Handle_XmlMDF_ADriverTable & aDrivers);
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute storage drivers to <aDriverSeq>.

	:param aDriverTable:
	:type aDriverTable: Handle_XmlMDF_ADriverTable &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const Handle_XmlMDF_ADriverTable & aDriverTable,const Handle_CDM_MessageDriver & theMessageDriver);
};


%extend XmlMDF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDF_ADriver;
class XmlMDF_ADriver : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available.

	:rtype: int
") VersionNumber;
		virtual Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Creates a new attribute from TDF.

	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type of source object, inheriting from Attribute from TDF.

	:rtype: Handle_Standard_Type
") SourceType;
		Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "	* Returns the full XML tag name (including NS prefix)

	:rtype: TCollection_AsciiString
") TypeName;
		const TCollection_AsciiString & TypeName ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* Translate the contents of <aSource> and put it into <aTarget>, using the relocation table <aRelocTable> to keep the sharings.

	:param aSource:
	:type aSource: XmlObjMgt_Persistent &
	:param aTarget:
	:type aTarget: Handle_TDF_Attribute &
	:param aRelocTable:
	:type aRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const XmlObjMgt_Persistent & aSource,const Handle_TDF_Attribute & aTarget,XmlObjMgt_RRelocationTable & aRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* Translate the contents of <aSource> and put it into <aTarget>, using the relocation table <aRelocTable> to keep the sharings.

	:param aSource:
	:type aSource: Handle_TDF_Attribute &
	:param aTarget:
	:type aTarget: XmlObjMgt_Persistent &
	:param aRelocTable:
	:type aRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & aSource,XmlObjMgt_Persistent & aTarget,XmlObjMgt_SRelocationTable & aRelocTable);
		%feature("compactdefaultargs") WriteMessage;
		%feature("autodoc", "	* Send message to Application (usually when error occurres)

	:param theMessage:
	:type theMessage: TCollection_ExtendedString &
	:rtype: None
") WriteMessage;
		void WriteMessage (const TCollection_ExtendedString & theMessage);
};


%make_alias(XmlMDF_ADriver)

%extend XmlMDF_ADriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDF_ADriverTable;
class XmlMDF_ADriverTable : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") XmlMDF_ADriverTable;
		%feature("autodoc", "	* Creates a mutable ADriverTable from XmlMDF.

	:rtype: None
") XmlMDF_ADriverTable;
		 XmlMDF_ADriverTable ();
		%feature("compactdefaultargs") AddDriver;
		%feature("autodoc", "	* Sets a translation driver: <aDriver>.

	:param anHDriver:
	:type anHDriver: Handle_XmlMDF_ADriver &
	:rtype: None
") AddDriver;
		void AddDriver (const Handle_XmlMDF_ADriver & anHDriver);
		%feature("compactdefaultargs") GetDrivers;
		%feature("autodoc", "	* Gets a map of drivers.

	:rtype: XmlMDF_TypeADriverMap
") GetDrivers;
		const XmlMDF_TypeADriverMap & GetDrivers ();
		%feature("compactdefaultargs") GetDriver;
		%feature("autodoc", "	* Gets a driver <aDriver> according to <aType> //! Returns True if a driver is found; false otherwise.

	:param aType:
	:type aType: Handle_Standard_Type &
	:param anHDriver:
	:type anHDriver: Handle_XmlMDF_ADriver &
	:rtype: bool
") GetDriver;
		Standard_Boolean GetDriver (const Handle_Standard_Type & aType,Handle_XmlMDF_ADriver & anHDriver);
};


%make_alias(XmlMDF_ADriverTable)

%extend XmlMDF_ADriverTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDF_DataMapIteratorOfMapOfDriver;
class XmlMDF_DataMapIteratorOfMapOfDriver : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") XmlMDF_DataMapIteratorOfMapOfDriver;
		%feature("autodoc", "	:rtype: None
") XmlMDF_DataMapIteratorOfMapOfDriver;
		 XmlMDF_DataMapIteratorOfMapOfDriver ();
		%feature("compactdefaultargs") XmlMDF_DataMapIteratorOfMapOfDriver;
		%feature("autodoc", "	:param aMap:
	:type aMap: XmlMDF_MapOfDriver &
	:rtype: None
") XmlMDF_DataMapIteratorOfMapOfDriver;
		 XmlMDF_DataMapIteratorOfMapOfDriver (const XmlMDF_MapOfDriver & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: XmlMDF_MapOfDriver &
	:rtype: None
") Initialize;
		void Initialize (const XmlMDF_MapOfDriver & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		const TCollection_AsciiString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_XmlMDF_ADriver
") Value;
		Handle_XmlMDF_ADriver Value ();
};


%extend XmlMDF_DataMapIteratorOfMapOfDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDF_DataMapIteratorOfTypeADriverMap;
class XmlMDF_DataMapIteratorOfTypeADriverMap : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") XmlMDF_DataMapIteratorOfTypeADriverMap;
		%feature("autodoc", "	:rtype: None
") XmlMDF_DataMapIteratorOfTypeADriverMap;
		 XmlMDF_DataMapIteratorOfTypeADriverMap ();
		%feature("compactdefaultargs") XmlMDF_DataMapIteratorOfTypeADriverMap;
		%feature("autodoc", "	:param aMap:
	:type aMap: XmlMDF_TypeADriverMap &
	:rtype: None
") XmlMDF_DataMapIteratorOfTypeADriverMap;
		 XmlMDF_DataMapIteratorOfTypeADriverMap (const XmlMDF_TypeADriverMap & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: XmlMDF_TypeADriverMap &
	:rtype: None
") Initialize;
		void Initialize (const XmlMDF_TypeADriverMap & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") Key;
		Handle_Standard_Type Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_XmlMDF_ADriver
") Value;
		Handle_XmlMDF_ADriver Value ();
};


%extend XmlMDF_DataMapIteratorOfTypeADriverMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDF_DataMapNodeOfMapOfDriver;
class XmlMDF_DataMapNodeOfMapOfDriver : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") XmlMDF_DataMapNodeOfMapOfDriver;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param I:
	:type I: Handle_XmlMDF_ADriver &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") XmlMDF_DataMapNodeOfMapOfDriver;
		 XmlMDF_DataMapNodeOfMapOfDriver (const TCollection_AsciiString & K,const Handle_XmlMDF_ADriver & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Key;
		TCollection_AsciiString & Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_XmlMDF_ADriver
") Value;
		Handle_XmlMDF_ADriver Value ();
};


%make_alias(XmlMDF_DataMapNodeOfMapOfDriver)

%extend XmlMDF_DataMapNodeOfMapOfDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDF_DataMapNodeOfTypeADriverMap;
class XmlMDF_DataMapNodeOfTypeADriverMap : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") XmlMDF_DataMapNodeOfTypeADriverMap;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:param I:
	:type I: Handle_XmlMDF_ADriver &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") XmlMDF_DataMapNodeOfTypeADriverMap;
		 XmlMDF_DataMapNodeOfTypeADriverMap (const Handle_Standard_Type & K,const Handle_XmlMDF_ADriver & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
") Key;
		Handle_Standard_Type Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_XmlMDF_ADriver
") Value;
		Handle_XmlMDF_ADriver Value ();
};


%make_alias(XmlMDF_DataMapNodeOfTypeADriverMap)

%extend XmlMDF_DataMapNodeOfTypeADriverMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDF_MapOfDriver;
class XmlMDF_MapOfDriver : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") XmlMDF_MapOfDriver;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") XmlMDF_MapOfDriver;
		 XmlMDF_MapOfDriver (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: XmlMDF_MapOfDriver &
	:rtype: XmlMDF_MapOfDriver
") Assign;
		XmlMDF_MapOfDriver & Assign (const XmlMDF_MapOfDriver & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: XmlMDF_MapOfDriver &
	:rtype: XmlMDF_MapOfDriver
") operator =;
		XmlMDF_MapOfDriver & operator = (const XmlMDF_MapOfDriver & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:param I:
	:type I: Handle_XmlMDF_ADriver &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TCollection_AsciiString & K,const Handle_XmlMDF_ADriver & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Handle_XmlMDF_ADriver
") Find;
		Handle_XmlMDF_ADriver Find (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Handle_XmlMDF_ADriver
") ChangeFind;
		Handle_XmlMDF_ADriver ChangeFind (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TCollection_AsciiString & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TCollection_AsciiString &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TCollection_AsciiString & K);
};


%extend XmlMDF_MapOfDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDF_TypeADriverMap;
class XmlMDF_TypeADriverMap : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") XmlMDF_TypeADriverMap;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") XmlMDF_TypeADriverMap;
		 XmlMDF_TypeADriverMap (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: XmlMDF_TypeADriverMap &
	:rtype: XmlMDF_TypeADriverMap
") Assign;
		XmlMDF_TypeADriverMap & Assign (const XmlMDF_TypeADriverMap & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: XmlMDF_TypeADriverMap &
	:rtype: XmlMDF_TypeADriverMap
") operator =;
		XmlMDF_TypeADriverMap & operator = (const XmlMDF_TypeADriverMap & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:param I:
	:type I: Handle_XmlMDF_ADriver &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const Handle_Standard_Type & K,const Handle_XmlMDF_ADriver & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Handle_XmlMDF_ADriver
") Find;
		Handle_XmlMDF_ADriver Find (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Handle_XmlMDF_ADriver
") ChangeFind;
		Handle_XmlMDF_ADriver ChangeFind (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const Handle_Standard_Type & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: Handle_Standard_Type &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const Handle_Standard_Type & K);
};


%extend XmlMDF_TypeADriverMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDF_ReferenceDriver;
class XmlMDF_ReferenceDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDF_ReferenceDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDF_ReferenceDriver;
		 XmlMDF_ReferenceDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(XmlMDF_ReferenceDriver)

%extend XmlMDF_ReferenceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDF_TagSourceDriver;
class XmlMDF_TagSourceDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDF_TagSourceDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDF_TagSourceDriver;
		 XmlMDF_TagSourceDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%make_alias(XmlMDF_TagSourceDriver)

%extend XmlMDF_TagSourceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
