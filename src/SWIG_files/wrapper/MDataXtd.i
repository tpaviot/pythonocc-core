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
%module (package="OCC") MDataXtd

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


%include MDataXtd_headers.i


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

%rename(mdataxtd) MDataXtd;
class MDataXtd {
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
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Method to launch in MgtGeom Delete MDataStd_1.cxx Modify MDataStd_GeometryStorageDriver::Paste

	:param Geometry:
	:type Geometry: Handle_Geom_Geometry &
	:rtype: Handle_PGeom_Geometry
") Translate;
		static Handle_PGeom_Geometry Translate (const Handle_Geom_Geometry & Geometry);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Method to lasunch in MgtGeom Delete MDataStd_1.cxx Modify MDataStd_GeometryRetrievalDriver::Paste Translation of TDataXtd enumerations to integer ===============================================

	:param Geometry:
	:type Geometry: Handle_PGeom_Geometry &
	:rtype: Handle_Geom_Geometry
") Translate;
		static Handle_Geom_Geometry Translate (const Handle_PGeom_Geometry & Geometry);
		%feature("compactdefaultargs") ConstraintTypeToInteger;
		%feature("autodoc", "	:param e:
	:type e: TDataXtd_ConstraintEnum
	:rtype: int
") ConstraintTypeToInteger;
		static Standard_Integer ConstraintTypeToInteger (const TDataXtd_ConstraintEnum e);
		%feature("compactdefaultargs") IntegerToConstraintType;
		%feature("autodoc", "	:param i:
	:type i: int
	:rtype: TDataXtd_ConstraintEnum
") IntegerToConstraintType;
		static TDataXtd_ConstraintEnum IntegerToConstraintType (const Standard_Integer i);
		%feature("compactdefaultargs") GeometryTypeToInteger;
		%feature("autodoc", "	:param e:
	:type e: TDataXtd_GeometryEnum
	:rtype: int
") GeometryTypeToInteger;
		static Standard_Integer GeometryTypeToInteger (const TDataXtd_GeometryEnum e);
		%feature("compactdefaultargs") IntegerToGeometryType;
		%feature("autodoc", "	:param i:
	:type i: int
	:rtype: TDataXtd_GeometryEnum
") IntegerToGeometryType;
		static TDataXtd_GeometryEnum IntegerToGeometryType (const Standard_Integer i);
};


%extend MDataXtd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_AxisRetrievalDriver;
class MDataXtd_AxisRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_AxisRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_AxisRetrievalDriver;
		 MDataXtd_AxisRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Axis from PDataXtd.

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


%extend MDataXtd_AxisRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_AxisRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_AxisRetrievalDriver::Handle_MDataXtd_AxisRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_AxisRetrievalDriver;
class Handle_MDataXtd_AxisRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataXtd_AxisRetrievalDriver();
        Handle_MDataXtd_AxisRetrievalDriver(const Handle_MDataXtd_AxisRetrievalDriver &aHandle);
        Handle_MDataXtd_AxisRetrievalDriver(const MDataXtd_AxisRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_AxisRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_AxisRetrievalDriver {
    MDataXtd_AxisRetrievalDriver* _get_reference() {
    return (MDataXtd_AxisRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_AxisRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_AxisRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_AxisStorageDriver;
class MDataXtd_AxisStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_AxisStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_AxisStorageDriver;
		 MDataXtd_AxisStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataXtd_AxisStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_AxisStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_AxisStorageDriver::Handle_MDataXtd_AxisStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_AxisStorageDriver;
class Handle_MDataXtd_AxisStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataXtd_AxisStorageDriver();
        Handle_MDataXtd_AxisStorageDriver(const Handle_MDataXtd_AxisStorageDriver &aHandle);
        Handle_MDataXtd_AxisStorageDriver(const MDataXtd_AxisStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_AxisStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_AxisStorageDriver {
    MDataXtd_AxisStorageDriver* _get_reference() {
    return (MDataXtd_AxisStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_AxisStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_AxisStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_ConstraintRetrievalDriver;
class MDataXtd_ConstraintRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_ConstraintRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_ConstraintRetrievalDriver;
		 MDataXtd_ConstraintRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Constraint from PDataXtd.

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


%extend MDataXtd_ConstraintRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_ConstraintRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_ConstraintRetrievalDriver::Handle_MDataXtd_ConstraintRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_ConstraintRetrievalDriver;
class Handle_MDataXtd_ConstraintRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataXtd_ConstraintRetrievalDriver();
        Handle_MDataXtd_ConstraintRetrievalDriver(const Handle_MDataXtd_ConstraintRetrievalDriver &aHandle);
        Handle_MDataXtd_ConstraintRetrievalDriver(const MDataXtd_ConstraintRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_ConstraintRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_ConstraintRetrievalDriver {
    MDataXtd_ConstraintRetrievalDriver* _get_reference() {
    return (MDataXtd_ConstraintRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_ConstraintRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_ConstraintRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_ConstraintStorageDriver;
class MDataXtd_ConstraintStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_ConstraintStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_ConstraintStorageDriver;
		 MDataXtd_ConstraintStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataXtd_ConstraintStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_ConstraintStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_ConstraintStorageDriver::Handle_MDataXtd_ConstraintStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_ConstraintStorageDriver;
class Handle_MDataXtd_ConstraintStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataXtd_ConstraintStorageDriver();
        Handle_MDataXtd_ConstraintStorageDriver(const Handle_MDataXtd_ConstraintStorageDriver &aHandle);
        Handle_MDataXtd_ConstraintStorageDriver(const MDataXtd_ConstraintStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_ConstraintStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_ConstraintStorageDriver {
    MDataXtd_ConstraintStorageDriver* _get_reference() {
    return (MDataXtd_ConstraintStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_ConstraintStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_ConstraintStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_GeometryRetrievalDriver;
class MDataXtd_GeometryRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_GeometryRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_GeometryRetrievalDriver;
		 MDataXtd_GeometryRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Geometry from PDataXtd.

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


%extend MDataXtd_GeometryRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_GeometryRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_GeometryRetrievalDriver::Handle_MDataXtd_GeometryRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_GeometryRetrievalDriver;
class Handle_MDataXtd_GeometryRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataXtd_GeometryRetrievalDriver();
        Handle_MDataXtd_GeometryRetrievalDriver(const Handle_MDataXtd_GeometryRetrievalDriver &aHandle);
        Handle_MDataXtd_GeometryRetrievalDriver(const MDataXtd_GeometryRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_GeometryRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_GeometryRetrievalDriver {
    MDataXtd_GeometryRetrievalDriver* _get_reference() {
    return (MDataXtd_GeometryRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_GeometryRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_GeometryRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_GeometryStorageDriver;
class MDataXtd_GeometryStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_GeometryStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_GeometryStorageDriver;
		 MDataXtd_GeometryStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataXtd_GeometryStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_GeometryStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_GeometryStorageDriver::Handle_MDataXtd_GeometryStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_GeometryStorageDriver;
class Handle_MDataXtd_GeometryStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataXtd_GeometryStorageDriver();
        Handle_MDataXtd_GeometryStorageDriver(const Handle_MDataXtd_GeometryStorageDriver &aHandle);
        Handle_MDataXtd_GeometryStorageDriver(const MDataXtd_GeometryStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_GeometryStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_GeometryStorageDriver {
    MDataXtd_GeometryStorageDriver* _get_reference() {
    return (MDataXtd_GeometryStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_GeometryStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_GeometryStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PatternStdRetrievalDriver;
class MDataXtd_PatternStdRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PatternStdRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PatternStdRetrievalDriver;
		 MDataXtd_PatternStdRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: PatternStd from PDataXtd.

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


%extend MDataXtd_PatternStdRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_PatternStdRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_PatternStdRetrievalDriver::Handle_MDataXtd_PatternStdRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_PatternStdRetrievalDriver;
class Handle_MDataXtd_PatternStdRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataXtd_PatternStdRetrievalDriver();
        Handle_MDataXtd_PatternStdRetrievalDriver(const Handle_MDataXtd_PatternStdRetrievalDriver &aHandle);
        Handle_MDataXtd_PatternStdRetrievalDriver(const MDataXtd_PatternStdRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_PatternStdRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_PatternStdRetrievalDriver {
    MDataXtd_PatternStdRetrievalDriver* _get_reference() {
    return (MDataXtd_PatternStdRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_PatternStdRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_PatternStdRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PatternStdStorageDriver;
class MDataXtd_PatternStdStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PatternStdStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PatternStdStorageDriver;
		 MDataXtd_PatternStdStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataXtd_PatternStdStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_PatternStdStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_PatternStdStorageDriver::Handle_MDataXtd_PatternStdStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_PatternStdStorageDriver;
class Handle_MDataXtd_PatternStdStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataXtd_PatternStdStorageDriver();
        Handle_MDataXtd_PatternStdStorageDriver(const Handle_MDataXtd_PatternStdStorageDriver &aHandle);
        Handle_MDataXtd_PatternStdStorageDriver(const MDataXtd_PatternStdStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_PatternStdStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_PatternStdStorageDriver {
    MDataXtd_PatternStdStorageDriver* _get_reference() {
    return (MDataXtd_PatternStdStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_PatternStdStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_PatternStdStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PlacementRetrievalDriver;
class MDataXtd_PlacementRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PlacementRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PlacementRetrievalDriver;
		 MDataXtd_PlacementRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Placement from PDataXtd.

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


%extend MDataXtd_PlacementRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_PlacementRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_PlacementRetrievalDriver::Handle_MDataXtd_PlacementRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_PlacementRetrievalDriver;
class Handle_MDataXtd_PlacementRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataXtd_PlacementRetrievalDriver();
        Handle_MDataXtd_PlacementRetrievalDriver(const Handle_MDataXtd_PlacementRetrievalDriver &aHandle);
        Handle_MDataXtd_PlacementRetrievalDriver(const MDataXtd_PlacementRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_PlacementRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_PlacementRetrievalDriver {
    MDataXtd_PlacementRetrievalDriver* _get_reference() {
    return (MDataXtd_PlacementRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_PlacementRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_PlacementRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PlacementStorageDriver;
class MDataXtd_PlacementStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PlacementStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PlacementStorageDriver;
		 MDataXtd_PlacementStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataXtd_PlacementStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_PlacementStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_PlacementStorageDriver::Handle_MDataXtd_PlacementStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_PlacementStorageDriver;
class Handle_MDataXtd_PlacementStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataXtd_PlacementStorageDriver();
        Handle_MDataXtd_PlacementStorageDriver(const Handle_MDataXtd_PlacementStorageDriver &aHandle);
        Handle_MDataXtd_PlacementStorageDriver(const MDataXtd_PlacementStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_PlacementStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_PlacementStorageDriver {
    MDataXtd_PlacementStorageDriver* _get_reference() {
    return (MDataXtd_PlacementStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_PlacementStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_PlacementStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PlaneRetrievalDriver;
class MDataXtd_PlaneRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PlaneRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PlaneRetrievalDriver;
		 MDataXtd_PlaneRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Plane from PDataXtd.

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


%extend MDataXtd_PlaneRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_PlaneRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_PlaneRetrievalDriver::Handle_MDataXtd_PlaneRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_PlaneRetrievalDriver;
class Handle_MDataXtd_PlaneRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataXtd_PlaneRetrievalDriver();
        Handle_MDataXtd_PlaneRetrievalDriver(const Handle_MDataXtd_PlaneRetrievalDriver &aHandle);
        Handle_MDataXtd_PlaneRetrievalDriver(const MDataXtd_PlaneRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_PlaneRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_PlaneRetrievalDriver {
    MDataXtd_PlaneRetrievalDriver* _get_reference() {
    return (MDataXtd_PlaneRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_PlaneRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_PlaneRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PlaneStorageDriver;
class MDataXtd_PlaneStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PlaneStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PlaneStorageDriver;
		 MDataXtd_PlaneStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataXtd_PlaneStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_PlaneStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_PlaneStorageDriver::Handle_MDataXtd_PlaneStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_PlaneStorageDriver;
class Handle_MDataXtd_PlaneStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataXtd_PlaneStorageDriver();
        Handle_MDataXtd_PlaneStorageDriver(const Handle_MDataXtd_PlaneStorageDriver &aHandle);
        Handle_MDataXtd_PlaneStorageDriver(const MDataXtd_PlaneStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_PlaneStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_PlaneStorageDriver {
    MDataXtd_PlaneStorageDriver* _get_reference() {
    return (MDataXtd_PlaneStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_PlaneStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_PlaneStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PointRetrievalDriver;
class MDataXtd_PointRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PointRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PointRetrievalDriver;
		 MDataXtd_PointRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Point from PDataXtd.

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


%extend MDataXtd_PointRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_PointRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_PointRetrievalDriver::Handle_MDataXtd_PointRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_PointRetrievalDriver;
class Handle_MDataXtd_PointRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataXtd_PointRetrievalDriver();
        Handle_MDataXtd_PointRetrievalDriver(const Handle_MDataXtd_PointRetrievalDriver &aHandle);
        Handle_MDataXtd_PointRetrievalDriver(const MDataXtd_PointRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_PointRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_PointRetrievalDriver {
    MDataXtd_PointRetrievalDriver* _get_reference() {
    return (MDataXtd_PointRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_PointRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_PointRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_PointStorageDriver;
class MDataXtd_PointStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_PointStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_PointStorageDriver;
		 MDataXtd_PointStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataXtd_PointStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_PointStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_PointStorageDriver::Handle_MDataXtd_PointStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_PointStorageDriver;
class Handle_MDataXtd_PointStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataXtd_PointStorageDriver();
        Handle_MDataXtd_PointStorageDriver(const Handle_MDataXtd_PointStorageDriver &aHandle);
        Handle_MDataXtd_PointStorageDriver(const MDataXtd_PointStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_PointStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_PointStorageDriver {
    MDataXtd_PointStorageDriver* _get_reference() {
    return (MDataXtd_PointStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_PointStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_PointStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_ShapeRetrievalDriver;
class MDataXtd_ShapeRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_ShapeRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_ShapeRetrievalDriver;
		 MDataXtd_ShapeRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: Shape from PDataXtd.

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


%extend MDataXtd_ShapeRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_ShapeRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_ShapeRetrievalDriver::Handle_MDataXtd_ShapeRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_ShapeRetrievalDriver;
class Handle_MDataXtd_ShapeRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDataXtd_ShapeRetrievalDriver();
        Handle_MDataXtd_ShapeRetrievalDriver(const Handle_MDataXtd_ShapeRetrievalDriver &aHandle);
        Handle_MDataXtd_ShapeRetrievalDriver(const MDataXtd_ShapeRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_ShapeRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_ShapeRetrievalDriver {
    MDataXtd_ShapeRetrievalDriver* _get_reference() {
    return (MDataXtd_ShapeRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_ShapeRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_ShapeRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDataXtd_ShapeStorageDriver;
class MDataXtd_ShapeStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDataXtd_ShapeStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDataXtd_ShapeStorageDriver;
		 MDataXtd_ShapeStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend MDataXtd_ShapeStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDataXtd_ShapeStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDataXtd_ShapeStorageDriver::Handle_MDataXtd_ShapeStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDataXtd_ShapeStorageDriver;
class Handle_MDataXtd_ShapeStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDataXtd_ShapeStorageDriver();
        Handle_MDataXtd_ShapeStorageDriver(const Handle_MDataXtd_ShapeStorageDriver &aHandle);
        Handle_MDataXtd_ShapeStorageDriver(const MDataXtd_ShapeStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDataXtd_ShapeStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDataXtd_ShapeStorageDriver {
    MDataXtd_ShapeStorageDriver* _get_reference() {
    return (MDataXtd_ShapeStorageDriver*)$self->Access();
    }
};

%extend Handle_MDataXtd_ShapeStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDataXtd_ShapeStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
