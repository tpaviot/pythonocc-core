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
%module (package="OCC") XmlTObjDrivers

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


%include XmlTObjDrivers_headers.i


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

%rename(xmltobjdrivers) XmlTObjDrivers;
%nodefaultctor XmlTObjDrivers;
class XmlTObjDrivers {
	public:
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "	:param aGUID:
	:type aGUID: Standard_GUID &
	:rtype: Handle_Standard_Transient
") Factory;
		static Handle_Standard_Transient Factory (const Standard_GUID & aGUID);
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	:param aDriverTable:
	:type aDriverTable: Handle_XmlMDF_ADriverTable &
	:param anMsgDrv:
	:type anMsgDrv: Handle_CDM_MessageDriver &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const Handle_XmlMDF_ADriverTable & aDriverTable,const Handle_CDM_MessageDriver & anMsgDrv);
};


%extend XmlTObjDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlTObjDrivers_DocumentRetrievalDriver;
class XmlTObjDrivers_DocumentRetrievalDriver : public XmlLDrivers_DocumentRetrievalDriver {
	public:
		%feature("compactdefaultargs") XmlTObjDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "	:rtype: None
") XmlTObjDrivers_DocumentRetrievalDriver;
		 XmlTObjDrivers_DocumentRetrievalDriver ();
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_XmlMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_XmlMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%extend XmlTObjDrivers_DocumentRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlTObjDrivers_DocumentRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlTObjDrivers_DocumentRetrievalDriver::Handle_XmlTObjDrivers_DocumentRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlTObjDrivers_DocumentRetrievalDriver;
class Handle_XmlTObjDrivers_DocumentRetrievalDriver : public Handle_XmlLDrivers_DocumentRetrievalDriver {

