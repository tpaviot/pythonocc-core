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
%define XMLLDRIVERSDOCSTRING
"XmlLDrivers module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_xmlldrivers.html"
%enddef
%module (package="OCC.Core", docstring=XMLLDRIVERSDOCSTRING) XmlLDrivers


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
#include<XmlLDrivers_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<XmlMDF_module.hxx>
#include<TCollection_module.hxx>
#include<TDocStd_module.hxx>
#include<PCDM_module.hxx>
#include<CDM_module.hxx>
#include<Storage_module.hxx>
#include<Resource_module.hxx>
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
%import TCollection.i
%import TDocStd.i
%import PCDM.i
%import CDM.i
%import Storage.i

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
%wrap_handle(XmlLDrivers_DocumentRetrievalDriver)
%wrap_handle(XmlLDrivers_DocumentStorageDriver)
/* end handles declaration */

/* templates */
%template(XmlLDrivers_SequenceOfNamespaceDef) NCollection_Sequence<XmlLDrivers_NamespaceDef>;

%extend NCollection_Sequence<XmlLDrivers_NamespaceDef> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<XmlLDrivers_NamespaceDef> XmlLDrivers_SequenceOfNamespaceDef;
/* end typedefs declaration */

/********************
* class XmlLDrivers *
********************/
%rename(xmlldrivers) XmlLDrivers;
class XmlLDrivers {
	public:
		/****** XmlLDrivers::AttributeDrivers ******/
		/****** md5 signature: 08d744ca820fa43305d43b8e54b1d5dc ******/
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

		/****** XmlLDrivers::CreationDate ******/
		/****** md5 signature: c3236ab34dc20a2deee56080c6681b3e ******/
		%feature("compactdefaultargs") CreationDate;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") CreationDate;
		static TCollection_AsciiString CreationDate();

		/****** XmlLDrivers::DefineFormat ******/
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
Defines format 'XmlLOcaf' and registers its read and write drivers in the specified application.
") DefineFormat;
		static void DefineFormat(const opencascade::handle<TDocStd_Application> & theApp);

		/****** XmlLDrivers::Factory ******/
		/****** md5 signature: 9e70ed3bca71e988f9b9e86628ed8ed4 ******/
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


%extend XmlLDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class XmlLDrivers_DocumentRetrievalDriver *
********************************************/
class XmlLDrivers_DocumentRetrievalDriver : public PCDM_RetrievalDriver {
	public:
		/****** XmlLDrivers_DocumentRetrievalDriver::XmlLDrivers_DocumentRetrievalDriver ******/
		/****** md5 signature: b7cc7840dd73193a835f8ea879c08109 ******/
		%feature("compactdefaultargs") XmlLDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XmlLDrivers_DocumentRetrievalDriver;
		 XmlLDrivers_DocumentRetrievalDriver();

		/****** XmlLDrivers_DocumentRetrievalDriver::AttributeDrivers ******/
		/****** md5 signature: 8df783b7f95c753e0804758cea795cef ******/
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

		/****** XmlLDrivers_DocumentRetrievalDriver::Read ******/
		/****** md5 signature: d00a6a8efb84379816422604bd70ebf9 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theFileName: str
theNewDocument: CDM_Document
theApplication: CDM_Application
theFilter: PCDM_ReaderFilter (optional, default to opencascade::handle<PCDM_ReaderFilter>())
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") Read;
		virtual void Read(TCollection_ExtendedString theFileName, const opencascade::handle<CDM_Document> & theNewDocument, const opencascade::handle<CDM_Application> & theApplication, const opencascade::handle<PCDM_ReaderFilter> & theFilter = opencascade::handle<PCDM_ReaderFilter>(), const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** XmlLDrivers_DocumentRetrievalDriver::Read ******/
		/****** md5 signature: 4a77300577377854b68d84da8ab8bdf0 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theIStream: str
theStorageData: Storage_Data
theDoc: CDM_Document
theApplication: CDM_Application
theFilter: PCDM_ReaderFilter (optional, default to opencascade::handle<PCDM_ReaderFilter>())
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") Read;
		virtual void Read(std::istream & theIStream, const opencascade::handle<Storage_Data> & theStorageData, const opencascade::handle<CDM_Document> & theDoc, const opencascade::handle<CDM_Application> & theApplication, const opencascade::handle<PCDM_ReaderFilter> & theFilter = opencascade::handle<PCDM_ReaderFilter>(), const Message_ProgressRange & theRange = Message_ProgressRange());

};


%make_alias(XmlLDrivers_DocumentRetrievalDriver)

%extend XmlLDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class XmlLDrivers_DocumentStorageDriver *
******************************************/
class XmlLDrivers_DocumentStorageDriver : public PCDM_StorageDriver {
	public:
		/****** XmlLDrivers_DocumentStorageDriver::XmlLDrivers_DocumentStorageDriver ******/
		/****** md5 signature: 5091fd5bd4fa743ad8fe7947041658e6 ******/
		%feature("compactdefaultargs") XmlLDrivers_DocumentStorageDriver;
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
") XmlLDrivers_DocumentStorageDriver;
		 XmlLDrivers_DocumentStorageDriver(TCollection_ExtendedString theCopyright);

