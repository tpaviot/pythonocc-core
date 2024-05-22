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
%define BINMDATAXTDDOCSTRING
"BinMDataXtd module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_binmdataxtd.html"
%enddef
%module (package="OCC.Core", docstring=BINMDATAXTDDOCSTRING) BinMDataXtd


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
#include<BinMDataXtd_module.hxx>

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
%wrap_handle(BinMDataXtd_ConstraintDriver)
%wrap_handle(BinMDataXtd_GeometryDriver)
%wrap_handle(BinMDataXtd_PatternStdDriver)
%wrap_handle(BinMDataXtd_PositionDriver)
%wrap_handle(BinMDataXtd_PresentationDriver)
%wrap_handle(BinMDataXtd_TriangulationDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/********************
* class BinMDataXtd *
********************/
%rename(binmdataxtd) BinMDataXtd;
class BinMDataXtd {
	public:
		/****************** AddDrivers ******************/
		/**** md5 signature: 3b175e0207523895c819eaf3e413231f ****/
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
Adds the attribute drivers to <thedrivertable>.
") AddDrivers;
		static void AddDrivers(const opencascade::handle<BinMDF_ADriverTable> & theDriverTable, const opencascade::handle<Message_Messenger> & aMsgDrv);

		/****************** DocumentVersion ******************/
		/**** md5 signature: 8b57e019ee3c812dbd005e3488c6e740 ****/
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") DocumentVersion;
		static Standard_Integer DocumentVersion();

		/****************** SetDocumentVersion ******************/
		/**** md5 signature: 8b449cc197fc27f62f0af24f12357e84 ****/
		%feature("compactdefaultargs") SetDocumentVersion;
		%feature("autodoc", "
Parameters
----------
DocVersion: int

Return
-------
None

Description
-----------
No available documentation.
") SetDocumentVersion;
		static void SetDocumentVersion(const Standard_Integer DocVersion);

};


%extend BinMDataXtd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BinMDataXtd_ConstraintDriver *
*************************************/
class BinMDataXtd_ConstraintDriver : public BinMDF_ADriver {
	public:
		/****************** BinMDataXtd_ConstraintDriver ******************/
		/**** md5 signature: b632f588437c5b44b2d4d2d89db73828 ****/
		%feature("compactdefaultargs") BinMDataXtd_ConstraintDriver;
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
") BinMDataXtd_ConstraintDriver;
		 BinMDataXtd_ConstraintDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 3bca84cbb3164ee155cf7623ceb16244 ****/
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

		/****************** Paste ******************/
		/**** md5 signature: 67b435110398ae49c79b33db64bbe228 ****/
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


%make_alias(BinMDataXtd_ConstraintDriver)

%extend BinMDataXtd_ConstraintDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BinMDataXtd_GeometryDriver *
***********************************/
class BinMDataXtd_GeometryDriver : public BinMDF_ADriver {
	public:
		/****************** BinMDataXtd_GeometryDriver ******************/
		/**** md5 signature: a20e88688a61101dfde069e133d25e2e ****/
		%feature("compactdefaultargs") BinMDataXtd_GeometryDriver;
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
") BinMDataXtd_GeometryDriver;
		 BinMDataXtd_GeometryDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 3bca84cbb3164ee155cf7623ceb16244 ****/
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

		/****************** Paste ******************/
		/**** md5 signature: 67b435110398ae49c79b33db64bbe228 ****/
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


%make_alias(BinMDataXtd_GeometryDriver)

%extend BinMDataXtd_GeometryDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BinMDataXtd_PatternStdDriver *
*************************************/
class BinMDataXtd_PatternStdDriver : public BinMDF_ADriver {
	public:
		/****************** BinMDataXtd_PatternStdDriver ******************/
		/**** md5 signature: 74bff32b099a795ecc4ec284c25aac0d ****/
		%feature("compactdefaultargs") BinMDataXtd_PatternStdDriver;
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
") BinMDataXtd_PatternStdDriver;
		 BinMDataXtd_PatternStdDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 3bca84cbb3164ee155cf7623ceb16244 ****/
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

		/****************** Paste ******************/
		/**** md5 signature: 67b435110398ae49c79b33db64bbe228 ****/
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


%make_alias(BinMDataXtd_PatternStdDriver)

%extend BinMDataXtd_PatternStdDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BinMDataXtd_PositionDriver *
***********************************/
class BinMDataXtd_PositionDriver : public BinMDF_ADriver {
	public:
		/****************** BinMDataXtd_PositionDriver ******************/
		/**** md5 signature: 22ee2199f912cc056071114676f73d2d ****/
		%feature("compactdefaultargs") BinMDataXtd_PositionDriver;
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
") BinMDataXtd_PositionDriver;
		 BinMDataXtd_PositionDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 3bca84cbb3164ee155cf7623ceb16244 ****/
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

		/****************** Paste ******************/
		/**** md5 signature: 67b435110398ae49c79b33db64bbe228 ****/
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


%make_alias(BinMDataXtd_PositionDriver)

%extend BinMDataXtd_PositionDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class BinMDataXtd_PresentationDriver *
***************************************/
class BinMDataXtd_PresentationDriver : public BinMDF_ADriver {
	public:
		/****************** BinMDataXtd_PresentationDriver ******************/
		/**** md5 signature: e7c58a20c07e3651e261afe00921cbd6 ****/
		%feature("compactdefaultargs") BinMDataXtd_PresentationDriver;
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
") BinMDataXtd_PresentationDriver;
		 BinMDataXtd_PresentationDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 3bca84cbb3164ee155cf7623ceb16244 ****/
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

		/****************** Paste ******************/
		/**** md5 signature: 67b435110398ae49c79b33db64bbe228 ****/
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


%make_alias(BinMDataXtd_PresentationDriver)

%extend BinMDataXtd_PresentationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class BinMDataXtd_TriangulationDriver *
****************************************/
class BinMDataXtd_TriangulationDriver : public BinMDF_ADriver {
	public:
		/****************** BinMDataXtd_TriangulationDriver ******************/
		/**** md5 signature: 36f8be4596af1159d32e8415b7c4af9d ****/
		%feature("compactdefaultargs") BinMDataXtd_TriangulationDriver;
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
") BinMDataXtd_TriangulationDriver;
		 BinMDataXtd_TriangulationDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 37851bb93a225f90250afe4fb5e61e60 ****/
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

		/****************** Paste ******************/
		/**** md5 signature: da6a0a35498ea18a652c6a19d6364015 ****/
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


%make_alias(BinMDataXtd_TriangulationDriver)

%extend BinMDataXtd_TriangulationDriver {
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
def binmdataxtd_AddDrivers(*args):
	return binmdataxtd.AddDrivers(*args)

@deprecated
def binmdataxtd_DocumentVersion(*args):
	return binmdataxtd.DocumentVersion(*args)

@deprecated
def binmdataxtd_SetDocumentVersion(*args):
	return binmdataxtd.SetDocumentVersion(*args)

}
