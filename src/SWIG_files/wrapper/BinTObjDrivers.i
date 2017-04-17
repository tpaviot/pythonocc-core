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
%module (package="OCC") BinTObjDrivers

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


%include BinTObjDrivers_headers.i


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

%rename(bintobjdrivers) BinTObjDrivers;
%nodefaultctor BinTObjDrivers;
class BinTObjDrivers {
	public:
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "	:param aGUID:
	:type aGUID: Standard_GUID &
	:rtype: Handle_Standard_Transient
") Factory;
		static Handle_Standard_Transient Factory (const Standard_GUID & aGUID);
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	:param aDriverTable:
	:type aDriverTable: Handle_BinMDF_ADriverTable &
	:param aMsgDrv:
	:type aMsgDrv: Handle_CDM_MessageDriver &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const Handle_BinMDF_ADriverTable & aDriverTable,const Handle_CDM_MessageDriver & aMsgDrv);
};


%extend BinTObjDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinTObjDrivers_DocumentRetrievalDriver;
class BinTObjDrivers_DocumentRetrievalDriver : public BinLDrivers_DocumentRetrievalDriver {
	public:
		%feature("compactdefaultargs") BinTObjDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "	:rtype: None
") BinTObjDrivers_DocumentRetrievalDriver;
		 BinTObjDrivers_DocumentRetrievalDriver ();
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_BinMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_BinMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%extend BinTObjDrivers_DocumentRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinTObjDrivers_DocumentRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinTObjDrivers_DocumentRetrievalDriver::Handle_BinTObjDrivers_DocumentRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinTObjDrivers_DocumentRetrievalDriver;
class Handle_BinTObjDrivers_DocumentRetrievalDriver : public Handle_BinLDrivers_DocumentRetrievalDriver {

