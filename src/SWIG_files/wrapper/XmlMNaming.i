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
%define XMLMNAMINGDOCSTRING
"XmlMNaming module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_XmlMNaming.html"
%enddef
%module (package="OCC.Core", docstring=XMLMNAMINGDOCSTRING) XmlMNaming

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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
#include<XmlMNaming_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<XmlMDF_module.hxx>
#include<Message_module.hxx>
#include<TopTools_module.hxx>
#include<TDF_module.hxx>
#include<XmlObjMgt_module.hxx>
#include<TopAbs_module.hxx>
#include<TopoDS_module.hxx>
#include<Message_module.hxx>
#include<Resource_module.hxx>
#include<TopLoc_module.hxx>
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
%import TopAbs.i
%import TopoDS.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(XmlMNaming_NamedShapeDriver)
%wrap_handle(XmlMNaming_NamingDriver)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%rename(xmlmnaming) XmlMNaming;
class XmlMNaming {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute drivers to <aDriverTable>.

	:param aDriverTable:
	:type aDriverTable: opencascade::handle<XmlMDF_ADriverTable> &
	:param aMessageDriver:
	:type aMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const opencascade::handle<XmlMDF_ADriverTable> & aDriverTable,const opencascade::handle<Message_Messenger> & aMessageDriver);
};


%extend XmlMNaming {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMNaming_NamedShapeDriver;
class XmlMNaming_NamedShapeDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear myShapeSet

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") GetShapesLocations;
		%feature("autodoc", "	* get the format of topology

	:rtype: TopTools_LocationSet
") GetShapesLocations;
		TopTools_LocationSet & GetShapesLocations ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") ReadShapeSection;
		%feature("autodoc", "	* Input the shapes from DOM element

	:param anElement:
	:type anElement: XmlObjMgt_Element &
	:rtype: None
") ReadShapeSection;
		void ReadShapeSection (const XmlObjMgt_Element & anElement);
		%feature("compactdefaultargs") WriteShapeSection;
		%feature("autodoc", "	* Output the shapes into DOM element

	:param anElement:
	:type anElement: XmlObjMgt_Element &
	:rtype: None
") WriteShapeSection;
		void WriteShapeSection (XmlObjMgt_Element & anElement);
		%feature("compactdefaultargs") XmlMNaming_NamedShapeDriver;
		%feature("autodoc", "	:param aMessageDriver:
	:type aMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMNaming_NamedShapeDriver;
		 XmlMNaming_NamedShapeDriver (const opencascade::handle<Message_Messenger> & aMessageDriver);
};


%make_alias(XmlMNaming_NamedShapeDriver)

%extend XmlMNaming_NamedShapeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMNaming_NamingDriver;
class XmlMNaming_NamingDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: opencascade::handle<TDF_Attribute> &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const opencascade::handle<TDF_Attribute> & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: opencascade::handle<TDF_Attribute> &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") XmlMNaming_NamingDriver;
		%feature("autodoc", "	:param aMessageDriver:
	:type aMessageDriver: opencascade::handle<Message_Messenger> &
	:rtype: None
") XmlMNaming_NamingDriver;
		 XmlMNaming_NamingDriver (const opencascade::handle<Message_Messenger> & aMessageDriver);
};


%make_alias(XmlMNaming_NamingDriver)

%extend XmlMNaming_NamingDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMNaming_Shape1;
class XmlMNaming_Shape1 {
	public:
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "	* return myElement

	:rtype: XmlObjMgt_Element
") Element;
		const XmlObjMgt_Element & Element ();
		%feature("compactdefaultargs") Element;
		%feature("autodoc", "	* return myElement

	:rtype: XmlObjMgt_Element
") Element;
		XmlObjMgt_Element & Element ();
		%feature("compactdefaultargs") LocId;
		%feature("autodoc", "	:rtype: int
") LocId;
		Standard_Integer LocId ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "	:param ID:
	:type ID: int
	:param LocID:
	:type LocID: int
	:param Orient:
	:type Orient: TopAbs_Orientation
	:rtype: None
") SetShape;
		void SetShape (const Standard_Integer ID,const Standard_Integer LocID,const TopAbs_Orientation Orient);
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "	:param theVertex:
	:type theVertex: TopoDS_Shape &
	:rtype: None
") SetVertex;
		void SetVertex (const TopoDS_Shape & theVertex);
		%feature("compactdefaultargs") TShapeId;
		%feature("autodoc", "	:rtype: int
") TShapeId;
		Standard_Integer TShapeId ();
		%feature("compactdefaultargs") XmlMNaming_Shape1;
		%feature("autodoc", "	:param Doc:
	:type Doc: XmlObjMgt_Document &
	:rtype: None
") XmlMNaming_Shape1;
		 XmlMNaming_Shape1 (XmlObjMgt_Document & Doc);
		%feature("compactdefaultargs") XmlMNaming_Shape1;
		%feature("autodoc", "	:param E:
	:type E: XmlObjMgt_Element &
	:rtype: None
") XmlMNaming_Shape1;
		 XmlMNaming_Shape1 (const XmlObjMgt_Element & E);
};


%extend XmlMNaming_Shape1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
