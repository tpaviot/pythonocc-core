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
%module (package="OCC") BinMDataXtd

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


%include BinMDataXtd_headers.i


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

%rename(binmdataxtd) BinMDataXtd;
class BinMDataXtd {
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


%extend BinMDataXtd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_AxisDriver;
class BinMDataXtd_AxisDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_AxisDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataXtd_AxisDriver;
		 BinMDataXtd_AxisDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend BinMDataXtd_AxisDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataXtd_AxisDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataXtd_AxisDriver::Handle_BinMDataXtd_AxisDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataXtd_AxisDriver;
class Handle_BinMDataXtd_AxisDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataXtd_AxisDriver();
        Handle_BinMDataXtd_AxisDriver(const Handle_BinMDataXtd_AxisDriver &aHandle);
        Handle_BinMDataXtd_AxisDriver(const BinMDataXtd_AxisDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataXtd_AxisDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataXtd_AxisDriver {
    BinMDataXtd_AxisDriver* _get_reference() {
    return (BinMDataXtd_AxisDriver*)$self->Access();
    }
};

%extend Handle_BinMDataXtd_AxisDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataXtd_AxisDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_ConstraintDriver;
class BinMDataXtd_ConstraintDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_ConstraintDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataXtd_ConstraintDriver;
		 BinMDataXtd_ConstraintDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend BinMDataXtd_ConstraintDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataXtd_ConstraintDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataXtd_ConstraintDriver::Handle_BinMDataXtd_ConstraintDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataXtd_ConstraintDriver;
class Handle_BinMDataXtd_ConstraintDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataXtd_ConstraintDriver();
        Handle_BinMDataXtd_ConstraintDriver(const Handle_BinMDataXtd_ConstraintDriver &aHandle);
        Handle_BinMDataXtd_ConstraintDriver(const BinMDataXtd_ConstraintDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataXtd_ConstraintDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataXtd_ConstraintDriver {
    BinMDataXtd_ConstraintDriver* _get_reference() {
    return (BinMDataXtd_ConstraintDriver*)$self->Access();
    }
};

%extend Handle_BinMDataXtd_ConstraintDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataXtd_ConstraintDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_GeometryDriver;
class BinMDataXtd_GeometryDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_GeometryDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataXtd_GeometryDriver;
		 BinMDataXtd_GeometryDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend BinMDataXtd_GeometryDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataXtd_GeometryDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataXtd_GeometryDriver::Handle_BinMDataXtd_GeometryDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataXtd_GeometryDriver;
class Handle_BinMDataXtd_GeometryDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataXtd_GeometryDriver();
        Handle_BinMDataXtd_GeometryDriver(const Handle_BinMDataXtd_GeometryDriver &aHandle);
        Handle_BinMDataXtd_GeometryDriver(const BinMDataXtd_GeometryDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataXtd_GeometryDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataXtd_GeometryDriver {
    BinMDataXtd_GeometryDriver* _get_reference() {
    return (BinMDataXtd_GeometryDriver*)$self->Access();
    }
};

%extend Handle_BinMDataXtd_GeometryDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataXtd_GeometryDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_PatternStdDriver;
class BinMDataXtd_PatternStdDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_PatternStdDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataXtd_PatternStdDriver;
		 BinMDataXtd_PatternStdDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend BinMDataXtd_PatternStdDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataXtd_PatternStdDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataXtd_PatternStdDriver::Handle_BinMDataXtd_PatternStdDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataXtd_PatternStdDriver;
class Handle_BinMDataXtd_PatternStdDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataXtd_PatternStdDriver();
        Handle_BinMDataXtd_PatternStdDriver(const Handle_BinMDataXtd_PatternStdDriver &aHandle);
        Handle_BinMDataXtd_PatternStdDriver(const BinMDataXtd_PatternStdDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataXtd_PatternStdDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataXtd_PatternStdDriver {
    BinMDataXtd_PatternStdDriver* _get_reference() {
    return (BinMDataXtd_PatternStdDriver*)$self->Access();
    }
};

%extend Handle_BinMDataXtd_PatternStdDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataXtd_PatternStdDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_PlacementDriver;
class BinMDataXtd_PlacementDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_PlacementDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataXtd_PlacementDriver;
		 BinMDataXtd_PlacementDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend BinMDataXtd_PlacementDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataXtd_PlacementDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataXtd_PlacementDriver::Handle_BinMDataXtd_PlacementDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataXtd_PlacementDriver;
class Handle_BinMDataXtd_PlacementDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataXtd_PlacementDriver();
        Handle_BinMDataXtd_PlacementDriver(const Handle_BinMDataXtd_PlacementDriver &aHandle);
        Handle_BinMDataXtd_PlacementDriver(const BinMDataXtd_PlacementDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataXtd_PlacementDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataXtd_PlacementDriver {
    BinMDataXtd_PlacementDriver* _get_reference() {
    return (BinMDataXtd_PlacementDriver*)$self->Access();
    }
};

%extend Handle_BinMDataXtd_PlacementDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataXtd_PlacementDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_PlaneDriver;
class BinMDataXtd_PlaneDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_PlaneDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataXtd_PlaneDriver;
		 BinMDataXtd_PlaneDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend BinMDataXtd_PlaneDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataXtd_PlaneDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataXtd_PlaneDriver::Handle_BinMDataXtd_PlaneDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataXtd_PlaneDriver;
class Handle_BinMDataXtd_PlaneDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataXtd_PlaneDriver();
        Handle_BinMDataXtd_PlaneDriver(const Handle_BinMDataXtd_PlaneDriver &aHandle);
        Handle_BinMDataXtd_PlaneDriver(const BinMDataXtd_PlaneDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataXtd_PlaneDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataXtd_PlaneDriver {
    BinMDataXtd_PlaneDriver* _get_reference() {
    return (BinMDataXtd_PlaneDriver*)$self->Access();
    }
};

%extend Handle_BinMDataXtd_PlaneDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataXtd_PlaneDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_PointDriver;
class BinMDataXtd_PointDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_PointDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataXtd_PointDriver;
		 BinMDataXtd_PointDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend BinMDataXtd_PointDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataXtd_PointDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataXtd_PointDriver::Handle_BinMDataXtd_PointDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataXtd_PointDriver;
class Handle_BinMDataXtd_PointDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataXtd_PointDriver();
        Handle_BinMDataXtd_PointDriver(const Handle_BinMDataXtd_PointDriver &aHandle);
        Handle_BinMDataXtd_PointDriver(const BinMDataXtd_PointDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataXtd_PointDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataXtd_PointDriver {
    BinMDataXtd_PointDriver* _get_reference() {
    return (BinMDataXtd_PointDriver*)$self->Access();
    }
};

%extend Handle_BinMDataXtd_PointDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataXtd_PointDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinMDataXtd_ShapeDriver;
class BinMDataXtd_ShapeDriver : public BinMDF_ADriver {
	public:
		%feature("compactdefaultargs") BinMDataXtd_ShapeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") BinMDataXtd_ShapeDriver;
		 BinMDataXtd_ShapeDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend BinMDataXtd_ShapeDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinMDataXtd_ShapeDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinMDataXtd_ShapeDriver::Handle_BinMDataXtd_ShapeDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinMDataXtd_ShapeDriver;
class Handle_BinMDataXtd_ShapeDriver : public Handle_BinMDF_ADriver {

    public:
        // constructors
        Handle_BinMDataXtd_ShapeDriver();
        Handle_BinMDataXtd_ShapeDriver(const Handle_BinMDataXtd_ShapeDriver &aHandle);
        Handle_BinMDataXtd_ShapeDriver(const BinMDataXtd_ShapeDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinMDataXtd_ShapeDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinMDataXtd_ShapeDriver {
    BinMDataXtd_ShapeDriver* _get_reference() {
    return (BinMDataXtd_ShapeDriver*)$self->Access();
    }
};

%extend Handle_BinMDataXtd_ShapeDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinMDataXtd_ShapeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
