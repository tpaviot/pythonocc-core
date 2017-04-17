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
%module (package="OCC") BinMXCAFDoc

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


%include BinMXCAFDoc_headers.i


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

%rename(binmxcafdoc) BinMXCAFDoc;
class BinMXCAFDoc {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute drivers to <theDriverTable>.

	:param theDriverTable:
	:type theDriverTable: Handle_BinMDF_ADriverTable &
	:param theMsgDrv:
	:type theMsgDrv: Handle_CDM_MessageDriver &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const Handle_BinMDF_ADriverTable & theDriverTable,const Handle_CDM_MessageDriver & theMsgDrv);
};


%extend BinMXCAFDoc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_AreaDriver;
class BinMXCAFDoc_AreaDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_AreaDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_AreaDriver;
		 BinMXCAFDoc_AreaDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinMXCAFDoc_AreaDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMXCAFDoc_AreaDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMXCAFDoc_AreaDriver::Handle_BinMXCAFDoc_AreaDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMXCAFDoc_AreaDriver;
class Handle_BinMXCAFDoc_AreaDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMXCAFDoc_AreaDriver();
        Handle_BinMXCAFDoc_AreaDriver(const Handle_BinMXCAFDoc_AreaDriver &aHandle);
        Handle_BinMXCAFDoc_AreaDriver(const BinMXCAFDoc_AreaDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMXCAFDoc_AreaDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMXCAFDoc_AreaDriver {
    BinMXCAFDoc_AreaDriver* _get_reference() {
    return (BinMXCAFDoc_AreaDriver*)$self->Access();
    }
};

%extend Handle_BinMXCAFDoc_AreaDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMXCAFDoc_AreaDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_CentroidDriver;
class BinMXCAFDoc_CentroidDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_CentroidDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_CentroidDriver;
		 BinMXCAFDoc_CentroidDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinMXCAFDoc_CentroidDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMXCAFDoc_CentroidDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMXCAFDoc_CentroidDriver::Handle_BinMXCAFDoc_CentroidDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMXCAFDoc_CentroidDriver;
class Handle_BinMXCAFDoc_CentroidDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMXCAFDoc_CentroidDriver();
        Handle_BinMXCAFDoc_CentroidDriver(const Handle_BinMXCAFDoc_CentroidDriver &aHandle);
        Handle_BinMXCAFDoc_CentroidDriver(const BinMXCAFDoc_CentroidDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMXCAFDoc_CentroidDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMXCAFDoc_CentroidDriver {
    BinMXCAFDoc_CentroidDriver* _get_reference() {
    return (BinMXCAFDoc_CentroidDriver*)$self->Access();
    }
};

%extend Handle_BinMXCAFDoc_CentroidDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMXCAFDoc_CentroidDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_ColorDriver;
class BinMXCAFDoc_ColorDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_ColorDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_ColorDriver;
		 BinMXCAFDoc_ColorDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinMXCAFDoc_ColorDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMXCAFDoc_ColorDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMXCAFDoc_ColorDriver::Handle_BinMXCAFDoc_ColorDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMXCAFDoc_ColorDriver;
class Handle_BinMXCAFDoc_ColorDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMXCAFDoc_ColorDriver();
        Handle_BinMXCAFDoc_ColorDriver(const Handle_BinMXCAFDoc_ColorDriver &aHandle);
        Handle_BinMXCAFDoc_ColorDriver(const BinMXCAFDoc_ColorDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMXCAFDoc_ColorDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMXCAFDoc_ColorDriver {
    BinMXCAFDoc_ColorDriver* _get_reference() {
    return (BinMXCAFDoc_ColorDriver*)$self->Access();
    }
};

%extend Handle_BinMXCAFDoc_ColorDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMXCAFDoc_ColorDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_ColorToolDriver;
class BinMXCAFDoc_ColorToolDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_ColorToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_ColorToolDriver;
		 BinMXCAFDoc_ColorToolDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinMXCAFDoc_ColorToolDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMXCAFDoc_ColorToolDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMXCAFDoc_ColorToolDriver::Handle_BinMXCAFDoc_ColorToolDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMXCAFDoc_ColorToolDriver;
class Handle_BinMXCAFDoc_ColorToolDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMXCAFDoc_ColorToolDriver();
        Handle_BinMXCAFDoc_ColorToolDriver(const Handle_BinMXCAFDoc_ColorToolDriver &aHandle);
        Handle_BinMXCAFDoc_ColorToolDriver(const BinMXCAFDoc_ColorToolDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMXCAFDoc_ColorToolDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMXCAFDoc_ColorToolDriver {
    BinMXCAFDoc_ColorToolDriver* _get_reference() {
    return (BinMXCAFDoc_ColorToolDriver*)$self->Access();
    }
};

%extend Handle_BinMXCAFDoc_ColorToolDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMXCAFDoc_ColorToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_DatumDriver;
class BinMXCAFDoc_DatumDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_DatumDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_DatumDriver;
		 BinMXCAFDoc_DatumDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinMXCAFDoc_DatumDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMXCAFDoc_DatumDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMXCAFDoc_DatumDriver::Handle_BinMXCAFDoc_DatumDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMXCAFDoc_DatumDriver;
class Handle_BinMXCAFDoc_DatumDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMXCAFDoc_DatumDriver();
        Handle_BinMXCAFDoc_DatumDriver(const Handle_BinMXCAFDoc_DatumDriver &aHandle);
        Handle_BinMXCAFDoc_DatumDriver(const BinMXCAFDoc_DatumDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMXCAFDoc_DatumDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMXCAFDoc_DatumDriver {
    BinMXCAFDoc_DatumDriver* _get_reference() {
    return (BinMXCAFDoc_DatumDriver*)$self->Access();
    }
};

%extend Handle_BinMXCAFDoc_DatumDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMXCAFDoc_DatumDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_DimTolDriver;
class BinMXCAFDoc_DimTolDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_DimTolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_DimTolDriver;
		 BinMXCAFDoc_DimTolDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinMXCAFDoc_DimTolDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMXCAFDoc_DimTolDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMXCAFDoc_DimTolDriver::Handle_BinMXCAFDoc_DimTolDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMXCAFDoc_DimTolDriver;
class Handle_BinMXCAFDoc_DimTolDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMXCAFDoc_DimTolDriver();
        Handle_BinMXCAFDoc_DimTolDriver(const Handle_BinMXCAFDoc_DimTolDriver &aHandle);
        Handle_BinMXCAFDoc_DimTolDriver(const BinMXCAFDoc_DimTolDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMXCAFDoc_DimTolDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMXCAFDoc_DimTolDriver {
    BinMXCAFDoc_DimTolDriver* _get_reference() {
    return (BinMXCAFDoc_DimTolDriver*)$self->Access();
    }
};

%extend Handle_BinMXCAFDoc_DimTolDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMXCAFDoc_DimTolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_DimTolToolDriver;
class BinMXCAFDoc_DimTolToolDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_DimTolToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_DimTolToolDriver;
		 BinMXCAFDoc_DimTolToolDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinMXCAFDoc_DimTolToolDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMXCAFDoc_DimTolToolDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMXCAFDoc_DimTolToolDriver::Handle_BinMXCAFDoc_DimTolToolDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMXCAFDoc_DimTolToolDriver;
class Handle_BinMXCAFDoc_DimTolToolDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMXCAFDoc_DimTolToolDriver();
        Handle_BinMXCAFDoc_DimTolToolDriver(const Handle_BinMXCAFDoc_DimTolToolDriver &aHandle);
        Handle_BinMXCAFDoc_DimTolToolDriver(const BinMXCAFDoc_DimTolToolDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMXCAFDoc_DimTolToolDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMXCAFDoc_DimTolToolDriver {
    BinMXCAFDoc_DimTolToolDriver* _get_reference() {
    return (BinMXCAFDoc_DimTolToolDriver*)$self->Access();
    }
};

%extend Handle_BinMXCAFDoc_DimTolToolDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMXCAFDoc_DimTolToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_DocumentToolDriver;
class BinMXCAFDoc_DocumentToolDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_DocumentToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_DocumentToolDriver;
		 BinMXCAFDoc_DocumentToolDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinMXCAFDoc_DocumentToolDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMXCAFDoc_DocumentToolDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMXCAFDoc_DocumentToolDriver::Handle_BinMXCAFDoc_DocumentToolDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMXCAFDoc_DocumentToolDriver;
class Handle_BinMXCAFDoc_DocumentToolDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMXCAFDoc_DocumentToolDriver();
        Handle_BinMXCAFDoc_DocumentToolDriver(const Handle_BinMXCAFDoc_DocumentToolDriver &aHandle);
        Handle_BinMXCAFDoc_DocumentToolDriver(const BinMXCAFDoc_DocumentToolDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMXCAFDoc_DocumentToolDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMXCAFDoc_DocumentToolDriver {
    BinMXCAFDoc_DocumentToolDriver* _get_reference() {
    return (BinMXCAFDoc_DocumentToolDriver*)$self->Access();
    }
};

%extend Handle_BinMXCAFDoc_DocumentToolDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMXCAFDoc_DocumentToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_GraphNodeDriver;
class BinMXCAFDoc_GraphNodeDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_GraphNodeDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_GraphNodeDriver;
		 BinMXCAFDoc_GraphNodeDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinMXCAFDoc_GraphNodeDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMXCAFDoc_GraphNodeDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMXCAFDoc_GraphNodeDriver::Handle_BinMXCAFDoc_GraphNodeDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMXCAFDoc_GraphNodeDriver;
class Handle_BinMXCAFDoc_GraphNodeDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMXCAFDoc_GraphNodeDriver();
        Handle_BinMXCAFDoc_GraphNodeDriver(const Handle_BinMXCAFDoc_GraphNodeDriver &aHandle);
        Handle_BinMXCAFDoc_GraphNodeDriver(const BinMXCAFDoc_GraphNodeDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMXCAFDoc_GraphNodeDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMXCAFDoc_GraphNodeDriver {
    BinMXCAFDoc_GraphNodeDriver* _get_reference() {
    return (BinMXCAFDoc_GraphNodeDriver*)$self->Access();
    }
};

%extend Handle_BinMXCAFDoc_GraphNodeDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMXCAFDoc_GraphNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_LayerToolDriver;
class BinMXCAFDoc_LayerToolDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_LayerToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_LayerToolDriver;
		 BinMXCAFDoc_LayerToolDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinMXCAFDoc_LayerToolDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMXCAFDoc_LayerToolDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMXCAFDoc_LayerToolDriver::Handle_BinMXCAFDoc_LayerToolDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMXCAFDoc_LayerToolDriver;
class Handle_BinMXCAFDoc_LayerToolDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMXCAFDoc_LayerToolDriver();
        Handle_BinMXCAFDoc_LayerToolDriver(const Handle_BinMXCAFDoc_LayerToolDriver &aHandle);
        Handle_BinMXCAFDoc_LayerToolDriver(const BinMXCAFDoc_LayerToolDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMXCAFDoc_LayerToolDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMXCAFDoc_LayerToolDriver {
    BinMXCAFDoc_LayerToolDriver* _get_reference() {
    return (BinMXCAFDoc_LayerToolDriver*)$self->Access();
    }
};

%extend Handle_BinMXCAFDoc_LayerToolDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMXCAFDoc_LayerToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_LocationDriver;
class BinMXCAFDoc_LocationDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_LocationDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_LocationDriver;
		 BinMXCAFDoc_LocationDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theLoc:
	:type theLoc: TopLoc_Location &
	:param theMap:
	:type theMap: BinObjMgt_RRelocationTable &
	:rtype: bool
") Translate;
		Standard_Boolean Translate (const BinObjMgt_Persistent & theSource,TopLoc_Location & theLoc,BinObjMgt_RRelocationTable & theMap);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Translate transient location to storable

	:param theLoc:
	:type theLoc: TopLoc_Location &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theMap:
	:type theMap: BinObjMgt_SRelocationTable &
	:rtype: None
") Translate;
		void Translate (const TopLoc_Location & theLoc,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theMap);
		%feature("compactdefaultargs") SetSharedLocations;
		%feature("autodoc", "	:param theLocations:
	:type theLocations: BinTools_LocationSetPtr &
	:rtype: None
") SetSharedLocations;
		void SetSharedLocations (const BinTools_LocationSetPtr & theLocations);
};


%extend BinMXCAFDoc_LocationDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMXCAFDoc_LocationDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMXCAFDoc_LocationDriver::Handle_BinMXCAFDoc_LocationDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMXCAFDoc_LocationDriver;
class Handle_BinMXCAFDoc_LocationDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMXCAFDoc_LocationDriver();
        Handle_BinMXCAFDoc_LocationDriver(const Handle_BinMXCAFDoc_LocationDriver &aHandle);
        Handle_BinMXCAFDoc_LocationDriver(const BinMXCAFDoc_LocationDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMXCAFDoc_LocationDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMXCAFDoc_LocationDriver {
    BinMXCAFDoc_LocationDriver* _get_reference() {
    return (BinMXCAFDoc_LocationDriver*)$self->Access();
    }
};

%extend Handle_BinMXCAFDoc_LocationDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMXCAFDoc_LocationDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_MaterialDriver;
class BinMXCAFDoc_MaterialDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_MaterialDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_MaterialDriver;
		 BinMXCAFDoc_MaterialDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinMXCAFDoc_MaterialDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMXCAFDoc_MaterialDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMXCAFDoc_MaterialDriver::Handle_BinMXCAFDoc_MaterialDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMXCAFDoc_MaterialDriver;
class Handle_BinMXCAFDoc_MaterialDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMXCAFDoc_MaterialDriver();
        Handle_BinMXCAFDoc_MaterialDriver(const Handle_BinMXCAFDoc_MaterialDriver &aHandle);
        Handle_BinMXCAFDoc_MaterialDriver(const BinMXCAFDoc_MaterialDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMXCAFDoc_MaterialDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMXCAFDoc_MaterialDriver {
    BinMXCAFDoc_MaterialDriver* _get_reference() {
    return (BinMXCAFDoc_MaterialDriver*)$self->Access();
    }
};

%extend Handle_BinMXCAFDoc_MaterialDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMXCAFDoc_MaterialDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_MaterialToolDriver;
class BinMXCAFDoc_MaterialToolDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_MaterialToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_MaterialToolDriver;
		 BinMXCAFDoc_MaterialToolDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinMXCAFDoc_MaterialToolDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMXCAFDoc_MaterialToolDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMXCAFDoc_MaterialToolDriver::Handle_BinMXCAFDoc_MaterialToolDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMXCAFDoc_MaterialToolDriver;
class Handle_BinMXCAFDoc_MaterialToolDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMXCAFDoc_MaterialToolDriver();
        Handle_BinMXCAFDoc_MaterialToolDriver(const Handle_BinMXCAFDoc_MaterialToolDriver &aHandle);
        Handle_BinMXCAFDoc_MaterialToolDriver(const BinMXCAFDoc_MaterialToolDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMXCAFDoc_MaterialToolDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMXCAFDoc_MaterialToolDriver {
    BinMXCAFDoc_MaterialToolDriver* _get_reference() {
    return (BinMXCAFDoc_MaterialToolDriver*)$self->Access();
    }
};

%extend Handle_BinMXCAFDoc_MaterialToolDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMXCAFDoc_MaterialToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_ShapeToolDriver;
class BinMXCAFDoc_ShapeToolDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_ShapeToolDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_ShapeToolDriver;
		 BinMXCAFDoc_ShapeToolDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinMXCAFDoc_ShapeToolDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMXCAFDoc_ShapeToolDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMXCAFDoc_ShapeToolDriver::Handle_BinMXCAFDoc_ShapeToolDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMXCAFDoc_ShapeToolDriver;
class Handle_BinMXCAFDoc_ShapeToolDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMXCAFDoc_ShapeToolDriver();
        Handle_BinMXCAFDoc_ShapeToolDriver(const Handle_BinMXCAFDoc_ShapeToolDriver &aHandle);
        Handle_BinMXCAFDoc_ShapeToolDriver(const BinMXCAFDoc_ShapeToolDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMXCAFDoc_ShapeToolDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMXCAFDoc_ShapeToolDriver {
    BinMXCAFDoc_ShapeToolDriver* _get_reference() {
    return (BinMXCAFDoc_ShapeToolDriver*)$self->Access();
    }
};

%extend Handle_BinMXCAFDoc_ShapeToolDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMXCAFDoc_ShapeToolDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMXCAFDoc_VolumeDriver;
class BinMXCAFDoc_VolumeDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMXCAFDoc_VolumeDriver;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMXCAFDoc_VolumeDriver;
		 BinMXCAFDoc_VolumeDriver (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		virtual Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinMXCAFDoc_VolumeDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMXCAFDoc_VolumeDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMXCAFDoc_VolumeDriver::Handle_BinMXCAFDoc_VolumeDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMXCAFDoc_VolumeDriver;
class Handle_BinMXCAFDoc_VolumeDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMXCAFDoc_VolumeDriver();
        Handle_BinMXCAFDoc_VolumeDriver(const Handle_BinMXCAFDoc_VolumeDriver &aHandle);
        Handle_BinMXCAFDoc_VolumeDriver(const BinMXCAFDoc_VolumeDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMXCAFDoc_VolumeDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMXCAFDoc_VolumeDriver {
    BinMXCAFDoc_VolumeDriver* _get_reference() {
    return (BinMXCAFDoc_VolumeDriver*)$self->Access();
    }
};

%extend Handle_BinMXCAFDoc_VolumeDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMXCAFDoc_VolumeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
