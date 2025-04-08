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
%define BINTOBJDRIVERSDOCSTRING
"BinTObjDrivers module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_bintobjdrivers.html"
%enddef
%module (package="OCC.Core", docstring=BINTOBJDRIVERSDOCSTRING) BinTObjDrivers


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
#include<BinTObjDrivers_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BinMDF_module.hxx>
#include<Message_module.hxx>
#include<TDocStd_module.hxx>
#include<BinLDrivers_module.hxx>
#include<TDF_module.hxx>
#include<BinObjMgt_module.hxx>
#include<Resource_module.hxx>
#include<PCDM_module.hxx>
#include<LDOM_module.hxx>
#include<CDF_module.hxx>
#include<TDF_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BinMDF.i
%import Message.i
%import TDocStd.i
%import BinLDrivers.i
%import TDF.i
%import BinObjMgt.i

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
%wrap_handle(BinTObjDrivers_DocumentRetrievalDriver)
%wrap_handle(BinTObjDrivers_DocumentStorageDriver)
%wrap_handle(BinTObjDrivers_IntSparseArrayDriver)
%wrap_handle(BinTObjDrivers_ModelDriver)
%wrap_handle(BinTObjDrivers_ObjectDriver)
%wrap_handle(BinTObjDrivers_ReferenceDriver)
%wrap_handle(BinTObjDrivers_XYZDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***********************
* class BinTObjDrivers *
***********************/
%rename(bintobjdrivers) BinTObjDrivers;
class BinTObjDrivers {
	public:
		/****** BinTObjDrivers::AddDrivers ******/
		/****** md5 signature: 9b16e0c464e556dc0dccd242954afcdf ******/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "
Parameters
----------
aDriverTable: BinMDF_ADriverTable
aMsgDrv: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") AddDrivers;
		static void AddDrivers(const opencascade::handle<BinMDF_ADriverTable> & aDriverTable, const opencascade::handle<Message_Messenger> & aMsgDrv);

		/****** BinTObjDrivers::DefineFormat ******/
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
Defines format 'TObjBin' and registers its read and write drivers in the specified application.
") DefineFormat;
		static void DefineFormat(const opencascade::handle<TDocStd_Application> & theApp);

		/****** BinTObjDrivers::Factory ******/
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
No available documentation.
") Factory;
		static const opencascade::handle<Standard_Transient> & Factory(const Standard_GUID & aGUID);

};


%extend BinTObjDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************************
* class BinTObjDrivers_DocumentRetrievalDriver *
***********************************************/
class BinTObjDrivers_DocumentRetrievalDriver : public BinLDrivers_DocumentRetrievalDriver {
	public:
		/****** BinTObjDrivers_DocumentRetrievalDriver::BinTObjDrivers_DocumentRetrievalDriver ******/
		/****** md5 signature: 765ef87bf58d193c24b6923fc9d07ea9 ******/
		%feature("compactdefaultargs") BinTObjDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BinTObjDrivers_DocumentRetrievalDriver;
		 BinTObjDrivers_DocumentRetrievalDriver();

		/****** BinTObjDrivers_DocumentRetrievalDriver::AttributeDrivers ******/
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


%make_alias(BinTObjDrivers_DocumentRetrievalDriver)

%extend BinTObjDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class BinTObjDrivers_DocumentStorageDriver *
*********************************************/
class BinTObjDrivers_DocumentStorageDriver : public BinLDrivers_DocumentStorageDriver {
	public:
		/****** BinTObjDrivers_DocumentStorageDriver::BinTObjDrivers_DocumentStorageDriver ******/
		/****** md5 signature: 95d30e1a9ad5d17ebb868ad2712e1818 ******/
		%feature("compactdefaultargs") BinTObjDrivers_DocumentStorageDriver;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BinTObjDrivers_DocumentStorageDriver;
		 BinTObjDrivers_DocumentStorageDriver();

		/****** BinTObjDrivers_DocumentStorageDriver::AttributeDrivers ******/
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


%make_alias(BinTObjDrivers_DocumentStorageDriver)

%extend BinTObjDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class BinTObjDrivers_IntSparseArrayDriver *
********************************************/
class BinTObjDrivers_IntSparseArrayDriver : public BinMDF_ADriver {
	public:
		/****** BinTObjDrivers_IntSparseArrayDriver::BinTObjDrivers_IntSparseArrayDriver ******/
		/****** md5 signature: 32e4fe1c219c40df1d8ec9da8ed230d3 ******/
		%feature("compactdefaultargs") BinTObjDrivers_IntSparseArrayDriver;
		%feature("autodoc", "
Parameters
----------
theMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinTObjDrivers_IntSparseArrayDriver;
		 BinTObjDrivers_IntSparseArrayDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinTObjDrivers_IntSparseArrayDriver::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinTObjDrivers_IntSparseArrayDriver::Paste ******/
		/****** md5 signature: 285cacb62018270002b8621b74089e7a ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****** BinTObjDrivers_IntSparseArrayDriver::Paste ******/
		/****** md5 signature: 2f4b9505f848ac23f775b8398b7db225 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinTObjDrivers_IntSparseArrayDriver)

%extend BinTObjDrivers_IntSparseArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BinTObjDrivers_ModelDriver *
***********************************/
class BinTObjDrivers_ModelDriver : public BinMDF_ADriver {
	public:
		/****** BinTObjDrivers_ModelDriver::BinTObjDrivers_ModelDriver ******/
		/****** md5 signature: b5f810dd1a758e144925453eece549a1 ******/
		%feature("compactdefaultargs") BinTObjDrivers_ModelDriver;
		%feature("autodoc", "
Parameters
----------
theMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinTObjDrivers_ModelDriver;
		 BinTObjDrivers_ModelDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinTObjDrivers_ModelDriver::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinTObjDrivers_ModelDriver::Paste ******/
		/****** md5 signature: 3bca84cbb3164ee155cf7623ceb16244 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: BinObjMgt_Persistent
Target: TDF_Attribute
RelocTable: BinObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinTObjDrivers_ModelDriver::Paste ******/
		/****** md5 signature: 67b435110398ae49c79b33db64bbe228 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: BinObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinTObjDrivers_ModelDriver)

%extend BinTObjDrivers_ModelDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BinTObjDrivers_ObjectDriver *
************************************/
class BinTObjDrivers_ObjectDriver : public BinMDF_ADriver {
	public:
		/****** BinTObjDrivers_ObjectDriver::BinTObjDrivers_ObjectDriver ******/
		/****** md5 signature: ad39b8d34394d3ceccd856d5658ce519 ******/
		%feature("compactdefaultargs") BinTObjDrivers_ObjectDriver;
		%feature("autodoc", "
Parameters
----------
theMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinTObjDrivers_ObjectDriver;
		 BinTObjDrivers_ObjectDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinTObjDrivers_ObjectDriver::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinTObjDrivers_ObjectDriver::Paste ******/
		/****** md5 signature: 3bca84cbb3164ee155cf7623ceb16244 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: BinObjMgt_Persistent
Target: TDF_Attribute
RelocTable: BinObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinTObjDrivers_ObjectDriver::Paste ******/
		/****** md5 signature: 67b435110398ae49c79b33db64bbe228 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: BinObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinTObjDrivers_ObjectDriver)

%extend BinTObjDrivers_ObjectDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BinTObjDrivers_ReferenceDriver *
***************************************/
class BinTObjDrivers_ReferenceDriver : public BinMDF_ADriver {
	public:
		/****** BinTObjDrivers_ReferenceDriver::BinTObjDrivers_ReferenceDriver ******/
		/****** md5 signature: 675d245cb5c543ae64df23cfd74f762f ******/
		%feature("compactdefaultargs") BinTObjDrivers_ReferenceDriver;
		%feature("autodoc", "
Parameters
----------
theMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinTObjDrivers_ReferenceDriver;
		 BinTObjDrivers_ReferenceDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinTObjDrivers_ReferenceDriver::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinTObjDrivers_ReferenceDriver::Paste ******/
		/****** md5 signature: 3bca84cbb3164ee155cf7623ceb16244 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: BinObjMgt_Persistent
Target: TDF_Attribute
RelocTable: BinObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinTObjDrivers_ReferenceDriver::Paste ******/
		/****** md5 signature: 67b435110398ae49c79b33db64bbe228 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: BinObjMgt_Persistent
RelocTable: BinObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinTObjDrivers_ReferenceDriver)

%extend BinTObjDrivers_ReferenceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BinTObjDrivers_XYZDriver *
*********************************/
class BinTObjDrivers_XYZDriver : public BinMDF_ADriver {
	public:
		/****** BinTObjDrivers_XYZDriver::BinTObjDrivers_XYZDriver ******/
		/****** md5 signature: e5c21a4c769f8058ac37fe7c08e97272 ******/
		%feature("compactdefaultargs") BinTObjDrivers_XYZDriver;
		%feature("autodoc", "
Parameters
----------
theMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinTObjDrivers_XYZDriver;
		 BinTObjDrivers_XYZDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinTObjDrivers_XYZDriver::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinTObjDrivers_XYZDriver::Paste ******/
		/****** md5 signature: 285cacb62018270002b8621b74089e7a ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****** BinTObjDrivers_XYZDriver::Paste ******/
		/****** md5 signature: 2f4b9505f848ac23f775b8398b7db225 ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinTObjDrivers_XYZDriver)

%extend BinTObjDrivers_XYZDriver {
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
def bintobjdrivers_AddDrivers(*args):
	return bintobjdrivers.AddDrivers(*args)

@deprecated
def bintobjdrivers_DefineFormat(*args):
	return bintobjdrivers.DefineFormat(*args)

@deprecated
def bintobjdrivers_Factory(*args):
	return bintobjdrivers.Factory(*args)

}
