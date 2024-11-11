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
%define XMLMDATAXTDDOCSTRING
"XmlMDataXtd module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_xmlmdataxtd.html"
%enddef
%module (package="OCC.Core", docstring=XMLMDATAXTDDOCSTRING) XmlMDataXtd


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
#include<XmlMDataXtd_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<XmlMDF_module.hxx>
#include<Message_module.hxx>
#include<TDF_module.hxx>
#include<XmlObjMgt_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import XmlMDF.i
%import Message.i
%import TDF.i
%import XmlObjMgt.i

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
%wrap_handle(XmlMDataXtd_ConstraintDriver)
%wrap_handle(XmlMDataXtd_GeometryDriver)
%wrap_handle(XmlMDataXtd_PatternStdDriver)
%wrap_handle(XmlMDataXtd_PositionDriver)
%wrap_handle(XmlMDataXtd_PresentationDriver)
%wrap_handle(XmlMDataXtd_TriangulationDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/********************
* class XmlMDataXtd *
********************/
%rename(xmlmdataxtd) XmlMDataXtd;
class XmlMDataXtd {
	public:
		/****************** AddDrivers ******************/
		/**** md5 signature: 831746c79de4e4f242f5fd72f43b291b ****/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "
Parameters
----------
aDriverTable: XmlMDF_ADriverTable
anMsgDrv: Message_Messenger

Return
-------
None

Description
-----------
Adds the attribute drivers to <adrivertable>.
") AddDrivers;
		static void AddDrivers(const opencascade::handle<XmlMDF_ADriverTable> & aDriverTable, const opencascade::handle<Message_Messenger> & anMsgDrv);

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


%extend XmlMDataXtd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class XmlMDataXtd_ConstraintDriver *
*************************************/
class XmlMDataXtd_ConstraintDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMDataXtd_ConstraintDriver ******************/
		/**** md5 signature: bbe85fe1837d4642b2bc380e6ef52e24 ****/
		%feature("compactdefaultargs") XmlMDataXtd_ConstraintDriver;
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
") XmlMDataXtd_ConstraintDriver;
		 XmlMDataXtd_ConstraintDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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
		/**** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		/**** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

};


%make_alias(XmlMDataXtd_ConstraintDriver)

%extend XmlMDataXtd_ConstraintDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class XmlMDataXtd_GeometryDriver *
***********************************/
class XmlMDataXtd_GeometryDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMDataXtd_GeometryDriver ******************/
		/**** md5 signature: 584d6f8f400cc48f78bc8a60ebf21f2c ****/
		%feature("compactdefaultargs") XmlMDataXtd_GeometryDriver;
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
") XmlMDataXtd_GeometryDriver;
		 XmlMDataXtd_GeometryDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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
		/**** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		/**** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

};


%make_alias(XmlMDataXtd_GeometryDriver)

%extend XmlMDataXtd_GeometryDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class XmlMDataXtd_PatternStdDriver *
*************************************/
class XmlMDataXtd_PatternStdDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMDataXtd_PatternStdDriver ******************/
		/**** md5 signature: 736202fd8fa0a2f0fe04d146992b8d96 ****/
		%feature("compactdefaultargs") XmlMDataXtd_PatternStdDriver;
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
") XmlMDataXtd_PatternStdDriver;
		 XmlMDataXtd_PatternStdDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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
		/**** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		/**** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

};


%make_alias(XmlMDataXtd_PatternStdDriver)

%extend XmlMDataXtd_PatternStdDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class XmlMDataXtd_PositionDriver *
***********************************/
class XmlMDataXtd_PositionDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMDataXtd_PositionDriver ******************/
		/**** md5 signature: 3b459c8d542b987e3b5ee14d674b95c9 ****/
		%feature("compactdefaultargs") XmlMDataXtd_PositionDriver;
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
") XmlMDataXtd_PositionDriver;
		 XmlMDataXtd_PositionDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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
		/**** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		/**** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

};


%make_alias(XmlMDataXtd_PositionDriver)

%extend XmlMDataXtd_PositionDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class XmlMDataXtd_PresentationDriver *
***************************************/
class XmlMDataXtd_PresentationDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMDataXtd_PresentationDriver ******************/
		/**** md5 signature: b2caeb90a974fdac52255bdc959cd8a1 ****/
		%feature("compactdefaultargs") XmlMDataXtd_PresentationDriver;
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
") XmlMDataXtd_PresentationDriver;
		 XmlMDataXtd_PresentationDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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
		/**** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		/**** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

};


%make_alias(XmlMDataXtd_PresentationDriver)

%extend XmlMDataXtd_PresentationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class XmlMDataXtd_TriangulationDriver *
****************************************/
class XmlMDataXtd_TriangulationDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMDataXtd_TriangulationDriver ******************/
		/**** md5 signature: e13b9bb814a4349417bc8c4f8c72fffb ****/
		%feature("compactdefaultargs") XmlMDataXtd_TriangulationDriver;
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
") XmlMDataXtd_TriangulationDriver;
		 XmlMDataXtd_TriangulationDriver(const opencascade::handle<Message_Messenger> & theMessageDriver);

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
		/**** md5 signature: 3dd41285e4a0d4dafa2b2b321d4fcc26 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: XmlObjMgt_Persistent
Target: TDF_Attribute
RelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & Source, const opencascade::handle<TDF_Attribute> & Target, XmlObjMgt_RRelocationTable & RelocTable);

		/****************** Paste ******************/
		/**** md5 signature: bfb59b0a8136ec850943b5ad7848f316 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Source: TDF_Attribute
Target: XmlObjMgt_Persistent
RelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Source, XmlObjMgt_Persistent & Target, XmlObjMgt_SRelocationTable & RelocTable);

};


%make_alias(XmlMDataXtd_TriangulationDriver)

%extend XmlMDataXtd_TriangulationDriver {
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
def xmlmdataxtd_AddDrivers(*args):
	return xmlmdataxtd.AddDrivers(*args)

@deprecated
def xmlmdataxtd_DocumentVersion(*args):
	return xmlmdataxtd.DocumentVersion(*args)

@deprecated
def xmlmdataxtd_SetDocumentVersion(*args):
	return xmlmdataxtd.SetDocumentVersion(*args)

}
