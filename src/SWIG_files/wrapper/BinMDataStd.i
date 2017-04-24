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
%module (package="OCC") BinMDataStd

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


%include BinMDataStd_headers.i


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

%rename(binmdatastd) BinMDataStd;
class BinMDataStd {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute drivers to <theDriverTable>.

	:param theDriverTable:
	:type theDriverTable: Handle_BinMDF_ADriverTable &
	:param aMsgDrv:
	:type aMsgDrv: Handle_CDM_MessageDriver &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const Handle_BinMDF_ADriverTable & theDriverTable,const Handle_CDM_MessageDriver & aMsgDrv);
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


%extend BinMDataStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_AsciiStringDriver;
class BinMDataStd_AsciiStringDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_AsciiStringDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_AsciiStringDriver;
		 BinMDataStd_AsciiStringDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* persistent -> transient (retrieve)

	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* transient -> persistent (store)

	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_AsciiStringDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_AsciiStringDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_AsciiStringDriver::Handle_BinMDataStd_AsciiStringDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_AsciiStringDriver;
class Handle_BinMDataStd_AsciiStringDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_AsciiStringDriver();
        Handle_BinMDataStd_AsciiStringDriver(const Handle_BinMDataStd_AsciiStringDriver &aHandle);
        Handle_BinMDataStd_AsciiStringDriver(const BinMDataStd_AsciiStringDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_AsciiStringDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_AsciiStringDriver {
    BinMDataStd_AsciiStringDriver* _get_reference() {
    return (BinMDataStd_AsciiStringDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_AsciiStringDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_AsciiStringDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_BooleanArrayDriver;
class BinMDataStd_BooleanArrayDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_BooleanArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_BooleanArrayDriver;
		 BinMDataStd_BooleanArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_BooleanArrayDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_BooleanArrayDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_BooleanArrayDriver::Handle_BinMDataStd_BooleanArrayDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_BooleanArrayDriver;
class Handle_BinMDataStd_BooleanArrayDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_BooleanArrayDriver();
        Handle_BinMDataStd_BooleanArrayDriver(const Handle_BinMDataStd_BooleanArrayDriver &aHandle);
        Handle_BinMDataStd_BooleanArrayDriver(const BinMDataStd_BooleanArrayDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_BooleanArrayDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_BooleanArrayDriver {
    BinMDataStd_BooleanArrayDriver* _get_reference() {
    return (BinMDataStd_BooleanArrayDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_BooleanArrayDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_BooleanArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_BooleanListDriver;
class BinMDataStd_BooleanListDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_BooleanListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_BooleanListDriver;
		 BinMDataStd_BooleanListDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_BooleanListDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_BooleanListDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_BooleanListDriver::Handle_BinMDataStd_BooleanListDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_BooleanListDriver;
class Handle_BinMDataStd_BooleanListDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_BooleanListDriver();
        Handle_BinMDataStd_BooleanListDriver(const Handle_BinMDataStd_BooleanListDriver &aHandle);
        Handle_BinMDataStd_BooleanListDriver(const BinMDataStd_BooleanListDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_BooleanListDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_BooleanListDriver {
    BinMDataStd_BooleanListDriver* _get_reference() {
    return (BinMDataStd_BooleanListDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_BooleanListDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_BooleanListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_ByteArrayDriver;
class BinMDataStd_ByteArrayDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_ByteArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_ByteArrayDriver;
		 BinMDataStd_ByteArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_ByteArrayDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_ByteArrayDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_ByteArrayDriver::Handle_BinMDataStd_ByteArrayDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_ByteArrayDriver;
class Handle_BinMDataStd_ByteArrayDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_ByteArrayDriver();
        Handle_BinMDataStd_ByteArrayDriver(const Handle_BinMDataStd_ByteArrayDriver &aHandle);
        Handle_BinMDataStd_ByteArrayDriver(const BinMDataStd_ByteArrayDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_ByteArrayDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_ByteArrayDriver {
    BinMDataStd_ByteArrayDriver* _get_reference() {
    return (BinMDataStd_ByteArrayDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_ByteArrayDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_ByteArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_CommentDriver;
class BinMDataStd_CommentDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_CommentDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_CommentDriver;
		 BinMDataStd_CommentDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_CommentDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_CommentDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_CommentDriver::Handle_BinMDataStd_CommentDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_CommentDriver;
class Handle_BinMDataStd_CommentDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_CommentDriver();
        Handle_BinMDataStd_CommentDriver(const Handle_BinMDataStd_CommentDriver &aHandle);
        Handle_BinMDataStd_CommentDriver(const BinMDataStd_CommentDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_CommentDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_CommentDriver {
    BinMDataStd_CommentDriver* _get_reference() {
    return (BinMDataStd_CommentDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_CommentDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_CommentDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_DirectoryDriver;
class BinMDataStd_DirectoryDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_DirectoryDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_DirectoryDriver;
		 BinMDataStd_DirectoryDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_DirectoryDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_DirectoryDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_DirectoryDriver::Handle_BinMDataStd_DirectoryDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_DirectoryDriver;
class Handle_BinMDataStd_DirectoryDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_DirectoryDriver();
        Handle_BinMDataStd_DirectoryDriver(const Handle_BinMDataStd_DirectoryDriver &aHandle);
        Handle_BinMDataStd_DirectoryDriver(const BinMDataStd_DirectoryDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_DirectoryDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_DirectoryDriver {
    BinMDataStd_DirectoryDriver* _get_reference() {
    return (BinMDataStd_DirectoryDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_DirectoryDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_DirectoryDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_ExpressionDriver;
class BinMDataStd_ExpressionDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_ExpressionDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_ExpressionDriver;
		 BinMDataStd_ExpressionDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_ExpressionDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_ExpressionDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_ExpressionDriver::Handle_BinMDataStd_ExpressionDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_ExpressionDriver;
class Handle_BinMDataStd_ExpressionDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_ExpressionDriver();
        Handle_BinMDataStd_ExpressionDriver(const Handle_BinMDataStd_ExpressionDriver &aHandle);
        Handle_BinMDataStd_ExpressionDriver(const BinMDataStd_ExpressionDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_ExpressionDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_ExpressionDriver {
    BinMDataStd_ExpressionDriver* _get_reference() {
    return (BinMDataStd_ExpressionDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_ExpressionDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_ExpressionDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_ExtStringArrayDriver;
class BinMDataStd_ExtStringArrayDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_ExtStringArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_ExtStringArrayDriver;
		 BinMDataStd_ExtStringArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_ExtStringArrayDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_ExtStringArrayDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_ExtStringArrayDriver::Handle_BinMDataStd_ExtStringArrayDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_ExtStringArrayDriver;
class Handle_BinMDataStd_ExtStringArrayDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_ExtStringArrayDriver();
        Handle_BinMDataStd_ExtStringArrayDriver(const Handle_BinMDataStd_ExtStringArrayDriver &aHandle);
        Handle_BinMDataStd_ExtStringArrayDriver(const BinMDataStd_ExtStringArrayDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_ExtStringArrayDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_ExtStringArrayDriver {
    BinMDataStd_ExtStringArrayDriver* _get_reference() {
    return (BinMDataStd_ExtStringArrayDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_ExtStringArrayDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_ExtStringArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_ExtStringListDriver;
class BinMDataStd_ExtStringListDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_ExtStringListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_ExtStringListDriver;
		 BinMDataStd_ExtStringListDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_ExtStringListDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_ExtStringListDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_ExtStringListDriver::Handle_BinMDataStd_ExtStringListDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_ExtStringListDriver;
class Handle_BinMDataStd_ExtStringListDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_ExtStringListDriver();
        Handle_BinMDataStd_ExtStringListDriver(const Handle_BinMDataStd_ExtStringListDriver &aHandle);
        Handle_BinMDataStd_ExtStringListDriver(const BinMDataStd_ExtStringListDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_ExtStringListDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_ExtStringListDriver {
    BinMDataStd_ExtStringListDriver* _get_reference() {
    return (BinMDataStd_ExtStringListDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_ExtStringListDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_ExtStringListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_IntPackedMapDriver;
class BinMDataStd_IntPackedMapDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_IntPackedMapDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_IntPackedMapDriver;
		 BinMDataStd_IntPackedMapDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* persistent -> transient (retrieve)

	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* transient -> persistent (store)

	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_IntPackedMapDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_IntPackedMapDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_IntPackedMapDriver::Handle_BinMDataStd_IntPackedMapDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_IntPackedMapDriver;
class Handle_BinMDataStd_IntPackedMapDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_IntPackedMapDriver();
        Handle_BinMDataStd_IntPackedMapDriver(const Handle_BinMDataStd_IntPackedMapDriver &aHandle);
        Handle_BinMDataStd_IntPackedMapDriver(const BinMDataStd_IntPackedMapDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_IntPackedMapDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_IntPackedMapDriver {
    BinMDataStd_IntPackedMapDriver* _get_reference() {
    return (BinMDataStd_IntPackedMapDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_IntPackedMapDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_IntPackedMapDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_IntegerArrayDriver;
class BinMDataStd_IntegerArrayDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_IntegerArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_IntegerArrayDriver;
		 BinMDataStd_IntegerArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_IntegerArrayDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_IntegerArrayDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_IntegerArrayDriver::Handle_BinMDataStd_IntegerArrayDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_IntegerArrayDriver;
class Handle_BinMDataStd_IntegerArrayDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_IntegerArrayDriver();
        Handle_BinMDataStd_IntegerArrayDriver(const Handle_BinMDataStd_IntegerArrayDriver &aHandle);
        Handle_BinMDataStd_IntegerArrayDriver(const BinMDataStd_IntegerArrayDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_IntegerArrayDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_IntegerArrayDriver {
    BinMDataStd_IntegerArrayDriver* _get_reference() {
    return (BinMDataStd_IntegerArrayDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_IntegerArrayDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_IntegerArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_IntegerDriver;
class BinMDataStd_IntegerDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_IntegerDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_IntegerDriver;
		 BinMDataStd_IntegerDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_IntegerDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_IntegerDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_IntegerDriver::Handle_BinMDataStd_IntegerDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_IntegerDriver;
class Handle_BinMDataStd_IntegerDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_IntegerDriver();
        Handle_BinMDataStd_IntegerDriver(const Handle_BinMDataStd_IntegerDriver &aHandle);
        Handle_BinMDataStd_IntegerDriver(const BinMDataStd_IntegerDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_IntegerDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_IntegerDriver {
    BinMDataStd_IntegerDriver* _get_reference() {
    return (BinMDataStd_IntegerDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_IntegerDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_IntegerDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_IntegerListDriver;
class BinMDataStd_IntegerListDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_IntegerListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_IntegerListDriver;
		 BinMDataStd_IntegerListDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_IntegerListDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_IntegerListDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_IntegerListDriver::Handle_BinMDataStd_IntegerListDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_IntegerListDriver;
class Handle_BinMDataStd_IntegerListDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_IntegerListDriver();
        Handle_BinMDataStd_IntegerListDriver(const Handle_BinMDataStd_IntegerListDriver &aHandle);
        Handle_BinMDataStd_IntegerListDriver(const BinMDataStd_IntegerListDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_IntegerListDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_IntegerListDriver {
    BinMDataStd_IntegerListDriver* _get_reference() {
    return (BinMDataStd_IntegerListDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_IntegerListDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_IntegerListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_NameDriver;
class BinMDataStd_NameDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_NameDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_NameDriver;
		 BinMDataStd_NameDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* persistent -> transient (retrieve)

	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* transient -> persistent (store)

	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_NameDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_NameDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_NameDriver::Handle_BinMDataStd_NameDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_NameDriver;
class Handle_BinMDataStd_NameDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_NameDriver();
        Handle_BinMDataStd_NameDriver(const Handle_BinMDataStd_NameDriver &aHandle);
        Handle_BinMDataStd_NameDriver(const BinMDataStd_NameDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_NameDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_NameDriver {
    BinMDataStd_NameDriver* _get_reference() {
    return (BinMDataStd_NameDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_NameDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_NameDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_NamedDataDriver;
class BinMDataStd_NamedDataDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_NamedDataDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_NamedDataDriver;
		 BinMDataStd_NamedDataDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_NamedDataDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_NamedDataDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_NamedDataDriver::Handle_BinMDataStd_NamedDataDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_NamedDataDriver;
class Handle_BinMDataStd_NamedDataDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_NamedDataDriver();
        Handle_BinMDataStd_NamedDataDriver(const Handle_BinMDataStd_NamedDataDriver &aHandle);
        Handle_BinMDataStd_NamedDataDriver(const BinMDataStd_NamedDataDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_NamedDataDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_NamedDataDriver {
    BinMDataStd_NamedDataDriver* _get_reference() {
    return (BinMDataStd_NamedDataDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_NamedDataDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_NamedDataDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_NoteBookDriver;
class BinMDataStd_NoteBookDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_NoteBookDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_NoteBookDriver;
		 BinMDataStd_NoteBookDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_NoteBookDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_NoteBookDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_NoteBookDriver::Handle_BinMDataStd_NoteBookDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_NoteBookDriver;
class Handle_BinMDataStd_NoteBookDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_NoteBookDriver();
        Handle_BinMDataStd_NoteBookDriver(const Handle_BinMDataStd_NoteBookDriver &aHandle);
        Handle_BinMDataStd_NoteBookDriver(const BinMDataStd_NoteBookDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_NoteBookDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_NoteBookDriver {
    BinMDataStd_NoteBookDriver* _get_reference() {
    return (BinMDataStd_NoteBookDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_NoteBookDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_NoteBookDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_RealArrayDriver;
class BinMDataStd_RealArrayDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_RealArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_RealArrayDriver;
		 BinMDataStd_RealArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_RealArrayDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_RealArrayDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_RealArrayDriver::Handle_BinMDataStd_RealArrayDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_RealArrayDriver;
class Handle_BinMDataStd_RealArrayDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_RealArrayDriver();
        Handle_BinMDataStd_RealArrayDriver(const Handle_BinMDataStd_RealArrayDriver &aHandle);
        Handle_BinMDataStd_RealArrayDriver(const BinMDataStd_RealArrayDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_RealArrayDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_RealArrayDriver {
    BinMDataStd_RealArrayDriver* _get_reference() {
    return (BinMDataStd_RealArrayDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_RealArrayDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_RealArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_RealDriver;
class BinMDataStd_RealDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_RealDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_RealDriver;
		 BinMDataStd_RealDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_RealDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_RealDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_RealDriver::Handle_BinMDataStd_RealDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_RealDriver;
class Handle_BinMDataStd_RealDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_RealDriver();
        Handle_BinMDataStd_RealDriver(const Handle_BinMDataStd_RealDriver &aHandle);
        Handle_BinMDataStd_RealDriver(const BinMDataStd_RealDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_RealDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_RealDriver {
    BinMDataStd_RealDriver* _get_reference() {
    return (BinMDataStd_RealDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_RealDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_RealDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_RealListDriver;
class BinMDataStd_RealListDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_RealListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_RealListDriver;
		 BinMDataStd_RealListDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_RealListDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_RealListDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_RealListDriver::Handle_BinMDataStd_RealListDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_RealListDriver;
class Handle_BinMDataStd_RealListDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_RealListDriver();
        Handle_BinMDataStd_RealListDriver(const Handle_BinMDataStd_RealListDriver &aHandle);
        Handle_BinMDataStd_RealListDriver(const BinMDataStd_RealListDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_RealListDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_RealListDriver {
    BinMDataStd_RealListDriver* _get_reference() {
    return (BinMDataStd_RealListDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_RealListDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_RealListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_ReferenceArrayDriver;
class BinMDataStd_ReferenceArrayDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_ReferenceArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_ReferenceArrayDriver;
		 BinMDataStd_ReferenceArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_ReferenceArrayDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_ReferenceArrayDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_ReferenceArrayDriver::Handle_BinMDataStd_ReferenceArrayDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_ReferenceArrayDriver;
class Handle_BinMDataStd_ReferenceArrayDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_ReferenceArrayDriver();
        Handle_BinMDataStd_ReferenceArrayDriver(const Handle_BinMDataStd_ReferenceArrayDriver &aHandle);
        Handle_BinMDataStd_ReferenceArrayDriver(const BinMDataStd_ReferenceArrayDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_ReferenceArrayDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_ReferenceArrayDriver {
    BinMDataStd_ReferenceArrayDriver* _get_reference() {
    return (BinMDataStd_ReferenceArrayDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_ReferenceArrayDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_ReferenceArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_ReferenceListDriver;
class BinMDataStd_ReferenceListDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_ReferenceListDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_ReferenceListDriver;
		 BinMDataStd_ReferenceListDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_ReferenceListDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_ReferenceListDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_ReferenceListDriver::Handle_BinMDataStd_ReferenceListDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_ReferenceListDriver;
class Handle_BinMDataStd_ReferenceListDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_ReferenceListDriver();
        Handle_BinMDataStd_ReferenceListDriver(const Handle_BinMDataStd_ReferenceListDriver &aHandle);
        Handle_BinMDataStd_ReferenceListDriver(const BinMDataStd_ReferenceListDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_ReferenceListDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_ReferenceListDriver {
    BinMDataStd_ReferenceListDriver* _get_reference() {
    return (BinMDataStd_ReferenceListDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_ReferenceListDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_ReferenceListDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_RelationDriver;
class BinMDataStd_RelationDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_RelationDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_RelationDriver;
		 BinMDataStd_RelationDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_RelationDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_RelationDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_RelationDriver::Handle_BinMDataStd_RelationDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_RelationDriver;
class Handle_BinMDataStd_RelationDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_RelationDriver();
        Handle_BinMDataStd_RelationDriver(const Handle_BinMDataStd_RelationDriver &aHandle);
        Handle_BinMDataStd_RelationDriver(const BinMDataStd_RelationDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_RelationDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_RelationDriver {
    BinMDataStd_RelationDriver* _get_reference() {
    return (BinMDataStd_RelationDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_RelationDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_RelationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_TickDriver;
class BinMDataStd_TickDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_TickDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_TickDriver;
		 BinMDataStd_TickDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_TickDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_TickDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_TickDriver::Handle_BinMDataStd_TickDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_TickDriver;
class Handle_BinMDataStd_TickDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_TickDriver();
        Handle_BinMDataStd_TickDriver(const Handle_BinMDataStd_TickDriver &aHandle);
        Handle_BinMDataStd_TickDriver(const BinMDataStd_TickDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_TickDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_TickDriver {
    BinMDataStd_TickDriver* _get_reference() {
    return (BinMDataStd_TickDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_TickDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_TickDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_TreeNodeDriver;
class BinMDataStd_TreeNodeDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_TreeNodeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_TreeNodeDriver;
		 BinMDataStd_TreeNodeDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_TreeNodeDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_TreeNodeDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_TreeNodeDriver::Handle_BinMDataStd_TreeNodeDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_TreeNodeDriver;
class Handle_BinMDataStd_TreeNodeDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_TreeNodeDriver();
        Handle_BinMDataStd_TreeNodeDriver(const Handle_BinMDataStd_TreeNodeDriver &aHandle);
        Handle_BinMDataStd_TreeNodeDriver(const BinMDataStd_TreeNodeDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_TreeNodeDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_TreeNodeDriver {
    BinMDataStd_TreeNodeDriver* _get_reference() {
    return (BinMDataStd_TreeNodeDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_TreeNodeDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_TreeNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_UAttributeDriver;
class BinMDataStd_UAttributeDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_UAttributeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_UAttributeDriver;
		 BinMDataStd_UAttributeDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_UAttributeDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_UAttributeDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_UAttributeDriver::Handle_BinMDataStd_UAttributeDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_UAttributeDriver;
class Handle_BinMDataStd_UAttributeDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_UAttributeDriver();
        Handle_BinMDataStd_UAttributeDriver(const Handle_BinMDataStd_UAttributeDriver &aHandle);
        Handle_BinMDataStd_UAttributeDriver(const BinMDataStd_UAttributeDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_UAttributeDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_UAttributeDriver {
    BinMDataStd_UAttributeDriver* _get_reference() {
    return (BinMDataStd_UAttributeDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_UAttributeDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_UAttributeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataStd_VariableDriver;
class BinMDataStd_VariableDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataStd_VariableDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataStd_VariableDriver;
		 BinMDataStd_VariableDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: BinObjMgt_Persistent &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & Source,const Handle_TDF_Attribute & Target,BinObjMgt_RRelocationTable & RelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: BinObjMgt_Persistent &
	:param RelocTable:
	:type RelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,BinObjMgt_Persistent & Target,BinObjMgt_SRelocationTable & RelocTable);
};


%extend BinMDataStd_VariableDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataStd_VariableDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataStd_VariableDriver::Handle_BinMDataStd_VariableDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataStd_VariableDriver;
class Handle_BinMDataStd_VariableDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataStd_VariableDriver();
        Handle_BinMDataStd_VariableDriver(const Handle_BinMDataStd_VariableDriver &aHandle);
        Handle_BinMDataStd_VariableDriver(const BinMDataStd_VariableDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataStd_VariableDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataStd_VariableDriver {
    BinMDataStd_VariableDriver* _get_reference() {
    return (BinMDataStd_VariableDriver*)$self->Access();
    }
};

%extend Handle_BinMDataStd_VariableDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataStd_VariableDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
