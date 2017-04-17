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
%module (package="OCC") XmlDrivers

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


%include XmlDrivers_headers.i


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

%rename(xmldrivers) XmlDrivers;
class XmlDrivers {
	public:
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "	:param theGUID:
	:type theGUID: Standard_GUID &
	:rtype: Handle_Standard_Transient
") Factory;
		static Handle_Standard_Transient Factory (const Standard_GUID & theGUID);
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_XmlMDF_ADriverTable
") AttributeDrivers;
		static Handle_XmlMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%extend XmlDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlDrivers_DocumentRetrievalDriver;
class XmlDrivers_DocumentRetrievalDriver : public XmlLDrivers_DocumentRetrievalDriver {
	public:
		%feature("compactdefaultargs") XmlDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "	:rtype: None
") XmlDrivers_DocumentRetrievalDriver;
		 XmlDrivers_DocumentRetrievalDriver ();
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_XmlMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_XmlMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") ReadShapeSection;
		%feature("autodoc", "	:param thePDoc:
	:type thePDoc: XmlObjMgt_Element &
	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_XmlMDF_ADriver
") ReadShapeSection;
		virtual Handle_XmlMDF_ADriver ReadShapeSection (const XmlObjMgt_Element & thePDoc,const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") ShapeSetCleaning;
		%feature("autodoc", "	:param theDriver:
	:type theDriver: Handle_XmlMDF_ADriver &
	:rtype: void
") ShapeSetCleaning;
		virtual void ShapeSetCleaning (const Handle_XmlMDF_ADriver & theDriver);
		%feature("compactdefaultargs") PropagateDocumentVersion;
		%feature("autodoc", "	:param theDocVersion:
	:type theDocVersion: int
	:rtype: void
") PropagateDocumentVersion;
		virtual void PropagateDocumentVersion (const Standard_Integer theDocVersion);
};


%extend XmlDrivers_DocumentRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlDrivers_DocumentRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlDrivers_DocumentRetrievalDriver::Handle_XmlDrivers_DocumentRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlDrivers_DocumentRetrievalDriver;
class Handle_XmlDrivers_DocumentRetrievalDriver : public Handle_XmlLDrivers_DocumentRetrievalDriver {

    public:
        // constructors
        Handle_XmlDrivers_DocumentRetrievalDriver();
        Handle_XmlDrivers_DocumentRetrievalDriver(const Handle_XmlDrivers_DocumentRetrievalDriver &aHandle);
        Handle_XmlDrivers_DocumentRetrievalDriver(const XmlDrivers_DocumentRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlDrivers_DocumentRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlDrivers_DocumentRetrievalDriver {
    XmlDrivers_DocumentRetrievalDriver* _get_reference() {
    return (XmlDrivers_DocumentRetrievalDriver*)$self->Access();
    }
};

%extend Handle_XmlDrivers_DocumentRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlDrivers_DocumentStorageDriver;
class XmlDrivers_DocumentStorageDriver : public XmlLDrivers_DocumentStorageDriver {
	public:
		%feature("compactdefaultargs") XmlDrivers_DocumentStorageDriver;
		%feature("autodoc", "	:param theCopyright:
	:type theCopyright: TCollection_ExtendedString &
	:rtype: None
") XmlDrivers_DocumentStorageDriver;
		 XmlDrivers_DocumentStorageDriver (const TCollection_ExtendedString & theCopyright);
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_XmlMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_XmlMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") WriteShapeSection;
		%feature("autodoc", "	:param thePDoc:
	:type thePDoc: XmlObjMgt_Element &
	:rtype: bool
") WriteShapeSection;
		virtual Standard_Boolean WriteShapeSection (XmlObjMgt_Element & thePDoc);
};


%extend XmlDrivers_DocumentStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlDrivers_DocumentStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlDrivers_DocumentStorageDriver::Handle_XmlDrivers_DocumentStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlDrivers_DocumentStorageDriver;
class Handle_XmlDrivers_DocumentStorageDriver : public Handle_XmlLDrivers_DocumentStorageDriver {

    public:
        // constructors
        Handle_XmlDrivers_DocumentStorageDriver();
        Handle_XmlDrivers_DocumentStorageDriver(const Handle_XmlDrivers_DocumentStorageDriver &aHandle);
        Handle_XmlDrivers_DocumentStorageDriver(const XmlDrivers_DocumentStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlDrivers_DocumentStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlDrivers_DocumentStorageDriver {
    XmlDrivers_DocumentStorageDriver* _get_reference() {
    return (XmlDrivers_DocumentStorageDriver*)$self->Access();
    }
};

%extend Handle_XmlDrivers_DocumentStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
