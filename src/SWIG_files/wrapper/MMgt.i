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
%module (package="OCC") MMgt

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


%include MMgt_headers.i


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

%nodefaultctor MMgt_TShared;
class MMgt_TShared : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
};


%extend MMgt_TShared {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_MMgt_TShared(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_MMgt_TShared::Handle_MMgt_TShared %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_MMgt_TShared;
class Handle_MMgt_TShared : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_MMgt_TShared();
        Handle_MMgt_TShared(const Handle_MMgt_TShared &aHandle);
        Handle_MMgt_TShared(const MMgt_TShared *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_MMgt_TShared DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_MMgt_TShared {
    MMgt_TShared* _get_reference() {
    return (MMgt_TShared*)$self->Access();
    }
};

%extend Handle_MMgt_TShared {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend MMgt_TShared {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
