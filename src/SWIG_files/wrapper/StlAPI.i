/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_stlapi.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<StlAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<Message_module.hxx>
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
%import Message.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
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
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
aFile: str

Return
-------
bool

Description
-----------
Legacy interface. read stl file and create a shape composed of triangular faces, one per facet. this approach is very inefficient, especially for large files. consider reading stl file to poly_triangulation object instead (see class rwstl).
") Read;
		static Standard_Boolean Read(TopoDS_Shape & theShape, Standard_CString aFile);

		/****************** Write ******************/
		/**** md5 signature: 6440898486e448da078517629383a97a ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFile: str
theAsciiMode: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Convert and write shape to stl format. file is written in binary if aasciimode is false otherwise it is written in ascii (by default).
") Write;
		static Standard_Boolean Write(const TopoDS_Shape & theShape, Standard_CString theFile, const Standard_Boolean theAsciiMode = Standard_True);

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
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFileName: str

Return
-------
bool

Description
-----------
Reads stl file to the topods_shape (each triangle is converted to the face). return true if reading is successful.
") Read;
		Standard_Boolean Read(TopoDS_Shape & theShape, Standard_CString theFileName);

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
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a writer object with default parameters: asciimode.
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
		/**** md5 signature: 2af1d9f86c5642907de91a1eb03fe67f ****/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFileName: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Converts a given shape to stl format and writes it to file with a given filename. eturn the error state.
") Write;
		Standard_Boolean Write(const TopoDS_Shape & theShape, Standard_CString theFileName, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend StlAPI_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def stlapi_Read(*args):
	return stlapi.Read(*args)

@deprecated
def stlapi_Write(*args):
	return stlapi.Write(*args)

}
