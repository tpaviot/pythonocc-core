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
%module (package="OCC") XCAFApp

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


%include XCAFApp_headers.i


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

%nodefaultctor XCAFApp_Application;
class XCAFApp_Application : public TDocStd_Application {
	public:
		%feature("compactdefaultargs") Formats;
		%feature("autodoc", "	:param Formats:
	:type Formats: TColStd_SequenceOfExtendedString &
	:rtype: void
") Formats;
		virtual void Formats (TColStd_SequenceOfExtendedString & Formats);
		%feature("compactdefaultargs") ResourcesName;
		%feature("autodoc", "	* methods from TDocStd_Application ================================

	:rtype: char *
") ResourcesName;
		virtual const char * ResourcesName ();
		%feature("compactdefaultargs") InitDocument;
		%feature("autodoc", "	* Set XCAFDoc_DocumentTool attribute

	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:rtype: void
") InitDocument;
		virtual void InitDocument (const Handle_TDocStd_Document & aDoc);
		%feature("compactdefaultargs") GetApplication;
		%feature("autodoc", "	* Initializes (for the first time) and returns the static object (XCAFApp_Application) This is the only valid method to get XCAFApp_Application object, and it should be called at least once before any actions with documents in order to init application

	:rtype: Handle_XCAFApp_Application
") GetApplication;
		static Handle_XCAFApp_Application GetApplication ();
};


%extend XCAFApp_Application {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XCAFApp_Application(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XCAFApp_Application::Handle_XCAFApp_Application %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_XCAFApp_Application;
class Handle_XCAFApp_Application : public Handle_TDocStd_Application {

    public:
        // constructors
        Handle_XCAFApp_Application();
        Handle_XCAFApp_Application(const Handle_XCAFApp_Application &aHandle);
        Handle_XCAFApp_Application(const XCAFApp_Application *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XCAFApp_Application DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XCAFApp_Application {
    XCAFApp_Application* _get_reference() {
    return (XCAFApp_Application*)$self->Access();
    }
};

%extend Handle_XCAFApp_Application {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XCAFApp_Application {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
