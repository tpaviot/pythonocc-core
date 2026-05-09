/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_rwstl.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<RWStl_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<OSD_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<TShort_module.hxx>
#include<Bnd_module.hxx>
#include<IFSelect_module.hxx>
#include<TopTools_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<CDF_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<MoniTool_module.hxx>
#include<Transfer_module.hxx>
#include<Interface_module.hxx>
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

/**************
* class RWStl *
**************/
%rename(rwstl) RWStl;
class RWStl {
	public:
		/****** RWStl::ReadAscii ******/
		/****** md5 signature: a4082bfc34c1229bc435c44951da6960 ******/
		%feature("compactdefaultargs") ReadAscii;
		%feature("autodoc", "
Parameters
----------
thePath: OSD_Path
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Read triangulation from an Ascii STL file In case of error, returns Null handle.
") ReadAscii;
		static opencascade::handle<Poly_Triangulation> ReadAscii(const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::ReadAsciiStream ******/
		/****** md5 signature: df5114d215cb69b8828e151dcaece8e5 ******/
		%feature("compactdefaultargs") ReadAsciiStream;
		%feature("autodoc", "
Parameters
----------
theStream: str
theMergeAngle: double (optional, default to M_PI/2.0)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Read triangulation from ASCII STL stream In case of error, returns Null handle.
") ReadAsciiStream;
		static opencascade::handle<Poly_Triangulation> ReadAsciiStream(std::istream & theStream, const double theMergeAngle = M_PI/2.0, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::ReadBinary ******/
		/****** md5 signature: 715829aa852a6829b2792b5ff41018e6 ******/
		%feature("compactdefaultargs") ReadBinary;
		%feature("autodoc", "
Parameters
----------
thePath: OSD_Path
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Read triangulation from a binary STL file In case of error, returns Null handle.
") ReadBinary;
		static opencascade::handle<Poly_Triangulation> ReadBinary(const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::ReadBinaryStream ******/
		/****** md5 signature: d94d56ed2cdf296707a2ca997b0ec2e1 ******/
		%feature("compactdefaultargs") ReadBinaryStream;
		%feature("autodoc", "
Parameters
----------
theStream: str
theMergeAngle: double (optional, default to M_PI/2.0)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Read triangulation from binary STL stream In case of error, returns Null handle.
") ReadBinaryStream;
		static opencascade::handle<Poly_Triangulation> ReadBinaryStream(std::istream & theStream, const double theMergeAngle = M_PI/2.0, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::ReadFile ******/
		/****** md5 signature: 64c7a7ea1e7b324b70672cedadb30bca ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
theFile: OSD_Path
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Read specified STL file and returns its content as triangulation. In case of error, returns Null handle.
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(const OSD_Path & theFile, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::ReadFile ******/
		/****** md5 signature: 30ac16ed8f9a3bc9e611e8bf3218fe52 ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
theFile: char *
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Read specified STL file and returns its content as triangulation. In case of error, returns Null handle.
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(const char * const theFile, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::ReadFile ******/
		/****** md5 signature: 7914feca9ad0c10073884c16adb0f818 ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
theFile: char *
theMergeAngle: double
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Read specified STL file and returns its content as triangulation. 
Input parameter: theFile file path to read 
Input parameter: theMergeAngle maximum angle in radians between triangles to merge equal nodes; M_PI/2 means ignore angle 
Input parameter: theProgress progress indicator 
Return: result triangulation or NULL in case of error.
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(const char * const theFile, const double theMergeAngle, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::ReadFile ******/
		/****** md5 signature: e3dd057238e10e9129268d923dfff4da ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
theFile: char *
theMergeAngle: double
theTriangList: Poly_Triangulation
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Read specified STL file and fills triangulation list for multi-domain case. 
Input parameter: theFile file path to read 
Input parameter: theMergeAngle maximum angle in radians between triangles to merge equal nodes; M_PI/2 means ignore angle @param[out] theTriangList triangulation list for multi-domain case 
Input parameter: theProgress progress indicator.
") ReadFile;
		static void ReadFile(const char * const theFile, const double theMergeAngle, NCollection_Sequence<opencascade::handle<Poly_Triangulation>> & theTriangList, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::ReadStream ******/
		/****** md5 signature: 59fc68980f5876e52974817c37ad1076 ******/
		%feature("compactdefaultargs") ReadStream;
		%feature("autodoc", "
Parameters
----------
theStream: str
theMergeAngle: double (optional, default to M_PI/2.0)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Read STL data from stream (auto-detects ASCII vs Binary) In case of error, returns Null handle.
") ReadStream;
		static opencascade::handle<Poly_Triangulation> ReadStream(std::istream & theStream, const double theMergeAngle = M_PI/2.0, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::WriteAscii ******/
		/****** md5 signature: 0b7bcde568e3cf995a2f68b08b61d967 ******/
		%feature("compactdefaultargs") WriteAscii;
		%feature("autodoc", "
Parameters
----------
theMesh: Poly_Triangulation
thePath: OSD_Path
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
write the meshing in a file following the Ascii format of an STL file. Returns false if the cannot be opened;.
") WriteAscii;
		static bool WriteAscii(const opencascade::handle<Poly_Triangulation> & theMesh, const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::WriteAscii ******/
		/****** md5 signature: e4fe51b24d7e0af8c273902ea84f2b9c ******/
		%feature("compactdefaultargs") WriteAscii;
		%feature("autodoc", "
Parameters
----------
theMesh: Poly_Triangulation
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
theStream: Standard_OStream

Description
-----------
Write triangulation to ASCII STL stream.
") WriteAscii;
		static bool WriteAscii(const opencascade::handle<Poly_Triangulation> & theMesh, std::ostream &OutValue, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::WriteBinary ******/
		/****** md5 signature: 339cb5ccd11286c5ff31f51593e7a6e5 ******/
		%feature("compactdefaultargs") WriteBinary;
		%feature("autodoc", "
Parameters
----------
theMesh: Poly_Triangulation
thePath: OSD_Path
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Write triangulation to binary STL file. binary format of an STL file. Returns false if the cannot be opened;.
") WriteBinary;
		static bool WriteBinary(const opencascade::handle<Poly_Triangulation> & theMesh, const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::WriteBinary ******/
		/****** md5 signature: 299a60f2d06ae3e257c3c04279f8779a ******/
		%feature("compactdefaultargs") WriteBinary;
		%feature("autodoc", "
Parameters
----------
theMesh: Poly_Triangulation
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
theStream: Standard_OStream

Description
-----------
Write triangulation to binary STL stream.
") WriteBinary;
		static bool WriteBinary(const opencascade::handle<Poly_Triangulation> & theMesh, std::ostream &OutValue, const Message_ProgressRange & theProgress = Message_ProgressRange());

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
/* deprecated methods */
%pythoncode {
@deprecated
def rwstl_ReadAscii(*args):
	return rwstl.ReadAscii(*args)

@deprecated
def rwstl_ReadAsciiStream(*args):
	return rwstl.ReadAsciiStream(*args)

@deprecated
def rwstl_ReadBinary(*args):
	return rwstl.ReadBinary(*args)

@deprecated
def rwstl_ReadBinaryStream(*args):
	return rwstl.ReadBinaryStream(*args)

@deprecated
def rwstl_ReadFile(*args):
	return rwstl.ReadFile(*args)

@deprecated
def rwstl_ReadFile(*args):
	return rwstl.ReadFile(*args)

@deprecated
def rwstl_ReadFile(*args):
	return rwstl.ReadFile(*args)

@deprecated
def rwstl_ReadFile(*args):
	return rwstl.ReadFile(*args)

@deprecated
def rwstl_ReadStream(*args):
	return rwstl.ReadStream(*args)

@deprecated
def rwstl_WriteAscii(*args):
	return rwstl.WriteAscii(*args)

@deprecated
def rwstl_WriteAscii(*args):
	return rwstl.WriteAscii(*args)

@deprecated
def rwstl_WriteBinary(*args):
	return rwstl.WriteBinary(*args)

@deprecated
def rwstl_WriteBinary(*args):
	return rwstl.WriteBinary(*args)

}
