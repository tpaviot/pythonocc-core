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
%define XMLXCAFDRIVERSDOCSTRING
"XmlXCAFDrivers module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_xmlxcafdrivers.html"
%enddef
%module (package="OCC.Core", docstring=XMLXCAFDRIVERSDOCSTRING) XmlXCAFDrivers


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
#include<XmlXCAFDrivers_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDocStd_module.hxx>
#include<XmlDrivers_module.hxx>
#include<Message_module.hxx>
#include<XmlMDF_module.hxx>
#include<TCollection_module.hxx>
#include<Resource_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<CDF_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TDocStd.i
%import XmlDrivers.i
%import Message.i
%import XmlMDF.i
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
%wrap_handle(XmlXCAFDrivers_DocumentRetrievalDriver)
%wrap_handle(XmlXCAFDrivers_DocumentStorageDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***********************
* class XmlXCAFDrivers *
***********************/
%rename(xmlxcafdrivers) XmlXCAFDrivers;
class XmlXCAFDrivers {
	public:
		/****** XmlXCAFDrivers::DefineFormat ******/
		/****** md5 signature: 2ae4ef4b935d04445595a5553ed3615b ******/
		%feature("compactdefaultargs") DefineFormat;
		%feature("autodoc", "
Parameters
----------
theApp: TDocStd_Application

Return
-------
None

Description
-----------
Defines format 'XmlXCAF' and registers its read and write drivers in the specified application.
") DefineFormat;
		static void DefineFormat(const opencascade::handle<TDocStd_Application> & theApp);

		/****** XmlXCAFDrivers::Factory ******/
		/****** md5 signature: 3da280e6bb218a5037c98dc98a4e3815 ******/
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "
Parameters
----------
aGUID: Standard_GUID

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Depending from the ID, returns a list of storage or retrieval attribute drivers. Used for plugin. //! Standard data model drivers =========================== 47b0b826-d931-11d1-b5da-00a0c9064368 Transient-Persistent 47b0b827-d931-11d1-b5da-00a0c9064368 Persistent-Transient //! XCAF data model drivers ================================= ed8793f8-3142-11d4-b9b5-0060b0ee281b Transient-Persistent ed8793f9-3142-11d4-b9b5-0060b0ee281b Persistent-Transient ed8793fa-3142-11d4-b9b5-0060b0ee281b XCAFSchema.
") Factory;
		static const opencascade::handle<Standard_Transient> & Factory(const Standard_GUID & aGUID);

};


%extend XmlXCAFDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class XmlXCAFDrivers_DocumentRetrievalDriver *
***********************************************/
class XmlXCAFDrivers_DocumentRetrievalDriver : public XmlDrivers_DocumentRetrievalDriver {
	public:
		/****** XmlXCAFDrivers_DocumentRetrievalDriver::XmlXCAFDrivers_DocumentRetrievalDriver ******/
		/****** md5 signature: 9beb6699d1b2c6ff4d2c46e0f7ad385b ******/
		%feature("compactdefaultargs") XmlXCAFDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XmlXCAFDrivers_DocumentRetrievalDriver;
		 XmlXCAFDrivers_DocumentRetrievalDriver();

		/****** XmlXCAFDrivers_DocumentRetrievalDriver::AttributeDrivers ******/
		/****** md5 signature: 8f96c34c95c7e9b565e8874b99e9133c ******/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
opencascade::handle<XmlMDF_ADriverTable>

Description
-----------
No available documentation.
") AttributeDrivers;
		virtual opencascade::handle<XmlMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

};


%make_alias(XmlXCAFDrivers_DocumentRetrievalDriver)

%extend XmlXCAFDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class XmlXCAFDrivers_DocumentStorageDriver *
*********************************************/
class XmlXCAFDrivers_DocumentStorageDriver : public XmlDrivers_DocumentStorageDriver {
	public:
		/****** XmlXCAFDrivers_DocumentStorageDriver::XmlXCAFDrivers_DocumentStorageDriver ******/
		/****** md5 signature: 71d96a93a79deba990e4fea2cd40f4ed ******/
		%feature("compactdefaultargs") XmlXCAFDrivers_DocumentStorageDriver;
		%feature("autodoc", "
Parameters
----------
theCopyright: str

Return
-------
None

Description
-----------
No available documentation.
") XmlXCAFDrivers_DocumentStorageDriver;
		 XmlXCAFDrivers_DocumentStorageDriver(TCollection_ExtendedString theCopyright);

		/****** XmlXCAFDrivers_DocumentStorageDriver::AttributeDrivers ******/
		/****** md5 signature: 8f96c34c95c7e9b565e8874b99e9133c ******/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
opencascade::handle<XmlMDF_ADriverTable>

Description
-----------
No available documentation.
") AttributeDrivers;
		virtual opencascade::handle<XmlMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

};


%make_alias(XmlXCAFDrivers_DocumentStorageDriver)

%extend XmlXCAFDrivers_DocumentStorageDriver {
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
def xmlxcafdrivers_DefineFormat(*args):
	return xmlxcafdrivers.DefineFormat(*args)

@deprecated
def xmlxcafdrivers_Factory(*args):
	return xmlxcafdrivers.Factory(*args)

}
