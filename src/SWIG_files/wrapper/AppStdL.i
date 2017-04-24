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
%module (package="OCC") AppStdL

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


%include AppStdL_headers.i


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

%nodefaultctor AppStdL_Application;
class AppStdL_Application : public TDocStd_Application {
	public:
		%feature("compactdefaultargs") AppStdL_Application;
		%feature("autodoc", "	:rtype: None
") AppStdL_Application;
		 AppStdL_Application ();
		%feature("compactdefaultargs") MessageDriver;
		%feature("autodoc", "	:rtype: Handle_CDM_MessageDriver
") MessageDriver;
		virtual Handle_CDM_MessageDriver MessageDriver ();
		%feature("compactdefaultargs") Formats;
		%feature("autodoc", "	* returns supported format for application documents.

	:param theFormats:
	:type theFormats: TColStd_SequenceOfExtendedString &
	:rtype: void
") Formats;
		virtual void Formats (TColStd_SequenceOfExtendedString & theFormats);
		%feature("compactdefaultargs") ResourcesName;
		%feature("autodoc", "	* returns the file name which contains application resources

	:rtype: char *
") ResourcesName;
		const char * ResourcesName ();
};


%extend AppStdL_Application {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_AppStdL_Application(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_AppStdL_Application::Handle_AppStdL_Application %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_AppStdL_Application;
class Handle_AppStdL_Application : public Handle_TDocStd_Application {

    public:
        // constructors
        Handle_AppStdL_Application();
        Handle_AppStdL_Application(const Handle_AppStdL_Application &aHandle);
        Handle_AppStdL_Application(const AppStdL_Application *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_AppStdL_Application DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_AppStdL_Application {
    AppStdL_Application* _get_reference() {
    return (AppStdL_Application*)$self->Access();
    }
};

%extend Handle_AppStdL_Application {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend AppStdL_Application {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
