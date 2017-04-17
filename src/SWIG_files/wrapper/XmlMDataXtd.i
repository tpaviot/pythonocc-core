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
%module (package="OCC") XmlMDataXtd

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


%include XmlMDataXtd_headers.i


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

%rename(xmlmdataxtd) XmlMDataXtd;
class XmlMDataXtd {
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


%extend XmlMDataXtd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataXtd_AxisDriver;
class XmlMDataXtd_AxisDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataXtd_AxisDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataXtd_AxisDriver;
		 XmlMDataXtd_AxisDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataXtd_AxisDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataXtd_AxisDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataXtd_AxisDriver::Handle_XmlMDataXtd_AxisDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataXtd_AxisDriver;
class Handle_XmlMDataXtd_AxisDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataXtd_AxisDriver();
        Handle_XmlMDataXtd_AxisDriver(const Handle_XmlMDataXtd_AxisDriver &aHandle);
        Handle_XmlMDataXtd_AxisDriver(const XmlMDataXtd_AxisDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataXtd_AxisDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataXtd_AxisDriver {
    XmlMDataXtd_AxisDriver* _get_reference() {
    return (XmlMDataXtd_AxisDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataXtd_AxisDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataXtd_AxisDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataXtd_ConstraintDriver;
class XmlMDataXtd_ConstraintDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataXtd_ConstraintDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataXtd_ConstraintDriver;
		 XmlMDataXtd_ConstraintDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataXtd_ConstraintDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataXtd_ConstraintDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataXtd_ConstraintDriver::Handle_XmlMDataXtd_ConstraintDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataXtd_ConstraintDriver;
class Handle_XmlMDataXtd_ConstraintDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataXtd_ConstraintDriver();
        Handle_XmlMDataXtd_ConstraintDriver(const Handle_XmlMDataXtd_ConstraintDriver &aHandle);
        Handle_XmlMDataXtd_ConstraintDriver(const XmlMDataXtd_ConstraintDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataXtd_ConstraintDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataXtd_ConstraintDriver {
    XmlMDataXtd_ConstraintDriver* _get_reference() {
    return (XmlMDataXtd_ConstraintDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataXtd_ConstraintDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataXtd_ConstraintDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataXtd_GeometryDriver;
class XmlMDataXtd_GeometryDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataXtd_GeometryDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataXtd_GeometryDriver;
		 XmlMDataXtd_GeometryDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataXtd_GeometryDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataXtd_GeometryDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataXtd_GeometryDriver::Handle_XmlMDataXtd_GeometryDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataXtd_GeometryDriver;
class Handle_XmlMDataXtd_GeometryDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataXtd_GeometryDriver();
        Handle_XmlMDataXtd_GeometryDriver(const Handle_XmlMDataXtd_GeometryDriver &aHandle);
        Handle_XmlMDataXtd_GeometryDriver(const XmlMDataXtd_GeometryDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataXtd_GeometryDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataXtd_GeometryDriver {
    XmlMDataXtd_GeometryDriver* _get_reference() {
    return (XmlMDataXtd_GeometryDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataXtd_GeometryDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataXtd_GeometryDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataXtd_PatternStdDriver;
class XmlMDataXtd_PatternStdDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataXtd_PatternStdDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataXtd_PatternStdDriver;
		 XmlMDataXtd_PatternStdDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataXtd_PatternStdDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataXtd_PatternStdDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataXtd_PatternStdDriver::Handle_XmlMDataXtd_PatternStdDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataXtd_PatternStdDriver;
class Handle_XmlMDataXtd_PatternStdDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataXtd_PatternStdDriver();
        Handle_XmlMDataXtd_PatternStdDriver(const Handle_XmlMDataXtd_PatternStdDriver &aHandle);
        Handle_XmlMDataXtd_PatternStdDriver(const XmlMDataXtd_PatternStdDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataXtd_PatternStdDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataXtd_PatternStdDriver {
    XmlMDataXtd_PatternStdDriver* _get_reference() {
    return (XmlMDataXtd_PatternStdDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataXtd_PatternStdDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataXtd_PatternStdDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataXtd_PlacementDriver;
class XmlMDataXtd_PlacementDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataXtd_PlacementDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataXtd_PlacementDriver;
		 XmlMDataXtd_PlacementDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataXtd_PlacementDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataXtd_PlacementDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataXtd_PlacementDriver::Handle_XmlMDataXtd_PlacementDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataXtd_PlacementDriver;
class Handle_XmlMDataXtd_PlacementDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataXtd_PlacementDriver();
        Handle_XmlMDataXtd_PlacementDriver(const Handle_XmlMDataXtd_PlacementDriver &aHandle);
        Handle_XmlMDataXtd_PlacementDriver(const XmlMDataXtd_PlacementDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataXtd_PlacementDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataXtd_PlacementDriver {
    XmlMDataXtd_PlacementDriver* _get_reference() {
    return (XmlMDataXtd_PlacementDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataXtd_PlacementDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataXtd_PlacementDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataXtd_PlaneDriver;
class XmlMDataXtd_PlaneDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataXtd_PlaneDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataXtd_PlaneDriver;
		 XmlMDataXtd_PlaneDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataXtd_PlaneDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataXtd_PlaneDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataXtd_PlaneDriver::Handle_XmlMDataXtd_PlaneDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataXtd_PlaneDriver;
class Handle_XmlMDataXtd_PlaneDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataXtd_PlaneDriver();
        Handle_XmlMDataXtd_PlaneDriver(const Handle_XmlMDataXtd_PlaneDriver &aHandle);
        Handle_XmlMDataXtd_PlaneDriver(const XmlMDataXtd_PlaneDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataXtd_PlaneDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataXtd_PlaneDriver {
    XmlMDataXtd_PlaneDriver* _get_reference() {
    return (XmlMDataXtd_PlaneDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataXtd_PlaneDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataXtd_PlaneDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataXtd_PointDriver;
class XmlMDataXtd_PointDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataXtd_PointDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataXtd_PointDriver;
		 XmlMDataXtd_PointDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataXtd_PointDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataXtd_PointDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataXtd_PointDriver::Handle_XmlMDataXtd_PointDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataXtd_PointDriver;
class Handle_XmlMDataXtd_PointDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataXtd_PointDriver();
        Handle_XmlMDataXtd_PointDriver(const Handle_XmlMDataXtd_PointDriver &aHandle);
        Handle_XmlMDataXtd_PointDriver(const XmlMDataXtd_PointDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataXtd_PointDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataXtd_PointDriver {
    XmlMDataXtd_PointDriver* _get_reference() {
    return (XmlMDataXtd_PointDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataXtd_PointDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataXtd_PointDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMDataXtd_ShapeDriver;
class XmlMDataXtd_ShapeDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMDataXtd_ShapeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMDataXtd_ShapeDriver;
		 XmlMDataXtd_ShapeDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMDataXtd_ShapeDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMDataXtd_ShapeDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMDataXtd_ShapeDriver::Handle_XmlMDataXtd_ShapeDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMDataXtd_ShapeDriver;
class Handle_XmlMDataXtd_ShapeDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMDataXtd_ShapeDriver();
        Handle_XmlMDataXtd_ShapeDriver(const Handle_XmlMDataXtd_ShapeDriver &aHandle);
        Handle_XmlMDataXtd_ShapeDriver(const XmlMDataXtd_ShapeDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMDataXtd_ShapeDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMDataXtd_ShapeDriver {
    XmlMDataXtd_ShapeDriver* _get_reference() {
    return (XmlMDataXtd_ShapeDriver*)$self->Access();
    }
};

%extend Handle_XmlMDataXtd_ShapeDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMDataXtd_ShapeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
