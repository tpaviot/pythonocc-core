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
%define BINMXCAFDOCDOCSTRING
"BinMXCAFDoc module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_binmxcafdoc.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<BinMXCAFDoc_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BinMDF_module.hxx>
#include<Message_module.hxx>
#include<TDF_module.hxx>
#include<BinObjMgt_module.hxx>
#include<BinTools_module.hxx>
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
%import BinTools.i
%import TopLoc.i

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
%wrap_handle(BinMXCAFDoc_AssemblyItemRefDriver)
%wrap_handle(BinMXCAFDoc_CentroidDriver)
%wrap_handle(BinMXCAFDoc_ColorDriver)
%wrap_handle(BinMXCAFDoc_DatumDriver)
%wrap_handle(BinMXCAFDoc_DimTolDriver)
%wrap_handle(BinMXCAFDoc_GraphNodeDriver)
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
		/****************** AddDrivers ******************/
		/**** md5 signature: 670f5b656e14f5858b9a49416984ce6b ****/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "Adds the attribute drivers to <thedrivertable>.

Parameters
----------
theDriverTable: BinMDF_ADriverTable
theMsgDrv: Message_Messenger

Returns
-------
None
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
		/****************** BinMXCAFDoc_AssemblyItemRefDriver ******************/
		/**** md5 signature: 41bbe9ac47dbd8c9a8c5be34e43c5995 ****/
		%feature("compactdefaultargs") BinMXCAFDoc_AssemblyItemRefDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") BinMXCAFDoc_AssemblyItemRefDriver;
		 BinMXCAFDoc_AssemblyItemRefDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 285cacb62018270002b8621b74089e7a ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 2f4b9505f848ac23f775b8398b7db225 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
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
		/****************** BinMXCAFDoc_CentroidDriver ******************/
		/**** md5 signature: 7f6dfda4a911bacab4ac3376e420c38c ****/
		%feature("compactdefaultargs") BinMXCAFDoc_CentroidDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") BinMXCAFDoc_CentroidDriver;
		 BinMXCAFDoc_CentroidDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
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
		/****************** BinMXCAFDoc_ColorDriver ******************/
		/**** md5 signature: 776a78672d34f4fea15a100f8a191783 ****/
		%feature("compactdefaultargs") BinMXCAFDoc_ColorDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") BinMXCAFDoc_ColorDriver;
		 BinMXCAFDoc_ColorDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
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
		/****************** BinMXCAFDoc_DatumDriver ******************/
		/**** md5 signature: 3a457d4af9e83c0fea428480b0dccaf8 ****/
		%feature("compactdefaultargs") BinMXCAFDoc_DatumDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") BinMXCAFDoc_DatumDriver;
		 BinMXCAFDoc_DatumDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
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
		/****************** BinMXCAFDoc_DimTolDriver ******************/
		/**** md5 signature: e50bbc4c96324938fb53a373af2f039e ****/
		%feature("compactdefaultargs") BinMXCAFDoc_DimTolDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") BinMXCAFDoc_DimTolDriver;
		 BinMXCAFDoc_DimTolDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
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
		/****************** BinMXCAFDoc_GraphNodeDriver ******************/
		/**** md5 signature: 5983a4056a87bd3fcb1057502f2b3712 ****/
		%feature("compactdefaultargs") BinMXCAFDoc_GraphNodeDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") BinMXCAFDoc_GraphNodeDriver;
		 BinMXCAFDoc_GraphNodeDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(BinMXCAFDoc_GraphNodeDriver)

%extend BinMXCAFDoc_GraphNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BinMXCAFDoc_LocationDriver *
***********************************/
class BinMXCAFDoc_LocationDriver : public BinMDF_ADriver {
	public:
		/****************** BinMXCAFDoc_LocationDriver ******************/
		/**** md5 signature: 0f8052cdebe1cfbc19d49d0f30fc30fe ****/
		%feature("compactdefaultargs") BinMXCAFDoc_LocationDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") BinMXCAFDoc_LocationDriver;
		 BinMXCAFDoc_LocationDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, BinObjMgt_Persistent & theTarget, BinObjMgt_SRelocationTable & theRelocTable);

		/****************** SetSharedLocations ******************/
		/**** md5 signature: 9780e60ef49e2e627ed3a82a98eed35f ****/
		%feature("compactdefaultargs") SetSharedLocations;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLocations: BinTools_LocationSetPtr

