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
%define BINMDATASTDDOCSTRING
"BinMDataStd module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_binmdatastd.html"
%enddef
%module (package="OCC.Core", docstring=BINMDATASTDDOCSTRING) BinMDataStd


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
#include<BinMDataStd_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BinMDF_module.hxx>
#include<Message_module.hxx>
#include<TDF_module.hxx>
#include<BinObjMgt_module.hxx>
#include<Resource_module.hxx>
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
%wrap_handle(BinMDataStd_AsciiStringDriver)
%wrap_handle(BinMDataStd_BooleanArrayDriver)
%wrap_handle(BinMDataStd_BooleanListDriver)
%wrap_handle(BinMDataStd_ByteArrayDriver)
%wrap_handle(BinMDataStd_ExpressionDriver)
%wrap_handle(BinMDataStd_ExtStringArrayDriver)
%wrap_handle(BinMDataStd_ExtStringListDriver)
%wrap_handle(BinMDataStd_GenericEmptyDriver)
%wrap_handle(BinMDataStd_GenericExtStringDriver)
%wrap_handle(BinMDataStd_IntPackedMapDriver)
%wrap_handle(BinMDataStd_IntegerArrayDriver)
%wrap_handle(BinMDataStd_IntegerDriver)
%wrap_handle(BinMDataStd_IntegerListDriver)
%wrap_handle(BinMDataStd_NamedDataDriver)
%wrap_handle(BinMDataStd_RealArrayDriver)
%wrap_handle(BinMDataStd_RealDriver)
%wrap_handle(BinMDataStd_RealListDriver)
%wrap_handle(BinMDataStd_ReferenceArrayDriver)
%wrap_handle(BinMDataStd_ReferenceListDriver)
%wrap_handle(BinMDataStd_TreeNodeDriver)
%wrap_handle(BinMDataStd_UAttributeDriver)
%wrap_handle(BinMDataStd_VariableDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/********************
* class BinMDataStd *
********************/
%rename(binmdatastd) BinMDataStd;
class BinMDataStd {
	public:
		/****** BinMDataStd::AddDrivers ******/
		/****** md5 signature: 3b175e0207523895c819eaf3e413231f ******/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "
Parameters
----------
theDriverTable: BinMDF_ADriverTable
aMsgDrv: Message_Messenger

Return
-------
None

Description
-----------
Adds the attribute drivers to <theDriverTable>.
") AddDrivers;
		static void AddDrivers(const opencascade::handle<BinMDF_ADriverTable> & theDriverTable, const opencascade::handle<Message_Messenger> & aMsgDrv);

};


%extend BinMDataStd {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def SetAttributeID(self):
		pass
	}
};

/**************************************
* class BinMDataStd_AsciiStringDriver *
**************************************/
class BinMDataStd_AsciiStringDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_AsciiStringDriver::BinMDataStd_AsciiStringDriver ******/
		/****** md5 signature: 188836d86692645c787f700473cd4701 ******/
		%feature("compactdefaultargs") BinMDataStd_AsciiStringDriver;
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
") BinMDataStd_AsciiStringDriver;
		 BinMDataStd_AsciiStringDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_AsciiStringDriver::NewEmpty ******/
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

		/****** BinMDataStd_AsciiStringDriver::Paste ******/
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
persistent -> transient (retrieve).
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_AsciiStringDriver::Paste ******/
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
transient -> persistent (store).
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_AsciiStringDriver)

%extend BinMDataStd_AsciiStringDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BinMDataStd_BooleanArrayDriver *
***************************************/
class BinMDataStd_BooleanArrayDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_BooleanArrayDriver::BinMDataStd_BooleanArrayDriver ******/
		/****** md5 signature: f5bb0d94c6ce1700a4890524ec6a435a ******/
		%feature("compactdefaultargs") BinMDataStd_BooleanArrayDriver;
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
") BinMDataStd_BooleanArrayDriver;
		 BinMDataStd_BooleanArrayDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_BooleanArrayDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDataStd_BooleanArrayDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_BooleanArrayDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_BooleanArrayDriver)

%extend BinMDataStd_BooleanArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BinMDataStd_BooleanListDriver *
**************************************/
class BinMDataStd_BooleanListDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_BooleanListDriver::BinMDataStd_BooleanListDriver ******/
		/****** md5 signature: 27642213d0e2b698c2ecd0a9d507e751 ******/
		%feature("compactdefaultargs") BinMDataStd_BooleanListDriver;
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
") BinMDataStd_BooleanListDriver;
		 BinMDataStd_BooleanListDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_BooleanListDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDataStd_BooleanListDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_BooleanListDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_BooleanListDriver)

