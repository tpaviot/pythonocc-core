/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module RWStl

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include RWStl_required_python_modules.i
%include RWStl_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(rwstl) RWStl;
%nodefaultctor RWStl;
class RWStl {
	public:
		%feature("autodoc", "Args:
	aMesh(Handle_StlMesh_Mesh)
	aPath(OSD_Path)
	aProgInd(Handle_Message_ProgressIndicator)=NULL

Returns:
	static Standard_Boolean

write the meshing in a file following the  
        binary format of an STL file.  
        Returns false if the cannot be opened;") WriteBinary;
		static Standard_Boolean WriteBinary (const Handle_StlMesh_Mesh & aMesh,const OSD_Path & aPath,const Handle_Message_ProgressIndicator & aProgInd = NULL);
		%feature("autodoc", "Args:
	aMesh(Handle_StlMesh_Mesh)
	aPath(OSD_Path)
	aProgInd(Handle_Message_ProgressIndicator)=NULL

Returns:
	static Standard_Boolean

write the meshing in a file following the  
        Ascii  format of an STL file.  
        Returns false if the cannot be opened;") WriteAscii;
		static Standard_Boolean WriteAscii (const Handle_StlMesh_Mesh & aMesh,const OSD_Path & aPath,const Handle_Message_ProgressIndicator & aProgInd = NULL);
		%feature("autodoc", "Args:
	aPath(OSD_Path)
	aProgInd(Handle_Message_ProgressIndicator)=NULL

Returns:
	static Handle_StlMesh_Mesh

This method will chwck if the file is a binary  
        file or an AsciiFile testing  the 5 first  
        characters of the file wich are :'solid' in an  
        ascii file. If we do not find that word we assume  
        that it is a binary file.") ReadFile;
		static Handle_StlMesh_Mesh ReadFile (const OSD_Path & aPath,const Handle_Message_ProgressIndicator & aProgInd = NULL);
		%feature("autodoc", "Args:
	aPath(OSD_Path)
	aProgInd(Handle_Message_ProgressIndicator)=NULL

Returns:
	static Handle_StlMesh_Mesh

Read a meshing from a binary file  
       Raises NoMoreObject from Standard if a statement  
       does not contain the right number of tokens  
       Raises TypeMisMatch if a token has not the good  
       type (often real)") ReadBinary;
		static Handle_StlMesh_Mesh ReadBinary (const OSD_Path & aPath,const Handle_Message_ProgressIndicator & aProgInd = NULL);
		%feature("autodoc", "Args:
	aPath(OSD_Path)
	aProgInd(Handle_Message_ProgressIndicator)=NULL

Returns:
	static Handle_StlMesh_Mesh

Read a meshing from a binary file  
       Raises NoMoreObject from Standard if a statement  
       does not contain the right number of tokens  
       Raises TypeMisMatch if a token has not the good  
       type (often real)  
       Raises MoMoreObject if a file is finished before  
       having found the word endsolid;") ReadAscii;
		static Handle_StlMesh_Mesh ReadAscii (const OSD_Path & aPath,const Handle_Message_ProgressIndicator & aProgInd = NULL);
};


%feature("shadow") RWStl::~RWStl %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend RWStl {
	void _kill_pointed() {
		delete $self;
	}
};
