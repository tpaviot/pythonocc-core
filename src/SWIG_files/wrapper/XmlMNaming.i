/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") XmlMNaming

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include XmlMNaming_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(xmlmnaming) XmlMNaming;
class XmlMNaming {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute drivers to <aDriverTable>.

	:param aDriverTable:
	:type aDriverTable: Handle_XmlMDF_ADriverTable &
	:param aMessageDriver:
	:type aMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const Handle_XmlMDF_ADriverTable & aDriverTable,const Handle_CDM_MessageDriver & aMessageDriver);
		%feature("compactdefaultargs") SetDocumentVersion;
		%feature("autodoc", "	:param DocVersion:
	:type DocVersion: int
	:rtype: void
") SetDocumentVersion;
		static void SetDocumentVersion (const Standard_Integer DocVersion);
		%feature("compactdefaultargs") DocumentVersion;
		%feature("autodoc", "	:rtype: int
") DocumentVersion;
		static Standard_Integer DocumentVersion ();
};


%extend XmlMNaming {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMNaming_NamedShapeDriver;
class XmlMNaming_NamedShapeDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMNaming_NamedShapeDriver;
		%feature("autodoc", "	:param aMessageDriver:
	:type aMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMNaming_NamedShapeDriver;
		 XmlMNaming_NamedShapeDriver (const Handle_CDM_MessageDriver & aMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
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
};


%extend XmlMNaming_NamedShapeDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMNaming_NamedShapeDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMNaming_NamedShapeDriver::Handle_XmlMNaming_NamedShapeDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMNaming_NamedShapeDriver;
class Handle_XmlMNaming_NamedShapeDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMNaming_NamedShapeDriver();
        Handle_XmlMNaming_NamedShapeDriver(const Handle_XmlMNaming_NamedShapeDriver &aHandle);
        Handle_XmlMNaming_NamedShapeDriver(const XmlMNaming_NamedShapeDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMNaming_NamedShapeDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMNaming_NamedShapeDriver {
    XmlMNaming_NamedShapeDriver* _get_reference() {
    return (XmlMNaming_NamedShapeDriver*)$self->Access();
    }
};

%extend Handle_XmlMNaming_NamedShapeDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMNaming_NamedShapeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMNaming_NamingDriver;
class XmlMNaming_NamingDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMNaming_NamingDriver;
		%feature("autodoc", "	:param aMessageDriver:
	:type aMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMNaming_NamingDriver;
		 XmlMNaming_NamingDriver (const Handle_CDM_MessageDriver & aMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: XmlObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,XmlObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: XmlObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & theSource,XmlObjMgt_Persistent & theTarget,XmlObjMgt_SRelocationTable & theRelocTable);
};


%extend XmlMNaming_NamingDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMNaming_NamingDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMNaming_NamingDriver::Handle_XmlMNaming_NamingDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMNaming_NamingDriver;
class Handle_XmlMNaming_NamingDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMNaming_NamingDriver();
        Handle_XmlMNaming_NamingDriver(const Handle_XmlMNaming_NamingDriver &aHandle);
        Handle_XmlMNaming_NamingDriver(const XmlMNaming_NamingDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMNaming_NamingDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMNaming_NamingDriver {
    XmlMNaming_NamingDriver* _get_reference() {
    return (XmlMNaming_NamingDriver*)$self->Access();
    }
};

%extend Handle_XmlMNaming_NamingDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMNaming_NamingDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMNaming_Shape1;
class XmlMNaming_Shape1 {
	public:
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
		%feature("compactdefaultargs") TShapeId;
		%feature("autodoc", "	:rtype: int
") TShapeId;
		Standard_Integer TShapeId ();
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
		%feature("compactdefaultargs") XmlMNaming_Shape1;
		%feature("autodoc", "	:rtype: None
") XmlMNaming_Shape1;
		 XmlMNaming_Shape1 ();
		%feature("compactdefaultargs") _CSFDB_GetXmlMNaming_Shape1myElement;
		%feature("autodoc", "	:rtype: XmlObjMgt_Element
") _CSFDB_GetXmlMNaming_Shape1myElement;
		XmlObjMgt_Element _CSFDB_GetXmlMNaming_Shape1myElement ();
		%feature("compactdefaultargs") _CSFDB_SetXmlMNaming_Shape1myElement;
		%feature("autodoc", "	:param p:
	:type p: XmlObjMgt_Element
	:rtype: None
") _CSFDB_SetXmlMNaming_Shape1myElement;
		void _CSFDB_SetXmlMNaming_Shape1myElement (const XmlObjMgt_Element p);
		%feature("compactdefaultargs") _CSFDB_GetXmlMNaming_Shape1myTShapeID;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetXmlMNaming_Shape1myTShapeID;
		Standard_Integer _CSFDB_GetXmlMNaming_Shape1myTShapeID ();
		%feature("compactdefaultargs") _CSFDB_SetXmlMNaming_Shape1myTShapeID;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetXmlMNaming_Shape1myTShapeID;
		void _CSFDB_SetXmlMNaming_Shape1myTShapeID (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetXmlMNaming_Shape1myLocID;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetXmlMNaming_Shape1myLocID;
		Standard_Integer _CSFDB_GetXmlMNaming_Shape1myLocID ();
		%feature("compactdefaultargs") _CSFDB_SetXmlMNaming_Shape1myLocID;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetXmlMNaming_Shape1myLocID;
		void _CSFDB_SetXmlMNaming_Shape1myLocID (const Standard_Integer p);
		%feature("compactdefaultargs") _CSFDB_GetXmlMNaming_Shape1myOrientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") _CSFDB_GetXmlMNaming_Shape1myOrientation;
		TopAbs_Orientation _CSFDB_GetXmlMNaming_Shape1myOrientation ();
		%feature("compactdefaultargs") _CSFDB_SetXmlMNaming_Shape1myOrientation;
		%feature("autodoc", "	:param p:
	:type p: TopAbs_Orientation
	:rtype: None
") _CSFDB_SetXmlMNaming_Shape1myOrientation;
		void _CSFDB_SetXmlMNaming_Shape1myOrientation (const TopAbs_Orientation p);
};


%extend XmlMNaming_Shape1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