%extend BinMDataStd_BooleanListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BinMDataStd_ByteArrayDriver *
************************************/
class BinMDataStd_ByteArrayDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_ByteArrayDriver::BinMDataStd_ByteArrayDriver ******/
		/****** md5 signature: 7421ceb2628d7ffe6b7d210929b3f449 ******/
		%feature("compactdefaultargs") BinMDataStd_ByteArrayDriver;
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
") BinMDataStd_ByteArrayDriver;
		 BinMDataStd_ByteArrayDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_ByteArrayDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDataStd_ByteArrayDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_ByteArrayDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_ByteArrayDriver)

%extend BinMDataStd_ByteArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BinMDataStd_ExpressionDriver *
*************************************/
class BinMDataStd_ExpressionDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_ExpressionDriver::BinMDataStd_ExpressionDriver ******/
		/****** md5 signature: 44b8f4421d10d38a72ec459a6d734809 ******/
		%feature("compactdefaultargs") BinMDataStd_ExpressionDriver;
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
") BinMDataStd_ExpressionDriver;
		 BinMDataStd_ExpressionDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_ExpressionDriver::NewEmpty ******/
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

		/****** BinMDataStd_ExpressionDriver::Paste ******/
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

		/****** BinMDataStd_ExpressionDriver::Paste ******/
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


%make_alias(BinMDataStd_ExpressionDriver)

%extend BinMDataStd_ExpressionDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class BinMDataStd_ExtStringArrayDriver *
*****************************************/
class BinMDataStd_ExtStringArrayDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_ExtStringArrayDriver::BinMDataStd_ExtStringArrayDriver ******/
		/****** md5 signature: e4594ab60a3ad31866ae4d5d389d8922 ******/
		%feature("compactdefaultargs") BinMDataStd_ExtStringArrayDriver;
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
") BinMDataStd_ExtStringArrayDriver;
		 BinMDataStd_ExtStringArrayDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_ExtStringArrayDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDataStd_ExtStringArrayDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_ExtStringArrayDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_ExtStringArrayDriver)

%extend BinMDataStd_ExtStringArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class BinMDataStd_ExtStringListDriver *
****************************************/
class BinMDataStd_ExtStringListDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_ExtStringListDriver::BinMDataStd_ExtStringListDriver ******/
		/****** md5 signature: d8001b61a1b250aaef87b7d236283261 ******/
		%feature("compactdefaultargs") BinMDataStd_ExtStringListDriver;
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
") BinMDataStd_ExtStringListDriver;
		 BinMDataStd_ExtStringListDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_ExtStringListDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDataStd_ExtStringListDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_ExtStringListDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_ExtStringListDriver)

%extend BinMDataStd_ExtStringListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BinMDataStd_GenericEmptyDriver *
***************************************/
class BinMDataStd_GenericEmptyDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_GenericEmptyDriver::BinMDataStd_GenericEmptyDriver ******/
		/****** md5 signature: 53eb6c4275aed57b97b6b324bdf02ba1 ******/
		%feature("compactdefaultargs") BinMDataStd_GenericEmptyDriver;
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
") BinMDataStd_GenericEmptyDriver;
		 BinMDataStd_GenericEmptyDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_GenericEmptyDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDataStd_GenericEmptyDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_GenericEmptyDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

		/****** BinMDataStd_GenericEmptyDriver::SourceType ******/
		/****** md5 signature: a352980563a6f80ea43fdc689b280238 ******/
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
No available documentation.
") SourceType;
		virtual const opencascade::handle<Standard_Type> & SourceType();

};


%make_alias(BinMDataStd_GenericEmptyDriver)

%extend BinMDataStd_GenericEmptyDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class BinMDataStd_GenericExtStringDriver *
*******************************************/
class BinMDataStd_GenericExtStringDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_GenericExtStringDriver::BinMDataStd_GenericExtStringDriver ******/
		/****** md5 signature: 3d9af25d9f8aae7f6799cceee169e52b ******/
		%feature("compactdefaultargs") BinMDataStd_GenericExtStringDriver;
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
") BinMDataStd_GenericExtStringDriver;
		 BinMDataStd_GenericExtStringDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_GenericExtStringDriver::NewEmpty ******/
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

		/****** BinMDataStd_GenericExtStringDriver::Paste ******/
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
persistent -> transient (retrieve).
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_GenericExtStringDriver::Paste ******/
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
transient -> persistent (store).
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

		/****** BinMDataStd_GenericExtStringDriver::SourceType ******/
		/****** md5 signature: a352980563a6f80ea43fdc689b280238 ******/
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "Return
-------
opencascade::handle<Standard_Type>