		/****** XmlLDrivers_DocumentStorageDriver::AttributeDrivers ******/
		/****** md5 signature: 8df783b7f95c753e0804758cea795cef ******/
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

		/****** XmlLDrivers_DocumentStorageDriver::Write ******/
		/****** md5 signature: 3ba5a4920118cfb01ca7cb6e94265c60 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theDocument: CDM_Document
theFileName: str
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
No available documentation.
") Write;
		virtual void Write(const opencascade::handle<CDM_Document> & theDocument, TCollection_ExtendedString theFileName, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****** XmlLDrivers_DocumentStorageDriver::Write ******/
		/****** md5 signature: 1593005190d18463c833b2c78ffb13a5 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theDocument: CDM_Document
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
theOStream: Standard_OStream

Description
-----------
No available documentation.
") Write;
		virtual void Write(const opencascade::handle<CDM_Document> & theDocument, std::ostream &OutValue, const Message_ProgressRange & theRange = Message_ProgressRange());

};


%make_alias(XmlLDrivers_DocumentStorageDriver)

%extend XmlLDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class XmlLDrivers_NamespaceDef *
*********************************/
class XmlLDrivers_NamespaceDef {
	public:
		/****** XmlLDrivers_NamespaceDef::XmlLDrivers_NamespaceDef ******/
		/****** md5 signature: 4322762040d34698d4489046962dbd43 ******/
		%feature("compactdefaultargs") XmlLDrivers_NamespaceDef;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XmlLDrivers_NamespaceDef;
		 XmlLDrivers_NamespaceDef();

		/****** XmlLDrivers_NamespaceDef::XmlLDrivers_NamespaceDef ******/
		/****** md5 signature: 891fdab46adff6414fc7856d235fadd7 ******/
		%feature("compactdefaultargs") XmlLDrivers_NamespaceDef;
		%feature("autodoc", "
Parameters
----------
thePrefix: str
theURI: str

Return
-------
None

Description
-----------
No available documentation.
") XmlLDrivers_NamespaceDef;
		 XmlLDrivers_NamespaceDef(TCollection_AsciiString thePrefix, TCollection_AsciiString theURI);

		/****** XmlLDrivers_NamespaceDef::Prefix ******/
		/****** md5 signature: 3891509b09d4df1a141a4efe34da89ee ******/
		%feature("compactdefaultargs") Prefix;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") Prefix;
		const TCollection_AsciiString & Prefix();

		/****** XmlLDrivers_NamespaceDef::URI ******/
		/****** md5 signature: cc974bf2bbf82049cc50012b0e0c123a ******/
		%feature("compactdefaultargs") URI;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") URI;
		const TCollection_AsciiString & URI();

};


%extend XmlLDrivers_NamespaceDef {
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
def xmlldrivers_AttributeDrivers(*args):
	return xmlldrivers.AttributeDrivers(*args)

@deprecated
def xmlldrivers_CreationDate(*args):
	return xmlldrivers.CreationDate(*args)

@deprecated
def xmlldrivers_DefineFormat(*args):
	return xmlldrivers.DefineFormat(*args)

@deprecated
def xmlldrivers_Factory(*args):
	return xmlldrivers.Factory(*args)

}
