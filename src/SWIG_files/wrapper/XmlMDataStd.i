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
%module (package="OCC") XmlMDataStd

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


%include XmlMDataStd_headers.i


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

%rename(xmlmdatastd) XmlMDataStd;
class XmlMDataStd {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute drivers to <aDriverTable>.

	:param aDriverTable:
	:type aDriverTable: Handle_XmlMDF_ADriverTable &
	:param anMsgDrv:
	:type anMsgDrv: Handle_CDM_MessageDriver &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const Handle_XmlMDF_ADriverTable & aDriverTable,const Handle_CDM_MessageDriver & anMsgDrv);
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


%extend XmlMDataStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_AsciiStringDriver;
class XmlMDataStd_AsciiStringDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_AsciiStringDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_AsciiStringDriver;
		 XmlMDataStd_AsciiStringDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* persistent -> transient (retrieve)

	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* transient -> persistent (store)

	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
};


%extend XmlMDataStd_AsciiStringDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_AsciiStringDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_AsciiStringDriver::Handle_XmlMDataStd_AsciiStringDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_AsciiStringDriver;
class Handle_XmlMDataStd_AsciiStringDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_AsciiStringDriver();
        Handle_XmlMDataStd_AsciiStringDriver(const Handle_XmlMDataStd_AsciiStringDriver &aHandle);
        Handle_XmlMDataStd_AsciiStringDriver(const XmlMDataStd_AsciiStringDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_AsciiStringDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_AsciiStringDriver {
    XmlMDataStd_AsciiStringDriver* _get_reference() {
    return (XmlMDataStd_AsciiStringDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_AsciiStringDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_AsciiStringDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_BooleanArrayDriver;
class XmlMDataStd_BooleanArrayDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_BooleanArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_BooleanArrayDriver;
		 XmlMDataStd_BooleanArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_BooleanArrayDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_BooleanArrayDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_BooleanArrayDriver::Handle_XmlMDataStd_BooleanArrayDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_BooleanArrayDriver;
class Handle_XmlMDataStd_BooleanArrayDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_BooleanArrayDriver();
        Handle_XmlMDataStd_BooleanArrayDriver(const Handle_XmlMDataStd_BooleanArrayDriver &aHandle);
        Handle_XmlMDataStd_BooleanArrayDriver(const XmlMDataStd_BooleanArrayDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_BooleanArrayDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_BooleanArrayDriver {
    XmlMDataStd_BooleanArrayDriver* _get_reference() {
    return (XmlMDataStd_BooleanArrayDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_BooleanArrayDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_BooleanArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_BooleanListDriver;
class XmlMDataStd_BooleanListDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_BooleanListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_BooleanListDriver;
		 XmlMDataStd_BooleanListDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_BooleanListDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_BooleanListDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_BooleanListDriver::Handle_XmlMDataStd_BooleanListDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_BooleanListDriver;
class Handle_XmlMDataStd_BooleanListDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_BooleanListDriver();
        Handle_XmlMDataStd_BooleanListDriver(const Handle_XmlMDataStd_BooleanListDriver &aHandle);
        Handle_XmlMDataStd_BooleanListDriver(const XmlMDataStd_BooleanListDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_BooleanListDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_BooleanListDriver {
    XmlMDataStd_BooleanListDriver* _get_reference() {
    return (XmlMDataStd_BooleanListDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_BooleanListDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_BooleanListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_ByteArrayDriver;
class XmlMDataStd_ByteArrayDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_ByteArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_ByteArrayDriver;
		 XmlMDataStd_ByteArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_ByteArrayDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_ByteArrayDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_ByteArrayDriver::Handle_XmlMDataStd_ByteArrayDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_ByteArrayDriver;
class Handle_XmlMDataStd_ByteArrayDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_ByteArrayDriver();
        Handle_XmlMDataStd_ByteArrayDriver(const Handle_XmlMDataStd_ByteArrayDriver &aHandle);
        Handle_XmlMDataStd_ByteArrayDriver(const XmlMDataStd_ByteArrayDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_ByteArrayDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_ByteArrayDriver {
    XmlMDataStd_ByteArrayDriver* _get_reference() {
    return (XmlMDataStd_ByteArrayDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_ByteArrayDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_ByteArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_CommentDriver;
class XmlMDataStd_CommentDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_CommentDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_CommentDriver;
		 XmlMDataStd_CommentDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_CommentDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_CommentDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_CommentDriver::Handle_XmlMDataStd_CommentDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_CommentDriver;
class Handle_XmlMDataStd_CommentDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_CommentDriver();
        Handle_XmlMDataStd_CommentDriver(const Handle_XmlMDataStd_CommentDriver &aHandle);
        Handle_XmlMDataStd_CommentDriver(const XmlMDataStd_CommentDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_CommentDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_CommentDriver {
    XmlMDataStd_CommentDriver* _get_reference() {
    return (XmlMDataStd_CommentDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_CommentDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_CommentDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_DirectoryDriver;
class XmlMDataStd_DirectoryDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_DirectoryDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_DirectoryDriver;
		 XmlMDataStd_DirectoryDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_DirectoryDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_DirectoryDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_DirectoryDriver::Handle_XmlMDataStd_DirectoryDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_DirectoryDriver;
class Handle_XmlMDataStd_DirectoryDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_DirectoryDriver();
        Handle_XmlMDataStd_DirectoryDriver(const Handle_XmlMDataStd_DirectoryDriver &aHandle);
        Handle_XmlMDataStd_DirectoryDriver(const XmlMDataStd_DirectoryDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_DirectoryDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_DirectoryDriver {
    XmlMDataStd_DirectoryDriver* _get_reference() {
    return (XmlMDataStd_DirectoryDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_DirectoryDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_DirectoryDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_ExpressionDriver;
class XmlMDataStd_ExpressionDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_ExpressionDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_ExpressionDriver;
		 XmlMDataStd_ExpressionDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_ExpressionDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_ExpressionDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_ExpressionDriver::Handle_XmlMDataStd_ExpressionDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_ExpressionDriver;
class Handle_XmlMDataStd_ExpressionDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_ExpressionDriver();
        Handle_XmlMDataStd_ExpressionDriver(const Handle_XmlMDataStd_ExpressionDriver &aHandle);
        Handle_XmlMDataStd_ExpressionDriver(const XmlMDataStd_ExpressionDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_ExpressionDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_ExpressionDriver {
    XmlMDataStd_ExpressionDriver* _get_reference() {
    return (XmlMDataStd_ExpressionDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_ExpressionDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_ExpressionDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_ExtStringArrayDriver;
class XmlMDataStd_ExtStringArrayDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_ExtStringArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_ExtStringArrayDriver;
		 XmlMDataStd_ExtStringArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_ExtStringArrayDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_ExtStringArrayDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_ExtStringArrayDriver::Handle_XmlMDataStd_ExtStringArrayDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_ExtStringArrayDriver;
class Handle_XmlMDataStd_ExtStringArrayDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_ExtStringArrayDriver();
        Handle_XmlMDataStd_ExtStringArrayDriver(const Handle_XmlMDataStd_ExtStringArrayDriver &aHandle);
        Handle_XmlMDataStd_ExtStringArrayDriver(const XmlMDataStd_ExtStringArrayDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_ExtStringArrayDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_ExtStringArrayDriver {
    XmlMDataStd_ExtStringArrayDriver* _get_reference() {
    return (XmlMDataStd_ExtStringArrayDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_ExtStringArrayDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_ExtStringArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_ExtStringListDriver;
class XmlMDataStd_ExtStringListDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_ExtStringListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_ExtStringListDriver;
		 XmlMDataStd_ExtStringListDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_ExtStringListDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_ExtStringListDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_ExtStringListDriver::Handle_XmlMDataStd_ExtStringListDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_ExtStringListDriver;
class Handle_XmlMDataStd_ExtStringListDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_ExtStringListDriver();
        Handle_XmlMDataStd_ExtStringListDriver(const Handle_XmlMDataStd_ExtStringListDriver &aHandle);
        Handle_XmlMDataStd_ExtStringListDriver(const XmlMDataStd_ExtStringListDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_ExtStringListDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_ExtStringListDriver {
    XmlMDataStd_ExtStringListDriver* _get_reference() {
    return (XmlMDataStd_ExtStringListDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_ExtStringListDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_ExtStringListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_IntPackedMapDriver;
class XmlMDataStd_IntPackedMapDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_IntPackedMapDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_IntPackedMapDriver;
		 XmlMDataStd_IntPackedMapDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* persistent -> transient (retrieve)

	:param Source:
	:type Source: XmlObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const XmlObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,XmlObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* transient -> persistent (store)

	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: XmlObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: XmlObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,XmlObjMgt_Persistent & Target,XmlObjMgt_SRelocationTable & RelocTable);
};


%extend XmlMDataStd_IntPackedMapDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_IntPackedMapDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_IntPackedMapDriver::Handle_XmlMDataStd_IntPackedMapDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_IntPackedMapDriver;
class Handle_XmlMDataStd_IntPackedMapDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_IntPackedMapDriver();
        Handle_XmlMDataStd_IntPackedMapDriver(const Handle_XmlMDataStd_IntPackedMapDriver &aHandle);
        Handle_XmlMDataStd_IntPackedMapDriver(const XmlMDataStd_IntPackedMapDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_IntPackedMapDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_IntPackedMapDriver {
    XmlMDataStd_IntPackedMapDriver* _get_reference() {
    return (XmlMDataStd_IntPackedMapDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_IntPackedMapDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_IntPackedMapDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_IntegerArrayDriver;
class XmlMDataStd_IntegerArrayDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_IntegerArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_IntegerArrayDriver;
		 XmlMDataStd_IntegerArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_IntegerArrayDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_IntegerArrayDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_IntegerArrayDriver::Handle_XmlMDataStd_IntegerArrayDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_IntegerArrayDriver;
class Handle_XmlMDataStd_IntegerArrayDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_IntegerArrayDriver();
        Handle_XmlMDataStd_IntegerArrayDriver(const Handle_XmlMDataStd_IntegerArrayDriver &aHandle);
        Handle_XmlMDataStd_IntegerArrayDriver(const XmlMDataStd_IntegerArrayDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_IntegerArrayDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_IntegerArrayDriver {
    XmlMDataStd_IntegerArrayDriver* _get_reference() {
    return (XmlMDataStd_IntegerArrayDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_IntegerArrayDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_IntegerArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_IntegerDriver;
class XmlMDataStd_IntegerDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_IntegerDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_IntegerDriver;
		 XmlMDataStd_IntegerDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_IntegerDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_IntegerDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_IntegerDriver::Handle_XmlMDataStd_IntegerDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_IntegerDriver;
class Handle_XmlMDataStd_IntegerDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_IntegerDriver();
        Handle_XmlMDataStd_IntegerDriver(const Handle_XmlMDataStd_IntegerDriver &aHandle);
        Handle_XmlMDataStd_IntegerDriver(const XmlMDataStd_IntegerDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_IntegerDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_IntegerDriver {
    XmlMDataStd_IntegerDriver* _get_reference() {
    return (XmlMDataStd_IntegerDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_IntegerDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_IntegerDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_IntegerListDriver;
class XmlMDataStd_IntegerListDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_IntegerListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_IntegerListDriver;
		 XmlMDataStd_IntegerListDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_IntegerListDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_IntegerListDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_IntegerListDriver::Handle_XmlMDataStd_IntegerListDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_IntegerListDriver;
class Handle_XmlMDataStd_IntegerListDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_IntegerListDriver();
        Handle_XmlMDataStd_IntegerListDriver(const Handle_XmlMDataStd_IntegerListDriver &aHandle);
        Handle_XmlMDataStd_IntegerListDriver(const XmlMDataStd_IntegerListDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_IntegerListDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_IntegerListDriver {
    XmlMDataStd_IntegerListDriver* _get_reference() {
    return (XmlMDataStd_IntegerListDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_IntegerListDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_IntegerListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_NameDriver;
class XmlMDataStd_NameDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_NameDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_NameDriver;
		 XmlMDataStd_NameDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_NameDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_NameDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_NameDriver::Handle_XmlMDataStd_NameDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_NameDriver;
class Handle_XmlMDataStd_NameDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_NameDriver();
        Handle_XmlMDataStd_NameDriver(const Handle_XmlMDataStd_NameDriver &aHandle);
        Handle_XmlMDataStd_NameDriver(const XmlMDataStd_NameDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_NameDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_NameDriver {
    XmlMDataStd_NameDriver* _get_reference() {
    return (XmlMDataStd_NameDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_NameDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_NameDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_NamedDataDriver;
class XmlMDataStd_NamedDataDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_NamedDataDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_NamedDataDriver;
		 XmlMDataStd_NamedDataDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_NamedDataDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_NamedDataDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_NamedDataDriver::Handle_XmlMDataStd_NamedDataDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_NamedDataDriver;
class Handle_XmlMDataStd_NamedDataDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_NamedDataDriver();
        Handle_XmlMDataStd_NamedDataDriver(const Handle_XmlMDataStd_NamedDataDriver &aHandle);
        Handle_XmlMDataStd_NamedDataDriver(const XmlMDataStd_NamedDataDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_NamedDataDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_NamedDataDriver {
    XmlMDataStd_NamedDataDriver* _get_reference() {
    return (XmlMDataStd_NamedDataDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_NamedDataDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_NamedDataDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_NoteBookDriver;
class XmlMDataStd_NoteBookDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_NoteBookDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_NoteBookDriver;
		 XmlMDataStd_NoteBookDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_NoteBookDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_NoteBookDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_NoteBookDriver::Handle_XmlMDataStd_NoteBookDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_NoteBookDriver;
class Handle_XmlMDataStd_NoteBookDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_NoteBookDriver();
        Handle_XmlMDataStd_NoteBookDriver(const Handle_XmlMDataStd_NoteBookDriver &aHandle);
        Handle_XmlMDataStd_NoteBookDriver(const XmlMDataStd_NoteBookDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_NoteBookDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_NoteBookDriver {
    XmlMDataStd_NoteBookDriver* _get_reference() {
    return (XmlMDataStd_NoteBookDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_NoteBookDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_NoteBookDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_RealArrayDriver;
class XmlMDataStd_RealArrayDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_RealArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_RealArrayDriver;
		 XmlMDataStd_RealArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_RealArrayDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_RealArrayDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_RealArrayDriver::Handle_XmlMDataStd_RealArrayDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_RealArrayDriver;
class Handle_XmlMDataStd_RealArrayDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_RealArrayDriver();
        Handle_XmlMDataStd_RealArrayDriver(const Handle_XmlMDataStd_RealArrayDriver &aHandle);
        Handle_XmlMDataStd_RealArrayDriver(const XmlMDataStd_RealArrayDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_RealArrayDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_RealArrayDriver {
    XmlMDataStd_RealArrayDriver* _get_reference() {
    return (XmlMDataStd_RealArrayDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_RealArrayDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_RealArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_RealDriver;
class XmlMDataStd_RealDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_RealDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_RealDriver;
		 XmlMDataStd_RealDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_RealDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_RealDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_RealDriver::Handle_XmlMDataStd_RealDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_RealDriver;
class Handle_XmlMDataStd_RealDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_RealDriver();
        Handle_XmlMDataStd_RealDriver(const Handle_XmlMDataStd_RealDriver &aHandle);
        Handle_XmlMDataStd_RealDriver(const XmlMDataStd_RealDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_RealDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_RealDriver {
    XmlMDataStd_RealDriver* _get_reference() {
    return (XmlMDataStd_RealDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_RealDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_RealDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_RealListDriver;
class XmlMDataStd_RealListDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_RealListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_RealListDriver;
		 XmlMDataStd_RealListDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_RealListDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_RealListDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_RealListDriver::Handle_XmlMDataStd_RealListDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_RealListDriver;
class Handle_XmlMDataStd_RealListDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_RealListDriver();
        Handle_XmlMDataStd_RealListDriver(const Handle_XmlMDataStd_RealListDriver &aHandle);
        Handle_XmlMDataStd_RealListDriver(const XmlMDataStd_RealListDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_RealListDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_RealListDriver {
    XmlMDataStd_RealListDriver* _get_reference() {
    return (XmlMDataStd_RealListDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_RealListDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_RealListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_ReferenceArrayDriver;
class XmlMDataStd_ReferenceArrayDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_ReferenceArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_ReferenceArrayDriver;
		 XmlMDataStd_ReferenceArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_ReferenceArrayDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_ReferenceArrayDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_ReferenceArrayDriver::Handle_XmlMDataStd_ReferenceArrayDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_ReferenceArrayDriver;
class Handle_XmlMDataStd_ReferenceArrayDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_ReferenceArrayDriver();
        Handle_XmlMDataStd_ReferenceArrayDriver(const Handle_XmlMDataStd_ReferenceArrayDriver &aHandle);
        Handle_XmlMDataStd_ReferenceArrayDriver(const XmlMDataStd_ReferenceArrayDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_ReferenceArrayDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_ReferenceArrayDriver {
    XmlMDataStd_ReferenceArrayDriver* _get_reference() {
    return (XmlMDataStd_ReferenceArrayDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_ReferenceArrayDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_ReferenceArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_ReferenceListDriver;
class XmlMDataStd_ReferenceListDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_ReferenceListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_ReferenceListDriver;
		 XmlMDataStd_ReferenceListDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_ReferenceListDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_ReferenceListDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_ReferenceListDriver::Handle_XmlMDataStd_ReferenceListDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_ReferenceListDriver;
class Handle_XmlMDataStd_ReferenceListDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_ReferenceListDriver();
        Handle_XmlMDataStd_ReferenceListDriver(const Handle_XmlMDataStd_ReferenceListDriver &aHandle);
        Handle_XmlMDataStd_ReferenceListDriver(const XmlMDataStd_ReferenceListDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_ReferenceListDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_ReferenceListDriver {
    XmlMDataStd_ReferenceListDriver* _get_reference() {
    return (XmlMDataStd_ReferenceListDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_ReferenceListDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_ReferenceListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_RelationDriver;
class XmlMDataStd_RelationDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_RelationDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_RelationDriver;
		 XmlMDataStd_RelationDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_RelationDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_RelationDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_RelationDriver::Handle_XmlMDataStd_RelationDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_RelationDriver;
class Handle_XmlMDataStd_RelationDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_RelationDriver();
        Handle_XmlMDataStd_RelationDriver(const Handle_XmlMDataStd_RelationDriver &aHandle);
        Handle_XmlMDataStd_RelationDriver(const XmlMDataStd_RelationDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_RelationDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_RelationDriver {
    XmlMDataStd_RelationDriver* _get_reference() {
    return (XmlMDataStd_RelationDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_RelationDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_RelationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_TickDriver;
class XmlMDataStd_TickDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_TickDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_TickDriver;
		 XmlMDataStd_TickDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_TickDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_TickDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_TickDriver::Handle_XmlMDataStd_TickDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_TickDriver;
class Handle_XmlMDataStd_TickDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_TickDriver();
        Handle_XmlMDataStd_TickDriver(const Handle_XmlMDataStd_TickDriver &aHandle);
        Handle_XmlMDataStd_TickDriver(const XmlMDataStd_TickDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_TickDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_TickDriver {
    XmlMDataStd_TickDriver* _get_reference() {
    return (XmlMDataStd_TickDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_TickDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_TickDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_TreeNodeDriver;
class XmlMDataStd_TreeNodeDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_TreeNodeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_TreeNodeDriver;
		 XmlMDataStd_TreeNodeDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_TreeNodeDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_TreeNodeDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_TreeNodeDriver::Handle_XmlMDataStd_TreeNodeDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_TreeNodeDriver;
class Handle_XmlMDataStd_TreeNodeDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_TreeNodeDriver();
        Handle_XmlMDataStd_TreeNodeDriver(const Handle_XmlMDataStd_TreeNodeDriver &aHandle);
        Handle_XmlMDataStd_TreeNodeDriver(const XmlMDataStd_TreeNodeDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_TreeNodeDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_TreeNodeDriver {
    XmlMDataStd_TreeNodeDriver* _get_reference() {
    return (XmlMDataStd_TreeNodeDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_TreeNodeDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_TreeNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_UAttributeDriver;
class XmlMDataStd_UAttributeDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_UAttributeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_UAttributeDriver;
		 XmlMDataStd_UAttributeDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_UAttributeDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_UAttributeDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_UAttributeDriver::Handle_XmlMDataStd_UAttributeDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_UAttributeDriver;
class Handle_XmlMDataStd_UAttributeDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_UAttributeDriver();
        Handle_XmlMDataStd_UAttributeDriver(const Handle_XmlMDataStd_UAttributeDriver &aHandle);
        Handle_XmlMDataStd_UAttributeDriver(const XmlMDataStd_UAttributeDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_UAttributeDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_UAttributeDriver {
    XmlMDataStd_UAttributeDriver* _get_reference() {
    return (XmlMDataStd_UAttributeDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_UAttributeDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_UAttributeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataStd_VariableDriver;
class XmlMDataStd_VariableDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataStd_VariableDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataStd_VariableDriver;
		 XmlMDataStd_VariableDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataStd_VariableDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataStd_VariableDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataStd_VariableDriver::Handle_XmlMDataStd_VariableDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataStd_VariableDriver;
class Handle_XmlMDataStd_VariableDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataStd_VariableDriver();
        Handle_XmlMDataStd_VariableDriver(const Handle_XmlMDataStd_VariableDriver &aHandle);
        Handle_XmlMDataStd_VariableDriver(const XmlMDataStd_VariableDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataStd_VariableDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataStd_VariableDriver {
    XmlMDataStd_VariableDriver* _get_reference() {
    return (XmlMDataStd_VariableDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataStd_VariableDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataStd_VariableDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
