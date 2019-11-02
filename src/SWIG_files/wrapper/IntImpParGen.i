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

- time : 2019-11-03 11:38:13
- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define INTIMPPARGENDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=INTIMPPARGENDOCSTRING) IntImpParGen

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


%include IntImpParGen_headers.i

/* public enums */
/* end public enums declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/* handles */
/* end handles declaration */

%rename(intimppargen) IntImpParGen;
class IntImpParGen {
	public:
		%feature("compactdefaultargs") DeterminePosition;
		%feature("autodoc", "	:param Pos1:
	:type Pos1: IntRes2d_Position &
	:param Dom1:
	:type Dom1: IntRes2d_Domain &
	:param P1:
	:type P1: gp_Pnt2d
	:param Tol:
	:type Tol: float
	:rtype: void
") DeterminePosition;
		static void DeterminePosition (IntRes2d_Position & Pos1,const IntRes2d_Domain & Dom1,const gp_Pnt2d & P1,const Standard_Real Tol);
		%feature("compactdefaultargs") DetermineTransition;
		%feature("autodoc", "	* Template class for an implicit curve. Math function, instantiated inside the Intersector. Tool used by the package IntCurve and IntImpParGen

	:param Pos1:
	:type Pos1: IntRes2d_Position
	:param Tan1:
	:type Tan1: gp_Vec2d
	:param Norm1:
	:type Norm1: gp_Vec2d
	:param Trans1:
	:type Trans1: IntRes2d_Transition &
	:param Pos2:
	:type Pos2: IntRes2d_Position
	:param Tan2:
	:type Tan2: gp_Vec2d
	:param Norm2:
	:type Norm2: gp_Vec2d
	:param Trans2:
	:type Trans2: IntRes2d_Transition &
	:param Tol:
	:type Tol: float
	:rtype: void
") DetermineTransition;
		static void DetermineTransition (const IntRes2d_Position Pos1,gp_Vec2d & Tan1,const gp_Vec2d & Norm1,IntRes2d_Transition & Trans1,const IntRes2d_Position Pos2,gp_Vec2d & Tan2,const gp_Vec2d & Norm2,IntRes2d_Transition & Trans2,const Standard_Real Tol);
		%feature("compactdefaultargs") DetermineTransition;
		%feature("autodoc", "	:param Pos1:
	:type Pos1: IntRes2d_Position
	:param Tan1:
	:type Tan1: gp_Vec2d
	:param Trans1:
	:type Trans1: IntRes2d_Transition &
	:param Pos2:
	:type Pos2: IntRes2d_Position
	:param Tan2:
	:type Tan2: gp_Vec2d
	:param Trans2:
	:type Trans2: IntRes2d_Transition &
	:param Tol:
	:type Tol: float
	:rtype: bool
") DetermineTransition;
		static Standard_Boolean DetermineTransition (const IntRes2d_Position Pos1,gp_Vec2d & Tan1,IntRes2d_Transition & Trans1,const IntRes2d_Position Pos2,gp_Vec2d & Tan2,IntRes2d_Transition & Trans2,const Standard_Real Tol);
		%feature("compactdefaultargs") NormalizeOnDomain;
		%feature("autodoc", "	:param Par1:
	:type Par1: float &
	:param Dom1:
	:type Dom1: IntRes2d_Domain &
	:rtype: float
") NormalizeOnDomain;
		static Standard_Real NormalizeOnDomain (Standard_Real &OutValue,const IntRes2d_Domain & Dom1);
};


%extend IntImpParGen {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
