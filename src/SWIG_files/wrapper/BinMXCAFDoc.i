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
%define BINMXCAFDOCDOCSTRING
"BinMXCAFDoc module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_binmxcafdoc.html"
%enddef
%module (package="OCC.Core", docstring=BINMXCAFDOCDOCSTRING) BinMXCAFDoc


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
#include<BinMXCAFDoc_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BinMDF_module.hxx>
#include<Message_module.hxx>
#include<TDF_module.hxx>
#include<BinObjMgt_module.hxx>
#include<BinMNaming_module.hxx>
#include<TopLoc_module.hxx>
#include<Resource_module.hxx>
#include<Geom_module.hxx>
#include<TopoDS_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<XCAFView_module.hxx>
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
%import BinMNaming.i
%import TopLoc.i

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
%wrap_handle(BinMXCAFDoc_AssemblyItemRefDriver)
%wrap_handle(BinMXCAFDoc_CentroidDriver)
%wrap_handle(BinMXCAFDoc_ColorDriver)
%wrap_handle(BinMXCAFDoc_DatumDriver)
%wrap_handle(BinMXCAFDoc_DimTolDriver)
%wrap_handle(BinMXCAFDoc_GraphNodeDriver)
%wrap_handle(BinMXCAFDoc_LengthUnitDriver)
%wrap_handle(BinMXCAFDoc_LocationDriver)
%wrap_handle(BinMXCAFDoc_MaterialDriver)
%wrap_handle(BinMXCAFDoc_NoteDriver)
%wrap_handle(BinMXCAFDoc_VisMaterialDriver)
%wrap_handle(BinMXCAFDoc_VisMaterialToolDriver)
%wrap_handle(BinMXCAFDoc_NoteBinDataDriver)
%wrap_handle(BinMXCAFDoc_NoteCommentDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/********************
* class BinMXCAFDoc *
********************/
%rename(binmxcafdoc) BinMXCAFDoc;
class BinMXCAFDoc {
	public:
		/****** BinMXCAFDoc::AddDrivers ******/
		/****** md5 signature: 670f5b656e14f5858b9a49416984ce6b ******/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "
Parameters
----------
theDriverTable: BinMDF_ADriverTable
theMsgDrv: Message_Messenger

Return
-------
None

Description
-----------
Adds the attribute drivers to <theDriverTable>.
") AddDrivers;
		static void AddDrivers(const opencascade::handle<BinMDF_ADriverTable> & theDriverTable, const opencascade::handle<Message_Messenger> & theMsgDrv);

};


%extend BinMXCAFDoc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class BinMXCAFDoc_AssemblyItemRefDriver *
******************************************/
class BinMXCAFDoc_AssemblyItemRefDriver : public BinMDF_ADriver {
	public:
		/****** BinMXCAFDoc_AssemblyItemRefDriver::BinMXCAFDoc_AssemblyItemRefDriver ******/
		/****** md5 signature: 41bbe9ac47dbd8c9a8c5be34e43c5995 ******/
		%feature("compactdefaultargs") BinMXCAFDoc_AssemblyItemRefDriver;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinMXCAFDoc_AssemblyItemRefDriver;
		 BinMXCAFDoc_AssemblyItemRefDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****** BinMXCAFDoc_AssemblyItemRefDriver::NewEmpty ******/
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

		/****** BinMXCAFDoc_AssemblyItemRefDriver::Paste ******/
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

		/****** BinMXCAFDoc_AssemblyItemRefDriver::Paste ******/
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


%make_alias(BinMXCAFDoc_AssemblyItemRefDriver)

%extend BinMXCAFDoc_AssemblyItemRefDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BinMXCAFDoc_CentroidDriver *
***********************************/
class BinMXCAFDoc_CentroidDriver : public BinMDF_ADriver {
	public:
		/****** BinMXCAFDoc_CentroidDriver::BinMXCAFDoc_CentroidDriver ******/
		/****** md5 signature: 7f6dfda4a911bacab4ac3376e420c38c ******/
		%feature("compactdefaultargs") BinMXCAFDoc_CentroidDriver;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinMXCAFDoc_CentroidDriver;
		 BinMXCAFDoc_CentroidDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****** BinMXCAFDoc_CentroidDriver::NewEmpty ******/
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

		/****** BinMXCAFDoc_CentroidDriver::Paste ******/
		/****** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****** BinMXCAFDoc_CentroidDriver::Paste ******/
		/****** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_CentroidDriver)

%extend BinMXCAFDoc_CentroidDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BinMXCAFDoc_ColorDriver *
********************************/
class BinMXCAFDoc_ColorDriver : public BinMDF_ADriver {
	public:
		/****** BinMXCAFDoc_ColorDriver::BinMXCAFDoc_ColorDriver ******/
		/****** md5 signature: 776a78672d34f4fea15a100f8a191783 ******/
		%feature("compactdefaultargs") BinMXCAFDoc_ColorDriver;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinMXCAFDoc_ColorDriver;
		 BinMXCAFDoc_ColorDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****** BinMXCAFDoc_ColorDriver::NewEmpty ******/
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

		/****** BinMXCAFDoc_ColorDriver::Paste ******/
		/****** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****** BinMXCAFDoc_ColorDriver::Paste ******/
		/****** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_ColorDriver)

%extend BinMXCAFDoc_ColorDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BinMXCAFDoc_DatumDriver *
********************************/
class BinMXCAFDoc_DatumDriver : public BinMDF_ADriver {
	public:
		/****** BinMXCAFDoc_DatumDriver::BinMXCAFDoc_DatumDriver ******/
		/****** md5 signature: 3a457d4af9e83c0fea428480b0dccaf8 ******/
		%feature("compactdefaultargs") BinMXCAFDoc_DatumDriver;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinMXCAFDoc_DatumDriver;
		 BinMXCAFDoc_DatumDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****** BinMXCAFDoc_DatumDriver::NewEmpty ******/
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

		/****** BinMXCAFDoc_DatumDriver::Paste ******/
		/****** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****** BinMXCAFDoc_DatumDriver::Paste ******/
		/****** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_DatumDriver)

%extend BinMXCAFDoc_DatumDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BinMXCAFDoc_DimTolDriver *
*********************************/
class BinMXCAFDoc_DimTolDriver : public BinMDF_ADriver {
	public:
		/****** BinMXCAFDoc_DimTolDriver::BinMXCAFDoc_DimTolDriver ******/
		/****** md5 signature: e50bbc4c96324938fb53a373af2f039e ******/
		%feature("compactdefaultargs") BinMXCAFDoc_DimTolDriver;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinMXCAFDoc_DimTolDriver;
		 BinMXCAFDoc_DimTolDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****** BinMXCAFDoc_DimTolDriver::NewEmpty ******/
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

		/****** BinMXCAFDoc_DimTolDriver::Paste ******/
		/****** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****** BinMXCAFDoc_DimTolDriver::Paste ******/
		/****** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_DimTolDriver)

%extend BinMXCAFDoc_DimTolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BinMXCAFDoc_GraphNodeDriver *
************************************/
class BinMXCAFDoc_GraphNodeDriver : public BinMDF_ADriver {
	public:
		/****** BinMXCAFDoc_GraphNodeDriver::BinMXCAFDoc_GraphNodeDriver ******/
		/****** md5 signature: 5983a4056a87bd3fcb1057502f2b3712 ******/
		%feature("compactdefaultargs") BinMXCAFDoc_GraphNodeDriver;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinMXCAFDoc_GraphNodeDriver;
		 BinMXCAFDoc_GraphNodeDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****** BinMXCAFDoc_GraphNodeDriver::NewEmpty ******/
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

		/****** BinMXCAFDoc_GraphNodeDriver::Paste ******/
		/****** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****** BinMXCAFDoc_GraphNodeDriver::Paste ******/
		/****** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_GraphNodeDriver)

%extend BinMXCAFDoc_GraphNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class BinMXCAFDoc_LengthUnitDriver *
*************************************/
class BinMXCAFDoc_LengthUnitDriver : public BinMDF_ADriver {
	public:
		/****** BinMXCAFDoc_LengthUnitDriver::BinMXCAFDoc_LengthUnitDriver ******/
		/****** md5 signature: 84791bd884b758ab125885102aed1181 ******/
		%feature("compactdefaultargs") BinMXCAFDoc_LengthUnitDriver;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinMXCAFDoc_LengthUnitDriver;
		 BinMXCAFDoc_LengthUnitDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****** BinMXCAFDoc_LengthUnitDriver::NewEmpty ******/
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

		/****** BinMXCAFDoc_LengthUnitDriver::Paste ******/
		/****** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****** BinMXCAFDoc_LengthUnitDriver::Paste ******/
		/****** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_LengthUnitDriver)

%extend BinMXCAFDoc_LengthUnitDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BinMXCAFDoc_LocationDriver *
***********************************/
class BinMXCAFDoc_LocationDriver : public BinMDF_ADriver {
	public:
		/****** BinMXCAFDoc_LocationDriver::BinMXCAFDoc_LocationDriver ******/
		/****** md5 signature: 0f8052cdebe1cfbc19d49d0f30fc30fe ******/
		%feature("compactdefaultargs") BinMXCAFDoc_LocationDriver;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinMXCAFDoc_LocationDriver;
		 BinMXCAFDoc_LocationDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****** BinMXCAFDoc_LocationDriver::NewEmpty ******/
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

		/****** BinMXCAFDoc_LocationDriver::Paste ******/
		/****** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****** BinMXCAFDoc_LocationDriver::Paste ******/
		/****** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theRelocTable);

		/****** BinMXCAFDoc_LocationDriver::SetNSDriver ******/
		/****** md5 signature: f3cb65b5e43b312739ef39e2d6ebc688 ******/
		%feature("compactdefaultargs") SetNSDriver;
		%feature("autodoc", "
Parameters
----------
theNSDriver: BinMNaming_NamedShapeDriver

Return
-------
None

Description
-----------
No available documentation.
") SetNSDriver;
		void SetNSDriver(const opencascade::handle<BinMNaming_NamedShapeDriver> & theNSDriver);

		/****** BinMXCAFDoc_LocationDriver::Translate ******/
		/****** md5 signature: 894ea8006cf844ca094b6b68a5b6b96f ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theSource: BinObjMgt_Persistent
theLoc: TopLoc_Location
theMap: BinObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Translate;
		Standard_Boolean Translate(const BinObjMgt_Persistent & theSource, TopLoc_Location & theLoc, BinObjMgt_RRelocationTable & theMap);

		/****** BinMXCAFDoc_LocationDriver::Translate ******/
		/****** md5 signature: 842635d22abf5c4afae88eb581060ba7 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theLoc: TopLoc_Location
theTarget: BinObjMgt_Persistent
theMap: BinObjMgt_SRelocationTable

Return
-------
None

Description
-----------
Translate transient location to storable.
") Translate;
		void Translate(const TopLoc_Location & theLoc, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theMap);

};


%make_alias(BinMXCAFDoc_LocationDriver)

%extend BinMXCAFDoc_LocationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BinMXCAFDoc_MaterialDriver *
***********************************/
class BinMXCAFDoc_MaterialDriver : public BinMDF_ADriver {
	public:
		/****** BinMXCAFDoc_MaterialDriver::BinMXCAFDoc_MaterialDriver ******/
		/****** md5 signature: 13e6b9590f464710ec094948d31668bd ******/
		%feature("compactdefaultargs") BinMXCAFDoc_MaterialDriver;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinMXCAFDoc_MaterialDriver;
		 BinMXCAFDoc_MaterialDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****** BinMXCAFDoc_MaterialDriver::NewEmpty ******/
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

		/****** BinMXCAFDoc_MaterialDriver::Paste ******/
		/****** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ******/
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
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****** BinMXCAFDoc_MaterialDriver::Paste ******/
		/****** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ******/
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
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_MaterialDriver)

%extend BinMXCAFDoc_MaterialDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BinMXCAFDoc_NoteDriver *
*******************************/
%nodefaultctor BinMXCAFDoc_NoteDriver;
class BinMXCAFDoc_NoteDriver : public BinMDF_ADriver {
	public:
		/****** BinMXCAFDoc_NoteDriver::Paste ******/
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

		/****** BinMXCAFDoc_NoteDriver::Paste ******/
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


%make_alias(BinMXCAFDoc_NoteDriver)

%extend BinMXCAFDoc_NoteDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BinMXCAFDoc_VisMaterialDriver *
**************************************/
class BinMXCAFDoc_VisMaterialDriver : public BinMDF_ADriver {
	public:
		/****** BinMXCAFDoc_VisMaterialDriver::BinMXCAFDoc_VisMaterialDriver ******/
		/****** md5 signature: 8f9b1580f27735dca06ac2d625223ed7 ******/
		%feature("compactdefaultargs") BinMXCAFDoc_VisMaterialDriver;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
None

Description
-----------
Main constructor.
") BinMXCAFDoc_VisMaterialDriver;
		 BinMXCAFDoc_VisMaterialDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****** BinMXCAFDoc_VisMaterialDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Create new instance of XCAFDoc_VisMaterial.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMXCAFDoc_VisMaterialDriver::Paste ******/
		/****** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ******/
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
Paste attribute from persistence into document.
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****** BinMXCAFDoc_VisMaterialDriver::Paste ******/
		/****** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ******/
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
Paste attribute from document into persistence.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_VisMaterialDriver)

%extend BinMXCAFDoc_VisMaterialDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class BinMXCAFDoc_VisMaterialToolDriver *
******************************************/
class BinMXCAFDoc_VisMaterialToolDriver : public BinMDF_ADriver {
	public:
		/****** BinMXCAFDoc_VisMaterialToolDriver::BinMXCAFDoc_VisMaterialToolDriver ******/
		/****** md5 signature: 66d94924f14c0912ad999f034e603399 ******/
		%feature("compactdefaultargs") BinMXCAFDoc_VisMaterialToolDriver;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
None

Description
-----------
Main constructor.
") BinMXCAFDoc_VisMaterialToolDriver;
		 BinMXCAFDoc_VisMaterialToolDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****** BinMXCAFDoc_VisMaterialToolDriver::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Create new instance of XCAFDoc_VisMaterialTool.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** BinMXCAFDoc_VisMaterialToolDriver::Paste ******/
		/****** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ******/
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
Paste attribute from persistence into document.
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****** BinMXCAFDoc_VisMaterialToolDriver::Paste ******/
		/****** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ******/
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
Paste attribute from document into persistence.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_VisMaterialToolDriver)

%extend BinMXCAFDoc_VisMaterialToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BinMXCAFDoc_NoteBinDataDriver *
**************************************/
class BinMXCAFDoc_NoteBinDataDriver : public BinMXCAFDoc_NoteDriver {
	public:
		/****** BinMXCAFDoc_NoteBinDataDriver::BinMXCAFDoc_NoteBinDataDriver ******/
		/****** md5 signature: 5021f107f2799f194bbf37237eaacfcd ******/
		%feature("compactdefaultargs") BinMXCAFDoc_NoteBinDataDriver;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinMXCAFDoc_NoteBinDataDriver;
		 BinMXCAFDoc_NoteBinDataDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****** BinMXCAFDoc_NoteBinDataDriver::NewEmpty ******/
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

		/****** BinMXCAFDoc_NoteBinDataDriver::Paste ******/
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

		/****** BinMXCAFDoc_NoteBinDataDriver::Paste ******/
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


%make_alias(BinMXCAFDoc_NoteBinDataDriver)

%extend BinMXCAFDoc_NoteBinDataDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class BinMXCAFDoc_NoteCommentDriver *
**************************************/
class BinMXCAFDoc_NoteCommentDriver : public BinMXCAFDoc_NoteDriver {
	public:
		/****** BinMXCAFDoc_NoteCommentDriver::BinMXCAFDoc_NoteCommentDriver ******/
		/****** md5 signature: 6bf0f6df4f57711b23cdbb0cfe95f41c ******/
		%feature("compactdefaultargs") BinMXCAFDoc_NoteCommentDriver;
		%feature("autodoc", "
Parameters
----------
theMsgDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") BinMXCAFDoc_NoteCommentDriver;
		 BinMXCAFDoc_NoteCommentDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****** BinMXCAFDoc_NoteCommentDriver::NewEmpty ******/
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

		/****** BinMXCAFDoc_NoteCommentDriver::Paste ******/
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

		/****** BinMXCAFDoc_NoteCommentDriver::Paste ******/
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


%make_alias(BinMXCAFDoc_NoteCommentDriver)

%extend BinMXCAFDoc_NoteCommentDriver {
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
def binmxcafdoc_AddDrivers(*args):
	return binmxcafdoc.AddDrivers(*args)

}
