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
%module (package="OCC") PFunction

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


%include PFunction_headers.i


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

%nodefaultctor PFunction_Function;
class PFunction_Function : public PDF_Attribute {
	public:
		%feature("compactdefaultargs") PFunction_Function;
		%feature("autodoc", "	:rtype: None
") PFunction_Function;
		 PFunction_Function ();
		%feature("compactdefaultargs") SetDriverGUID;
		%feature("autodoc", "	:param driverGUID:
	:type driverGUID: Standard_GUID &
	:rtype: None
") SetDriverGUID;
		void SetDriverGUID (const Standard_GUID & driverGUID);
		%feature("compactdefaultargs") GetDriverGUID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetDriverGUID;
		Standard_GUID GetDriverGUID ();
		%feature("compactdefaultargs") GetFailure;
		%feature("autodoc", "	:rtype: int
") GetFailure;
		Standard_Integer GetFailure ();
		%feature("compactdefaultargs") SetFailure;
		%feature("autodoc", "	:param mode:
	:type mode: int
	:rtype: None
") SetFailure;
		void SetFailure (const Standard_Integer mode);
		%feature("compactdefaultargs") PFunction_Function;
		%feature("autodoc", "	:param a:
	:type a: Storage_stCONSTclCOM &
	:rtype: None
") PFunction_Function;
		 PFunction_Function (const Storage_stCONSTclCOM & a);
		%feature("compactdefaultargs") _CSFDB_GetPFunction_FunctionmyDriverGUID;
		%feature("autodoc", "	:rtype: Standard_GUID
") _CSFDB_GetPFunction_FunctionmyDriverGUID;
		const Standard_GUID & _CSFDB_GetPFunction_FunctionmyDriverGUID ();
		%feature("compactdefaultargs") _CSFDB_GetPFunction_FunctionmyFailure;
		%feature("autodoc", "	:rtype: int
") _CSFDB_GetPFunction_FunctionmyFailure;
		Standard_Integer _CSFDB_GetPFunction_FunctionmyFailure ();
		%feature("compactdefaultargs") _CSFDB_SetPFunction_FunctionmyFailure;
		%feature("autodoc", "	:param p:
	:type p: int
	:rtype: None
") _CSFDB_SetPFunction_FunctionmyFailure;
		void _CSFDB_SetPFunction_FunctionmyFailure (const Standard_Integer p);
};


%extend PFunction_Function {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PFunction_Function(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PFunction_Function::Handle_PFunction_Function %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PFunction_Function;
class Handle_PFunction_Function : public Handle_PDF_Attribute {

    public:
        // constructors
        Handle_PFunction_Function();
        Handle_PFunction_Function(const Handle_PFunction_Function &aHandle);
        Handle_PFunction_Function(const PFunction_Function *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PFunction_Function DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_PFunction_Function {
    PFunction_Function* _get_reference() {
    return (PFunction_Function*)$self->Access();
    }
};

%extend Handle_PFunction_Function {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend PFunction_Function {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