Description
-----------
No available documentation.
") SourceType;
		virtual const opencascade::handle<Standard_Type> & SourceType();

};


%make_alias(BinMDataStd_GenericExtStringDriver)

%extend BinMDataStd_GenericExtStringDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BinMDataStd_IntPackedMapDriver *
***************************************/
class BinMDataStd_IntPackedMapDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_IntPackedMapDriver::BinMDataStd_IntPackedMapDriver ******/
		/****** md5 signature: 1c438d931e66ed4639378f15a9d51636 ******/
		%feature("compactdefaultargs") BinMDataStd_IntPackedMapDriver;
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
") BinMDataStd_IntPackedMapDriver;
		 BinMDataStd_IntPackedMapDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_IntPackedMapDriver::NewEmpty ******/
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

		/****** BinMDataStd_IntPackedMapDriver::Paste ******/
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
persistent -> transient (retrieve).
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_IntPackedMapDriver::Paste ******/
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
transient -> persistent (store).
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_IntPackedMapDriver)

%extend BinMDataStd_IntPackedMapDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BinMDataStd_IntegerArrayDriver *
***************************************/
class BinMDataStd_IntegerArrayDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_IntegerArrayDriver::BinMDataStd_IntegerArrayDriver ******/
		/****** md5 signature: ac3bf857f4f0a69b5c3fc00b747f3574 ******/
		%feature("compactdefaultargs") BinMDataStd_IntegerArrayDriver;
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
") BinMDataStd_IntegerArrayDriver;
		 BinMDataStd_IntegerArrayDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_IntegerArrayDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDataStd_IntegerArrayDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_IntegerArrayDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_IntegerArrayDriver)

%extend BinMDataStd_IntegerArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BinMDataStd_IntegerDriver *
**********************************/
class BinMDataStd_IntegerDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_IntegerDriver::BinMDataStd_IntegerDriver ******/
		/****** md5 signature: f770b41e1007f40902117f8f9b9cfe91 ******/
		%feature("compactdefaultargs") BinMDataStd_IntegerDriver;
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
") BinMDataStd_IntegerDriver;
		 BinMDataStd_IntegerDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_IntegerDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDataStd_IntegerDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_IntegerDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_IntegerDriver)

%extend BinMDataStd_IntegerDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BinMDataStd_IntegerListDriver *
**************************************/
class BinMDataStd_IntegerListDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_IntegerListDriver::BinMDataStd_IntegerListDriver ******/
		/****** md5 signature: f6e36c89eac46357557f49bf8bfc4f82 ******/
		%feature("compactdefaultargs") BinMDataStd_IntegerListDriver;
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
") BinMDataStd_IntegerListDriver;
		 BinMDataStd_IntegerListDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_IntegerListDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDataStd_IntegerListDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_IntegerListDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_IntegerListDriver)

%extend BinMDataStd_IntegerListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BinMDataStd_NamedDataDriver *
************************************/
class BinMDataStd_NamedDataDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_NamedDataDriver::BinMDataStd_NamedDataDriver ******/
		/****** md5 signature: 9630554939964fd88c768db697943156 ******/
		%feature("compactdefaultargs") BinMDataStd_NamedDataDriver;
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
") BinMDataStd_NamedDataDriver;
		 BinMDataStd_NamedDataDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_NamedDataDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDataStd_NamedDataDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_NamedDataDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_NamedDataDriver)

%extend BinMDataStd_NamedDataDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BinMDataStd_RealArrayDriver *
************************************/
class BinMDataStd_RealArrayDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_RealArrayDriver::BinMDataStd_RealArrayDriver ******/
		/****** md5 signature: 7957e537c1292ff19d2445c66ad7c5b2 ******/
		%feature("compactdefaultargs") BinMDataStd_RealArrayDriver;
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
") BinMDataStd_RealArrayDriver;
		 BinMDataStd_RealArrayDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_RealArrayDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDataStd_RealArrayDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_RealArrayDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_RealArrayDriver)

%extend BinMDataStd_RealArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BinMDataStd_RealDriver *
*******************************/
class BinMDataStd_RealDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_RealDriver::BinMDataStd_RealDriver ******/
		/****** md5 signature: 7848592ee60f06d3d879056b31225e0b ******/
		%feature("compactdefaultargs") BinMDataStd_RealDriver;
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
") BinMDataStd_RealDriver;
		 BinMDataStd_RealDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_RealDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDataStd_RealDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_RealDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_RealDriver)