    public:
        // constructors
        Handle_XmlTObjDrivers_DocumentRetrievalDriver();
        Handle_XmlTObjDrivers_DocumentRetrievalDriver(const Handle_XmlTObjDrivers_DocumentRetrievalDriver &aHandle);
        Handle_XmlTObjDrivers_DocumentRetrievalDriver(const XmlTObjDrivers_DocumentRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlTObjDrivers_DocumentRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlTObjDrivers_DocumentRetrievalDriver {
    XmlTObjDrivers_DocumentRetrievalDriver* _get_reference() {
    return (XmlTObjDrivers_DocumentRetrievalDriver*)$self->Access();
    }
};

%extend Handle_XmlTObjDrivers_DocumentRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlTObjDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlTObjDrivers_DocumentStorageDriver;
class XmlTObjDrivers_DocumentStorageDriver : public XmlLDrivers_DocumentStorageDriver {
	public:
		%feature("compactdefaultargs") XmlTObjDrivers_DocumentStorageDriver;
		%feature("autodoc", "	:param theCopyright:
	:type theCopyright: TCollection_ExtendedString &
	:rtype: None
") XmlTObjDrivers_DocumentStorageDriver;
		 XmlTObjDrivers_DocumentStorageDriver (const TCollection_ExtendedString & theCopyright);
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_XmlMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_XmlMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%extend XmlTObjDrivers_DocumentStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlTObjDrivers_DocumentStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlTObjDrivers_DocumentStorageDriver::Handle_XmlTObjDrivers_DocumentStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlTObjDrivers_DocumentStorageDriver;
class Handle_XmlTObjDrivers_DocumentStorageDriver : public Handle_XmlLDrivers_DocumentStorageDriver {

    public:
        // constructors
        Handle_XmlTObjDrivers_DocumentStorageDriver();
        Handle_XmlTObjDrivers_DocumentStorageDriver(const Handle_XmlTObjDrivers_DocumentStorageDriver &aHandle);
        Handle_XmlTObjDrivers_DocumentStorageDriver(const XmlTObjDrivers_DocumentStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlTObjDrivers_DocumentStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlTObjDrivers_DocumentStorageDriver {
    XmlTObjDrivers_DocumentStorageDriver* _get_reference() {
    return (XmlTObjDrivers_DocumentStorageDriver*)$self->Access();
    }
};

%extend Handle_XmlTObjDrivers_DocumentStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlTObjDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlTObjDrivers_IntSparseArrayDriver;
class XmlTObjDrivers_IntSparseArrayDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlTObjDrivers_IntSparseArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlTObjDrivers_IntSparseArrayDriver;
		 XmlTObjDrivers_IntSparseArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlTObjDrivers_IntSparseArrayDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlTObjDrivers_IntSparseArrayDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlTObjDrivers_IntSparseArrayDriver::Handle_XmlTObjDrivers_IntSparseArrayDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlTObjDrivers_IntSparseArrayDriver;
class Handle_XmlTObjDrivers_IntSparseArrayDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlTObjDrivers_IntSparseArrayDriver();
        Handle_XmlTObjDrivers_IntSparseArrayDriver(const Handle_XmlTObjDrivers_IntSparseArrayDriver &aHandle);
        Handle_XmlTObjDrivers_IntSparseArrayDriver(const XmlTObjDrivers_IntSparseArrayDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlTObjDrivers_IntSparseArrayDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlTObjDrivers_IntSparseArrayDriver {
    XmlTObjDrivers_IntSparseArrayDriver* _get_reference() {
    return (XmlTObjDrivers_IntSparseArrayDriver*)$self->Access();
    }
};

%extend Handle_XmlTObjDrivers_IntSparseArrayDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlTObjDrivers_IntSparseArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlTObjDrivers_ModelDriver;
class XmlTObjDrivers_ModelDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlTObjDrivers_ModelDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlTObjDrivers_ModelDriver;
		 XmlTObjDrivers_ModelDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
};


%extend XmlTObjDrivers_ModelDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlTObjDrivers_ModelDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlTObjDrivers_ModelDriver::Handle_XmlTObjDrivers_ModelDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlTObjDrivers_ModelDriver;
class Handle_XmlTObjDrivers_ModelDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlTObjDrivers_ModelDriver();
        Handle_XmlTObjDrivers_ModelDriver(const Handle_XmlTObjDrivers_ModelDriver &aHandle);
        Handle_XmlTObjDrivers_ModelDriver(const XmlTObjDrivers_ModelDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlTObjDrivers_ModelDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlTObjDrivers_ModelDriver {
    XmlTObjDrivers_ModelDriver* _get_reference() {
    return (XmlTObjDrivers_ModelDriver*)$self->Access();
    }
};

%extend Handle_XmlTObjDrivers_ModelDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlTObjDrivers_ModelDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlTObjDrivers_ObjectDriver;
class XmlTObjDrivers_ObjectDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlTObjDrivers_ObjectDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlTObjDrivers_ObjectDriver;
		 XmlTObjDrivers_ObjectDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
};


%extend XmlTObjDrivers_ObjectDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlTObjDrivers_ObjectDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlTObjDrivers_ObjectDriver::Handle_XmlTObjDrivers_ObjectDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlTObjDrivers_ObjectDriver;
class Handle_XmlTObjDrivers_ObjectDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlTObjDrivers_ObjectDriver();
        Handle_XmlTObjDrivers_ObjectDriver(const Handle_XmlTObjDrivers_ObjectDriver &aHandle);
        Handle_XmlTObjDrivers_ObjectDriver(const XmlTObjDrivers_ObjectDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlTObjDrivers_ObjectDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlTObjDrivers_ObjectDriver {
    XmlTObjDrivers_ObjectDriver* _get_reference() {
    return (XmlTObjDrivers_ObjectDriver*)$self->Access();
    }
};

%extend Handle_XmlTObjDrivers_ObjectDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlTObjDrivers_ObjectDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlTObjDrivers_ReferenceDriver;
class XmlTObjDrivers_ReferenceDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlTObjDrivers_ReferenceDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlTObjDrivers_ReferenceDriver;
		 XmlTObjDrivers_ReferenceDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
};


%extend XmlTObjDrivers_ReferenceDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlTObjDrivers_ReferenceDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlTObjDrivers_ReferenceDriver::Handle_XmlTObjDrivers_ReferenceDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlTObjDrivers_ReferenceDriver;
class Handle_XmlTObjDrivers_ReferenceDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlTObjDrivers_ReferenceDriver();
        Handle_XmlTObjDrivers_ReferenceDriver(const Handle_XmlTObjDrivers_ReferenceDriver &aHandle);
        Handle_XmlTObjDrivers_ReferenceDriver(const XmlTObjDrivers_ReferenceDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlTObjDrivers_ReferenceDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlTObjDrivers_ReferenceDriver {
    XmlTObjDrivers_ReferenceDriver* _get_reference() {
    return (XmlTObjDrivers_ReferenceDriver*)$self->Access();
    }
};

%extend Handle_XmlTObjDrivers_ReferenceDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlTObjDrivers_ReferenceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlTObjDrivers_XYZDriver;
class XmlTObjDrivers_XYZDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlTObjDrivers_XYZDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlTObjDrivers_XYZDriver;
		 XmlTObjDrivers_XYZDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
};


%extend XmlTObjDrivers_XYZDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlTObjDrivers_XYZDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlTObjDrivers_XYZDriver::Handle_XmlTObjDrivers_XYZDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlTObjDrivers_XYZDriver;
class Handle_XmlTObjDrivers_XYZDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlTObjDrivers_XYZDriver();
        Handle_XmlTObjDrivers_XYZDriver(const Handle_XmlTObjDrivers_XYZDriver &aHandle);
        Handle_XmlTObjDrivers_XYZDriver(const XmlTObjDrivers_XYZDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlTObjDrivers_XYZDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlTObjDrivers_XYZDriver {
    XmlTObjDrivers_XYZDriver* _get_reference() {
    return (XmlTObjDrivers_XYZDriver*)$self->Access();
    }
};

%extend Handle_XmlTObjDrivers_XYZDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlTObjDrivers_XYZDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
