/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
%define XMLMNAMINGDOCSTRING
"XmlMNaming module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_xmlmnaming.html"
%enddef
%module (package="OCC.Core", docstring=XMLMNAMINGDOCSTRING) XmlMNaming


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
#include<XmlMNaming_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<XmlMDF_module.hxx>
#include<Message_module.hxx>
#include<TopTools_module.hxx>
#include<TDF_module.hxx>
#include<XmlObjMgt_module.hxx>
#include<TDocStd_module.hxx>
#include<TopAbs_module.hxx>
#include<TopoDS_module.hxx>
#include<Message_module.hxx>
#include<Resource_module.hxx>
#include<TopLoc_module.hxx>
#include<PCDM_module.hxx>
#include<CDF_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import XmlMDF.i
%import Message.i
%import TopTools.i
%import TDF.i
%import XmlObjMgt.i
%import TDocStd.i
%import TopAbs.i
%import TopoDS.i

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
%wrap_handle(XmlMNaming_NamedShapeDriver)
%wrap_handle(XmlMNaming_NamingDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*******************
* class XmlMNaming *
*******************/
%rename(xmlmnaming) XmlMNaming;
class XmlMNaming {
	public:
		/****************** AddDrivers ******************/
		/**** md5 signature: e8cbd68e09b8e62468cffcea900d0dd2 ****/
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "
Parameters
----------
aDriverTable: XmlMDF_ADriverTable
aMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
Adds the attribute drivers to <adrivertable>.
") AddDrivers;
		static void AddDrivers(const opencascade::handle<XmlMDF_ADriverTable> & aDriverTable, const opencascade::handle<Message_Messenger> & aMessageDriver);

};


%extend XmlMNaming {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class XmlMNaming_NamedShapeDriver *
************************************/
class XmlMNaming_NamedShapeDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMNaming_NamedShapeDriver ******************/
		/**** md5 signature: eb360ba0141d9e6480529612664e3297 ****/
		%feature("compactdefaultargs") XmlMNaming_NamedShapeDriver;
		%feature("autodoc", "
Parameters
----------
aMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") XmlMNaming_NamedShapeDriver;
		 XmlMNaming_NamedShapeDriver(const opencascade::handle<Message_Messenger> & aMessageDriver);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear myshapeset.
") Clear;
		void Clear();

		/****************** GetShapesLocations ******************/
		/**** md5 signature: 822d6ca7fbf300e31ea29679fc02745e ****/
		%feature("compactdefaultargs") GetShapesLocations;
		%feature("autodoc", "Return
-------
TopTools_LocationSet

Description
-----------
Get the format of topology.
") GetShapesLocations;
		TopTools_LocationSet & GetShapesLocations();

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
		/**** md5 signature: 175da9d64d03984ff0a1e9404e96e330 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		virtual Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: 9c9a6281aaafe1c72d86f4bb8a4e351c ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

		/****************** ReadShapeSection ******************/
		/**** md5 signature: f35e8994871ba1e3b692ee0dcaad48d2 ****/
		%feature("compactdefaultargs") ReadShapeSection;
		%feature("autodoc", "
Parameters
----------
anElement: XmlObjMgt_Element
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Input the shapes from dom element.
") ReadShapeSection;
		void ReadShapeSection(const XmlObjMgt_Element & anElement, const Message_ProgressRange & theRange = Message_ProgressRange());

		/****************** WriteShapeSection ******************/
		/**** md5 signature: 69a365d33444b456e6642133619c034f ****/
		%feature("compactdefaultargs") WriteShapeSection;
		%feature("autodoc", "
Parameters
----------
anElement: XmlObjMgt_Element
theStorageFormatVersion: TDocStd_FormatVersion
theRange: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Output the shapes into dom element.
") WriteShapeSection;
		void WriteShapeSection(XmlObjMgt_Element & anElement, TDocStd_FormatVersion theStorageFormatVersion, const Message_ProgressRange & theRange = Message_ProgressRange());

};


%make_alias(XmlMNaming_NamedShapeDriver)

%extend XmlMNaming_NamedShapeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class XmlMNaming_NamingDriver *
********************************/
class XmlMNaming_NamingDriver : public XmlMDF_ADriver {
	public:
		/****************** XmlMNaming_NamingDriver ******************/
		/**** md5 signature: 1795c8a38adf3a7a18e075fe33dc960c ****/
		%feature("compactdefaultargs") XmlMNaming_NamingDriver;
		%feature("autodoc", "
Parameters
----------
aMessageDriver: Message_Messenger

Return
-------
None

Description
-----------
No available documentation.
") XmlMNaming_NamingDriver;
		 XmlMNaming_NamingDriver(const opencascade::handle<Message_Messenger> & aMessageDriver);

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
		/**** md5 signature: 031c6cb06a428765ac4d078be7d14cf9 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theSource: XmlObjMgt_Persistent
theTarget: TDF_Attribute
theRelocTable: XmlObjMgt_RRelocationTable

Return
-------
bool

Description
-----------
No available documentation.
") Paste;
		Standard_Boolean Paste(const XmlObjMgt_Persistent & theSource, const opencascade::handle<TDF_Attribute> & theTarget, XmlObjMgt_RRelocationTable & theRelocTable);

		/****************** Paste ******************/
		/**** md5 signature: f2623a6490ed13129844514bdeadf8d1 ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
theSource: TDF_Attribute
theTarget: XmlObjMgt_Persistent
theRelocTable: XmlObjMgt_SRelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & theSource, XmlObjMgt_Persistent & theTarget, XmlObjMgt_SRelocationTable & theRelocTable);

};


%make_alias(XmlMNaming_NamingDriver)

%extend XmlMNaming_NamingDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class XmlMNaming_Shape1 *
**************************/
class XmlMNaming_Shape1 {
	public:
		/****************** XmlMNaming_Shape1 ******************/
		/**** md5 signature: a65cd736b18e5ede9dfb57d185742e54 ****/
		%feature("compactdefaultargs") XmlMNaming_Shape1;
		%feature("autodoc", "
Parameters
----------
Doc: XmlObjMgt_Document

Return
-------
None

Description
-----------
No available documentation.
") XmlMNaming_Shape1;
		 XmlMNaming_Shape1(XmlObjMgt_Document & Doc);

		/****************** XmlMNaming_Shape1 ******************/
		/**** md5 signature: 3e71a1e34dcdefa49528b808f520b575 ****/
		%feature("compactdefaultargs") XmlMNaming_Shape1;
		%feature("autodoc", "
Parameters
----------
E: XmlObjMgt_Element

Return
-------
None

Description
-----------
No available documentation.
") XmlMNaming_Shape1;
		 XmlMNaming_Shape1(const XmlObjMgt_Element & E);

		/****************** Element ******************/
		/**** md5 signature: b048e740461d546184db9889ca335c27 ****/
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "Return
-------
XmlObjMgt_Element

Description
-----------
Return myelement.
") Element;
		const XmlObjMgt_Element & Element();

		/****************** Element ******************/
		/**** md5 signature: cda4b976f272db0cf7f309190b0cde07 ****/
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "Return
-------
XmlObjMgt_Element

Description
-----------
Return myelement.
") Element;
		XmlObjMgt_Element & Element();

		/****************** LocId ******************/
		/**** md5 signature: 53e3e499ef70d321e21aedbf55e51520 ****/
		%feature("compactdefaultargs") LocId;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") LocId;
		Standard_Integer LocId();

		/****************** Orientation ******************/
		/**** md5 signature: 328242fe19b1f80489d8169681ebc029 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** SetShape ******************/
		/**** md5 signature: 56b77bc4968b59430da809fe1b3fd0eb ****/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "
Parameters
----------
ID: int
LocID: int
Orient: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") SetShape;
		void SetShape(const Standard_Integer ID, const Standard_Integer LocID, const TopAbs_Orientation Orient);

		/****************** SetVertex ******************/
		/**** md5 signature: 2a04083159eea9de2121be2b885c7c20 ****/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "
Parameters
----------
theVertex: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") SetVertex;
		void SetVertex(const TopoDS_Shape & theVertex);

		/****************** TShapeId ******************/
		/**** md5 signature: ebfc1170e9714dfa7b02dd5c04120318 ****/
		%feature("compactdefaultargs") TShapeId;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") TShapeId;
		Standard_Integer TShapeId();

};


%extend XmlMNaming_Shape1 {
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
def xmlmnaming_AddDrivers(*args):
	return xmlmnaming.AddDrivers(*args)

}
