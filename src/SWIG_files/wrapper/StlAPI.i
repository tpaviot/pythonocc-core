/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_stlapi.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
		/****** StlAPI::Read ******/
		/****** md5 signature: 42e66c335f834945534d9e7cd2d8cd1b ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
aFile: char *

Return
-------
bool

Description
-----------
No available documentation.
") Read;
		static bool Read(TopoDS_Shape & theShape, const char * const aFile);

		/****** StlAPI::Write ******/
		/****** md5 signature: cfc32a923ee4c1f93df84656c783aa21 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFile: char *
theAsciiMode: bool (optional, default to true)

Return
-------
bool

Description
-----------
Convert and write shape to STL format. File is written in binary if aAsciiMode is False otherwise it is written in Ascii (by default).
") Write;
		static bool Write(const TopoDS_Shape & theShape, const char * const theFile, const bool theAsciiMode = true);

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
		/****** StlAPI_Reader::Read ******/
		/****** md5 signature: cb259df7f7ca8f5ca9c8082c877afacb ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFileName: char *

Return
-------
bool

Description
-----------
Reads STL file to the TopoDS_Shape (each triangle is converted to the face). 
Return: True if reading is successful.
") Read;
		bool Read(TopoDS_Shape & theShape, const char * const theFileName);

		/****** StlAPI_Reader::Read ******/
		/****** md5 signature: 246d752b624b547d938dda5546115d23 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theStream: str

Return
-------
bool

Description
-----------
Reads STL data from stream to the TopoDS_Shape (each triangle is converted to the face). 
Parameter theShape result shape 
Parameter theStream stream to read from 
Return: True if reading is successful.
") Read;
		bool Read(TopoDS_Shape & theShape, std::istream & theStream);

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
		/****** StlAPI_Writer::StlAPI_Writer ******/
		/****** md5 signature: bb0903a29083f9fab3c6442a6e38972c ******/
		%feature("compactdefaultargs") StlAPI_Writer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a writer object with default parameters: ASCIIMode.
") StlAPI_Writer;
		 StlAPI_Writer();

		/****** StlAPI_Writer::ASCIIMode ******/
		/****** md5 signature: b627f8569e1049e1da213f459b93be92 ******/
		%feature("compactdefaultargs") ASCIIMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the address to the flag defining the mode for writing the file. This address may be used to either read or change the flag. If the mode returns True (default value) the generated file is an ASCII file. If the mode returns False, the generated file is a binary file.
") ASCIIMode;
		bool & ASCIIMode();

		/****** StlAPI_Writer::Write ******/
		/****** md5 signature: bc699fe565b1c4d37508ec187f3e0ca3 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theFileName: char *
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Converts a given shape to STL format and writes it to file with a given filename. eturn the error state.
") Write;
		bool Write(const TopoDS_Shape & theShape, const char * const theFileName, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** StlAPI_Writer::Write ******/
		/****** md5 signature: 0d47b2947d3012a8ff9c39ef5914bf71 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
theStream: Standard_OStream

Description
-----------
Converts a given shape to STL format and writes it to the specified stream. eturn the error state.
") Write;
		bool Write(const TopoDS_Shape & theShape, std::ostream &OutValue, const Message_ProgressRange & theProgress = Message_ProgressRange());

		%extend{
			bool GetASCIIMode() { return self->ASCIIMode(); }
			void SetASCIIMode(bool value) { self->ASCIIMode() = value; }
		};
		%extend{
			void SetASCIIMode(bool theMode) { self->ASCIIMode() = theMode; }
		};
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
