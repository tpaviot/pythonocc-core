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
%module (package="OCC") StlAPI

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


%include StlAPI_headers.i


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
enum StlAPI_ErrorStatus {
	StlAPI_StatusOK = 0,
	StlAPI_MeshIsEmpty = 1,
	StlAPI_CannotOpenFile = 2,
};

/* end public enums declaration */

%rename(stlapi) StlAPI;
class StlAPI {
	public:
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Convert and write shape to STL format. file is written in binary if aAsciiMode is False otherwise it is written in Ascii (by default)

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aFile:
	:type aFile: char *
	:param aAsciiMode: default value is Standard_True
	:type aAsciiMode: bool
	:rtype: StlAPI_ErrorStatus
") Write;
		static StlAPI_ErrorStatus Write (const TopoDS_Shape & aShape,const char * aFile,const Standard_Boolean aAsciiMode = Standard_True);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* Create a shape from a STL format.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aFile:
	:type aFile: char *
	:rtype: void
") Read;
		static void Read (TopoDS_Shape & aShape,const char * aFile);
};


%extend StlAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StlAPI_Reader;
class StlAPI_Reader {
	public:
		%feature("compactdefaultargs") StlAPI_Reader;
		%feature("autodoc", "	:rtype: None
") StlAPI_Reader;
		 StlAPI_Reader ();
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aFileName:
	:type aFileName: char *
	:rtype: None
") Read;
		void Read (TopoDS_Shape & aShape,const char * aFileName);
};


%extend StlAPI_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StlAPI_Writer;
class StlAPI_Writer {
	public:
		%feature("compactdefaultargs") StlAPI_Writer;
		%feature("autodoc", "	* Creates a writer object with default parameters: ASCIIMode.

	:rtype: None
") StlAPI_Writer;
		 StlAPI_Writer ();

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetASCIIMode() {
                return (Standard_Boolean) $self->ASCIIMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetASCIIMode(Standard_Boolean value ) {
                $self->ASCIIMode()=value;
                }
            };
            		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Converts a given shape to STL format and writes it to file with a given filename. eturn the error state.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aFileName:
	:type aFileName: char *
	:rtype: StlAPI_ErrorStatus
") Write;
		StlAPI_ErrorStatus Write (const TopoDS_Shape & aShape,const char * aFileName);
};


%extend StlAPI_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
