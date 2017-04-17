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
%module (package="OCC") XmlMFunction

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


%include XmlMFunction_headers.i


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

%rename(xmlmfunction) XmlMFunction;
class XmlMFunction {
	public:
		%feature("compactdefaultargs") AddDrivers;
		%feature("autodoc", "	* Adds the attribute storage drivers to <aDriverTable>.

	:param aDriverTable:
	:type aDriverTable: Handle_XmlMDF_ADriverTable &
	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: void
") AddDrivers;
		static void AddDrivers (const Handle_XmlMDF_ADriverTable & aDriverTable,const Handle_CDM_MessageDriver & theMessageDriver);
};


%extend XmlMFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMFunction_FunctionDriver;
class XmlMFunction_FunctionDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMFunction_FunctionDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMFunction_FunctionDriver;
		 XmlMFunction_FunctionDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMFunction_FunctionDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMFunction_FunctionDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMFunction_FunctionDriver::Handle_XmlMFunction_FunctionDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMFunction_FunctionDriver;
class Handle_XmlMFunction_FunctionDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMFunction_FunctionDriver();
        Handle_XmlMFunction_FunctionDriver(const Handle_XmlMFunction_FunctionDriver &aHandle);
        Handle_XmlMFunction_FunctionDriver(const XmlMFunction_FunctionDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMFunction_FunctionDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMFunction_FunctionDriver {
    XmlMFunction_FunctionDriver* _get_reference() {
    return (XmlMFunction_FunctionDriver*)$self->Access();
    }
};

%extend Handle_XmlMFunction_FunctionDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMFunction_FunctionDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMFunction_GraphNodeDriver;
class XmlMFunction_GraphNodeDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMFunction_GraphNodeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMFunction_GraphNodeDriver;
		 XmlMFunction_GraphNodeDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMFunction_GraphNodeDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMFunction_GraphNodeDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMFunction_GraphNodeDriver::Handle_XmlMFunction_GraphNodeDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMFunction_GraphNodeDriver;
class Handle_XmlMFunction_GraphNodeDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMFunction_GraphNodeDriver();
        Handle_XmlMFunction_GraphNodeDriver(const Handle_XmlMFunction_GraphNodeDriver &aHandle);
        Handle_XmlMFunction_GraphNodeDriver(const XmlMFunction_GraphNodeDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMFunction_GraphNodeDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMFunction_GraphNodeDriver {
    XmlMFunction_GraphNodeDriver* _get_reference() {
    return (XmlMFunction_GraphNodeDriver*)$self->Access();
    }
};

%extend Handle_XmlMFunction_GraphNodeDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMFunction_GraphNodeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XmlMFunction_ScopeDriver;
class XmlMFunction_ScopeDriver : public XmlMDF_ADriver {
	public:
		%feature("compactdefaultargs") XmlMFunction_ScopeDriver;
		%feature("autodoc", "	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:rtype: None
") XmlMFunction_ScopeDriver;
		 XmlMFunction_ScopeDriver (const Handle_CDM_MessageDriver & theMessageDriver);
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


%extend XmlMFunction_ScopeDriver {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XmlMFunction_ScopeDriver(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XmlMFunction_ScopeDriver::Handle_XmlMFunction_ScopeDriver %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XmlMFunction_ScopeDriver;
class Handle_XmlMFunction_ScopeDriver : public Handle_XmlMDF_ADriver {

    public:
        // constructors
        Handle_XmlMFunction_ScopeDriver();
        Handle_XmlMFunction_ScopeDriver(const Handle_XmlMFunction_ScopeDriver &aHandle);
        Handle_XmlMFunction_ScopeDriver(const XmlMFunction_ScopeDriver *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XmlMFunction_ScopeDriver DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XmlMFunction_ScopeDriver {
    XmlMFunction_ScopeDriver* _get_reference() {
    return (XmlMFunction_ScopeDriver*)$self->Access();
    }
};

%extend Handle_XmlMFunction_ScopeDriver {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XmlMFunction_ScopeDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
