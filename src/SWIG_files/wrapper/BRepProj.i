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
%module BRepProj

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

%include BRepProj_required_python_modules.i
%include BRepProj_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepProj_Projection;
class BRepProj_Projection {
	public:
		%feature("autodoc", "Args:
	Wire(TopoDS_Shape)
	Shape(TopoDS_Shape)
	D(gp_Dir)

Returns:
	None

Makes a Cylindrical projection of Wire om Shape") BRepProj_Projection;
		 BRepProj_Projection (const TopoDS_Shape & Wire,const TopoDS_Shape & Shape,const gp_Dir & D);
		%feature("autodoc", "Args:
	Wire(TopoDS_Shape)
	Shape(TopoDS_Shape)
	P(gp_Pnt)

Returns:
	None

Makes a Conical projection of Wire om Shape") BRepProj_Projection;
		 BRepProj_Projection (const TopoDS_Shape & Wire,const TopoDS_Shape & Shape,const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns False if the section failed") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Resets the iterator by resulting wires.") Init;
		void Init ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there is a current result wire") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Move to the next result wire.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

Returns the current result wire.") Current;
		TopoDS_Wire Current ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Compound

Returns the complete result as compound of wires.") Shape;
		TopoDS_Compound Shape ();
};


%feature("shadow") BRepProj_Projection::~BRepProj_Projection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepProj_Projection {
	void _kill_pointed() {
		delete $self;
	}
};
