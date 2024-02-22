/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
%define XMLDRIVERSDOCSTRING
"XmlDrivers module, see official documentation at
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_xmldrivers.html"
%enddef
%module (package="OCC.Core", docstring=XMLDRIVERSDOCSTRING) XmlDrivers


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
#include<XmlDrivers_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<XmlMDF_module.hxx>
#include<TDocStd_module.hxx>
#include<XmlLDrivers_module.hxx>
#include<XmlObjMgt_module.hxx>
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
%import Message.i
%import XmlMDF.i
%import TDocStd.i
%import XmlLDrivers.i
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
%wrap_handle(XmlDrivers_DocumentRetrievalDriver)
%wrap_handle(XmlDrivers_DocumentStorageDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*******************
* class XmlDrivers *
*******************/
%rename(xmldrivers) XmlDrivers;
class XmlDrivers {
	public:
		/****************** AttributeDrivers ******************/
		/**** md5 signature: 08d744ca820fa43305d43b8e54b1d5dc ****/
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
		static opencascade::handle<XmlMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** DefineFormat ******************/
		/**** md5 signature: 2ae4ef4b935d04445595a5553ed3615b ****/
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
Defines format 'xmlocaf' and registers its read and write drivers in the specified application.
") DefineFormat;
		static void DefineFormat(const opencascade::handle<TDocStd_Application> & theApp);

		/****************** Factory ******************/
		/**** md5 signature: 9e70ed3bca71e988f9b9e86628ed8ed4 ****/
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "
Parameters
----------
theGUID: Standard_GUID

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
") Factory;
		static const opencascade::handle<Standard_Transient> & Factory(const Standard_GUID & theGUID);

};


%extend XmlDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class XmlDrivers_DocumentRetrievalDriver *
*******************************************/
class XmlDrivers_DocumentRetrievalDriver : public XmlLDrivers_DocumentRetrievalDriver {
	public:
		/****************** XmlDrivers_DocumentRetrievalDriver ******************/
		/**** md5 signature: 1c38d20bba89fba514dd979e4c136cac ****/
		%feature("compactdefaultargs") XmlDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XmlDrivers_DocumentRetrievalDriver;
		 XmlDrivers_DocumentRetrievalDriver();

		/****************** AttributeDrivers ******************/
		/**** md5 signature: 8f96c34c95c7e9b565e8874b99e9133c ****/
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

		/****************** ReadShapeSection ******************/
		/**** md5 signature: e6c8d6b2639a12f4b1c8a6050a5f3163 ****/
		%feature("compactdefaultargs") ReadShapeSection;
		%feature("autodoc", "
Parameters
----------
thePDoc: XmlObjMgt_Element
theMsgDriver: Message_Messenger
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<XmlMDF_ADriver>

Description
-----------
No available documentation.
") ReadShapeSection;
		virtual opencascade::handle<XmlMDF_ADriver> ReadShapeSection(const XmlObjMgt_Element & thePDoc, const opencascade::handle<Message_Messenger> & theMsgDriver, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** ShapeSetCleaning ******************/
		/**** md5 signature: 4932412d0f0136668a4280a7c86030ec ****/
		%feature("compactdefaultargs") ShapeSetCleaning;
		%feature("autodoc", "
Parameters
----------
theDriver: XmlMDF_ADriver

Return
-------
None

Description
-----------
No available documentation.
") ShapeSetCleaning;
		virtual void ShapeSetCleaning(const opencascade::handle<XmlMDF_ADriver> & theDriver);

};


%make_alias(XmlDrivers_DocumentRetrievalDriver)

%extend XmlDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class XmlDrivers_DocumentStorageDriver *
*****************************************/
class XmlDrivers_DocumentStorageDriver : public XmlLDrivers_DocumentStorageDriver {
	public:
		/****************** XmlDrivers_DocumentStorageDriver ******************/
		/**** md5 signature: fd136f261cd9e3224f53b77b7c675099 ****/
		%feature("compactdefaultargs") XmlDrivers_DocumentStorageDriver;
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
") XmlDrivers_DocumentStorageDriver;
		 XmlDrivers_DocumentStorageDriver(TCollection_ExtendedString theCopyright);

		/****************** AttributeDrivers ******************/
		/**** md5 signature: 8f96c34c95c7e9b565e8874b99e9133c ****/
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

		/****************** WriteShapeSection ******************/
		/**** md5 signature: 4760c0c9885febf6a979848ca7454a48 ****/
		%feature("compactdefaultargs") WriteShapeSection;
		%feature("autodoc", "
Parameters
----------
thePDoc: XmlObjMgt_Element
theStorageFormatVersion: TDocStd_FormatVersion
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
No available documentation.
") WriteShapeSection;
		virtual Standard_Boolean WriteShapeSection(XmlObjMgt_Element & thePDoc, const TDocStd_FormatVersion theStorageFormatVersion, const Message_ProgressRange & theRange = Message_ProgressRange());

};


%make_alias(XmlDrivers_DocumentStorageDriver)

%extend XmlDrivers_DocumentStorageDriver {
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
def xmldrivers_AttributeDrivers(*args):
	return xmldrivers.AttributeDrivers(*args)

@deprecated
def xmldrivers_DefineFormat(*args):
	return xmldrivers.DefineFormat(*args)

@deprecated
def xmldrivers_Factory(*args):
	return xmldrivers.Factory(*args)

}
