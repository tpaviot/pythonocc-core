/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include AppStdL_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor AppStdL_Application;
class AppStdL_Application : public TDocStd_Application {
	public:
		%feature("autodoc", "	:rtype: None
") AppStdL_Application;
		 AppStdL_Application ();
		%feature("autodoc", "	:rtype: Handle_CDM_MessageDriver
") MessageDriver;
		virtual Handle_CDM_MessageDriver MessageDriver ();
		%feature("autodoc", "	* returns supported format for application documents.

	:param theFormats:
	:type theFormats: TColStd_SequenceOfExtendedString &
	:rtype: void
") Formats;
		virtual void Formats (TColStd_SequenceOfExtendedString & theFormats);
		%feature("autodoc", "	* returns the file name which contains application resources

	:rtype: char *
") ResourcesName;
		char * ResourcesName ();
};


%feature("shadow") AppStdL_Application::~AppStdL_Application %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AppStdL_Application {
	void _kill_pointed() {
		delete $self;
	}
};
%extend AppStdL_Application {
	Handle_AppStdL_Application GetHandle() {
	return *(Handle_AppStdL_Application*) &$self;
	}
};

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
    AppStdL_Application* GetObject() {
    return (AppStdL_Application*)$self->Access();
    }
};
%feature("shadow") Handle_AppStdL_Application::~Handle_AppStdL_Application %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_AppStdL_Application {
    void _kill_pointed() {
        delete $self;
    }
};

