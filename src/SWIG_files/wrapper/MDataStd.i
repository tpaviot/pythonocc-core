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
%module (package="OCC") MDataStd

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


%include MDataStd_headers.i


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

%rename(mdatastd) MDataStd;
class MDataStd {
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
		%feature("autodoc", "	* Adds the attribute retrieval drivers to <aDriverSeq>. Translation of TDataStd enumerations to integer ===============================================

	:param aDriverSeq:
	:type aDriverSeq: Handle_MDF_ARDriverHSequence &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddRetrievalDrivers;
		static void AddRetrievalDrivers (const Handle_MDF_ARDriverHSequence & aDriverSeq,const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") RealDimensionToInteger;
		%feature("autodoc", "	:param e:
	:type e: TDataStd_RealEnum
	:rtype: int
") RealDimensionToInteger;
		static Standard_Integer RealDimensionToInteger (const TDataStd_RealEnum e);
		%feature("compactdefaultargs") IntegerToRealDimension;
		%feature("autodoc", "	:param i:
	:type i: int
	:rtype: TDataStd_RealEnum
") IntegerToRealDimension;
		static TDataStd_RealEnum IntegerToRealDimension (const Standard_Integer i);
};


%extend MDataStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_AsciiStringRetrievalDriver;
class MDataStd_AsciiStringRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_AsciiStringRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_AsciiStringRetrievalDriver;
		 MDataStd_AsciiStringRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: AsciiString from PDataStd.

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


%extend MDataStd_AsciiStringRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_AsciiStringRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_AsciiStringRetrievalDriver::Handle_MDataStd_AsciiStringRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_AsciiStringRetrievalDriver;
class Handle_MDataStd_AsciiStringRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_AsciiStringRetrievalDriver();
        Handle_MDataStd_AsciiStringRetrievalDriver(const Handle_MDataStd_AsciiStringRetrievalDriver &aHandle);
        Handle_MDataStd_AsciiStringRetrievalDriver(const MDataStd_AsciiStringRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_AsciiStringRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_AsciiStringRetrievalDriver {
    MDataStd_AsciiStringRetrievalDriver* _get_reference() {
    return (MDataStd_AsciiStringRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_AsciiStringRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_AsciiStringRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_AsciiStringStorageDriver;
class MDataStd_AsciiStringStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_AsciiStringStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_AsciiStringStorageDriver;
		 MDataStd_AsciiStringStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataStd_AsciiStringStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_AsciiStringStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_AsciiStringStorageDriver::Handle_MDataStd_AsciiStringStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_AsciiStringStorageDriver;
class Handle_MDataStd_AsciiStringStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_AsciiStringStorageDriver();
        Handle_MDataStd_AsciiStringStorageDriver(const Handle_MDataStd_AsciiStringStorageDriver &aHandle);
        Handle_MDataStd_AsciiStringStorageDriver(const MDataStd_AsciiStringStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_AsciiStringStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_AsciiStringStorageDriver {
    MDataStd_AsciiStringStorageDriver* _get_reference() {
    return (MDataStd_AsciiStringStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_AsciiStringStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_AsciiStringStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_BooleanArrayRetrievalDriver;
class MDataStd_BooleanArrayRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_BooleanArrayRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_BooleanArrayRetrievalDriver;
		 MDataStd_BooleanArrayRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_BooleanArrayRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_BooleanArrayRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_BooleanArrayRetrievalDriver::Handle_MDataStd_BooleanArrayRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_BooleanArrayRetrievalDriver;
class Handle_MDataStd_BooleanArrayRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_BooleanArrayRetrievalDriver();
        Handle_MDataStd_BooleanArrayRetrievalDriver(const Handle_MDataStd_BooleanArrayRetrievalDriver &aHandle);
        Handle_MDataStd_BooleanArrayRetrievalDriver(const MDataStd_BooleanArrayRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_BooleanArrayRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_BooleanArrayRetrievalDriver {
    MDataStd_BooleanArrayRetrievalDriver* _get_reference() {
    return (MDataStd_BooleanArrayRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_BooleanArrayRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_BooleanArrayRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_BooleanArrayStorageDriver;
class MDataStd_BooleanArrayStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_BooleanArrayStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_BooleanArrayStorageDriver;
		 MDataStd_BooleanArrayStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_BooleanArrayStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_BooleanArrayStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_BooleanArrayStorageDriver::Handle_MDataStd_BooleanArrayStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_BooleanArrayStorageDriver;
class Handle_MDataStd_BooleanArrayStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_BooleanArrayStorageDriver();
        Handle_MDataStd_BooleanArrayStorageDriver(const Handle_MDataStd_BooleanArrayStorageDriver &aHandle);
        Handle_MDataStd_BooleanArrayStorageDriver(const MDataStd_BooleanArrayStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_BooleanArrayStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_BooleanArrayStorageDriver {
    MDataStd_BooleanArrayStorageDriver* _get_reference() {
    return (MDataStd_BooleanArrayStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_BooleanArrayStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_BooleanArrayStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_BooleanListRetrievalDriver;
class MDataStd_BooleanListRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_BooleanListRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_BooleanListRetrievalDriver;
		 MDataStd_BooleanListRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_BooleanListRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_BooleanListRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_BooleanListRetrievalDriver::Handle_MDataStd_BooleanListRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_BooleanListRetrievalDriver;
class Handle_MDataStd_BooleanListRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_BooleanListRetrievalDriver();
        Handle_MDataStd_BooleanListRetrievalDriver(const Handle_MDataStd_BooleanListRetrievalDriver &aHandle);
        Handle_MDataStd_BooleanListRetrievalDriver(const MDataStd_BooleanListRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_BooleanListRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_BooleanListRetrievalDriver {
    MDataStd_BooleanListRetrievalDriver* _get_reference() {
    return (MDataStd_BooleanListRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_BooleanListRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_BooleanListRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_BooleanListStorageDriver;
class MDataStd_BooleanListStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_BooleanListStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_BooleanListStorageDriver;
		 MDataStd_BooleanListStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_BooleanListStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_BooleanListStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_BooleanListStorageDriver::Handle_MDataStd_BooleanListStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_BooleanListStorageDriver;
class Handle_MDataStd_BooleanListStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_BooleanListStorageDriver();
        Handle_MDataStd_BooleanListStorageDriver(const Handle_MDataStd_BooleanListStorageDriver &aHandle);
        Handle_MDataStd_BooleanListStorageDriver(const MDataStd_BooleanListStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_BooleanListStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_BooleanListStorageDriver {
    MDataStd_BooleanListStorageDriver* _get_reference() {
    return (MDataStd_BooleanListStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_BooleanListStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_BooleanListStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ByteArrayRetrievalDriver;
class MDataStd_ByteArrayRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ByteArrayRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ByteArrayRetrievalDriver;
		 MDataStd_ByteArrayRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_ByteArrayRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_ByteArrayRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_ByteArrayRetrievalDriver::Handle_MDataStd_ByteArrayRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_ByteArrayRetrievalDriver;
class Handle_MDataStd_ByteArrayRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_ByteArrayRetrievalDriver();
        Handle_MDataStd_ByteArrayRetrievalDriver(const Handle_MDataStd_ByteArrayRetrievalDriver &aHandle);
        Handle_MDataStd_ByteArrayRetrievalDriver(const MDataStd_ByteArrayRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_ByteArrayRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_ByteArrayRetrievalDriver {
    MDataStd_ByteArrayRetrievalDriver* _get_reference() {
    return (MDataStd_ByteArrayRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_ByteArrayRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_ByteArrayRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ByteArrayRetrievalDriver_1;
class MDataStd_ByteArrayRetrievalDriver_1 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ByteArrayRetrievalDriver_1;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ByteArrayRetrievalDriver_1;
		 MDataStd_ByteArrayRetrievalDriver_1 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_ByteArrayRetrievalDriver_1 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_ByteArrayRetrievalDriver_1(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_ByteArrayRetrievalDriver_1::Handle_MDataStd_ByteArrayRetrievalDriver_1 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_ByteArrayRetrievalDriver_1;
class Handle_MDataStd_ByteArrayRetrievalDriver_1 : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_ByteArrayRetrievalDriver_1();
        Handle_MDataStd_ByteArrayRetrievalDriver_1(const Handle_MDataStd_ByteArrayRetrievalDriver_1 &aHandle);
        Handle_MDataStd_ByteArrayRetrievalDriver_1(const MDataStd_ByteArrayRetrievalDriver_1 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_ByteArrayRetrievalDriver_1 DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_ByteArrayRetrievalDriver_1 {
    MDataStd_ByteArrayRetrievalDriver_1* _get_reference() {
    return (MDataStd_ByteArrayRetrievalDriver_1*)$self->Access();
    }
};

%extend Handle_MDataStd_ByteArrayRetrievalDriver_1 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_ByteArrayRetrievalDriver_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ByteArrayStorageDriver;
class MDataStd_ByteArrayStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ByteArrayStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ByteArrayStorageDriver;
		 MDataStd_ByteArrayStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_ByteArrayStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_ByteArrayStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_ByteArrayStorageDriver::Handle_MDataStd_ByteArrayStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_ByteArrayStorageDriver;
class Handle_MDataStd_ByteArrayStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_ByteArrayStorageDriver();
        Handle_MDataStd_ByteArrayStorageDriver(const Handle_MDataStd_ByteArrayStorageDriver &aHandle);
        Handle_MDataStd_ByteArrayStorageDriver(const MDataStd_ByteArrayStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_ByteArrayStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_ByteArrayStorageDriver {
    MDataStd_ByteArrayStorageDriver* _get_reference() {
    return (MDataStd_ByteArrayStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_ByteArrayStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_ByteArrayStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_CommentRetrievalDriver;
class MDataStd_CommentRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_CommentRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_CommentRetrievalDriver;
		 MDataStd_CommentRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Comment from PDataStd.

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


%extend MDataStd_CommentRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_CommentRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_CommentRetrievalDriver::Handle_MDataStd_CommentRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_CommentRetrievalDriver;
class Handle_MDataStd_CommentRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_CommentRetrievalDriver();
        Handle_MDataStd_CommentRetrievalDriver(const Handle_MDataStd_CommentRetrievalDriver &aHandle);
        Handle_MDataStd_CommentRetrievalDriver(const MDataStd_CommentRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_CommentRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_CommentRetrievalDriver {
    MDataStd_CommentRetrievalDriver* _get_reference() {
    return (MDataStd_CommentRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_CommentRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_CommentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_CommentStorageDriver;
class MDataStd_CommentStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_CommentStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_CommentStorageDriver;
		 MDataStd_CommentStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataStd_CommentStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_CommentStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_CommentStorageDriver::Handle_MDataStd_CommentStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_CommentStorageDriver;
class Handle_MDataStd_CommentStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_CommentStorageDriver();
        Handle_MDataStd_CommentStorageDriver(const Handle_MDataStd_CommentStorageDriver &aHandle);
        Handle_MDataStd_CommentStorageDriver(const MDataStd_CommentStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_CommentStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_CommentStorageDriver {
    MDataStd_CommentStorageDriver* _get_reference() {
    return (MDataStd_CommentStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_CommentStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_CommentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_DirectoryRetrievalDriver;
class MDataStd_DirectoryRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_DirectoryRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_DirectoryRetrievalDriver;
		 MDataStd_DirectoryRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Directory from PDataStd.

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


%extend MDataStd_DirectoryRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_DirectoryRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_DirectoryRetrievalDriver::Handle_MDataStd_DirectoryRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_DirectoryRetrievalDriver;
class Handle_MDataStd_DirectoryRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_DirectoryRetrievalDriver();
        Handle_MDataStd_DirectoryRetrievalDriver(const Handle_MDataStd_DirectoryRetrievalDriver &aHandle);
        Handle_MDataStd_DirectoryRetrievalDriver(const MDataStd_DirectoryRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_DirectoryRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_DirectoryRetrievalDriver {
    MDataStd_DirectoryRetrievalDriver* _get_reference() {
    return (MDataStd_DirectoryRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_DirectoryRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_DirectoryRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_DirectoryStorageDriver;
class MDataStd_DirectoryStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_DirectoryStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_DirectoryStorageDriver;
		 MDataStd_DirectoryStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataStd_DirectoryStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_DirectoryStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_DirectoryStorageDriver::Handle_MDataStd_DirectoryStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_DirectoryStorageDriver;
class Handle_MDataStd_DirectoryStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_DirectoryStorageDriver();
        Handle_MDataStd_DirectoryStorageDriver(const Handle_MDataStd_DirectoryStorageDriver &aHandle);
        Handle_MDataStd_DirectoryStorageDriver(const MDataStd_DirectoryStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_DirectoryStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_DirectoryStorageDriver {
    MDataStd_DirectoryStorageDriver* _get_reference() {
    return (MDataStd_DirectoryStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_DirectoryStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_DirectoryStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ExpressionRetrievalDriver;
class MDataStd_ExpressionRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ExpressionRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ExpressionRetrievalDriver;
		 MDataStd_ExpressionRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Expression from PDataStd.

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


%extend MDataStd_ExpressionRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_ExpressionRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_ExpressionRetrievalDriver::Handle_MDataStd_ExpressionRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_ExpressionRetrievalDriver;
class Handle_MDataStd_ExpressionRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_ExpressionRetrievalDriver();
        Handle_MDataStd_ExpressionRetrievalDriver(const Handle_MDataStd_ExpressionRetrievalDriver &aHandle);
        Handle_MDataStd_ExpressionRetrievalDriver(const MDataStd_ExpressionRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_ExpressionRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_ExpressionRetrievalDriver {
    MDataStd_ExpressionRetrievalDriver* _get_reference() {
    return (MDataStd_ExpressionRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_ExpressionRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_ExpressionRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ExpressionStorageDriver;
class MDataStd_ExpressionStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ExpressionStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ExpressionStorageDriver;
		 MDataStd_ExpressionStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataStd_ExpressionStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_ExpressionStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_ExpressionStorageDriver::Handle_MDataStd_ExpressionStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_ExpressionStorageDriver;
class Handle_MDataStd_ExpressionStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_ExpressionStorageDriver();
        Handle_MDataStd_ExpressionStorageDriver(const Handle_MDataStd_ExpressionStorageDriver &aHandle);
        Handle_MDataStd_ExpressionStorageDriver(const MDataStd_ExpressionStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_ExpressionStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_ExpressionStorageDriver {
    MDataStd_ExpressionStorageDriver* _get_reference() {
    return (MDataStd_ExpressionStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_ExpressionStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_ExpressionStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ExtStringArrayRetrievalDriver;
class MDataStd_ExtStringArrayRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ExtStringArrayRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ExtStringArrayRetrievalDriver;
		 MDataStd_ExtStringArrayRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: ExtStringArray from PDataStd.

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


%extend MDataStd_ExtStringArrayRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_ExtStringArrayRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_ExtStringArrayRetrievalDriver::Handle_MDataStd_ExtStringArrayRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_ExtStringArrayRetrievalDriver;
class Handle_MDataStd_ExtStringArrayRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_ExtStringArrayRetrievalDriver();
        Handle_MDataStd_ExtStringArrayRetrievalDriver(const Handle_MDataStd_ExtStringArrayRetrievalDriver &aHandle);
        Handle_MDataStd_ExtStringArrayRetrievalDriver(const MDataStd_ExtStringArrayRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_ExtStringArrayRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_ExtStringArrayRetrievalDriver {
    MDataStd_ExtStringArrayRetrievalDriver* _get_reference() {
    return (MDataStd_ExtStringArrayRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_ExtStringArrayRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_ExtStringArrayRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ExtStringArrayRetrievalDriver_1;
class MDataStd_ExtStringArrayRetrievalDriver_1 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ExtStringArrayRetrievalDriver_1;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ExtStringArrayRetrievalDriver_1;
		 MDataStd_ExtStringArrayRetrievalDriver_1 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 1.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: ExtStringArray from PDataStd.

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


%extend MDataStd_ExtStringArrayRetrievalDriver_1 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_ExtStringArrayRetrievalDriver_1(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_ExtStringArrayRetrievalDriver_1::Handle_MDataStd_ExtStringArrayRetrievalDriver_1 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_ExtStringArrayRetrievalDriver_1;
class Handle_MDataStd_ExtStringArrayRetrievalDriver_1 : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_ExtStringArrayRetrievalDriver_1();
        Handle_MDataStd_ExtStringArrayRetrievalDriver_1(const Handle_MDataStd_ExtStringArrayRetrievalDriver_1 &aHandle);
        Handle_MDataStd_ExtStringArrayRetrievalDriver_1(const MDataStd_ExtStringArrayRetrievalDriver_1 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_ExtStringArrayRetrievalDriver_1 DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_ExtStringArrayRetrievalDriver_1 {
    MDataStd_ExtStringArrayRetrievalDriver_1* _get_reference() {
    return (MDataStd_ExtStringArrayRetrievalDriver_1*)$self->Access();
    }
};

%extend Handle_MDataStd_ExtStringArrayRetrievalDriver_1 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_ExtStringArrayRetrievalDriver_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ExtStringArrayStorageDriver;
class MDataStd_ExtStringArrayStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ExtStringArrayStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ExtStringArrayStorageDriver;
		 MDataStd_ExtStringArrayStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: ExtStringArray from TDataStd.

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


%extend MDataStd_ExtStringArrayStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_ExtStringArrayStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_ExtStringArrayStorageDriver::Handle_MDataStd_ExtStringArrayStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_ExtStringArrayStorageDriver;
class Handle_MDataStd_ExtStringArrayStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_ExtStringArrayStorageDriver();
        Handle_MDataStd_ExtStringArrayStorageDriver(const Handle_MDataStd_ExtStringArrayStorageDriver &aHandle);
        Handle_MDataStd_ExtStringArrayStorageDriver(const MDataStd_ExtStringArrayStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_ExtStringArrayStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_ExtStringArrayStorageDriver {
    MDataStd_ExtStringArrayStorageDriver* _get_reference() {
    return (MDataStd_ExtStringArrayStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_ExtStringArrayStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_ExtStringArrayStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ExtStringListRetrievalDriver;
class MDataStd_ExtStringListRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ExtStringListRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ExtStringListRetrievalDriver;
		 MDataStd_ExtStringListRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_ExtStringListRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_ExtStringListRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_ExtStringListRetrievalDriver::Handle_MDataStd_ExtStringListRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_ExtStringListRetrievalDriver;
class Handle_MDataStd_ExtStringListRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_ExtStringListRetrievalDriver();
        Handle_MDataStd_ExtStringListRetrievalDriver(const Handle_MDataStd_ExtStringListRetrievalDriver &aHandle);
        Handle_MDataStd_ExtStringListRetrievalDriver(const MDataStd_ExtStringListRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_ExtStringListRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_ExtStringListRetrievalDriver {
    MDataStd_ExtStringListRetrievalDriver* _get_reference() {
    return (MDataStd_ExtStringListRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_ExtStringListRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_ExtStringListRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ExtStringListStorageDriver;
class MDataStd_ExtStringListStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ExtStringListStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ExtStringListStorageDriver;
		 MDataStd_ExtStringListStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_ExtStringListStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_ExtStringListStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_ExtStringListStorageDriver::Handle_MDataStd_ExtStringListStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_ExtStringListStorageDriver;
class Handle_MDataStd_ExtStringListStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_ExtStringListStorageDriver();
        Handle_MDataStd_ExtStringListStorageDriver(const Handle_MDataStd_ExtStringListStorageDriver &aHandle);
        Handle_MDataStd_ExtStringListStorageDriver(const MDataStd_ExtStringListStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_ExtStringListStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_ExtStringListStorageDriver {
    MDataStd_ExtStringListStorageDriver* _get_reference() {
    return (MDataStd_ExtStringListStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_ExtStringListStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_ExtStringListStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntPackedMapRetrievalDriver;
class MDataStd_IntPackedMapRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntPackedMapRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntPackedMapRetrievalDriver;
		 MDataStd_IntPackedMapRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: IntPackedMap from PDataStd.

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


%extend MDataStd_IntPackedMapRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_IntPackedMapRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_IntPackedMapRetrievalDriver::Handle_MDataStd_IntPackedMapRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_IntPackedMapRetrievalDriver;
class Handle_MDataStd_IntPackedMapRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_IntPackedMapRetrievalDriver();
        Handle_MDataStd_IntPackedMapRetrievalDriver(const Handle_MDataStd_IntPackedMapRetrievalDriver &aHandle);
        Handle_MDataStd_IntPackedMapRetrievalDriver(const MDataStd_IntPackedMapRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_IntPackedMapRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_IntPackedMapRetrievalDriver {
    MDataStd_IntPackedMapRetrievalDriver* _get_reference() {
    return (MDataStd_IntPackedMapRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_IntPackedMapRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_IntPackedMapRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntPackedMapRetrievalDriver_1;
class MDataStd_IntPackedMapRetrievalDriver_1 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntPackedMapRetrievalDriver_1;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntPackedMapRetrievalDriver_1;
		 MDataStd_IntPackedMapRetrievalDriver_1 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 1.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: IntPackedMap_1 from PDataStd.

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


%extend MDataStd_IntPackedMapRetrievalDriver_1 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_IntPackedMapRetrievalDriver_1(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_IntPackedMapRetrievalDriver_1::Handle_MDataStd_IntPackedMapRetrievalDriver_1 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_IntPackedMapRetrievalDriver_1;
class Handle_MDataStd_IntPackedMapRetrievalDriver_1 : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_IntPackedMapRetrievalDriver_1();
        Handle_MDataStd_IntPackedMapRetrievalDriver_1(const Handle_MDataStd_IntPackedMapRetrievalDriver_1 &aHandle);
        Handle_MDataStd_IntPackedMapRetrievalDriver_1(const MDataStd_IntPackedMapRetrievalDriver_1 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_IntPackedMapRetrievalDriver_1 DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_IntPackedMapRetrievalDriver_1 {
    MDataStd_IntPackedMapRetrievalDriver_1* _get_reference() {
    return (MDataStd_IntPackedMapRetrievalDriver_1*)$self->Access();
    }
};

%extend Handle_MDataStd_IntPackedMapRetrievalDriver_1 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_IntPackedMapRetrievalDriver_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntPackedMapStorageDriver;
class MDataStd_IntPackedMapStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntPackedMapStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntPackedMapStorageDriver;
		 MDataStd_IntPackedMapStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataStd_IntPackedMapStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_IntPackedMapStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_IntPackedMapStorageDriver::Handle_MDataStd_IntPackedMapStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_IntPackedMapStorageDriver;
class Handle_MDataStd_IntPackedMapStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_IntPackedMapStorageDriver();
        Handle_MDataStd_IntPackedMapStorageDriver(const Handle_MDataStd_IntPackedMapStorageDriver &aHandle);
        Handle_MDataStd_IntPackedMapStorageDriver(const MDataStd_IntPackedMapStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_IntPackedMapStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_IntPackedMapStorageDriver {
    MDataStd_IntPackedMapStorageDriver* _get_reference() {
    return (MDataStd_IntPackedMapStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_IntPackedMapStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_IntPackedMapStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntegerArrayRetrievalDriver;
class MDataStd_IntegerArrayRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntegerArrayRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntegerArrayRetrievalDriver;
		 MDataStd_IntegerArrayRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: IntegerArray from PDataStd.

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


%extend MDataStd_IntegerArrayRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_IntegerArrayRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_IntegerArrayRetrievalDriver::Handle_MDataStd_IntegerArrayRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_IntegerArrayRetrievalDriver;
class Handle_MDataStd_IntegerArrayRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_IntegerArrayRetrievalDriver();
        Handle_MDataStd_IntegerArrayRetrievalDriver(const Handle_MDataStd_IntegerArrayRetrievalDriver &aHandle);
        Handle_MDataStd_IntegerArrayRetrievalDriver(const MDataStd_IntegerArrayRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_IntegerArrayRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_IntegerArrayRetrievalDriver {
    MDataStd_IntegerArrayRetrievalDriver* _get_reference() {
    return (MDataStd_IntegerArrayRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_IntegerArrayRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_IntegerArrayRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntegerArrayRetrievalDriver_1;
class MDataStd_IntegerArrayRetrievalDriver_1 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntegerArrayRetrievalDriver_1;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntegerArrayRetrievalDriver_1;
		 MDataStd_IntegerArrayRetrievalDriver_1 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 1.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: IntegerArray from PDataStd.

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


%extend MDataStd_IntegerArrayRetrievalDriver_1 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_IntegerArrayRetrievalDriver_1(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_IntegerArrayRetrievalDriver_1::Handle_MDataStd_IntegerArrayRetrievalDriver_1 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_IntegerArrayRetrievalDriver_1;
class Handle_MDataStd_IntegerArrayRetrievalDriver_1 : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_IntegerArrayRetrievalDriver_1();
        Handle_MDataStd_IntegerArrayRetrievalDriver_1(const Handle_MDataStd_IntegerArrayRetrievalDriver_1 &aHandle);
        Handle_MDataStd_IntegerArrayRetrievalDriver_1(const MDataStd_IntegerArrayRetrievalDriver_1 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_IntegerArrayRetrievalDriver_1 DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_IntegerArrayRetrievalDriver_1 {
    MDataStd_IntegerArrayRetrievalDriver_1* _get_reference() {
    return (MDataStd_IntegerArrayRetrievalDriver_1*)$self->Access();
    }
};

%extend Handle_MDataStd_IntegerArrayRetrievalDriver_1 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_IntegerArrayRetrievalDriver_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntegerArrayStorageDriver;
class MDataStd_IntegerArrayStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntegerArrayStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntegerArrayStorageDriver;
		 MDataStd_IntegerArrayStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: IntegerArray from TDataStd.

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


%extend MDataStd_IntegerArrayStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_IntegerArrayStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_IntegerArrayStorageDriver::Handle_MDataStd_IntegerArrayStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_IntegerArrayStorageDriver;
class Handle_MDataStd_IntegerArrayStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_IntegerArrayStorageDriver();
        Handle_MDataStd_IntegerArrayStorageDriver(const Handle_MDataStd_IntegerArrayStorageDriver &aHandle);
        Handle_MDataStd_IntegerArrayStorageDriver(const MDataStd_IntegerArrayStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_IntegerArrayStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_IntegerArrayStorageDriver {
    MDataStd_IntegerArrayStorageDriver* _get_reference() {
    return (MDataStd_IntegerArrayStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_IntegerArrayStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_IntegerArrayStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntegerListRetrievalDriver;
class MDataStd_IntegerListRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntegerListRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntegerListRetrievalDriver;
		 MDataStd_IntegerListRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_IntegerListRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_IntegerListRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_IntegerListRetrievalDriver::Handle_MDataStd_IntegerListRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_IntegerListRetrievalDriver;
class Handle_MDataStd_IntegerListRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_IntegerListRetrievalDriver();
        Handle_MDataStd_IntegerListRetrievalDriver(const Handle_MDataStd_IntegerListRetrievalDriver &aHandle);
        Handle_MDataStd_IntegerListRetrievalDriver(const MDataStd_IntegerListRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_IntegerListRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_IntegerListRetrievalDriver {
    MDataStd_IntegerListRetrievalDriver* _get_reference() {
    return (MDataStd_IntegerListRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_IntegerListRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_IntegerListRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntegerListStorageDriver;
class MDataStd_IntegerListStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntegerListStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntegerListStorageDriver;
		 MDataStd_IntegerListStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_IntegerListStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_IntegerListStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_IntegerListStorageDriver::Handle_MDataStd_IntegerListStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_IntegerListStorageDriver;
class Handle_MDataStd_IntegerListStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_IntegerListStorageDriver();
        Handle_MDataStd_IntegerListStorageDriver(const Handle_MDataStd_IntegerListStorageDriver &aHandle);
        Handle_MDataStd_IntegerListStorageDriver(const MDataStd_IntegerListStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_IntegerListStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_IntegerListStorageDriver {
    MDataStd_IntegerListStorageDriver* _get_reference() {
    return (MDataStd_IntegerListStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_IntegerListStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_IntegerListStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntegerRetrievalDriver;
class MDataStd_IntegerRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntegerRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntegerRetrievalDriver;
		 MDataStd_IntegerRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Integer from PDataStd.

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


%extend MDataStd_IntegerRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_IntegerRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_IntegerRetrievalDriver::Handle_MDataStd_IntegerRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_IntegerRetrievalDriver;
class Handle_MDataStd_IntegerRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_IntegerRetrievalDriver();
        Handle_MDataStd_IntegerRetrievalDriver(const Handle_MDataStd_IntegerRetrievalDriver &aHandle);
        Handle_MDataStd_IntegerRetrievalDriver(const MDataStd_IntegerRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_IntegerRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_IntegerRetrievalDriver {
    MDataStd_IntegerRetrievalDriver* _get_reference() {
    return (MDataStd_IntegerRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_IntegerRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_IntegerRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_IntegerStorageDriver;
class MDataStd_IntegerStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_IntegerStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_IntegerStorageDriver;
		 MDataStd_IntegerStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataStd_IntegerStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_IntegerStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_IntegerStorageDriver::Handle_MDataStd_IntegerStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_IntegerStorageDriver;
class Handle_MDataStd_IntegerStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_IntegerStorageDriver();
        Handle_MDataStd_IntegerStorageDriver(const Handle_MDataStd_IntegerStorageDriver &aHandle);
        Handle_MDataStd_IntegerStorageDriver(const MDataStd_IntegerStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_IntegerStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_IntegerStorageDriver {
    MDataStd_IntegerStorageDriver* _get_reference() {
    return (MDataStd_IntegerStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_IntegerStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_IntegerStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_NameRetrievalDriver;
class MDataStd_NameRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_NameRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_NameRetrievalDriver;
		 MDataStd_NameRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Name from PDataStd.

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


%extend MDataStd_NameRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_NameRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_NameRetrievalDriver::Handle_MDataStd_NameRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_NameRetrievalDriver;
class Handle_MDataStd_NameRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_NameRetrievalDriver();
        Handle_MDataStd_NameRetrievalDriver(const Handle_MDataStd_NameRetrievalDriver &aHandle);
        Handle_MDataStd_NameRetrievalDriver(const MDataStd_NameRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_NameRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_NameRetrievalDriver {
    MDataStd_NameRetrievalDriver* _get_reference() {
    return (MDataStd_NameRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_NameRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_NameRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_NameStorageDriver;
class MDataStd_NameStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_NameStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_NameStorageDriver;
		 MDataStd_NameStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataStd_NameStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_NameStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_NameStorageDriver::Handle_MDataStd_NameStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_NameStorageDriver;
class Handle_MDataStd_NameStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_NameStorageDriver();
        Handle_MDataStd_NameStorageDriver(const Handle_MDataStd_NameStorageDriver &aHandle);
        Handle_MDataStd_NameStorageDriver(const MDataStd_NameStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_NameStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_NameStorageDriver {
    MDataStd_NameStorageDriver* _get_reference() {
    return (MDataStd_NameStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_NameStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_NameStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_NamedDataRetrievalDriver;
class MDataStd_NamedDataRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_NamedDataRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_NamedDataRetrievalDriver;
		 MDataStd_NamedDataRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_NamedDataRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_NamedDataRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_NamedDataRetrievalDriver::Handle_MDataStd_NamedDataRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_NamedDataRetrievalDriver;
class Handle_MDataStd_NamedDataRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_NamedDataRetrievalDriver();
        Handle_MDataStd_NamedDataRetrievalDriver(const Handle_MDataStd_NamedDataRetrievalDriver &aHandle);
        Handle_MDataStd_NamedDataRetrievalDriver(const MDataStd_NamedDataRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_NamedDataRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_NamedDataRetrievalDriver {
    MDataStd_NamedDataRetrievalDriver* _get_reference() {
    return (MDataStd_NamedDataRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_NamedDataRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_NamedDataRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_NamedDataStorageDriver;
class MDataStd_NamedDataStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_NamedDataStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_NamedDataStorageDriver;
		 MDataStd_NamedDataStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_NamedDataStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_NamedDataStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_NamedDataStorageDriver::Handle_MDataStd_NamedDataStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_NamedDataStorageDriver;
class Handle_MDataStd_NamedDataStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_NamedDataStorageDriver();
        Handle_MDataStd_NamedDataStorageDriver(const Handle_MDataStd_NamedDataStorageDriver &aHandle);
        Handle_MDataStd_NamedDataStorageDriver(const MDataStd_NamedDataStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_NamedDataStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_NamedDataStorageDriver {
    MDataStd_NamedDataStorageDriver* _get_reference() {
    return (MDataStd_NamedDataStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_NamedDataStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_NamedDataStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_NoteBookRetrievalDriver;
class MDataStd_NoteBookRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_NoteBookRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_NoteBookRetrievalDriver;
		 MDataStd_NoteBookRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: NoteBook from PDataStd.

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


%extend MDataStd_NoteBookRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_NoteBookRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_NoteBookRetrievalDriver::Handle_MDataStd_NoteBookRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_NoteBookRetrievalDriver;
class Handle_MDataStd_NoteBookRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_NoteBookRetrievalDriver();
        Handle_MDataStd_NoteBookRetrievalDriver(const Handle_MDataStd_NoteBookRetrievalDriver &aHandle);
        Handle_MDataStd_NoteBookRetrievalDriver(const MDataStd_NoteBookRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_NoteBookRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_NoteBookRetrievalDriver {
    MDataStd_NoteBookRetrievalDriver* _get_reference() {
    return (MDataStd_NoteBookRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_NoteBookRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_NoteBookRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_NoteBookStorageDriver;
class MDataStd_NoteBookStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_NoteBookStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_NoteBookStorageDriver;
		 MDataStd_NoteBookStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataStd_NoteBookStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_NoteBookStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_NoteBookStorageDriver::Handle_MDataStd_NoteBookStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_NoteBookStorageDriver;
class Handle_MDataStd_NoteBookStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_NoteBookStorageDriver();
        Handle_MDataStd_NoteBookStorageDriver(const Handle_MDataStd_NoteBookStorageDriver &aHandle);
        Handle_MDataStd_NoteBookStorageDriver(const MDataStd_NoteBookStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_NoteBookStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_NoteBookStorageDriver {
    MDataStd_NoteBookStorageDriver* _get_reference() {
    return (MDataStd_NoteBookStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_NoteBookStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_NoteBookStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RealArrayRetrievalDriver;
class MDataStd_RealArrayRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RealArrayRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RealArrayRetrievalDriver;
		 MDataStd_RealArrayRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: RealArray from PDataStd.

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


%extend MDataStd_RealArrayRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_RealArrayRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_RealArrayRetrievalDriver::Handle_MDataStd_RealArrayRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_RealArrayRetrievalDriver;
class Handle_MDataStd_RealArrayRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_RealArrayRetrievalDriver();
        Handle_MDataStd_RealArrayRetrievalDriver(const Handle_MDataStd_RealArrayRetrievalDriver &aHandle);
        Handle_MDataStd_RealArrayRetrievalDriver(const MDataStd_RealArrayRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_RealArrayRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_RealArrayRetrievalDriver {
    MDataStd_RealArrayRetrievalDriver* _get_reference() {
    return (MDataStd_RealArrayRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_RealArrayRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_RealArrayRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RealArrayRetrievalDriver_1;
class MDataStd_RealArrayRetrievalDriver_1 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RealArrayRetrievalDriver_1;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RealArrayRetrievalDriver_1;
		 MDataStd_RealArrayRetrievalDriver_1 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 1.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: RealArray from PDataStd.

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


%extend MDataStd_RealArrayRetrievalDriver_1 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_RealArrayRetrievalDriver_1(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_RealArrayRetrievalDriver_1::Handle_MDataStd_RealArrayRetrievalDriver_1 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_RealArrayRetrievalDriver_1;
class Handle_MDataStd_RealArrayRetrievalDriver_1 : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_RealArrayRetrievalDriver_1();
        Handle_MDataStd_RealArrayRetrievalDriver_1(const Handle_MDataStd_RealArrayRetrievalDriver_1 &aHandle);
        Handle_MDataStd_RealArrayRetrievalDriver_1(const MDataStd_RealArrayRetrievalDriver_1 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_RealArrayRetrievalDriver_1 DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_RealArrayRetrievalDriver_1 {
    MDataStd_RealArrayRetrievalDriver_1* _get_reference() {
    return (MDataStd_RealArrayRetrievalDriver_1*)$self->Access();
    }
};

%extend Handle_MDataStd_RealArrayRetrievalDriver_1 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_RealArrayRetrievalDriver_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RealArrayStorageDriver;
class MDataStd_RealArrayStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RealArrayStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RealArrayStorageDriver;
		 MDataStd_RealArrayStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: RealArray from TDataStd.

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


%extend MDataStd_RealArrayStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_RealArrayStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_RealArrayStorageDriver::Handle_MDataStd_RealArrayStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_RealArrayStorageDriver;
class Handle_MDataStd_RealArrayStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_RealArrayStorageDriver();
        Handle_MDataStd_RealArrayStorageDriver(const Handle_MDataStd_RealArrayStorageDriver &aHandle);
        Handle_MDataStd_RealArrayStorageDriver(const MDataStd_RealArrayStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_RealArrayStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_RealArrayStorageDriver {
    MDataStd_RealArrayStorageDriver* _get_reference() {
    return (MDataStd_RealArrayStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_RealArrayStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_RealArrayStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RealListRetrievalDriver;
class MDataStd_RealListRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RealListRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RealListRetrievalDriver;
		 MDataStd_RealListRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_RealListRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_RealListRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_RealListRetrievalDriver::Handle_MDataStd_RealListRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_RealListRetrievalDriver;
class Handle_MDataStd_RealListRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_RealListRetrievalDriver();
        Handle_MDataStd_RealListRetrievalDriver(const Handle_MDataStd_RealListRetrievalDriver &aHandle);
        Handle_MDataStd_RealListRetrievalDriver(const MDataStd_RealListRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_RealListRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_RealListRetrievalDriver {
    MDataStd_RealListRetrievalDriver* _get_reference() {
    return (MDataStd_RealListRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_RealListRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_RealListRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RealListStorageDriver;
class MDataStd_RealListStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RealListStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RealListStorageDriver;
		 MDataStd_RealListStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_RealListStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_RealListStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_RealListStorageDriver::Handle_MDataStd_RealListStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_RealListStorageDriver;
class Handle_MDataStd_RealListStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_RealListStorageDriver();
        Handle_MDataStd_RealListStorageDriver(const Handle_MDataStd_RealListStorageDriver &aHandle);
        Handle_MDataStd_RealListStorageDriver(const MDataStd_RealListStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_RealListStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_RealListStorageDriver {
    MDataStd_RealListStorageDriver* _get_reference() {
    return (MDataStd_RealListStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_RealListStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_RealListStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RealRetrievalDriver;
class MDataStd_RealRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RealRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RealRetrievalDriver;
		 MDataStd_RealRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Real from PDataStd.

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


%extend MDataStd_RealRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_RealRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_RealRetrievalDriver::Handle_MDataStd_RealRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_RealRetrievalDriver;
class Handle_MDataStd_RealRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_RealRetrievalDriver();
        Handle_MDataStd_RealRetrievalDriver(const Handle_MDataStd_RealRetrievalDriver &aHandle);
        Handle_MDataStd_RealRetrievalDriver(const MDataStd_RealRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_RealRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_RealRetrievalDriver {
    MDataStd_RealRetrievalDriver* _get_reference() {
    return (MDataStd_RealRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_RealRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_RealRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RealStorageDriver;
class MDataStd_RealStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RealStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RealStorageDriver;
		 MDataStd_RealStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Real from TDataStd.

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


%extend MDataStd_RealStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_RealStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_RealStorageDriver::Handle_MDataStd_RealStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_RealStorageDriver;
class Handle_MDataStd_RealStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_RealStorageDriver();
        Handle_MDataStd_RealStorageDriver(const Handle_MDataStd_RealStorageDriver &aHandle);
        Handle_MDataStd_RealStorageDriver(const MDataStd_RealStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_RealStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_RealStorageDriver {
    MDataStd_RealStorageDriver* _get_reference() {
    return (MDataStd_RealStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_RealStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_RealStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ReferenceArrayRetrievalDriver;
class MDataStd_ReferenceArrayRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ReferenceArrayRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ReferenceArrayRetrievalDriver;
		 MDataStd_ReferenceArrayRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_ReferenceArrayRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_ReferenceArrayRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_ReferenceArrayRetrievalDriver::Handle_MDataStd_ReferenceArrayRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_ReferenceArrayRetrievalDriver;
class Handle_MDataStd_ReferenceArrayRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_ReferenceArrayRetrievalDriver();
        Handle_MDataStd_ReferenceArrayRetrievalDriver(const Handle_MDataStd_ReferenceArrayRetrievalDriver &aHandle);
        Handle_MDataStd_ReferenceArrayRetrievalDriver(const MDataStd_ReferenceArrayRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_ReferenceArrayRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_ReferenceArrayRetrievalDriver {
    MDataStd_ReferenceArrayRetrievalDriver* _get_reference() {
    return (MDataStd_ReferenceArrayRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_ReferenceArrayRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_ReferenceArrayRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ReferenceArrayStorageDriver;
class MDataStd_ReferenceArrayStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ReferenceArrayStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ReferenceArrayStorageDriver;
		 MDataStd_ReferenceArrayStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_ReferenceArrayStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_ReferenceArrayStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_ReferenceArrayStorageDriver::Handle_MDataStd_ReferenceArrayStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_ReferenceArrayStorageDriver;
class Handle_MDataStd_ReferenceArrayStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_ReferenceArrayStorageDriver();
        Handle_MDataStd_ReferenceArrayStorageDriver(const Handle_MDataStd_ReferenceArrayStorageDriver &aHandle);
        Handle_MDataStd_ReferenceArrayStorageDriver(const MDataStd_ReferenceArrayStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_ReferenceArrayStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_ReferenceArrayStorageDriver {
    MDataStd_ReferenceArrayStorageDriver* _get_reference() {
    return (MDataStd_ReferenceArrayStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_ReferenceArrayStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_ReferenceArrayStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ReferenceListRetrievalDriver;
class MDataStd_ReferenceListRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ReferenceListRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ReferenceListRetrievalDriver;
		 MDataStd_ReferenceListRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_ReferenceListRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_ReferenceListRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_ReferenceListRetrievalDriver::Handle_MDataStd_ReferenceListRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_ReferenceListRetrievalDriver;
class Handle_MDataStd_ReferenceListRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_ReferenceListRetrievalDriver();
        Handle_MDataStd_ReferenceListRetrievalDriver(const Handle_MDataStd_ReferenceListRetrievalDriver &aHandle);
        Handle_MDataStd_ReferenceListRetrievalDriver(const MDataStd_ReferenceListRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_ReferenceListRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_ReferenceListRetrievalDriver {
    MDataStd_ReferenceListRetrievalDriver* _get_reference() {
    return (MDataStd_ReferenceListRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_ReferenceListRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_ReferenceListRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_ReferenceListStorageDriver;
class MDataStd_ReferenceListStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_ReferenceListStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_ReferenceListStorageDriver;
		 MDataStd_ReferenceListStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_ReferenceListStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_ReferenceListStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_ReferenceListStorageDriver::Handle_MDataStd_ReferenceListStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_ReferenceListStorageDriver;
class Handle_MDataStd_ReferenceListStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_ReferenceListStorageDriver();
        Handle_MDataStd_ReferenceListStorageDriver(const Handle_MDataStd_ReferenceListStorageDriver &aHandle);
        Handle_MDataStd_ReferenceListStorageDriver(const MDataStd_ReferenceListStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_ReferenceListStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_ReferenceListStorageDriver {
    MDataStd_ReferenceListStorageDriver* _get_reference() {
    return (MDataStd_ReferenceListStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_ReferenceListStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_ReferenceListStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RelationRetrievalDriver;
class MDataStd_RelationRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RelationRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RelationRetrievalDriver;
		 MDataStd_RelationRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Relation from PDataStd.

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


%extend MDataStd_RelationRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_RelationRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_RelationRetrievalDriver::Handle_MDataStd_RelationRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_RelationRetrievalDriver;
class Handle_MDataStd_RelationRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_RelationRetrievalDriver();
        Handle_MDataStd_RelationRetrievalDriver(const Handle_MDataStd_RelationRetrievalDriver &aHandle);
        Handle_MDataStd_RelationRetrievalDriver(const MDataStd_RelationRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_RelationRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_RelationRetrievalDriver {
    MDataStd_RelationRetrievalDriver* _get_reference() {
    return (MDataStd_RelationRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_RelationRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_RelationRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_RelationStorageDriver;
class MDataStd_RelationStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_RelationStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_RelationStorageDriver;
		 MDataStd_RelationStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataStd_RelationStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_RelationStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_RelationStorageDriver::Handle_MDataStd_RelationStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_RelationStorageDriver;
class Handle_MDataStd_RelationStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_RelationStorageDriver();
        Handle_MDataStd_RelationStorageDriver(const Handle_MDataStd_RelationStorageDriver &aHandle);
        Handle_MDataStd_RelationStorageDriver(const MDataStd_RelationStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_RelationStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_RelationStorageDriver {
    MDataStd_RelationStorageDriver* _get_reference() {
    return (MDataStd_RelationStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_RelationStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_RelationStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_TickRetrievalDriver;
class MDataStd_TickRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_TickRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_TickRetrievalDriver;
		 MDataStd_TickRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type Tick from PDataStd.

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


%extend MDataStd_TickRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_TickRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_TickRetrievalDriver::Handle_MDataStd_TickRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_TickRetrievalDriver;
class Handle_MDataStd_TickRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_TickRetrievalDriver();
        Handle_MDataStd_TickRetrievalDriver(const Handle_MDataStd_TickRetrievalDriver &aHandle);
        Handle_MDataStd_TickRetrievalDriver(const MDataStd_TickRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_TickRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_TickRetrievalDriver {
    MDataStd_TickRetrievalDriver* _get_reference() {
    return (MDataStd_TickRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_TickRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_TickRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_TickStorageDriver;
class MDataStd_TickStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_TickStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_TickStorageDriver;
		 MDataStd_TickStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type Tick from TDataStd.

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


%extend MDataStd_TickStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_TickStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_TickStorageDriver::Handle_MDataStd_TickStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_TickStorageDriver;
class Handle_MDataStd_TickStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_TickStorageDriver();
        Handle_MDataStd_TickStorageDriver(const Handle_MDataStd_TickStorageDriver &aHandle);
        Handle_MDataStd_TickStorageDriver(const MDataStd_TickStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_TickStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_TickStorageDriver {
    MDataStd_TickStorageDriver* _get_reference() {
    return (MDataStd_TickStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_TickStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_TickStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_TreeNodeRetrievalDriver;
class MDataStd_TreeNodeRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_TreeNodeRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_TreeNodeRetrievalDriver;
		 MDataStd_TreeNodeRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_TreeNodeRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_TreeNodeRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_TreeNodeRetrievalDriver::Handle_MDataStd_TreeNodeRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_TreeNodeRetrievalDriver;
class Handle_MDataStd_TreeNodeRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_TreeNodeRetrievalDriver();
        Handle_MDataStd_TreeNodeRetrievalDriver(const Handle_MDataStd_TreeNodeRetrievalDriver &aHandle);
        Handle_MDataStd_TreeNodeRetrievalDriver(const MDataStd_TreeNodeRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_TreeNodeRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_TreeNodeRetrievalDriver {
    MDataStd_TreeNodeRetrievalDriver* _get_reference() {
    return (MDataStd_TreeNodeRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_TreeNodeRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_TreeNodeRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_TreeNodeStorageDriver;
class MDataStd_TreeNodeStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_TreeNodeStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_TreeNodeStorageDriver;
		 MDataStd_TreeNodeStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	:rtype: Handle_Standard_Type
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


%extend MDataStd_TreeNodeStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_TreeNodeStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_TreeNodeStorageDriver::Handle_MDataStd_TreeNodeStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_TreeNodeStorageDriver;
class Handle_MDataStd_TreeNodeStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_TreeNodeStorageDriver();
        Handle_MDataStd_TreeNodeStorageDriver(const Handle_MDataStd_TreeNodeStorageDriver &aHandle);
        Handle_MDataStd_TreeNodeStorageDriver(const MDataStd_TreeNodeStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_TreeNodeStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_TreeNodeStorageDriver {
    MDataStd_TreeNodeStorageDriver* _get_reference() {
    return (MDataStd_TreeNodeStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_TreeNodeStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_TreeNodeStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_UAttributeRetrievalDriver;
class MDataStd_UAttributeRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_UAttributeRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_UAttributeRetrievalDriver;
		 MDataStd_UAttributeRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: UAttribute from PDataStd.

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


%extend MDataStd_UAttributeRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_UAttributeRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_UAttributeRetrievalDriver::Handle_MDataStd_UAttributeRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_UAttributeRetrievalDriver;
class Handle_MDataStd_UAttributeRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_UAttributeRetrievalDriver();
        Handle_MDataStd_UAttributeRetrievalDriver(const Handle_MDataStd_UAttributeRetrievalDriver &aHandle);
        Handle_MDataStd_UAttributeRetrievalDriver(const MDataStd_UAttributeRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_UAttributeRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_UAttributeRetrievalDriver {
    MDataStd_UAttributeRetrievalDriver* _get_reference() {
    return (MDataStd_UAttributeRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_UAttributeRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_UAttributeRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_UAttributeStorageDriver;
class MDataStd_UAttributeStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_UAttributeStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_UAttributeStorageDriver;
		 MDataStd_UAttributeStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: UAttribute from TDataStd.

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


%extend MDataStd_UAttributeStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_UAttributeStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_UAttributeStorageDriver::Handle_MDataStd_UAttributeStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_UAttributeStorageDriver;
class Handle_MDataStd_UAttributeStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_UAttributeStorageDriver();
        Handle_MDataStd_UAttributeStorageDriver(const Handle_MDataStd_UAttributeStorageDriver &aHandle);
        Handle_MDataStd_UAttributeStorageDriver(const MDataStd_UAttributeStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_UAttributeStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_UAttributeStorageDriver {
    MDataStd_UAttributeStorageDriver* _get_reference() {
    return (MDataStd_UAttributeStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_UAttributeStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_UAttributeStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_VariableRetrievalDriver;
class MDataStd_VariableRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataStd_VariableRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_VariableRetrievalDriver;
		 MDataStd_VariableRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Variable from PDataStd.

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


%extend MDataStd_VariableRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_VariableRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_VariableRetrievalDriver::Handle_MDataStd_VariableRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_VariableRetrievalDriver;
class Handle_MDataStd_VariableRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataStd_VariableRetrievalDriver();
        Handle_MDataStd_VariableRetrievalDriver(const Handle_MDataStd_VariableRetrievalDriver &aHandle);
        Handle_MDataStd_VariableRetrievalDriver(const MDataStd_VariableRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_VariableRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_VariableRetrievalDriver {
    MDataStd_VariableRetrievalDriver* _get_reference() {
    return (MDataStd_VariableRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_VariableRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_VariableRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataStd_VariableStorageDriver;
class MDataStd_VariableStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataStd_VariableStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataStd_VariableStorageDriver;
		 MDataStd_VariableStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Variable from TDataStd.

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


%extend MDataStd_VariableStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataStd_VariableStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataStd_VariableStorageDriver::Handle_MDataStd_VariableStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataStd_VariableStorageDriver;
class Handle_MDataStd_VariableStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataStd_VariableStorageDriver();
        Handle_MDataStd_VariableStorageDriver(const Handle_MDataStd_VariableStorageDriver &aHandle);
        Handle_MDataStd_VariableStorageDriver(const MDataStd_VariableStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataStd_VariableStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataStd_VariableStorageDriver {
    MDataStd_VariableStorageDriver* _get_reference() {
    return (MDataStd_VariableStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataStd_VariableStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataStd_VariableStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
