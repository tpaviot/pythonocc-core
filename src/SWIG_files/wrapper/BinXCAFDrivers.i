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
%module (package="OCC") BinXCAFDrivers

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


%include BinXCAFDrivers_headers.i


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

%rename(binxcafdrivers) BinXCAFDrivers;
class BinXCAFDrivers {
	public:
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "	:param theGUID:
	:type theGUID: Standard_GUID &
	:rtype: Handle_Standard_Transient
") Factory;
		static Handle_Standard_Transient Factory (const Standard_GUID & theGUID);
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	* Creates the table of drivers of types supported

	:param MsgDrv:
	:type MsgDrv: Handle_CDM_MessageDriver &
	:rtype: Handle_BinMDF_ADriverTable
") AttributeDrivers;
		static Handle_BinMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & MsgDrv);
};


%extend BinXCAFDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinXCAFDrivers_DocumentRetrievalDriver;
class BinXCAFDrivers_DocumentRetrievalDriver : public BinDrivers_DocumentRetrievalDriver {
	public:
		%feature("compactdefaultargs") BinXCAFDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "	* Constructor

	:rtype: None
") BinXCAFDrivers_DocumentRetrievalDriver;
		 BinXCAFDrivers_DocumentRetrievalDriver ();
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_BinMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_BinMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%extend BinXCAFDrivers_DocumentRetrievalDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinXCAFDrivers_DocumentRetrievalDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinXCAFDrivers_DocumentRetrievalDriver::Handle_BinXCAFDrivers_DocumentRetrievalDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinXCAFDrivers_DocumentRetrievalDriver;
class Handle_BinXCAFDrivers_DocumentRetrievalDriver : public Handle_BinDrivers_DocumentRetrievalDriver {

    public:
        // constructors
        Handle_BinXCAFDrivers_DocumentRetrievalDriver();
        Handle_BinXCAFDrivers_DocumentRetrievalDriver(const Handle_BinXCAFDrivers_DocumentRetrievalDriver &aHandle);
        Handle_BinXCAFDrivers_DocumentRetrievalDriver(const BinXCAFDrivers_DocumentRetrievalDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinXCAFDrivers_DocumentRetrievalDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinXCAFDrivers_DocumentRetrievalDriver {
    BinXCAFDrivers_DocumentRetrievalDriver* _get_reference() {
    return (BinXCAFDrivers_DocumentRetrievalDriver*)$self->Access();
    }
};

%extend Handle_BinXCAFDrivers_DocumentRetrievalDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinXCAFDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinXCAFDrivers_DocumentStorageDriver;
class BinXCAFDrivers_DocumentStorageDriver : public BinDrivers_DocumentStorageDriver {
	public:
		%feature("compactdefaultargs") BinXCAFDrivers_DocumentStorageDriver;
		%feature("autodoc", "	* Constructor

	:rtype: None
") BinXCAFDrivers_DocumentStorageDriver;
		 BinXCAFDrivers_DocumentStorageDriver ();
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_BinMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_BinMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
};


%extend BinXCAFDrivers_DocumentStorageDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BinXCAFDrivers_DocumentStorageDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BinXCAFDrivers_DocumentStorageDriver::Handle_BinXCAFDrivers_DocumentStorageDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BinXCAFDrivers_DocumentStorageDriver;
class Handle_BinXCAFDrivers_DocumentStorageDriver : public Handle_BinDrivers_DocumentStorageDriver {

    public:
        // constructors
        Handle_BinXCAFDrivers_DocumentStorageDriver();
        Handle_BinXCAFDrivers_DocumentStorageDriver(const Handle_BinXCAFDrivers_DocumentStorageDriver &aHandle);
        Handle_BinXCAFDrivers_DocumentStorageDriver(const BinXCAFDrivers_DocumentStorageDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BinXCAFDrivers_DocumentStorageDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BinXCAFDrivers_DocumentStorageDriver {
    BinXCAFDrivers_DocumentStorageDriver* _get_reference() {
    return (BinXCAFDrivers_DocumentStorageDriver*)$self->Access();
    }
};

%extend Handle_BinXCAFDrivers_DocumentStorageDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BinXCAFDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
