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
%module (package="OCC") MNaming

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


%include MNaming_headers.i


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

%rename(mnaming) MNaming;
class MNaming {
	public:
		%feature("compactdefaultargs") AddStorageDrivers;
		%feature("autodoc", "	* Adds the attribute storage drivers to <aDriverSeq>.

	:param aDriverSeq:
	:type aDriverSeq: Handle_MDF_ASDriverHSequence &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddStorageDrivers;
		static void AddStorageDrivers (const Handle_MDF_ASDriverHSequence & aDriverSeq,const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") AddRetrievalDrivers;
		%feature("autodoc", "	* Adds the attribute retrieval drivers to <aDriverSeq>.

	:param aDriverSeq:
	:type aDriverSeq: Handle_MDF_ARDriverHSequence &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddRetrievalDrivers;
		static void AddRetrievalDrivers (const Handle_MDF_ARDriverHSequence & aDriverSeq,const Handle_CDM_MessageDriver & theMessageDriver);
};


%extend MNaming {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MNaming_NamedShapeRetrievalDriver;
class MNaming_NamedShapeRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MNaming_NamedShapeRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MNaming_NamedShapeRetrievalDriver;
		 MNaming_NamedShapeRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type NamedShape from PNaming.

	:rtype: Handle_Standard_Type
") SourceType;
		Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_PDF_Attribute &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: Handle_MDF_RRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_PDF_Attribute & Source,const Handle_TDF_Attribute & Target,const Handle_MDF_RRelocationTable & RelocTable);
};


%extend MNaming_NamedShapeRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MNaming_NamedShapeRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MNaming_NamedShapeRetrievalDriver::Handle_MNaming_NamedShapeRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MNaming_NamedShapeRetrievalDriver;
class Handle_MNaming_NamedShapeRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MNaming_NamedShapeRetrievalDriver();
        Handle_MNaming_NamedShapeRetrievalDriver(const Handle_MNaming_NamedShapeRetrievalDriver &aHandle);
        Handle_MNaming_NamedShapeRetrievalDriver(const MNaming_NamedShapeRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MNaming_NamedShapeRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MNaming_NamedShapeRetrievalDriver {
    MNaming_NamedShapeRetrievalDriver* _get_reference() {
    return (MNaming_NamedShapeRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MNaming_NamedShapeRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MNaming_NamedShapeRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MNaming_NamedShapeStorageDriver;
class MNaming_NamedShapeStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MNaming_NamedShapeStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MNaming_NamedShapeStorageDriver;
		 MNaming_NamedShapeStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: NamedShape from PNaming.

	:rtype: Handle_Standard_Type
") SourceType;
		Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_PDF_Attribute
") NewEmpty;
		Handle_PDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: Handle_PDF_Attribute &
	:param RelocTable:
	:type RelocTable: Handle_MDF_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,const Handle_PDF_Attribute & Target,const Handle_MDF_SRelocationTable & RelocTable);
};


%extend MNaming_NamedShapeStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MNaming_NamedShapeStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MNaming_NamedShapeStorageDriver::Handle_MNaming_NamedShapeStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MNaming_NamedShapeStorageDriver;
class Handle_MNaming_NamedShapeStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MNaming_NamedShapeStorageDriver();
        Handle_MNaming_NamedShapeStorageDriver(const Handle_MNaming_NamedShapeStorageDriver &aHandle);
        Handle_MNaming_NamedShapeStorageDriver(const MNaming_NamedShapeStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MNaming_NamedShapeStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MNaming_NamedShapeStorageDriver {
    MNaming_NamedShapeStorageDriver* _get_reference() {
    return (MNaming_NamedShapeStorageDriver*)$self->Access();
    }
};

%extend Handle_MNaming_NamedShapeStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MNaming_NamedShapeStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MNaming_NamingRetrievalDriver;
class MNaming_NamingRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MNaming_NamingRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MNaming_NamingRetrievalDriver;
		 MNaming_NamingRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Constraint from PDataStd.

	:rtype: Handle_Standard_Type
") SourceType;
		Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_PDF_Attribute &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: Handle_MDF_RRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_PDF_Attribute & Source,const Handle_TDF_Attribute & Target,const Handle_MDF_RRelocationTable & RelocTable);
};


%extend MNaming_NamingRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MNaming_NamingRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MNaming_NamingRetrievalDriver::Handle_MNaming_NamingRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MNaming_NamingRetrievalDriver;
class Handle_MNaming_NamingRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MNaming_NamingRetrievalDriver();
        Handle_MNaming_NamingRetrievalDriver(const Handle_MNaming_NamingRetrievalDriver &aHandle);
        Handle_MNaming_NamingRetrievalDriver(const MNaming_NamingRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MNaming_NamingRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MNaming_NamingRetrievalDriver {
    MNaming_NamingRetrievalDriver* _get_reference() {
    return (MNaming_NamingRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MNaming_NamingRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MNaming_NamingRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MNaming_NamingRetrievalDriver_1;
class MNaming_NamingRetrievalDriver_1 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MNaming_NamingRetrievalDriver_1;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MNaming_NamingRetrievalDriver_1;
		 MNaming_NamingRetrievalDriver_1 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Naming from PNaming.

	:rtype: Handle_Standard_Type
") SourceType;
		Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_PDF_Attribute &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: Handle_MDF_RRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_PDF_Attribute & Source,const Handle_TDF_Attribute & Target,const Handle_MDF_RRelocationTable & RelocTable);
};


%extend MNaming_NamingRetrievalDriver_1 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MNaming_NamingRetrievalDriver_1(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MNaming_NamingRetrievalDriver_1::Handle_MNaming_NamingRetrievalDriver_1 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MNaming_NamingRetrievalDriver_1;
class Handle_MNaming_NamingRetrievalDriver_1 : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MNaming_NamingRetrievalDriver_1();
        Handle_MNaming_NamingRetrievalDriver_1(const Handle_MNaming_NamingRetrievalDriver_1 &aHandle);
        Handle_MNaming_NamingRetrievalDriver_1(const MNaming_NamingRetrievalDriver_1 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MNaming_NamingRetrievalDriver_1 DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MNaming_NamingRetrievalDriver_1 {
    MNaming_NamingRetrievalDriver_1* _get_reference() {
    return (MNaming_NamingRetrievalDriver_1*)$self->Access();
    }
};

%extend Handle_MNaming_NamingRetrievalDriver_1 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MNaming_NamingRetrievalDriver_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MNaming_NamingRetrievalDriver_2;
class MNaming_NamingRetrievalDriver_2 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MNaming_NamingRetrievalDriver_2;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MNaming_NamingRetrievalDriver_2;
		 MNaming_NamingRetrievalDriver_2 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Naming from PNaming.

	:rtype: Handle_Standard_Type
") SourceType;
		Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_PDF_Attribute &
	:param Target:
	:type Target: Handle_TDF_Attribute &
	:param RelocTable:
	:type RelocTable: Handle_MDF_RRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_PDF_Attribute & Source,const Handle_TDF_Attribute & Target,const Handle_MDF_RRelocationTable & RelocTable);
};


%extend MNaming_NamingRetrievalDriver_2 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MNaming_NamingRetrievalDriver_2(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MNaming_NamingRetrievalDriver_2::Handle_MNaming_NamingRetrievalDriver_2 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MNaming_NamingRetrievalDriver_2;
class Handle_MNaming_NamingRetrievalDriver_2 : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MNaming_NamingRetrievalDriver_2();
        Handle_MNaming_NamingRetrievalDriver_2(const Handle_MNaming_NamingRetrievalDriver_2 &aHandle);
        Handle_MNaming_NamingRetrievalDriver_2(const MNaming_NamingRetrievalDriver_2 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MNaming_NamingRetrievalDriver_2 DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MNaming_NamingRetrievalDriver_2 {
    MNaming_NamingRetrievalDriver_2* _get_reference() {
    return (MNaming_NamingRetrievalDriver_2*)$self->Access();
    }
};

%extend Handle_MNaming_NamingRetrievalDriver_2 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MNaming_NamingRetrievalDriver_2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MNaming_NamingStorageDriver;
class MNaming_NamingStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MNaming_NamingStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MNaming_NamingStorageDriver;
		 MNaming_NamingStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Integer from TDataStd.

	:rtype: Handle_Standard_Type
") SourceType;
		Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_PDF_Attribute
") NewEmpty;
		Handle_PDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Source:
	:type Source: Handle_TDF_Attribute &
	:param Target:
	:type Target: Handle_PDF_Attribute &
	:param RelocTable:
	:type RelocTable: Handle_MDF_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Source,const Handle_PDF_Attribute & Target,const Handle_MDF_SRelocationTable & RelocTable);
};


%extend MNaming_NamingStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MNaming_NamingStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MNaming_NamingStorageDriver::Handle_MNaming_NamingStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MNaming_NamingStorageDriver;
class Handle_MNaming_NamingStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MNaming_NamingStorageDriver();
        Handle_MNaming_NamingStorageDriver(const Handle_MNaming_NamingStorageDriver &aHandle);
        Handle_MNaming_NamingStorageDriver(const MNaming_NamingStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MNaming_NamingStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MNaming_NamingStorageDriver {
    MNaming_NamingStorageDriver* _get_reference() {
    return (MNaming_NamingStorageDriver*)$self->Access();
    }
};

%extend Handle_MNaming_NamingStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MNaming_NamingStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
