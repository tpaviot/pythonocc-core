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
%module (package="OCC") RWStl

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


%include RWStl_headers.i


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

%rename(rwstl) RWStl;
class RWStl {
	public:
		%feature("compactdefaultargs") WriteBinary;
		%feature("autodoc", "	* write the meshing in a file following the binary format of an STL file. Returns false if the cannot be opened;

	:param aMesh:
	:type aMesh: Handle_StlMesh_Mesh &
	:param aPath:
	:type aPath: OSD_Path &
	:param aProgInd: default value is NULL
	:type aProgInd: Handle_Message_ProgressIndicator &
	:rtype: bool
") WriteBinary;
		static Standard_Boolean WriteBinary (const Handle_StlMesh_Mesh & aMesh,const OSD_Path & aPath,const Handle_Message_ProgressIndicator & aProgInd = NULL);
		%feature("compactdefaultargs") WriteAscii;
		%feature("autodoc", "	* write the meshing in a file following the Ascii format of an STL file. Returns false if the cannot be opened;

	:param aMesh:
	:type aMesh: Handle_StlMesh_Mesh &
	:param aPath:
	:type aPath: OSD_Path &
	:param aProgInd: default value is NULL
	:type aProgInd: Handle_Message_ProgressIndicator &
	:rtype: bool
") WriteAscii;
		static Standard_Boolean WriteAscii (const Handle_StlMesh_Mesh & aMesh,const OSD_Path & aPath,const Handle_Message_ProgressIndicator & aProgInd = NULL);
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "	* This method will chwck if the file is a binary file or an AsciiFile testing the 5 first characters of the file wich are :'solid' in an ascii file. If we do not find that word we assume that it is a binary file.

	:param aPath:
	:type aPath: OSD_Path &
	:param aProgInd: default value is NULL
	:type aProgInd: Handle_Message_ProgressIndicator &
	:rtype: Handle_StlMesh_Mesh
") ReadFile;
		static Handle_StlMesh_Mesh ReadFile (const OSD_Path & aPath,const Handle_Message_ProgressIndicator & aProgInd = NULL);
		%feature("compactdefaultargs") ReadBinary;
		%feature("autodoc", "	* Read a meshing from a binary file Raises NoMoreObject from Standard if a statement does not contain the right number of tokens Raises TypeMisMatch if a token has not the good type (often real)

	:param aPath:
	:type aPath: OSD_Path &
	:param aProgInd: default value is NULL
	:type aProgInd: Handle_Message_ProgressIndicator &
	:rtype: Handle_StlMesh_Mesh
") ReadBinary;
		static Handle_StlMesh_Mesh ReadBinary (const OSD_Path & aPath,const Handle_Message_ProgressIndicator & aProgInd = NULL);
		%feature("compactdefaultargs") ReadAscii;
		%feature("autodoc", "	* Read a meshing from a binary file Raises NoMoreObject from Standard if a statement does not contain the right number of tokens Raises TypeMisMatch if a token has not the good type (often real) Raises MoMoreObject if a file is finished before having found the word endsolid;

	:param aPath:
	:type aPath: OSD_Path &
	:param aProgInd: default value is NULL
	:type aProgInd: Handle_Message_ProgressIndicator &
	:rtype: Handle_StlMesh_Mesh
") ReadAscii;
		static Handle_StlMesh_Mesh ReadAscii (const OSD_Path & aPath,const Handle_Message_ProgressIndicator & aProgInd = NULL);
};


%extend RWStl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
