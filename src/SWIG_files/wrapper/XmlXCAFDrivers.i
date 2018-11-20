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
%define XMLXCAFDRIVERSDOCSTRING
"
"
%enddef
%module (package="OCC.Core", docstring=XMLXCAFDRIVERSDOCSTRING) XmlXCAFDrivers

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


%include XmlXCAFDrivers_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(XmlXCAFDrivers_DocumentRetrievalDriver)
%wrap_handle(XmlXCAFDrivers_DocumentStorageDriver)

%rename(xmlxcafdrivers) XmlXCAFDrivers;
class XmlXCAFDrivers {
	public:
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "	* Depending from the ID, returns a list of storage or retrieval attribute drivers. Used for plugin. //! Standard data model drivers =========================== 47b0b826-d931-11d1-b5da-00a0c9064368 Transient-Persistent 47b0b827-d931-11d1-b5da-00a0c9064368 Persistent-Transient //! XCAF data model drivers ================================= ed8793f8-3142-11d4-b9b5-0060b0ee281b Transient-Persistent ed8793f9-3142-11d4-b9b5-0060b0ee281b Persistent-Transient ed8793fa-3142-11d4-b9b5-0060b0ee281b XCAFSchema

	:param aGUID:
	:type aGUID: Standard_GUID &
	:rtype: Handle_Standard_Transient
") Factory;
		static Handle_Standard_Transient Factory (const Standard_GUID & aGUID);
};


%extend XmlXCAFDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlXCAFDrivers_DocumentRetrievalDriver;
class XmlXCAFDrivers_DocumentRetrievalDriver : public XmlDrivers_DocumentRetrievalDriver {
	public:
		%feature("compactdefaultargs") XmlXCAFDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "	:rtype: None
") XmlXCAFDrivers_DocumentRetrievalDriver;
		 XmlXCAFDrivers_DocumentRetrievalDriver ();
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_XmlMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_XmlMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%make_alias(XmlXCAFDrivers_DocumentRetrievalDriver)

%extend XmlXCAFDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlXCAFDrivers_DocumentStorageDriver;
class XmlXCAFDrivers_DocumentStorageDriver : public XmlDrivers_DocumentStorageDriver {
	public:
		%feature("compactdefaultargs") XmlXCAFDrivers_DocumentStorageDriver;
		%feature("autodoc", "	:param theCopyright:
	:type theCopyright: TCollection_ExtendedString &
	:rtype: None
") XmlXCAFDrivers_DocumentStorageDriver;
		 XmlXCAFDrivers_DocumentStorageDriver (const TCollection_ExtendedString & theCopyright);
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_XmlMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_XmlMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%make_alias(XmlXCAFDrivers_DocumentStorageDriver)

%extend XmlXCAFDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
