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
%module (package="OCC") HLRAppli

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

%include HLRAppli_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor HLRAppli_ReflectLines;
class HLRAppli_ReflectLines {
	public:
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	None

Constructor") HLRAppli_ReflectLines;
		 HLRAppli_ReflectLines (const TopoDS_Shape & aShape);
		%feature("autodoc", "Args:
	Nx(Standard_Real)
	Ny(Standard_Real)
	Nz(Standard_Real)
	XAt(Standard_Real)
	YAt(Standard_Real)
	ZAt(Standard_Real)
	XUp(Standard_Real)
	YUp(Standard_Real)
	ZUp(Standard_Real)

Returns:
	None

Sets the normal to the plane of visualisation,  
         the coordinates of the view point and  
         the coordinates of the vertical direction vector.") SetAxes;
		void SetAxes (const Standard_Real Nx,const Standard_Real Ny,const Standard_Real Nz,const Standard_Real XAt,const Standard_Real YAt,const Standard_Real ZAt,const Standard_Real XUp,const Standard_Real YUp,const Standard_Real ZUp);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns resulting compound of reflect lines  
         represented by edges in 3d") GetResult;
		TopoDS_Shape GetResult ();
};


%feature("shadow") HLRAppli_ReflectLines::~HLRAppli_ReflectLines %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRAppli_ReflectLines {
	void _kill_pointed() {
		delete $self;
	}
};
