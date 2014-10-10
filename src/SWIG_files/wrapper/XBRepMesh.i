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
%module XBRepMesh

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

%include XBRepMesh_required_python_modules.i
%include XBRepMesh_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(xbrepmesh) XBRepMesh;
%nodefaultctor XBRepMesh;
class XBRepMesh {
	public:
		%feature("autodoc", "Args:
	theShape(TopoDS_Shape)
	theDeflection(Standard_Real)
	theAngle(Standard_Real)
	theAlgo(BRepMesh_PDiscretRoot)

Returns:
	static Standard_Integer

No detailed docstring for this function.") Discret;
		static Standard_Integer Discret (const TopoDS_Shape & theShape,const Standard_Real theDeflection,const Standard_Real theAngle,BRepMesh_PDiscretRoot & theAlgo);
};


%feature("shadow") XBRepMesh::~XBRepMesh %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend XBRepMesh {
	void _kill_pointed() {
		delete $self;
	}
};