Returns
-------
None
") SetSharedLocations;
		void SetSharedLocations(const BinTools_LocationSetPtr & theLocations);

		/****************** Translate ******************/
		/**** md5 signature: 894ea8006cf844ca094b6b68a5b6b96f ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: BinObjMgt_Persistent
theLoc: TopLoc_Location
theMap: BinObjMgt_RRelocationTable

Returns
-------
bool
") Translate;
		Standard_Boolean Translate(const BinObjMgt_Persistent & theSource, TopLoc_Location & theLoc, BinObjMgt_RRelocationTable & theMap);

		/****************** Translate ******************/
		/**** md5 signature: 842635d22abf5c4afae88eb581060ba7 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Translate transient location to storable.

Parameters
----------
theLoc: TopLoc_Location
theTarget: BinObjMgt_Persistent
theMap: BinObjMgt_SRelocationTable

Returns
-------
None
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
		/****************** BinMXCAFDoc_MaterialDriver ******************/
		/**** md5 signature: 13e6b9590f464710ec094948d31668bd ****/
		%feature("compactdefaultargs") BinMXCAFDoc_MaterialDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") BinMXCAFDoc_MaterialDriver;
		 BinMXCAFDoc_MaterialDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
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
		/****************** Paste ******************/
		/**** md5 signature: 285cacb62018270002b8621b74089e7a ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 2f4b9505f848ac23f775b8398b7db225 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
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
		/****************** BinMXCAFDoc_VisMaterialDriver ******************/
		/**** md5 signature: 8f9b1580f27735dca06ac2d625223ed7 ****/
		%feature("compactdefaultargs") BinMXCAFDoc_VisMaterialDriver;
		%feature("autodoc", "Main constructor.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") BinMXCAFDoc_VisMaterialDriver;
		 BinMXCAFDoc_VisMaterialDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Create new instance of xcafdoc_vismaterial.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "Paste attribute from persistence into document.

Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "Paste attribute from document into persistence.

Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
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
		/****************** BinMXCAFDoc_VisMaterialToolDriver ******************/
		/**** md5 signature: 66d94924f14c0912ad999f034e603399 ****/
		%feature("compactdefaultargs") BinMXCAFDoc_VisMaterialToolDriver;
		%feature("autodoc", "Main constructor.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") BinMXCAFDoc_VisMaterialToolDriver;
		 BinMXCAFDoc_VisMaterialToolDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Create new instance of xcafdoc_vismaterialtool.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 1e52cd985850eb2ad199c368fa7282ef ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "Paste attribute from persistence into document.

Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		virtual Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 0d6af46154b0454b42333f770b1e15f1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "Paste attribute from document into persistence.

Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
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
		/****************** BinMXCAFDoc_NoteBinDataDriver ******************/
		/**** md5 signature: 5021f107f2799f194bbf37237eaacfcd ****/
		%feature("compactdefaultargs") BinMXCAFDoc_NoteBinDataDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") BinMXCAFDoc_NoteBinDataDriver;
		 BinMXCAFDoc_NoteBinDataDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 285cacb62018270002b8621b74089e7a ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 2f4b9505f848ac23f775b8398b7db225 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
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
		/****************** BinMXCAFDoc_NoteCommentDriver ******************/
		/**** md5 signature: 6bf0f6df4f57711b23cdbb0cfe95f41c ****/
		%feature("compactdefaultargs") BinMXCAFDoc_NoteCommentDriver;
		%feature("autodoc", "No available documentation.

Parameters
----------
theMsgDriver: Message_Messenger

Returns
-------
None
") BinMXCAFDoc_NoteCommentDriver;
		 BinMXCAFDoc_NoteCommentDriver(const opencascade::handle<Message_Messenger> & theMsgDriver);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 285cacb62018270002b8621b74089e7a ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: BinObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: BinObjMgt_RRelocationTable

Returns
-------
bool
") Paste;
		Standard_Boolean Paste(const BinObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, BinObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 2f4b9505f848ac23f775b8398b7db225 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSource: TDF_Attribute
theTarget: BinObjMgt_Persistent
theRelocTable: BinObjMgt_SRelocationTable

Returns
-------
None
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
