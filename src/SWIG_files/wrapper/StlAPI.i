/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
/* end public enums declaration */

%rename(stlapi) StlAPI;
class StlAPI {
	public:
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Convert and write shape to STL format.  file is written in binary if aAsciiMode is False  otherwise it is written in Ascii (by default)

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aFile:
	:type aFile: char *
	:param aAsciiMode: default value is Standard_True
	:type aAsciiMode: bool
	:rtype: void
") Write;
		static void Write (const TopoDS_Shape & aShape,const char * aFile,const Standard_Boolean aAsciiMode = Standard_True);
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


%nodefaultctor StlAPI_Writer;
class StlAPI_Writer {
	public:
		%feature("compactdefaultargs") StlAPI_Writer;
		%feature("autodoc", "	* Creates a writer object with default parameters: ASCIIMode, RelativeMode, SetCoefficent, SetDeflection. These parameters may be modified.

	:rtype: None
") StlAPI_Writer;
		 StlAPI_Writer ();
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "	* Sets the deflection of the meshing algorithm. Deflection is used, only if relative mode is false

	:param aDeflection:
	:type aDeflection: float
	:rtype: None
") SetDeflection;
		void SetDeflection (const Standard_Real aDeflection);
		%feature("compactdefaultargs") SetCoefficient;
		%feature("autodoc", "	* Sets the coeffiecient for computation of deflection through relative size of shape. Default value = 0.001

	:param aCoefficient:
	:type aCoefficient: float
	:rtype: None
") SetCoefficient;
		void SetCoefficient (const Standard_Real aCoefficient);

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetRelativeMode() {
                return (Standard_Boolean) $self->RelativeMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetRelativeMode(Standard_Boolean value ) {
                $self->RelativeMode()=value;
                }
            };
            
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
		%feature("autodoc", "	* Converts a given shape to STL format and writes it to file with a given filename.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aFileName:
	:type aFileName: char *
	:param InParallel: default value is Standard_False
	:type InParallel: bool
	:rtype: None
") Write;
		void Write (const TopoDS_Shape & aShape,const char * aFileName,const Standard_Boolean InParallel = Standard_False);
};


