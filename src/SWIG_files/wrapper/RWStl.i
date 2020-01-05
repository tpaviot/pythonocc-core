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
/* public enums */
/* end public enums declaration */

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
		%feature("compactdefaultargs") ReadAscii;
		%feature("autodoc", "* Read triangulation from an Ascii STL file In case of error, returns Null handle.
	:param thePath:
	:type thePath: OSD_Path
	:param theProgInd: default value is opencascade::handle<Message_ProgressIndicator>()
	:type theProgInd: Message_ProgressIndicator
	:rtype: opencascade::handle<Poly_Triangulation>") ReadAscii;
		static opencascade::handle<Poly_Triangulation> ReadAscii (const OSD_Path & thePath,const opencascade::handle<Message_ProgressIndicator> & theProgInd = opencascade::handle<Message_ProgressIndicator>());

		/****************** ReadBinary ******************/
		%feature("compactdefaultargs") ReadBinary;
		%feature("autodoc", "* Read triangulation from a binary STL file In case of error, returns Null handle.
	:param thePath:
	:type thePath: OSD_Path
	:param theProgInd: default value is opencascade::handle<Message_ProgressIndicator>()
	:type theProgInd: Message_ProgressIndicator
	:rtype: opencascade::handle<Poly_Triangulation>") ReadBinary;
		static opencascade::handle<Poly_Triangulation> ReadBinary (const OSD_Path & thePath,const opencascade::handle<Message_ProgressIndicator> & theProgInd = opencascade::handle<Message_ProgressIndicator>());

		/****************** ReadFile ******************/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "* Read specified STL file and returns its content as triangulation. In case of error, returns Null handle.
	:param theFile:
	:type theFile: OSD_Path
	:param aProgInd: default value is opencascade::handle<Message_ProgressIndicator>()
	:type aProgInd: Message_ProgressIndicator
	:rtype: opencascade::handle<Poly_Triangulation>") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile (const OSD_Path & theFile,const opencascade::handle<Message_ProgressIndicator> & aProgInd = opencascade::handle<Message_ProgressIndicator>());

		/****************** ReadFile ******************/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "* Read specified STL file and returns its content as triangulation. In case of error, returns Null handle.
	:param theFile:
	:type theFile: char *
	:param aProgInd: default value is opencascade::handle<Message_ProgressIndicator>()
	:type aProgInd: Message_ProgressIndicator
	:rtype: opencascade::handle<Poly_Triangulation>") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile (const char * theFile,const opencascade::handle<Message_ProgressIndicator> & aProgInd = opencascade::handle<Message_ProgressIndicator>());

		/****************** WriteAscii ******************/
		%feature("compactdefaultargs") WriteAscii;
		%feature("autodoc", "* write the meshing in a file following the Ascii format of an STL file. Returns false if the cannot be opened;
	:param theMesh:
	:type theMesh: Poly_Triangulation
	:param thePath:
	:type thePath: OSD_Path
	:param theProgInd: default value is opencascade::handle<Message_ProgressIndicator>()
	:type theProgInd: Message_ProgressIndicator
	:rtype: bool") WriteAscii;
		static Standard_Boolean WriteAscii (const opencascade::handle<Poly_Triangulation> & theMesh,const OSD_Path & thePath,const opencascade::handle<Message_ProgressIndicator> & theProgInd = opencascade::handle<Message_ProgressIndicator>());

		/****************** WriteBinary ******************/
		%feature("compactdefaultargs") WriteBinary;
		%feature("autodoc", "* Write triangulation to binary STL file. binary format of an STL file. Returns false if the cannot be opened;
	:param theMesh:
	:type theMesh: Poly_Triangulation
	:param thePath:
	:type thePath: OSD_Path
	:param theProgInd: default value is opencascade::handle<Message_ProgressIndicator>()
	:type theProgInd: Message_ProgressIndicator
	:rtype: bool") WriteBinary;
		static Standard_Boolean WriteBinary (const opencascade::handle<Poly_Triangulation> & theMesh,const OSD_Path & thePath,const opencascade::handle<Message_ProgressIndicator> & theProgInd = opencascade::handle<Message_ProgressIndicator>());

};


%extend RWStl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class RWStl_Reader *
*********************/
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
