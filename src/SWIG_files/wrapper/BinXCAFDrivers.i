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
%define BINXCAFDRIVERSDOCSTRING
"BinXCAFDrivers module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_binxcafdrivers.html"
%enddef
%module (package="OCC.Core", docstring=BINXCAFDRIVERSDOCSTRING) BinXCAFDrivers


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
#include<BinXCAFDrivers_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Message_module.hxx>
#include<BinMDF_module.hxx>
#include<TDocStd_module.hxx>
#include<BinDrivers_module.hxx>
#include<Resource_module.hxx>
#include<PCDM_module.hxx>
#include<LDOM_module.hxx>
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
%import BinMDF.i
%import TDocStd.i
%import BinDrivers.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(BinXCAFDrivers_DocumentRetrievalDriver)
%wrap_handle(BinXCAFDrivers_DocumentStorageDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***********************
* class BinXCAFDrivers *
***********************/
%rename(binxcafdrivers) BinXCAFDrivers;
class BinXCAFDrivers {
	public:
		/****************** AttributeDrivers ******************/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "* Creates the table of drivers of types supported
	:param MsgDrv:
	:type MsgDrv: Message_Messenger
	:rtype: opencascade::handle<BinMDF_ADriverTable>") AttributeDrivers;
		static opencascade::handle<BinMDF_ADriverTable> AttributeDrivers (const opencascade::handle<Message_Messenger> & MsgDrv);

		/****************** DefineFormat ******************/
		%feature("compactdefaultargs") DefineFormat;
		%feature("autodoc", "* Defines format 'BinXCAF' and registers its read and write drivers in the specified application
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

};


%extend BinXCAFDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class BinXCAFDrivers_DocumentRetrievalDriver *
***********************************************/
class BinXCAFDrivers_DocumentRetrievalDriver : public BinDrivers_DocumentRetrievalDriver {
	public:
		/****************** AttributeDrivers ******************/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: opencascade::handle<BinMDF_ADriverTable>") AttributeDrivers;
		virtual opencascade::handle<BinMDF_ADriverTable> AttributeDrivers (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** BinXCAFDrivers_DocumentRetrievalDriver ******************/
		%feature("compactdefaultargs") BinXCAFDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "* Constructor
	:rtype: None") BinXCAFDrivers_DocumentRetrievalDriver;
		 BinXCAFDrivers_DocumentRetrievalDriver ();

};


%make_alias(BinXCAFDrivers_DocumentRetrievalDriver)

%extend BinXCAFDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class BinXCAFDrivers_DocumentStorageDriver *
*********************************************/
class BinXCAFDrivers_DocumentStorageDriver : public BinDrivers_DocumentStorageDriver {
	public:
		/****************** AttributeDrivers ******************/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", ":param theMsgDriver:
	:type theMsgDriver: Message_Messenger
	:rtype: opencascade::handle<BinMDF_ADriverTable>") AttributeDrivers;
		virtual opencascade::handle<BinMDF_ADriverTable> AttributeDrivers (const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** BinXCAFDrivers_DocumentStorageDriver ******************/
		%feature("compactdefaultargs") BinXCAFDrivers_DocumentStorageDriver;
		%feature("autodoc", "* Constructor
	:rtype: None") BinXCAFDrivers_DocumentStorageDriver;
		 BinXCAFDrivers_DocumentStorageDriver ();

};


%make_alias(BinXCAFDrivers_DocumentStorageDriver)

%extend BinXCAFDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
