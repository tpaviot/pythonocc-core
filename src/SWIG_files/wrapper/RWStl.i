/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- time : 2019-11-03 11:38:27
- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define RWSTLDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=RWSTLDOCSTRING) RWStl

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include RWStl_headers.i

/* public enums */
/* end public enums declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/* handles */
/* end handles declaration */

%rename(rwstl) RWStl;
%nodefaultctor RWStl;
class RWStl {
	public:
		%feature("compactdefaultargs") ReadAscii;
		%feature("autodoc", "	* Read triangulation from an Ascii STL file In case of error, returns Null handle.

	:param thePath:
	:type thePath: OSD_Path &
	:param theProgInd: default value is opencascade::handle<Message_ProgressIndicator>()
	:type theProgInd: opencascade::handle<Message_ProgressIndicator> &
	:rtype: opencascade::handle<Poly_Triangulation>
") ReadAscii;
		static opencascade::handle<Poly_Triangulation> ReadAscii (const OSD_Path & thePath,const opencascade::handle<Message_ProgressIndicator> & theProgInd = opencascade::handle<Message_ProgressIndicator>());
		%feature("compactdefaultargs") ReadBinary;
		%feature("autodoc", "	* Read triangulation from a binary STL file In case of error, returns Null handle.

	:param thePath:
	:type thePath: OSD_Path &
	:param theProgInd: default value is opencascade::handle<Message_ProgressIndicator>()
	:type theProgInd: opencascade::handle<Message_ProgressIndicator> &
	:rtype: opencascade::handle<Poly_Triangulation>
") ReadBinary;
		static opencascade::handle<Poly_Triangulation> ReadBinary (const OSD_Path & thePath,const opencascade::handle<Message_ProgressIndicator> & theProgInd = opencascade::handle<Message_ProgressIndicator>());
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "	* Read specified STL file and returns its content as triangulation. In case of error, returns Null handle.

	:param theFile:
	:type theFile: OSD_Path &
	:param aProgInd: default value is opencascade::handle<Message_ProgressIndicator>()
	:type aProgInd: opencascade::handle<Message_ProgressIndicator> &
	:rtype: opencascade::handle<Poly_Triangulation>
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile (const OSD_Path & theFile,const opencascade::handle<Message_ProgressIndicator> & aProgInd = opencascade::handle<Message_ProgressIndicator>());
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "	* Read specified STL file and returns its content as triangulation. In case of error, returns Null handle.

	:param theFile:
	:type theFile: char *
	:param aProgInd: default value is opencascade::handle<Message_ProgressIndicator>()
	:type aProgInd: opencascade::handle<Message_ProgressIndicator> &
	:rtype: opencascade::handle<Poly_Triangulation>
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile (const char * theFile,const opencascade::handle<Message_ProgressIndicator> & aProgInd = opencascade::handle<Message_ProgressIndicator>());
		%feature("compactdefaultargs") WriteAscii;
		%feature("autodoc", "	* write the meshing in a file following the Ascii format of an STL file. Returns false if the cannot be opened;

	:param theMesh:
	:type theMesh: opencascade::handle<Poly_Triangulation> &
	:param thePath:
	:type thePath: OSD_Path &
	:param theProgInd: default value is opencascade::handle<Message_ProgressIndicator>()
	:type theProgInd: opencascade::handle<Message_ProgressIndicator> &
	:rtype: bool
") WriteAscii;
		static Standard_Boolean WriteAscii (const opencascade::handle<Poly_Triangulation> & theMesh,const OSD_Path & thePath,const opencascade::handle<Message_ProgressIndicator> & theProgInd = opencascade::handle<Message_ProgressIndicator>());
		%feature("compactdefaultargs") WriteBinary;
		%feature("autodoc", "	* Write triangulation to binary STL file. binary format of an STL file. Returns false if the cannot be opened;

	:param theMesh:
	:type theMesh: opencascade::handle<Poly_Triangulation> &
	:param thePath:
	:type thePath: OSD_Path &
	:param theProgInd: default value is opencascade::handle<Message_ProgressIndicator>()
	:type theProgInd: opencascade::handle<Message_ProgressIndicator> &
	:rtype: bool
") WriteBinary;
		static Standard_Boolean WriteBinary (const opencascade::handle<Poly_Triangulation> & theMesh,const OSD_Path & thePath,const opencascade::handle<Message_ProgressIndicator> & theProgInd = opencascade::handle<Message_ProgressIndicator>());
};


%extend RWStl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
