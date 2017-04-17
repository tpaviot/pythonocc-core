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
%module (package="OCC") MDocStd

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


%include MDocStd_headers.i


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

%rename(mdocstd) MDocStd;
class MDocStd {
	public:
		%feature("compactdefaultargs") AddStorageDrivers;
		%feature("autodoc", "	* Adds the attribute storage driver(s) to <aDriverSeq>.

	:param aDriverSeq:
	:type aDriverSeq: Handle_MDF_ASDriverHSequence &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddStorageDrivers;
		static void AddStorageDrivers (const Handle_MDF_ASDriverHSequence & aDriverSeq,const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") AddRetrievalDrivers;
		%feature("autodoc", "	* Adds the attribute retrieval driver(s) to <aDriverSeq>. Factory method ==============

	:param aDriverSeq:
	:type aDriverSeq: Handle_MDF_ARDriverHSequence &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddRetrievalDrivers;
		static void AddRetrievalDrivers (const Handle_MDF_ARDriverHSequence & aDriverSeq,const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "	:param aGUID:
	:type aGUID: Standard_GUID &
	:rtype: Handle_Standard_Transient
") Factory;
		static Handle_Standard_Transient Factory (const Standard_GUID & aGUID);
};


%extend MDocStd {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDocStd_DocumentRetrievalDriver;
class MDocStd_DocumentRetrievalDriver : public PCDM_RetrievalDriver {
	public:
		%feature("compactdefaultargs") MDocStd_DocumentRetrievalDriver;
		%feature("autodoc", "	:rtype: None
") MDocStd_DocumentRetrievalDriver;
		 MDocStd_DocumentRetrievalDriver ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* deferred methods of RetrievalDriver from PCDM =============================================

	:param PDOC:
	:type PDOC: Handle_PDocStd_Document &
	:param TDOC:
	:type TDOC: Handle_TDocStd_Document &
	:param aReloc:
	:type aReloc: Handle_MDF_RRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_PDocStd_Document & PDOC,const Handle_TDocStd_Document & TDOC,const Handle_MDF_RRelocationTable & aReloc);
		%feature("compactdefaultargs") Make;
		%feature("autodoc", "	* virtual methods (may be redefined by specialized application) =============================================================

	:param aPCDM:
	:type aPCDM: Handle_PCDM_Document &
	:param aCDM:
	:type aCDM: Handle_CDM_Document &
	:rtype: None
") Make;
		void Make (const Handle_PCDM_Document & aPCDM,const Handle_CDM_Document & aCDM);
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") SchemaName;
		virtual TCollection_ExtendedString SchemaName ();
		%feature("compactdefaultargs") CreateDocument;
		%feature("autodoc", "	* returns an empty TDocStd_Document. may be redefined;

	:rtype: Handle_CDM_Document
") CreateDocument;
		virtual Handle_CDM_Document CreateDocument ();
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_MDF_ARDriverTable
") AttributeDrivers;
		virtual Handle_MDF_ARDriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMessageDriver);
};


%extend MDocStd_DocumentRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDocStd_DocumentRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDocStd_DocumentRetrievalDriver::Handle_MDocStd_DocumentRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDocStd_DocumentRetrievalDriver;
class Handle_MDocStd_DocumentRetrievalDriver : public Handle_PCDM_RetrievalDriver {

    public:
        // constructors
        Handle_MDocStd_DocumentRetrievalDriver();
        Handle_MDocStd_DocumentRetrievalDriver(const Handle_MDocStd_DocumentRetrievalDriver &aHandle);
        Handle_MDocStd_DocumentRetrievalDriver(const MDocStd_DocumentRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDocStd_DocumentRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDocStd_DocumentRetrievalDriver {
    MDocStd_DocumentRetrievalDriver* _get_reference() {
    return (MDocStd_DocumentRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDocStd_DocumentRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDocStd_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDocStd_DocumentStorageDriver;
class MDocStd_DocumentStorageDriver : public PCDM_StorageDriver {
	public:
		%feature("compactdefaultargs") MDocStd_DocumentStorageDriver;
		%feature("autodoc", "	:rtype: None
") MDocStd_DocumentStorageDriver;
		 MDocStd_DocumentStorageDriver ();
		%feature("compactdefaultargs") CreateDocument;
		%feature("autodoc", "	* returns an empty PDocStd_Document. may be redefined;

	:rtype: Handle_PCDM_Document
") CreateDocument;
		virtual Handle_PCDM_Document CreateDocument ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* virtual methods of StorageDriver from PCDM ============================================

	:param TDOC:
	:type TDOC: Handle_TDocStd_Document &
	:param PDOC:
	:type PDOC: Handle_PDocStd_Document &
	:param aReloc:
	:type aReloc: Handle_MDF_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDocStd_Document & TDOC,const Handle_PDocStd_Document & PDOC,const Handle_MDF_SRelocationTable & aReloc);
		%feature("compactdefaultargs") Make;
		%feature("autodoc", "	* virtual methods (may be redefined by specialized application) =============================================================

	:param aDocument:
	:type aDocument: Handle_CDM_Document &
	:rtype: Handle_PCDM_Document
") Make;
		virtual Handle_PCDM_Document Make (const Handle_CDM_Document & aDocument);
		%feature("compactdefaultargs") SchemaName;
		%feature("autodoc", "	:rtype: TCollection_ExtendedString
") SchemaName;
		virtual TCollection_ExtendedString SchemaName ();
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_MDF_ASDriverTable
") AttributeDrivers;
		virtual Handle_MDF_ASDriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMessageDriver);
};


%extend MDocStd_DocumentStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDocStd_DocumentStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDocStd_DocumentStorageDriver::Handle_MDocStd_DocumentStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDocStd_DocumentStorageDriver;
class Handle_MDocStd_DocumentStorageDriver : public Handle_PCDM_StorageDriver {

    public:
        // constructors
        Handle_MDocStd_DocumentStorageDriver();
        Handle_MDocStd_DocumentStorageDriver(const Handle_MDocStd_DocumentStorageDriver &aHandle);
        Handle_MDocStd_DocumentStorageDriver(const MDocStd_DocumentStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDocStd_DocumentStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDocStd_DocumentStorageDriver {
    MDocStd_DocumentStorageDriver* _get_reference() {
    return (MDocStd_DocumentStorageDriver*)$self->Access();
    }
};

%extend Handle_MDocStd_DocumentStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDocStd_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDocStd_XLinkRetrievalDriver;
class MDocStd_XLinkRetrievalDriver : public MDF_ARDriver {
	public:
		%feature("compactdefaultargs") MDocStd_XLinkRetrievalDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDocStd_XLinkRetrievalDriver;
		 MDocStd_XLinkRetrievalDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type XLink from PXref.

	:rtype: Handle_Standard_Type
") SourceType;
		Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param aSource:
	:type aSource: Handle_PDF_Attribute &
	:param aTarget:
	:type aTarget: Handle_TDF_Attribute &
	:param aRelocTable:
	:type aRelocTable: Handle_MDF_RRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_PDF_Attribute & aSource,const Handle_TDF_Attribute & aTarget,const Handle_MDF_RRelocationTable & aRelocTable);
};


%extend MDocStd_XLinkRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDocStd_XLinkRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDocStd_XLinkRetrievalDriver::Handle_MDocStd_XLinkRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDocStd_XLinkRetrievalDriver;
class Handle_MDocStd_XLinkRetrievalDriver : public Handle_MDF_ARDriver {

    public:
        // constructors
        Handle_MDocStd_XLinkRetrievalDriver();
        Handle_MDocStd_XLinkRetrievalDriver(const Handle_MDocStd_XLinkRetrievalDriver &aHandle);
        Handle_MDocStd_XLinkRetrievalDriver(const MDocStd_XLinkRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDocStd_XLinkRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDocStd_XLinkRetrievalDriver {
    MDocStd_XLinkRetrievalDriver* _get_reference() {
    return (MDocStd_XLinkRetrievalDriver*)$self->Access();
    }
};

%extend Handle_MDocStd_XLinkRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDocStd_XLinkRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor MDocStd_XLinkStorageDriver;
class MDocStd_XLinkStorageDriver : public MDF_ASDriver {
	public:
		%feature("compactdefaultargs") MDocStd_XLinkStorageDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") MDocStd_XLinkStorageDriver;
		 MDocStd_XLinkStorageDriver (const Handle_CDM_MessageDriver & theMessageDriver);
		%feature("compactdefaultargs") VersionNumber;
		%feature("autodoc", "	* Returns the version number from which the driver is available: 0.

	:rtype: int
") VersionNumber;
		Standard_Integer VersionNumber ();
		%feature("compactdefaultargs") SourceType;
		%feature("autodoc", "	* Returns the type: XLink from TXLink.

	:rtype: Handle_Standard_Type
") SourceType;
		Handle_Standard_Type SourceType ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_PDF_Attribute
") NewEmpty;
		Handle_PDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param aSource:
	:type aSource: Handle_TDF_Attribute &
	:param aTarget:
	:type aTarget: Handle_PDF_Attribute &
	:param aRelocTable:
	:type aRelocTable: Handle_MDF_SRelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & aSource,const Handle_PDF_Attribute & aTarget,const Handle_MDF_SRelocationTable & aRelocTable);
};


%extend MDocStd_XLinkStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MDocStd_XLinkStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MDocStd_XLinkStorageDriver::Handle_MDocStd_XLinkStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MDocStd_XLinkStorageDriver;
class Handle_MDocStd_XLinkStorageDriver : public Handle_MDF_ASDriver {

    public:
        // constructors
        Handle_MDocStd_XLinkStorageDriver();
        Handle_MDocStd_XLinkStorageDriver(const Handle_MDocStd_XLinkStorageDriver &aHandle);
        Handle_MDocStd_XLinkStorageDriver(const MDocStd_XLinkStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MDocStd_XLinkStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MDocStd_XLinkStorageDriver {
    MDocStd_XLinkStorageDriver* _get_reference() {
    return (MDocStd_XLinkStorageDriver*)$self->Access();
    }
};

%extend Handle_MDocStd_XLinkStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MDocStd_XLinkStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