%extend BinMDataStd_RealDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BinMDataStd_RealListDriver *
***********************************/
class BinMDataStd_RealListDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_RealListDriver::BinMDataStd_RealListDriver ******/
		/****** md5 signature: 4d917328831565da9e238c529f3dfca1 ******/
		%feature("compactdefaultargs") BinMDataStd_RealListDriver;
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
") BinMDataStd_RealListDriver;
		 BinMDataStd_RealListDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_RealListDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDataStd_RealListDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_RealListDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_RealListDriver)

%extend BinMDataStd_RealListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class BinMDataStd_ReferenceArrayDriver *
*****************************************/
class BinMDataStd_ReferenceArrayDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_ReferenceArrayDriver::BinMDataStd_ReferenceArrayDriver ******/
		/****** md5 signature: 0d981c16e5fb7c8503ffb7223c5ddf44 ******/
		%feature("compactdefaultargs") BinMDataStd_ReferenceArrayDriver;
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
") BinMDataStd_ReferenceArrayDriver;
		 BinMDataStd_ReferenceArrayDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_ReferenceArrayDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDataStd_ReferenceArrayDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_ReferenceArrayDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_ReferenceArrayDriver)

%extend BinMDataStd_ReferenceArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class BinMDataStd_ReferenceListDriver *
****************************************/
class BinMDataStd_ReferenceListDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_ReferenceListDriver::BinMDataStd_ReferenceListDriver ******/
		/****** md5 signature: b6cec0295e9eb724a2ff7cf82c47ff5f ******/
		%feature("compactdefaultargs") BinMDataStd_ReferenceListDriver;
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
") BinMDataStd_ReferenceListDriver;
		 BinMDataStd_ReferenceListDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_ReferenceListDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMDataStd_ReferenceListDriver::Paste ******/
		/****** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, BinObjMgt_RRelocationTable & RelocTable);

		/****** BinMDataStd_ReferenceListDriver::Paste ******/
		/****** md5 signature: da6a0a35498ea18a652c6a19d6364015 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & Source, BinObjMgt_Persistent & Target, BinObjMgt_SRelocationTable & RelocTable);

};


%make_alias(BinMDataStd_ReferenceListDriver)

%extend BinMDataStd_ReferenceListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BinMDataStd_TreeNodeDriver *
***********************************/
class BinMDataStd_TreeNodeDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_TreeNodeDriver::BinMDataStd_TreeNodeDriver ******/
		/****** md5 signature: ca7bdecd6842ce94f98736f13985710a ******/
		%feature("compactdefaultargs") BinMDataStd_TreeNodeDriver;
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
") BinMDataStd_TreeNodeDriver;
		 BinMDataStd_TreeNodeDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_TreeNodeDriver::NewEmpty ******/
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

		/****** BinMDataStd_TreeNodeDriver::Paste ******/
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

		/****** BinMDataStd_TreeNodeDriver::Paste ******/
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


%make_alias(BinMDataStd_TreeNodeDriver)

%extend BinMDataStd_TreeNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BinMDataStd_UAttributeDriver *
*************************************/
class BinMDataStd_UAttributeDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_UAttributeDriver::BinMDataStd_UAttributeDriver ******/
		/****** md5 signature: d654807c685041b41f83e46af76ab304 ******/
		%feature("compactdefaultargs") BinMDataStd_UAttributeDriver;
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
") BinMDataStd_UAttributeDriver;
		 BinMDataStd_UAttributeDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_UAttributeDriver::NewEmpty ******/
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

		/****** BinMDataStd_UAttributeDriver::Paste ******/
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

		/****** BinMDataStd_UAttributeDriver::Paste ******/
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


%make_alias(BinMDataStd_UAttributeDriver)

%extend BinMDataStd_UAttributeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BinMDataStd_VariableDriver *
***********************************/
class BinMDataStd_VariableDriver : public BinMDF_ADriver {
	public:
		/****** BinMDataStd_VariableDriver::BinMDataStd_VariableDriver ******/
		/****** md5 signature: 3e4e0a65242c346149a9c3a8042b175e ******/
		%feature("compactdefaultargs") BinMDataStd_VariableDriver;
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
") BinMDataStd_VariableDriver;
		 BinMDataStd_VariableDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****** BinMDataStd_VariableDriver::NewEmpty ******/
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

		/****** BinMDataStd_VariableDriver::Paste ******/
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

		/****** BinMDataStd_VariableDriver::Paste ******/
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


%make_alias(BinMDataStd_VariableDriver)

%extend BinMDataStd_VariableDriver {
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
def binmdatastd_AddDrivers(*args):
	return binmdatastd.AddDrivers(*args)

}
