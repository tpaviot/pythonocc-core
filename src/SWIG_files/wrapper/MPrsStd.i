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
%module (package="OCC") MPrsStd

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


%include MPrsStd_headers.i


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

%rename(mprsstd) MPrsStd;
class MPrsStd {
	public:
		%feature("compactdefaultargs") AddStorageDrivers;
		%feature("autodoc", "	* Adds the attribute storage drivers to <aDriverTable>.

	:param aDriverTable:
	:type aDriverTable: Handle_MDF_ASDriverHSequence &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddStorageDrivers;
		static void AddStorageDrivers (const Handle_MDF_ASDriverHSequence & aDriverTable,const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") AddRetrievalDrivers;
		%feature("autodoc", "	* Adds the attribute retrieval drivers to <aDriverTable>.

	:param aDriverTable:
	:type aDriverTable: Handle_MDF_ARDriverHSequence &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddRetrievalDrivers;
		static void AddRetrievalDrivers (const Handle_MDF_ARDriverHSequence & aDriverTable,const Handle_CDM_MessageDriver & theMessageDriver);
};


%extend MPrsStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MPrsStd_AISPresentationRetrievalDriver;
class MPrsStd_AISPresentationRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MPrsStd_AISPresentationRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MPrsStd_AISPresentationRetrievalDriver;
		 MPrsStd_AISPresentationRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: AISPresentation from PPrsStd.

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


%extend MPrsStd_AISPresentationRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MPrsStd_AISPresentationRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MPrsStd_AISPresentationRetrievalDriver::Handle_MPrsStd_AISPresentationRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MPrsStd_AISPresentationRetrievalDriver;
class Handle_MPrsStd_AISPresentationRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MPrsStd_AISPresentationRetrievalDriver();
        Handle_MPrsStd_AISPresentationRetrievalDriver(const Handle_MPrsStd_AISPresentationRetrievalDriver &aHandle);
        Handle_MPrsStd_AISPresentationRetrievalDriver(const MPrsStd_AISPresentationRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MPrsStd_AISPresentationRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MPrsStd_AISPresentationRetrievalDriver {
    MPrsStd_AISPresentationRetrievalDriver* _get_reference() {
    return (MPrsStd_AISPresentationRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MPrsStd_AISPresentationRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MPrsStd_AISPresentationRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MPrsStd_AISPresentationRetrievalDriver_1;
class MPrsStd_AISPresentationRetrievalDriver_1 : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MPrsStd_AISPresentationRetrievalDriver_1;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MPrsStd_AISPresentationRetrievalDriver_1;
		 MPrsStd_AISPresentationRetrievalDriver_1 (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 1.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: AISPresentation from PPrsStd.

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


%extend MPrsStd_AISPresentationRetrievalDriver_1 {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MPrsStd_AISPresentationRetrievalDriver_1(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MPrsStd_AISPresentationRetrievalDriver_1::Handle_MPrsStd_AISPresentationRetrievalDriver_1 %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MPrsStd_AISPresentationRetrievalDriver_1;
class Handle_MPrsStd_AISPresentationRetrievalDriver_1 : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MPrsStd_AISPresentationRetrievalDriver_1();
        Handle_MPrsStd_AISPresentationRetrievalDriver_1(const Handle_MPrsStd_AISPresentationRetrievalDriver_1 &aHandle);
        Handle_MPrsStd_AISPresentationRetrievalDriver_1(const MPrsStd_AISPresentationRetrievalDriver_1 *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MPrsStd_AISPresentationRetrievalDriver_1 DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MPrsStd_AISPresentationRetrievalDriver_1 {
    MPrsStd_AISPresentationRetrievalDriver_1* _get_reference() {
    return (MPrsStd_AISPresentationRetrievalDriver_1*)$self->Access();
    }
};

%extend Handle_MPrsStd_AISPresentationRetrievalDriver_1 {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MPrsStd_AISPresentationRetrievalDriver_1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MPrsStd_AISPresentationStorageDriver;
class MPrsStd_AISPresentationStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MPrsStd_AISPresentationStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MPrsStd_AISPresentationStorageDriver;
		 MPrsStd_AISPresentationStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: AISPresentation from TPrsStd.

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


%extend MPrsStd_AISPresentationStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MPrsStd_AISPresentationStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MPrsStd_AISPresentationStorageDriver::Handle_MPrsStd_AISPresentationStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MPrsStd_AISPresentationStorageDriver;
class Handle_MPrsStd_AISPresentationStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MPrsStd_AISPresentationStorageDriver();
        Handle_MPrsStd_AISPresentationStorageDriver(const Handle_MPrsStd_AISPresentationStorageDriver &aHandle);
        Handle_MPrsStd_AISPresentationStorageDriver(const MPrsStd_AISPresentationStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MPrsStd_AISPresentationStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MPrsStd_AISPresentationStorageDriver {
    MPrsStd_AISPresentationStorageDriver* _get_reference() {
    return (MPrsStd_AISPresentationStorageDriver*)$self->Access();
    }
};

%extend Handle_MPrsStd_AISPresentationStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MPrsStd_AISPresentationStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MPrsStd_PositionRetrievalDriver;
class MPrsStd_PositionRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MPrsStd_PositionRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MPrsStd_PositionRetrievalDriver;
		 MPrsStd_PositionRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: ColorAttribute from PGraphicAttribute.

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


%extend MPrsStd_PositionRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MPrsStd_PositionRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MPrsStd_PositionRetrievalDriver::Handle_MPrsStd_PositionRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MPrsStd_PositionRetrievalDriver;
class Handle_MPrsStd_PositionRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MPrsStd_PositionRetrievalDriver();
        Handle_MPrsStd_PositionRetrievalDriver(const Handle_MPrsStd_PositionRetrievalDriver &aHandle);
        Handle_MPrsStd_PositionRetrievalDriver(const MPrsStd_PositionRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MPrsStd_PositionRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MPrsStd_PositionRetrievalDriver {
    MPrsStd_PositionRetrievalDriver* _get_reference() {
    return (MPrsStd_PositionRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MPrsStd_PositionRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MPrsStd_PositionRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MPrsStd_PositionStorageDriver;
class MPrsStd_PositionStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MPrsStd_PositionStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MPrsStd_PositionStorageDriver;
		 MPrsStd_PositionStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: ColorAttribute from TGraphicAttribute.

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


%extend MPrsStd_PositionStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MPrsStd_PositionStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MPrsStd_PositionStorageDriver::Handle_MPrsStd_PositionStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MPrsStd_PositionStorageDriver;
class Handle_MPrsStd_PositionStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MPrsStd_PositionStorageDriver();
        Handle_MPrsStd_PositionStorageDriver(const Handle_MPrsStd_PositionStorageDriver &aHandle);
        Handle_MPrsStd_PositionStorageDriver(const MPrsStd_PositionStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MPrsStd_PositionStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MPrsStd_PositionStorageDriver {
    MPrsStd_PositionStorageDriver* _get_reference() {
    return (MPrsStd_PositionStorageDriver*)$self->Access();
    }
};

%extend Handle_MPrsStd_PositionStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MPrsStd_PositionStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
