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
%define XMLLDRIVERSDOCSTRING
"XmlLDrivers module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xmlldrivers.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** AttributeDrivers ******************/
		/**** md5 signature: 08d744ca820fa43305d43b8e54b1d5dc ****/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
opencascade::handle<XmlMDF_ADriverTable>
") AttributeDrivers;
		static opencascade::handle<XmlMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** CreationDate ******************/
		/**** md5 signature: c3236ab34dc20a2deee56080c6681b3e ****/
		%feature("compactdefaultargs") CreationDate;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") CreationDate;
		static TCollection_AsciiString CreationDate();

		/****************** DefineFormat ******************/
		/**** md5 signature: 2ae4ef4b935d04445595a5553ed3615b ****/
		%feature("compactdefaultargs") DefineFormat;
		%feature("autodoc", "Defines format 'xmllocaf' and registers its read and write drivers in the specified application.

Parameters
----------
theApp: TDocStd_Application

Returns
-------
None
") DefineFormat;
		static void DefineFormat(const opencascade::handle<TDocStd_Application> & theApp);

		/****************** Factory ******************/
		/**** md5 signature: 9e70ed3bca71e988f9b9e86628ed8ed4 ****/
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "No available documentation.

Parameters
----------
theGUID: Standard_GUID

Returns
-------
opencascade::handle<Standard_Transient>
") Factory;
		static const opencascade::handle<Standard_Transient> & Factory(const Standard_GUID & theGUID);

		/****************** StorageVersion ******************/
		/**** md5 signature: 31bd68873566544a57a9fa9494380ade ****/
		%feature("compactdefaultargs") StorageVersion;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") StorageVersion;
		static int StorageVersion();

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
		/****************** XmlLDrivers_DocumentRetrievalDriver ******************/
		/**** md5 signature: b7cc7840dd73193a835f8ea879c08109 ****/
		%feature("compactdefaultargs") XmlLDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XmlLDrivers_DocumentRetrievalDriver;
		 XmlLDrivers_DocumentRetrievalDriver();

		/****************** AttributeDrivers ******************/
		/**** md5 signature: 8df783b7f95c753e0804758cea795cef ****/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
opencascade::handle<XmlMDF_ADriverTable>
") AttributeDrivers;
		virtual opencascade::handle<XmlMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** CreateDocument ******************/
		/**** md5 signature: d7e352e938b9f62ab597a280f53e96dc ****/
		%feature("compactdefaultargs") CreateDocument;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<CDM_Document>
") CreateDocument;
		virtual opencascade::handle<CDM_Document> CreateDocument();

		/****************** Read ******************/
		/**** md5 signature: a0e4644be6fe7bbb4ae862adb6817646 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFileName: TCollection_ExtendedString
theNewDocument: CDM_Document
theApplication: CDM_Application

Returns
-------
None
") Read;
		virtual void Read(const TCollection_ExtendedString & theFileName, const opencascade::handle<CDM_Document> & theNewDocument, const opencascade::handle<CDM_Application> & theApplication);

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
		/****************** XmlLDrivers_DocumentStorageDriver ******************/
		/**** md5 signature: 5091fd5bd4fa743ad8fe7947041658e6 ****/
		%feature("compactdefaultargs") XmlLDrivers_DocumentStorageDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theCopyright: TCollection_ExtendedString

Returns
-------
None
") XmlLDrivers_DocumentStorageDriver;
		 XmlLDrivers_DocumentStorageDriver(const TCollection_ExtendedString & theCopyright);

		/****************** AttributeDrivers ******************/
		/**** md5 signature: 8df783b7f95c753e0804758cea795cef ****/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
opencascade::handle<XmlMDF_ADriverTable>
") AttributeDrivers;
		virtual opencascade::handle<XmlMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** Write ******************/
		/**** md5 signature: 6a7ef59f77968568190e502f957cdad3 ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDocument: CDM_Document
theFileName: TCollection_ExtendedString

Returns
-------
None
") Write;
		virtual void Write(const opencascade::handle<CDM_Document> & theDocument, const TCollection_ExtendedString & theFileName);

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
		/****************** XmlLDrivers_NamespaceDef ******************/
		/**** md5 signature: 4322762040d34698d4489046962dbd43 ****/
		%feature("compactdefaultargs") XmlLDrivers_NamespaceDef;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XmlLDrivers_NamespaceDef;
		 XmlLDrivers_NamespaceDef();

		/****************** XmlLDrivers_NamespaceDef ******************/
		/**** md5 signature: 891fdab46adff6414fc7856d235fadd7 ****/
		%feature("compactdefaultargs") XmlLDrivers_NamespaceDef;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePrefix: TCollection_AsciiString
theURI: TCollection_AsciiString

Returns
-------
None
") XmlLDrivers_NamespaceDef;
		 XmlLDrivers_NamespaceDef(const TCollection_AsciiString & thePrefix, const TCollection_AsciiString & theURI);

		/****************** Prefix ******************/
		/**** md5 signature: 3891509b09d4df1a141a4efe34da89ee ****/
		%feature("compactdefaultargs") Prefix;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") Prefix;
		const TCollection_AsciiString & Prefix();

		/****************** URI ******************/
		/**** md5 signature: cc974bf2bbf82049cc50012b0e0c123a ****/
		%feature("compactdefaultargs") URI;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
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
