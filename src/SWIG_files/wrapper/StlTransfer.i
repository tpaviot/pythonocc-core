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
%module (package="OCC") StlTransfer

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

%include StlTransfer_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(stltransfer) StlTransfer;
%nodefaultctor StlTransfer;
class StlTransfer {
	public:
		%feature("autodoc", "	:param Shape:
	:type Shape: TopoDS_Shape &
	:param Deflection:
	:type Deflection: float
	:param InParallel:
	:type InParallel: bool
	:param Mesh:
	:type Mesh: Handle_StlMesh_Mesh &
	:rtype: void
") BuildIncrementalMesh;
		static void BuildIncrementalMesh (const TopoDS_Shape & Shape,const Standard_Real Deflection,const Standard_Boolean InParallel,const Handle_StlMesh_Mesh & Mesh);
};


%feature("shadow") StlTransfer::~StlTransfer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend StlTransfer {
	void _kill_pointed() {
		delete $self;
	}
};
