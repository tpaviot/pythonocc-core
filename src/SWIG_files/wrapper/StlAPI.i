/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
%define STLAPIDOCSTRING
"StlAPI module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stlapi.html"
%enddef
%module (package="OCC.Core", docstring=STLAPIDOCSTRING) StlAPI


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<StlAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<Message_module.hxx>
#include<TopLoc_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***************
* class StlAPI *
***************/
%rename(stlapi) StlAPI;
class StlAPI {
	public:
		/****************** Read ******************/
		/**** md5 signature: 04193a3dd7bc184e35d71f6296bb4160 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Legacy interface. read stl file and create a shape composed of triangular faces, one per facet. this approach is very inefficient, especially for large files. consider reading stl file to poly_triangulation object instead (see class rwstl).

Parameters
----------
theShape: TopoDS_Shape
aFile: char *

Returns
-------
bool
") Read;
		static Standard_Boolean Read(TopoDS_Shape & theShape, const char * aFile);

		/****************** Write ******************/
		/**** md5 signature: 6440898486e448da078517629383a97a ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Convert and write shape to stl format. file is written in binary if aasciimode is false otherwise it is written in ascii (by default).

Parameters
----------
theShape: TopoDS_Shape
theFile: char *
theAsciiMode: bool,optional
	default value is Standard_True

Returns
-------
bool
") Write;
		static Standard_Boolean Write(const TopoDS_Shape & theShape, const char * theFile, const Standard_Boolean theAsciiMode = Standard_True);

};


%extend StlAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class StlAPI_Reader *
**********************/
class StlAPI_Reader {
	public:
		/****************** Read ******************/
		/**** md5 signature: 7175fc9409b969fddd6af571d4af05e4 ****/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Reads stl file to the topods_shape (each triangle is converted to the face). returns true if reading is successful.

Parameters
----------
theShape: TopoDS_Shape
theFileName: char *

Returns
-------
bool
") Read;
		Standard_Boolean Read(TopoDS_Shape & theShape, const char * theFileName);

};


%extend StlAPI_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class StlAPI_Writer *
**********************/
class StlAPI_Writer {
	public:
		/****************** StlAPI_Writer ******************/
		/**** md5 signature: bb0903a29083f9fab3c6442a6e38972c ****/
		%feature("compactdefaultargs") StlAPI_Writer;
		%feature("autodoc", "Creates a writer object with default parameters: asciimode.

Returns
-------
None
") StlAPI_Writer;
		 StlAPI_Writer();


        %feature("autodoc","1");
        %extend {
            Standard_Boolean GetASCIIMode() {
            return (Standard_Boolean) $self->ASCIIMode();
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetASCIIMode(Standard_Boolean value) {
            $self->ASCIIMode()=value;
            }
        };
		/****************** Write ******************/
		/**** md5 signature: 0d7f29b491afa209c52b0b9f23ebebfc ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Converts a given shape to stl format and writes it to file with a given filename. eturn the error state.

Parameters
----------
theShape: TopoDS_Shape
theFileName: char *

Returns
-------
bool
") Write;
		Standard_Boolean Write(const TopoDS_Shape & theShape, const char * theFileName);

};


%extend StlAPI_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
