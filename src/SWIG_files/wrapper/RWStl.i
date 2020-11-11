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
%define RWSTLDOCSTRING
"RWStl module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_rwstl.html"
%enddef
%module (package="OCC.Core", docstring=RWSTLDOCSTRING) RWStl


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
#include<RWStl_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<OSD_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<TShort_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import OSD.i
%import Message.i
%import Poly.i

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

/**************
* class RWStl *
**************/
%rename(rwstl) RWStl;
class RWStl {
	public:
		/****************** ReadAscii ******************/
		/**** md5 signature: a4082bfc34c1229bc435c44951da6960 ****/
		%feature("compactdefaultargs") ReadAscii;
		%feature("autodoc", "Read triangulation from an ascii stl file in case of error, returns null handle.

Parameters
----------
thePath: OSD_Path
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<Poly_Triangulation>
") ReadAscii;
		static opencascade::handle<Poly_Triangulation> ReadAscii(const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** ReadBinary ******************/
		/**** md5 signature: 715829aa852a6829b2792b5ff41018e6 ****/
		%feature("compactdefaultargs") ReadBinary;
		%feature("autodoc", "Read triangulation from a binary stl file in case of error, returns null handle.

Parameters
----------
thePath: OSD_Path
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<Poly_Triangulation>
") ReadBinary;
		static opencascade::handle<Poly_Triangulation> ReadBinary(const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** ReadFile ******************/
		/**** md5 signature: d43c9b9243be3127708aa8d4c2ce0d80 ****/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Read specified stl file and returns its content as triangulation. in case of error, returns null handle.

Parameters
----------
theFile: OSD_Path
aProgInd: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<Poly_Triangulation>
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(const OSD_Path & theFile, const Message_ProgressRange & aProgInd = Message_ProgressRange());

		/****************** ReadFile ******************/
		/**** md5 signature: 760c46a9474c487b075bd12bfbd5c2c9 ****/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Read specified stl file and returns its content as triangulation. in case of error, returns null handle.

Parameters
----------
theFile: char *
aProgInd: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
opencascade::handle<Poly_Triangulation>
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(const char * theFile, const Message_ProgressRange & aProgInd = Message_ProgressRange());

		/****************** WriteAscii ******************/
		/**** md5 signature: 8cb39ba5b5c9e3b27f4e1ec1bd12de9c ****/
		%feature("compactdefaultargs") WriteAscii;
		%feature("autodoc", "Write the meshing in a file following the ascii format of an stl file. returns false if the cannot be opened;.

Parameters
----------
theMesh: Poly_Triangulation
thePath: OSD_Path
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") WriteAscii;
		static Standard_Boolean WriteAscii(const opencascade::handle<Poly_Triangulation> & theMesh, const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****************** WriteBinary ******************/
		/**** md5 signature: 3a7e5b47e0a20ed5065a6f3593a90ac4 ****/
		%feature("compactdefaultargs") WriteBinary;
		%feature("autodoc", "Write triangulation to binary stl file. binary format of an stl file. returns false if the cannot be opened;.

Parameters
----------
theMesh: Poly_Triangulation
thePath: OSD_Path
theProgress: Message_ProgressRange,optional
	default value is Message_ProgressRange()

Returns
-------
bool
") WriteBinary;
		static Standard_Boolean WriteBinary(const opencascade::handle<Poly_Triangulation> & theMesh, const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend RWStl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class RWStl_Reader *
*********************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class RWStl_Reader:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
