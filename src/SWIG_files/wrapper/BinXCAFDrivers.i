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
%define BINXCAFDRIVERSDOCSTRING
"BinXCAFDrivers module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_binxcafdrivers.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
		/****** BinXCAFDrivers::AttributeDrivers ******/
		/****** md5 signature: a3052842141074dac4fa7742d5b7f7f0 ******/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "
Parameters
----------
MsgDrv: Message_Messenger

Return
-------
opencascade::handle<BinMDF_ADriverTable>

Description
-----------
Creates the table of drivers of types supported.
") AttributeDrivers;
		static opencascade::handle<BinMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & MsgDrv);

		/****** BinXCAFDrivers::DefineFormat ******/
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
Defines format 'binxcaf' and registers its read and write drivers in the specified application.
") DefineFormat;
		static void DefineFormat(const opencascade::handle<TDocStd_Application> & theApp);

		/****** BinXCAFDrivers::Factory ******/
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
		/****** BinXCAFDrivers_DocumentRetrievalDriver::BinXCAFDrivers_DocumentRetrievalDriver ******/
		/****** md5 signature: b996bd3d7ecdeda355b84bdba5452cbd ******/
		%feature("compactdefaultargs") BinXCAFDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BinXCAFDrivers_DocumentRetrievalDriver;
		 BinXCAFDrivers_DocumentRetrievalDriver();

		/****** BinXCAFDrivers_DocumentRetrievalDriver::AttributeDrivers ******/
		/****** md5 signature: e2cb6a81c25c6d4dac001821709e8847 ******/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
opencascade::handle<BinMDF_ADriverTable>

Description
-----------
No available documentation.
") AttributeDrivers;
		virtual opencascade::handle<BinMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

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
		/****** BinXCAFDrivers_DocumentStorageDriver::BinXCAFDrivers_DocumentStorageDriver ******/
		/****** md5 signature: df3e8bf2e0cf21923e17f35b3771a100 ******/
		%feature("compactdefaultargs") BinXCAFDrivers_DocumentStorageDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructor.
") BinXCAFDrivers_DocumentStorageDriver;
		 BinXCAFDrivers_DocumentStorageDriver();

		/****** BinXCAFDrivers_DocumentStorageDriver::AttributeDrivers ******/
		/****** md5 signature: e2cb6a81c25c6d4dac001821709e8847 ******/
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
opencascade::handle<BinMDF_ADriverTable>

Description
-----------
No available documentation.
") AttributeDrivers;
		virtual opencascade::handle<BinMDF_ADriverTable> AttributeDrivers(const opencascade::handle<Message_Messenger> & theMsgDriver);

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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def binxcafdrivers_AttributeDrivers(*args):
	return binxcafdrivers.AttributeDrivers(*args)

@deprecated
def binxcafdrivers_DefineFormat(*args):
	return binxcafdrivers.DefineFormat(*args)

@deprecated
def binxcafdrivers_Factory(*args):
	return binxcafdrivers.Factory(*args)

}
