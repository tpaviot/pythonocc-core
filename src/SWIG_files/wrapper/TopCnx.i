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
%module (package="OCC") TopCnx

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

%include TopCnx_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor TopCnx_EdgeFaceTransition;
class TopCnx_EdgeFaceTransition {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty algorithm.") TopCnx_EdgeFaceTransition;
		 TopCnx_EdgeFaceTransition ();
		%feature("autodoc", "Args:
	Tgt(gp_Dir)
	Norm(gp_Dir)
	Curv(Standard_Real)

Returns:
	None

Initialize  the     algorithm    with the    local  
         description of the edge.") Reset;
		void Reset (const gp_Dir & Tgt,const gp_Dir & Norm,const Standard_Real Curv);
		%feature("autodoc", "Args:
	Tgt(gp_Dir)

Returns:
	None

Initialize the algorithm with a linear Edge.") Reset;
		void Reset (const gp_Dir & Tgt);
		%feature("autodoc", "Args:
	Tole(Standard_Real)
	Tang(gp_Dir)
	Norm(gp_Dir)
	Curv(Standard_Real)
	Or(TopAbs_Orientation)
	Tr(TopAbs_Orientation)
	BTr(TopAbs_Orientation)

Returns:
	None

Add a curve  element to the  boundary.  Or  is the  
         orientation of   the interference on  the boundary  
         curve. Tr is  the transition  of the interference.  
         BTr     is   the    boundary  transition    of the  
         interference.") AddInterference;
		void AddInterference (const Standard_Real Tole,const gp_Dir & Tang,const gp_Dir & Norm,const Standard_Real Curv,const TopAbs_Orientation Or,const TopAbs_Orientation Tr,const TopAbs_Orientation BTr);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

Returns the current cumulated transition.") Transition;
		TopAbs_Orientation Transition ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

Returns the current cumulated BoundaryTransition.") BoundaryTransition;
		TopAbs_Orientation BoundaryTransition ();
};


%feature("shadow") TopCnx_EdgeFaceTransition::~TopCnx_EdgeFaceTransition %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopCnx_EdgeFaceTransition {
	void _kill_pointed() {
		delete $self;
	}
};
