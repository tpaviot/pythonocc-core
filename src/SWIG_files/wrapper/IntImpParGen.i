/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
%define INTIMPPARGENDOCSTRING
"IntImpParGen module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_intimppargen.html"
%enddef
%module (package="OCC.Core", docstring=INTIMPPARGENDOCSTRING) IntImpParGen


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<IntImpParGen_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IntRes2d_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IntRes2d.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************
* class IntImpParGen *
*********************/
%rename(intimppargen) IntImpParGen;
class IntImpParGen {
	public:
		/****** IntImpParGen::DeterminePosition ******/
		/****** md5 signature: 3b52aa210a313a47b6632ce0fd9c3e8e ******/
		%feature("compactdefaultargs") DeterminePosition;
		%feature("autodoc", "
Parameters
----------
Pos1: IntRes2d_Position
Dom1: IntRes2d_Domain
P1: gp_Pnt2d
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") DeterminePosition;
		static void DeterminePosition(IntRes2d_Position & Pos1, const IntRes2d_Domain & Dom1, const gp_Pnt2d & P1, const double Tol);

		/****** IntImpParGen::DetermineTransition ******/
		/****** md5 signature: d53289e899f59b20d1ea2d5a46516cc9 ******/
		%feature("compactdefaultargs") DetermineTransition;
		%feature("autodoc", "
Parameters
----------
Pos1: IntRes2d_Position
Tan1: gp_Vec2d
Norm1: gp_Vec2d
Trans1: IntRes2d_Transition
Pos2: IntRes2d_Position
Tan2: gp_Vec2d
Norm2: gp_Vec2d
Trans2: IntRes2d_Transition
Tol: double

Return
-------
None

Description
-----------
Template class for an implicit curve. Math function, instantiated inside the Intersector. Tool used by the package IntCurve and IntImpParGen.
") DetermineTransition;
		static void DetermineTransition(const IntRes2d_Position Pos1, gp_Vec2d & Tan1, const gp_Vec2d & Norm1, IntRes2d_Transition & Trans1, const IntRes2d_Position Pos2, gp_Vec2d & Tan2, const gp_Vec2d & Norm2, IntRes2d_Transition & Trans2, const double Tol);

		/****** IntImpParGen::DetermineTransition ******/
		/****** md5 signature: 4a56c8d2b82288479a5fd0fc7ed5da4b ******/
		%feature("compactdefaultargs") DetermineTransition;
		%feature("autodoc", "
Parameters
----------
Pos1: IntRes2d_Position
Tan1: gp_Vec2d
Trans1: IntRes2d_Transition
Pos2: IntRes2d_Position
Tan2: gp_Vec2d
Trans2: IntRes2d_Transition
Tol: double

Return
-------
bool

Description
-----------
No available documentation.
") DetermineTransition;
		static bool DetermineTransition(const IntRes2d_Position Pos1, gp_Vec2d & Tan1, IntRes2d_Transition & Trans1, const IntRes2d_Position Pos2, gp_Vec2d & Tan2, IntRes2d_Transition & Trans2, const double Tol);

		/****** IntImpParGen::NormalizeOnDomain ******/
		/****** md5 signature: 93345cd0b84ce0c17339b7fbb4a11d7e ******/
		%feature("compactdefaultargs") NormalizeOnDomain;
		%feature("autodoc", "
Parameters
----------
Dom1: IntRes2d_Domain

Return
-------
Par1: double

Description
-----------
No available documentation.
") NormalizeOnDomain;
		static double NormalizeOnDomain(Standard_Real &OutValue, const IntRes2d_Domain & Dom1);

};


%extend IntImpParGen {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntImpParGen_ImpTool *
*****************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class IntImpParGen_ImpTool:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def intimppargen_DeterminePosition(*args):
	return intimppargen.DeterminePosition(*args)

@deprecated
def intimppargen_DetermineTransition(*args):
	return intimppargen.DetermineTransition(*args)

@deprecated
def intimppargen_DetermineTransition(*args):
	return intimppargen.DetermineTransition(*args)

@deprecated
def intimppargen_NormalizeOnDomain(*args):
	return intimppargen.NormalizeOnDomain(*args)

}
