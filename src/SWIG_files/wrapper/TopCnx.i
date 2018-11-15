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
%define TOPCNXDOCSTRING
"This algorithm provides algorithms to computes
transitions when many interferences occurs at the
same place on a shape.

An interference is an intersection on a shape (i.e
a vertex on an edge or an edge on a face) with
data about  the transition (how the shape is
crossing the  boundary where the  intersection
occurs).

There   are   three algorithms  to process
interferences :

* EdgeFaceTransition : To process interferences on
an adge crossing other edges on the boundary of a
face.

* EdgeSolidTransition : To  process interferences
on an  edge crossing faces  and edges on the
boundary of a solid.

* FaceSolidTransition : To process interferences
on a face crossing other faces on the boundary of
a solid.

This package relies on the TopTrans package for
the geometric computations.
"
%enddef
%module (package="OCC.Core", docstring=TOPCNXDOCSTRING) TopCnx

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


%include TopCnx_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */


%nodefaultctor TopCnx_EdgeFaceTransition;
class TopCnx_EdgeFaceTransition {
	public:
		%feature("compactdefaultargs") TopCnx_EdgeFaceTransition;
		%feature("autodoc", "	* Creates an empty algorithm.

	:rtype: None
") TopCnx_EdgeFaceTransition;
		 TopCnx_EdgeFaceTransition ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Initialize the algorithm with the local description of the edge.

	:param Tgt:
	:type Tgt: gp_Dir
	:param Norm:
	:type Norm: gp_Dir
	:param Curv:
	:type Curv: float
	:rtype: None
") Reset;
		void Reset (const gp_Dir & Tgt,const gp_Dir & Norm,const Standard_Real Curv);
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Initialize the algorithm with a linear Edge.

	:param Tgt:
	:type Tgt: gp_Dir
	:rtype: None
") Reset;
		void Reset (const gp_Dir & Tgt);
		%feature("compactdefaultargs") AddInterference;
		%feature("autodoc", "	* Add a curve element to the boundary. Or is the orientation of the interference on the boundary curve. Tr is the transition of the interference. BTr is the boundary transition of the interference.

	:param Tole:
	:type Tole: float
	:param Tang:
	:type Tang: gp_Dir
	:param Norm:
	:type Norm: gp_Dir
	:param Curv:
	:type Curv: float
	:param Or:
	:type Or: TopAbs_Orientation
	:param Tr:
	:type Tr: TopAbs_Orientation
	:param BTr:
	:type BTr: TopAbs_Orientation
	:rtype: None
") AddInterference;
		void AddInterference (const Standard_Real Tole,const gp_Dir & Tang,const gp_Dir & Norm,const Standard_Real Curv,const TopAbs_Orientation Or,const TopAbs_Orientation Tr,const TopAbs_Orientation BTr);
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	* Returns the current cumulated transition.

	:rtype: TopAbs_Orientation
") Transition;
		TopAbs_Orientation Transition ();
		%feature("compactdefaultargs") BoundaryTransition;
		%feature("autodoc", "	* Returns the current cumulated BoundaryTransition.

	:rtype: TopAbs_Orientation
") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition ();
};


%extend TopCnx_EdgeFaceTransition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
