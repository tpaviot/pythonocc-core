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
%module (package="OCC") XmlXCAFDrivers

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


%include XmlXCAFDrivers_headers.i


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

%rename(xmlxcafdrivers) XmlXCAFDrivers;
class XmlXCAFDrivers {
	public:
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "	* Depending from the ID, returns a list of storage or retrieval attribute drivers. Used for plugin. //! Standard data model drivers =========================== 47b0b826-d931-11d1-b5da-00a0c9064368 Transient-Persistent 47b0b827-d931-11d1-b5da-00a0c9064368 Persistent-Transient //! XCAF data model drivers ================================= ed8793f8-3142-11d4-b9b5-0060b0ee281b Transient-Persistent ed8793f9-3142-11d4-b9b5-0060b0ee281b Persistent-Transient ed8793fa-3142-11d4-b9b5-0060b0ee281b XCAFSchema

	:param aGUID:
	:type aGUID: Standard_GUID &
	:rtype: Handle_Standard_Transient
") Factory;
		static Handle_Standard_Transient Factory (const Standard_GUID & aGUID);
};


%extend XmlXCAFDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlXCAFDrivers_DocumentRetrievalDriver;
class XmlXCAFDrivers_DocumentRetrievalDriver : public XmlDrivers_DocumentRetrievalDriver {
	public:
		%feature("compactdefaultargs") XmlXCAFDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "	:rtype: None
") XmlXCAFDrivers_DocumentRetrievalDriver;
		 XmlXCAFDrivers_DocumentRetrievalDriver ();
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_XmlMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_XmlMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%extend XmlXCAFDrivers_DocumentRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlXCAFDrivers_DocumentRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlXCAFDrivers_DocumentRetrievalDriver::Handle_XmlXCAFDrivers_DocumentRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlXCAFDrivers_DocumentRetrievalDriver;
class Handle_XmlXCAFDrivers_DocumentRetrievalDriver : public Handle_XmlDrivers_DocumentRetrievalDriver {

    public:
        // constructors
        Handle_XmlXCAFDrivers_DocumentRetrievalDriver();
        Handle_XmlXCAFDrivers_DocumentRetrievalDriver(const Handle_XmlXCAFDrivers_DocumentRetrievalDriver &aHandle);
        Handle_XmlXCAFDrivers_DocumentRetrievalDriver(const XmlXCAFDrivers_DocumentRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlXCAFDrivers_DocumentRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlXCAFDrivers_DocumentRetrievalDriver {
    XmlXCAFDrivers_DocumentRetrievalDriver* _get_reference() {
    return (XmlXCAFDrivers_DocumentRetrievalDriver*)$self->Access();
    }
};

%extend Handle_XmlXCAFDrivers_DocumentRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlXCAFDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlXCAFDrivers_DocumentStorageDriver;
class XmlXCAFDrivers_DocumentStorageDriver : public XmlDrivers_DocumentStorageDriver {
	public:
		%feature("compactdefaultargs") XmlXCAFDrivers_DocumentStorageDriver;
		%feature("autodoc", "	:param theCopyright:
	:type theCopyright: TCollection_ExtendedString &
	:rtype: None
") XmlXCAFDrivers_DocumentStorageDriver;
		 XmlXCAFDrivers_DocumentStorageDriver (const TCollection_ExtendedString & theCopyright);
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_XmlMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_XmlMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%extend XmlXCAFDrivers_DocumentStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlXCAFDrivers_DocumentStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlXCAFDrivers_DocumentStorageDriver::Handle_XmlXCAFDrivers_DocumentStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlXCAFDrivers_DocumentStorageDriver;
class Handle_XmlXCAFDrivers_DocumentStorageDriver : public Handle_XmlDrivers_DocumentStorageDriver {

    public:
        // constructors
        Handle_XmlXCAFDrivers_DocumentStorageDriver();
        Handle_XmlXCAFDrivers_DocumentStorageDriver(const Handle_XmlXCAFDrivers_DocumentStorageDriver &aHandle);
        Handle_XmlXCAFDrivers_DocumentStorageDriver(const XmlXCAFDrivers_DocumentStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlXCAFDrivers_DocumentStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlXCAFDrivers_DocumentStorageDriver {
    XmlXCAFDrivers_DocumentStorageDriver* _get_reference() {
    return (XmlXCAFDrivers_DocumentStorageDriver*)$self->Access();
    }
};

%extend Handle_XmlXCAFDrivers_DocumentStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlXCAFDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
