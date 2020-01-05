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
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(XmlLDrivers_DocumentRetrievalDriver)
%wrap_handle(XmlLDrivers_DocumentStorageDriver)
/* end handles declaration */

/* templates */
%template(XmlLDrivers_SequenceOfNamespaceDef) NCollection_Sequence <XmlLDrivers_NamespaceDef>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <XmlLDrivers_NamespaceDef> XmlLDrivers_SequenceOfNamespaceDef;
/* end typedefs declaration */

/********************
* class XmlLDrivers *
********************/
%rename(xmlldrivers) XmlLDrivers;
class XmlLDrivers {
	public:
		/****************** AttributeDrivers ******************/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: opencascade::handle<XmlMDF_ADriverTable>") AttributeDrivers;
		static opencascade::handle<XmlMDF_ADriverTable> AttributeDrivers (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** CreationDate ******************/
		%feature("compactdefaultargs") CreationDate;
		%feature("autodoc", ":rtype: TCollection_AsciiString") CreationDate;
		static TCollection_AsciiString CreationDate ();

		/****************** DefineFormat ******************/
		%feature("compactdefaultargs") DefineFormat;
		%feature("autodoc", "* Defines format 'XmlLOcaf' and registers its read and write drivers in the specified application
	:param theApp:
	:type theApp: TDocStd_Application
	:rtype: void") DefineFormat;
		static void DefineFormat (const opencascade::handle<TDocStd_Application> & theApp);

		/****************** Factory ******************/
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", ":param theGUID:
	:type theGUID: Standard_GUID
	:rtype: opencascade::handle<Standard_Transient>") Factory;
		static const opencascade::handle<Standard_Transient> & Factory (const Standard_GUID & theGUID);

		/****************** StorageVersion ******************/
		%feature("compactdefaultargs") StorageVersion;
		%feature("autodoc", ":rtype: int") StorageVersion;
		static int StorageVersion ();

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
		/****************** AttributeDrivers ******************/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: opencascade::handle<XmlMDF_ADriverTable>") AttributeDrivers;
		virtual opencascade::handle<XmlMDF_ADriverTable> AttributeDrivers (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** CreateDocument ******************/
		%feature("compactdefaultargs") CreateDocument;
		%feature("autodoc", ":rtype: opencascade::handle<CDM_Document>") CreateDocument;
		virtual opencascade::handle<CDM_Document> CreateDocument ();

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", ":param theFileName:
	:type theFileName: TCollection_ExtendedString
	:param theNewDocument:
	:type theNewDocument: CDM_Document
	:param theApplication:
	:type theApplication: CDM_Application
	:rtype: void") Read;
		virtual void Read (const TCollection_ExtendedString & theFileName,const opencascade::handle<CDM_Document> & theNewDocument,const opencascade::handle<CDM_Application> & theApplication);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", ":param theIStream:
	:type theIStream: Standard_IStream
	:param theStorageData:
	:type theStorageData: Storage_Data
	:param theDoc:
	:type theDoc: CDM_Document
	:param theApplication:
	:type theApplication: CDM_Application
	:rtype: void") Read;
		virtual void Read (Standard_IStream & theIStream,const opencascade::handle<Storage_Data> & theStorageData,const opencascade::handle<CDM_Document> & theDoc,const opencascade::handle<CDM_Application> & theApplication);

		/****************** XmlLDrivers_DocumentRetrievalDriver ******************/
		%feature("compactdefaultargs") XmlLDrivers_DocumentRetrievalDriver;
		%feature("autodoc", ":rtype: None") XmlLDrivers_DocumentRetrievalDriver;
		 XmlLDrivers_DocumentRetrievalDriver ();

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
		/****************** AttributeDrivers ******************/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: opencascade::handle<XmlMDF_ADriverTable>") AttributeDrivers;
		virtual opencascade::handle<XmlMDF_ADriverTable> AttributeDrivers (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", ":param theDocument:
	:type theDocument: CDM_Document
	:param theFileName:
	:type theFileName: TCollection_ExtendedString
	:rtype: void") Write;
		virtual void Write (const opencascade::handle<CDM_Document> & theDocument,const TCollection_ExtendedString & theFileName);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", ":param theDocument:
	:type theDocument: CDM_Document
	:param theOStream:
	:type theOStream: Standard_OStream
	:rtype: void") Write;
		virtual void Write (const opencascade::handle<CDM_Document> & theDocument,Standard_OStream & theOStream);

		/****************** XmlLDrivers_DocumentStorageDriver ******************/
		%feature("compactdefaultargs") XmlLDrivers_DocumentStorageDriver;
		%feature("autodoc", ":param theCopyright:
	:type theCopyright: TCollection_ExtendedString
	:rtype: None") XmlLDrivers_DocumentStorageDriver;
		 XmlLDrivers_DocumentStorageDriver (const TCollection_ExtendedString & theCopyright);

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
		/****************** Prefix ******************/
		%feature("compactdefaultargs") Prefix;
		%feature("autodoc", ":rtype: TCollection_AsciiString") Prefix;
		const TCollection_AsciiString & Prefix ();

		/****************** URI ******************/
		%feature("compactdefaultargs") URI;
		%feature("autodoc", ":rtype: TCollection_AsciiString") URI;
		const TCollection_AsciiString & URI ();

		/****************** XmlLDrivers_NamespaceDef ******************/
		%feature("compactdefaultargs") XmlLDrivers_NamespaceDef;
		%feature("autodoc", ":rtype: None") XmlLDrivers_NamespaceDef;
		 XmlLDrivers_NamespaceDef ();

		/****************** XmlLDrivers_NamespaceDef ******************/
		%feature("compactdefaultargs") XmlLDrivers_NamespaceDef;
		%feature("autodoc", ":param thePrefix:
	:type thePrefix: TCollection_AsciiString
	:param theURI:
	:type theURI: TCollection_AsciiString
	:rtype: None") XmlLDrivers_NamespaceDef;
		 XmlLDrivers_NamespaceDef (const TCollection_AsciiString & thePrefix,const TCollection_AsciiString & theURI);

};


%extend XmlLDrivers_NamespaceDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
