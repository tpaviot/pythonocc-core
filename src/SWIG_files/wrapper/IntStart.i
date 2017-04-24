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
%module (package="OCC") IntStart

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


%include IntStart_headers.i


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

%nodefaultctor IntStart_SITopolTool;
class IntStart_SITopolTool : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: TopAbs_State
") Classify;
		virtual TopAbs_State Classify (const gp_Pnt2d & P,const Standard_Real Tol);
};


%extend IntStart_SITopolTool {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IntStart_SITopolTool(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IntStart_SITopolTool::Handle_IntStart_SITopolTool %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IntStart_SITopolTool;
class Handle_IntStart_SITopolTool : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IntStart_SITopolTool();
        Handle_IntStart_SITopolTool(const Handle_IntStart_SITopolTool &aHandle);
        Handle_IntStart_SITopolTool(const IntStart_SITopolTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IntStart_SITopolTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IntStart_SITopolTool {
    IntStart_SITopolTool* _get_reference() {
    return (IntStart_SITopolTool*)$self->Access();
    }
};

%extend Handle_IntStart_SITopolTool {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IntStart_SITopolTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
