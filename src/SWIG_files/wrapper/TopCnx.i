/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define TOPCNXDOCSTRING
"TopCnx module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_topcnx.html"
%enddef
%module (package="OCC.Core", docstring=TOPCNXDOCSTRING) TopCnx


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
#include<TopCnx_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TopAbs_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import TopAbs.i

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

/**********************************
* class TopCnx_EdgeFaceTransition *
**********************************/
class TopCnx_EdgeFaceTransition {
	public:
		/****** TopCnx_EdgeFaceTransition::TopCnx_EdgeFaceTransition ******/
		/****** md5 signature: 1e1067a755e152c2af0a73a891072d00 ******/
		%feature("compactdefaultargs") TopCnx_EdgeFaceTransition;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty algorithm.
") TopCnx_EdgeFaceTransition;
		 TopCnx_EdgeFaceTransition();

		/****** TopCnx_EdgeFaceTransition::AddInterference ******/
		/****** md5 signature: 65f7e21e78a92b664019e6880e4b200c ******/
		%feature("compactdefaultargs") AddInterference;
		%feature("autodoc", "
Parameters
----------
Tole: float
Tang: gp_Dir
Norm: gp_Dir
Curv: float
Or: TopAbs_Orientation
Tr: TopAbs_Orientation
BTr: TopAbs_Orientation

Return
-------
None

Description
-----------
Add a curve element to the boundary. Or is the orientation of the interference on the boundary curve. Tr is the transition of the interference. BTr is the boundary transition of the interference.
") AddInterference;
		void AddInterference(const Standard_Real Tole, const gp_Dir & Tang, const gp_Dir & Norm, const Standard_Real Curv, const TopAbs_Orientation Or, const TopAbs_Orientation Tr, const TopAbs_Orientation BTr);

		/****** TopCnx_EdgeFaceTransition::BoundaryTransition ******/
		/****** md5 signature: 74f690bd95102dfac559cd0dc3a25347 ******/
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
Returns the current cumulated BoundaryTransition.
") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition();

		/****** TopCnx_EdgeFaceTransition::Reset ******/
		/****** md5 signature: 41688a7deec782701e541aa14a291d6c ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
Tgt: gp_Dir
Norm: gp_Dir
Curv: float

Return
-------
None

Description
-----------
Initialize the algorithm with the local description of the edge.
") Reset;
		void Reset(const gp_Dir & Tgt, const gp_Dir & Norm, const Standard_Real Curv);

		/****** TopCnx_EdgeFaceTransition::Reset ******/
		/****** md5 signature: 477dbad6632871c94ebb699631f93444 ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "
Parameters
----------
Tgt: gp_Dir

Return
-------
None

Description
-----------
Initialize the algorithm with a linear Edge.
") Reset;
		void Reset(const gp_Dir & Tgt);

		/****** TopCnx_EdgeFaceTransition::Transition ******/
		/****** md5 signature: 054591dc4fd0ee1810f89fdf4fe89b33 ******/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
Returns the current cumulated transition.
") Transition;
		TopAbs_Orientation Transition();

};


%extend TopCnx_EdgeFaceTransition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
