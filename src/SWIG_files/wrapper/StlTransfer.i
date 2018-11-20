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
%define STLTRANSFERDOCSTRING
"The package  Algorithm for Meshing  implements
facilities to retrieve the Mesh data-structure from a shape of package
TopoDS. The triangulation should be computed before.
The result  is stored in the mesh
data-structure Mesh from package StlMesh.

"
%enddef
%module (package="OCC.Core", docstring=STLTRANSFERDOCSTRING) StlTransfer

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
%include ../common/OccHandle.i


%include StlTransfer_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */


%rename(stltransfer) StlTransfer;
class StlTransfer {
	public:
		%feature("compactdefaultargs") RetrieveMesh;
		%feature("autodoc", "	* Retrieve a Mesh data-structure from the Shape, convert and store it into the Mesh.

	:param Shape:
	:type Shape: TopoDS_Shape &
	:param Mesh:
	:type Mesh: Handle_StlMesh_Mesh &
	:rtype: void
") RetrieveMesh;
		static void RetrieveMesh (const TopoDS_Shape & Shape,const Handle_StlMesh_Mesh & Mesh);
};


%extend StlTransfer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