    public:
        // constructors
        Handle_BinTObjDrivers_DocumentRetrievalDriver();
        Handle_BinTObjDrivers_DocumentRetrievalDriver(const Handle_BinTObjDrivers_DocumentRetrievalDriver &aHandle);
        Handle_BinTObjDrivers_DocumentRetrievalDriver(const BinTObjDrivers_DocumentRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinTObjDrivers_DocumentRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinTObjDrivers_DocumentRetrievalDriver {
    BinTObjDrivers_DocumentRetrievalDriver* _get_reference() {
    return (BinTObjDrivers_DocumentRetrievalDriver*)$self->Access();
    }
};

%extend Handle_BinTObjDrivers_DocumentRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinTObjDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinTObjDrivers_DocumentStorageDriver;
class BinTObjDrivers_DocumentStorageDriver : public BinLDrivers_DocumentStorageDriver {
	public:
		%feature("compactdefaultargs") BinTObjDrivers_DocumentStorageDriver;
		%feature("autodoc", "	:rtype: None
") BinTObjDrivers_DocumentStorageDriver;
		 BinTObjDrivers_DocumentStorageDriver ();
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_BinMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_BinMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%extend BinTObjDrivers_DocumentStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinTObjDrivers_DocumentStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinTObjDrivers_DocumentStorageDriver::Handle_BinTObjDrivers_DocumentStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinTObjDrivers_DocumentStorageDriver;
class Handle_BinTObjDrivers_DocumentStorageDriver : public Handle_BinLDrivers_DocumentStorageDriver {

    public:
        // constructors
        Handle_BinTObjDrivers_DocumentStorageDriver();
        Handle_BinTObjDrivers_DocumentStorageDriver(const Handle_BinTObjDrivers_DocumentStorageDriver &aHandle);
        Handle_BinTObjDrivers_DocumentStorageDriver(const BinTObjDrivers_DocumentStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinTObjDrivers_DocumentStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinTObjDrivers_DocumentStorageDriver {
    BinTObjDrivers_DocumentStorageDriver* _get_reference() {
    return (BinTObjDrivers_DocumentStorageDriver*)$self->Access();
    }
};

%extend Handle_BinTObjDrivers_DocumentStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinTObjDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinTObjDrivers_IntSparseArrayDriver;
class BinTObjDrivers_IntSparseArrayDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinTObjDrivers_IntSparseArrayDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinTObjDrivers_IntSparseArrayDriver;
		 BinTObjDrivers_IntSparseArrayDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinTObjDrivers_IntSparseArrayDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinTObjDrivers_IntSparseArrayDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinTObjDrivers_IntSparseArrayDriver::Handle_BinTObjDrivers_IntSparseArrayDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinTObjDrivers_IntSparseArrayDriver;
class Handle_BinTObjDrivers_IntSparseArrayDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinTObjDrivers_IntSparseArrayDriver();
        Handle_BinTObjDrivers_IntSparseArrayDriver(const Handle_BinTObjDrivers_IntSparseArrayDriver &aHandle);
        Handle_BinTObjDrivers_IntSparseArrayDriver(const BinTObjDrivers_IntSparseArrayDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinTObjDrivers_IntSparseArrayDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinTObjDrivers_IntSparseArrayDriver {
    BinTObjDrivers_IntSparseArrayDriver* _get_reference() {
    return (BinTObjDrivers_IntSparseArrayDriver*)$self->Access();
    }
};

%extend Handle_BinTObjDrivers_IntSparseArrayDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinTObjDrivers_IntSparseArrayDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinTObjDrivers_ModelDriver;
class BinTObjDrivers_ModelDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinTObjDrivers_ModelDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinTObjDrivers_ModelDriver;
		 BinTObjDrivers_ModelDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend BinTObjDrivers_ModelDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinTObjDrivers_ModelDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinTObjDrivers_ModelDriver::Handle_BinTObjDrivers_ModelDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinTObjDrivers_ModelDriver;
class Handle_BinTObjDrivers_ModelDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinTObjDrivers_ModelDriver();
        Handle_BinTObjDrivers_ModelDriver(const Handle_BinTObjDrivers_ModelDriver &aHandle);
        Handle_BinTObjDrivers_ModelDriver(const BinTObjDrivers_ModelDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinTObjDrivers_ModelDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinTObjDrivers_ModelDriver {
    BinTObjDrivers_ModelDriver* _get_reference() {
    return (BinTObjDrivers_ModelDriver*)$self->Access();
    }
};

%extend Handle_BinTObjDrivers_ModelDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinTObjDrivers_ModelDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinTObjDrivers_ObjectDriver;
class BinTObjDrivers_ObjectDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinTObjDrivers_ObjectDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinTObjDrivers_ObjectDriver;
		 BinTObjDrivers_ObjectDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend BinTObjDrivers_ObjectDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinTObjDrivers_ObjectDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinTObjDrivers_ObjectDriver::Handle_BinTObjDrivers_ObjectDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinTObjDrivers_ObjectDriver;
class Handle_BinTObjDrivers_ObjectDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinTObjDrivers_ObjectDriver();
        Handle_BinTObjDrivers_ObjectDriver(const Handle_BinTObjDrivers_ObjectDriver &aHandle);
        Handle_BinTObjDrivers_ObjectDriver(const BinTObjDrivers_ObjectDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinTObjDrivers_ObjectDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinTObjDrivers_ObjectDriver {
    BinTObjDrivers_ObjectDriver* _get_reference() {
    return (BinTObjDrivers_ObjectDriver*)$self->Access();
    }
};

%extend Handle_BinTObjDrivers_ObjectDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinTObjDrivers_ObjectDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinTObjDrivers_ReferenceDriver;
class BinTObjDrivers_ReferenceDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinTObjDrivers_ReferenceDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinTObjDrivers_ReferenceDriver;
		 BinTObjDrivers_ReferenceDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend BinTObjDrivers_ReferenceDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinTObjDrivers_ReferenceDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinTObjDrivers_ReferenceDriver::Handle_BinTObjDrivers_ReferenceDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinTObjDrivers_ReferenceDriver;
class Handle_BinTObjDrivers_ReferenceDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinTObjDrivers_ReferenceDriver();
        Handle_BinTObjDrivers_ReferenceDriver(const Handle_BinTObjDrivers_ReferenceDriver &aHandle);
        Handle_BinTObjDrivers_ReferenceDriver(const BinTObjDrivers_ReferenceDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinTObjDrivers_ReferenceDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinTObjDrivers_ReferenceDriver {
    BinTObjDrivers_ReferenceDriver* _get_reference() {
    return (BinTObjDrivers_ReferenceDriver*)$self->Access();
    }
};

%extend Handle_BinTObjDrivers_ReferenceDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinTObjDrivers_ReferenceDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinTObjDrivers_XYZDriver;
class BinTObjDrivers_XYZDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinTObjDrivers_XYZDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinTObjDrivers_XYZDriver;
		 BinTObjDrivers_XYZDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: BinObjMgt_Persistent &
	:param theTarget:
	:type theTarget: Handle_TDF_Attribute &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_RRelocationTable &
	:rtype: bool
") Paste;
		Standard_Boolean Paste (const BinObjMgt_Persistent & theSource,const Handle_TDF_Attribute & theTarget,BinObjMgt_RRelocationTable & theRelocTable);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param theSource:
	:type theSource: Handle_TDF_Attribute &
	:param theTarget:
	:type theTarget: BinObjMgt_Persistent &
	:param theRelocTable:
	:type theRelocTable: BinObjMgt_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & theSource,BinObjMgt_Persistent & theTarget,BinObjMgt_SRelocationTable & theRelocTable);
};


%extend BinTObjDrivers_XYZDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinTObjDrivers_XYZDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinTObjDrivers_XYZDriver::Handle_BinTObjDrivers_XYZDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinTObjDrivers_XYZDriver;
class Handle_BinTObjDrivers_XYZDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinTObjDrivers_XYZDriver();
        Handle_BinTObjDrivers_XYZDriver(const Handle_BinTObjDrivers_XYZDriver &aHandle);
        Handle_BinTObjDrivers_XYZDriver(const BinTObjDrivers_XYZDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinTObjDrivers_XYZDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinTObjDrivers_XYZDriver {
    BinTObjDrivers_XYZDriver* _get_reference() {
    return (BinTObjDrivers_XYZDriver*)$self->Access();
    }
};

%extend Handle_BinTObjDrivers_XYZDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinTObjDrivers_XYZDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
