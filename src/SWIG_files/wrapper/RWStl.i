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
		/**** md5 signature: ee11f0bf8131771a8fb08fc5e104edad ****/
		%feature("compactdefaultargs") ReadAscii;
		%feature("autodoc", "Read triangulation from an ascii stl file in case of error, returns null handle.

Parameters
----------
thePath: OSD_Path
theProgInd: Message_ProgressIndicator,optional
	default value is opencascade::handle<Message_ProgressIndicator>()

Returns
-------
opencascade::handle<Poly_Triangulation>
") ReadAscii;
		static opencascade::handle<Poly_Triangulation> ReadAscii(const OSD_Path & thePath, const opencascade::handle<Message_ProgressIndicator> & theProgInd = opencascade::handle<Message_ProgressIndicator>());

		/****************** ReadBinary ******************/
		/**** md5 signature: 866da70f30bdaac89e98426c73d2e6ac ****/
		%feature("compactdefaultargs") ReadBinary;
		%feature("autodoc", "Read triangulation from a binary stl file in case of error, returns null handle.

Parameters
----------
thePath: OSD_Path
theProgInd: Message_ProgressIndicator,optional
	default value is opencascade::handle<Message_ProgressIndicator>()

Returns
-------
opencascade::handle<Poly_Triangulation>
") ReadBinary;
		static opencascade::handle<Poly_Triangulation> ReadBinary(const OSD_Path & thePath, const opencascade::handle<Message_ProgressIndicator> & theProgInd = opencascade::handle<Message_ProgressIndicator>());

		/****************** ReadFile ******************/
		/**** md5 signature: 293310934284db880032507aba06aa6e ****/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Read specified stl file and returns its content as triangulation. in case of error, returns null handle.

Parameters
----------
theFile: OSD_Path
aProgInd: Message_ProgressIndicator,optional
	default value is opencascade::handle<Message_ProgressIndicator>()

Returns
-------
opencascade::handle<Poly_Triangulation>
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(const OSD_Path & theFile, const opencascade::handle<Message_ProgressIndicator> & aProgInd = opencascade::handle<Message_ProgressIndicator>());

		/****************** ReadFile ******************/
		/**** md5 signature: 15a5b5614d960e1512f0f7cb77b371ef ****/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Read specified stl file and returns its content as triangulation. in case of error, returns null handle.

Parameters
----------
theFile: char *
aProgInd: Message_ProgressIndicator,optional
	default value is opencascade::handle<Message_ProgressIndicator>()

Returns
-------
opencascade::handle<Poly_Triangulation>
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(const char * theFile, const opencascade::handle<Message_ProgressIndicator> & aProgInd = opencascade::handle<Message_ProgressIndicator>());

		/****************** WriteAscii ******************/
		/**** md5 signature: 4e074416d39d5ad0261bcbf2e8663b50 ****/
		%feature("compactdefaultargs") WriteAscii;
		%feature("autodoc", "Write the meshing in a file following the ascii format of an stl file. returns false if the cannot be opened;.

Parameters
----------
theMesh: Poly_Triangulation
thePath: OSD_Path
theProgInd: Message_ProgressIndicator,optional
	default value is opencascade::handle<Message_ProgressIndicator>()

Returns
-------
bool
") WriteAscii;
		static Standard_Boolean WriteAscii(const opencascade::handle<Poly_Triangulation> & theMesh, const OSD_Path & thePath, const opencascade::handle<Message_ProgressIndicator> & theProgInd = opencascade::handle<Message_ProgressIndicator>());

		/****************** WriteBinary ******************/
		/**** md5 signature: c16756be3ac5eccd7cb2b9a471cb70ac ****/
		%feature("compactdefaultargs") WriteBinary;
		%feature("autodoc", "Write triangulation to binary stl file. binary format of an stl file. returns false if the cannot be opened;.

Parameters
----------
theMesh: Poly_Triangulation
thePath: OSD_Path
theProgInd: Message_ProgressIndicator,optional
	default value is opencascade::handle<Message_ProgressIndicator>()

Returns
-------
bool
") WriteBinary;
		static Standard_Boolean WriteBinary(const opencascade::handle<Poly_Triangulation> & theMesh, const OSD_Path & thePath, const opencascade::handle<Message_ProgressIndicator> & theProgInd = opencascade::handle<Message_ProgressIndicator>());

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
