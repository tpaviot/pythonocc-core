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
%module (package="OCC") IntImpParGen

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

%include IntImpParGen_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(intimppargen) IntImpParGen;
%nodefaultctor IntImpParGen;
class IntImpParGen {
	public:
		%feature("autodoc", "Args:
	Pos1(IntRes2d_Position)
	Tan1(gp_Vec2d)
	Norm1(gp_Vec2d)
	Trans1(IntRes2d_Transition)
	Pos2(IntRes2d_Position)
	Tan2(gp_Vec2d)
	Norm2(gp_Vec2d)
	Trans2(IntRes2d_Transition)
	Tol(Standard_Real)

Returns:
	static void

Template class for an implicit  curve.  Template class for a tool on a parameterised curve.  Math function, instantiated inside the Intersector.  Tool used by the package IntCurve and IntImpParGen") DetermineTransition;
		static void DetermineTransition (const IntRes2d_Position Pos1,gp_Vec2d & Tan1,const gp_Vec2d & Norm1,IntRes2d_Transition & Trans1,const IntRes2d_Position Pos2,gp_Vec2d & Tan2,const gp_Vec2d & Norm2,IntRes2d_Transition & Trans2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Pos1(IntRes2d_Position)
	Tan1(gp_Vec2d)
	Trans1(IntRes2d_Transition)
	Pos2(IntRes2d_Position)
	Tan2(gp_Vec2d)
	Trans2(IntRes2d_Transition)
	Tol(Standard_Real)

Returns:
	static Standard_Boolean

No detailed docstring for this function.") DetermineTransition;
		static Standard_Boolean DetermineTransition (const IntRes2d_Position Pos1,gp_Vec2d & Tan1,IntRes2d_Transition & Trans1,const IntRes2d_Position Pos2,gp_Vec2d & Tan2,IntRes2d_Transition & Trans2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Pos1(IntRes2d_Position)
	Dom1(IntRes2d_Domain)
	P1(gp_Pnt2d)
	Tol(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") DeterminePosition;
		static void DeterminePosition (IntRes2d_Position & Pos1,const IntRes2d_Domain & Dom1,const gp_Pnt2d & P1,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Par1(Standard_Real)
	Dom1(IntRes2d_Domain)

Returns:
	static Standard_Real

No detailed docstring for this function.") NormalizeOnDomain;
		static Standard_Real NormalizeOnDomain (Standard_Real &OutValue,const IntRes2d_Domain & Dom1);
};


%feature("shadow") IntImpParGen::~IntImpParGen %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IntImpParGen {
	void _kill_pointed() {
		delete $self;
	}
};
