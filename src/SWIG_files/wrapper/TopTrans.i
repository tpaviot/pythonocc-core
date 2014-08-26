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
%module TopTrans

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

%include TopTrans_required_python_modules.i
%include TopTrans_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor TopTrans_Array2OfOrientation;
class TopTrans_Array2OfOrientation {
	public:
		%feature("autodoc", "Args:
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopTrans_Array2OfOrientation;
		 TopTrans_Array2OfOrientation (const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	Item(TopAbs_Orientation)
	R1(Standard_Integer)
	R2(Standard_Integer)
	C1(Standard_Integer)
	C2(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") TopTrans_Array2OfOrientation;
		 TopTrans_Array2OfOrientation (const TopAbs_Orientation & Item,const Standard_Integer R1,const Standard_Integer R2,const Standard_Integer C1,const Standard_Integer C2);
		%feature("autodoc", "Args:
	V(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopAbs_Orientation & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	Other(TopTrans_Array2OfOrientation)

Returns:
	TopTrans_Array2OfOrientation

No detailed docstring for this function.") Assign;
		const TopTrans_Array2OfOrientation & Assign (const TopTrans_Array2OfOrientation & Other);
		%feature("autodoc", "Args:
	Other(TopTrans_Array2OfOrientation)

Returns:
	TopTrans_Array2OfOrientation

No detailed docstring for this function.") operator=;
		const TopTrans_Array2OfOrientation & operator = (const TopTrans_Array2OfOrientation & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") ColLength;
		Standard_Integer ColLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") RowLength;
		Standard_Integer RowLength ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerCol;
		Standard_Integer LowerCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LowerRow;
		Standard_Integer LowerRow ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperCol;
		Standard_Integer UpperCol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UpperRow;
		Standard_Integer UpperRow ();
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)
	Value(TopAbs_Orientation)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Row,const Standard_Integer Col,const TopAbs_Orientation & Value);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	TopAbs_Orientation

No detailed docstring for this function.") Value;
		const TopAbs_Orientation & Value (const Standard_Integer Row,const Standard_Integer Col);
		%feature("autodoc", "Args:
	Row(Standard_Integer)
	Col(Standard_Integer)

Returns:
	TopAbs_Orientation

No detailed docstring for this function.") ChangeValue;
		TopAbs_Orientation & ChangeValue (const Standard_Integer Row,const Standard_Integer Col);
};


%feature("shadow") TopTrans_Array2OfOrientation::~TopTrans_Array2OfOrientation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTrans_Array2OfOrientation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTrans_CurveTransition;
class TopTrans_CurveTransition {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Create an empty  Curve Transition.") TopTrans_CurveTransition;
		 TopTrans_CurveTransition ();
		%feature("autodoc", "Args:
	Tgt(gp_Dir)
	Norm(gp_Dir)
	Curv(Standard_Real)

Returns:
	None

Initialize a Transition with the local description  
         of a Curve.") Reset;
		void Reset (const gp_Dir & Tgt,const gp_Dir & Norm,const Standard_Real Curv);
		%feature("autodoc", "Args:
	Tgt(gp_Dir)

Returns:
	None

Initialize a Transition with the local description  
         of a straigth line.") Reset;
		void Reset (const gp_Dir & Tgt);
		%feature("autodoc", "Args:
	Tole(Standard_Real)
	Tang(gp_Dir)
	Norm(gp_Dir)
	Curv(Standard_Real)
	S(TopAbs_Orientation)
	Or(TopAbs_Orientation)

Returns:
	None

Add  a curve element to the  boundary.    If Or is  
         REVERSED  the curve  is   before the intersection,  
         else if  Or  is FORWARD  the   curv  is after  the  
         intersection   and    if   Or  is   INTERNAL   the  
         intersection is in the middle of the curv.") Compare;
		void Compare (const Standard_Real Tole,const gp_Dir & Tang,const gp_Dir & Norm,const Standard_Real Curv,const TopAbs_Orientation S,const TopAbs_Orientation Or);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

returns   the  state   of  the   curve  before the  
         intersection, this is the position relative to the  
         boundary of a point very close to the intersection  
         on the negative side of the tangent.") StateBefore;
		TopAbs_State StateBefore ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

returns  the    state of  the  curve   after   the  
         intersection, this is the position relative to the  
         boundary of a point very close to the intersection  
         on the positive side of the tangent.") StateAfter;
		TopAbs_State StateAfter ();
};


%feature("shadow") TopTrans_CurveTransition::~TopTrans_CurveTransition %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTrans_CurveTransition {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopTrans_SurfaceTransition;
class TopTrans_SurfaceTransition {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Create an empty Surface Transition.") TopTrans_SurfaceTransition;
		 TopTrans_SurfaceTransition ();
		%feature("autodoc", "Args:
	Tgt(gp_Dir)
	Norm(gp_Dir)
	MaxD(gp_Dir)
	MinD(gp_Dir)
	MaxCurv(Standard_Real)
	MinCurv(Standard_Real)

Returns:
	None

Initialize  a  Surface Transition with the local  
         description of the intersection curve and of the  
         reference surface.  
         PREQUESITORY : Norm oriented OUTSIDE 'geometric matter'") Reset;
		void Reset (const gp_Dir & Tgt,const gp_Dir & Norm,const gp_Dir & MaxD,const gp_Dir & MinD,const Standard_Real MaxCurv,const Standard_Real MinCurv);
		%feature("autodoc", "Args:
	Tgt(gp_Dir)
	Norm(gp_Dir)

Returns:
	None

Initialize  a  Surface Transition  with the  local  
         description of a straight line.") Reset;
		void Reset (const gp_Dir & Tgt,const gp_Dir & Norm);
		%feature("autodoc", "Args:
	Tole(Standard_Real)
	Norm(gp_Dir)
	MaxD(gp_Dir)
	MinD(gp_Dir)
	MaxCurv(Standard_Real)
	MinCurv(Standard_Real)
	S(TopAbs_Orientation)
	O(TopAbs_Orientation)

Returns:
	None

Add a face element to the boundary.  
 
         - S defines topological orientation for the face :  
         S FORWARD means: along the intersection curve on the  
         reference surface, transition states while crossing  
         the face are OUT,IN.  
         S REVERSED means states are IN,OUT.  
         S INTERNAL means states are IN,IN.  
 
         - O defines curve's position on face :  
         O FORWARD means the face is before the intersection  
         O REVERSED means the face is AFTER  
         O INTERNAL means the curve intersection is in the face.  
         PREQUESITORY : Norm oriented OUTSIDE 'geometric matter'") Compare;
		void Compare (const Standard_Real Tole,const gp_Dir & Norm,const gp_Dir & MaxD,const gp_Dir & MinD,const Standard_Real MaxCurv,const Standard_Real MinCurv,const TopAbs_Orientation S,const TopAbs_Orientation O);
		%feature("autodoc", "Args:
	Tole(Standard_Real)
	Norm(gp_Dir)
	S(TopAbs_Orientation)
	O(TopAbs_Orientation)

Returns:
	None

Add a plane or a cylindric face to the boundary.") Compare;
		void Compare (const Standard_Real Tole,const gp_Dir & Norm,const TopAbs_Orientation S,const TopAbs_Orientation O);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

Returns the state of the reference surface before  
         the interference, this is the position relative to  
         the surface of a  point very close to the intersection  
         on the negative side of the tangent.") StateBefore;
		TopAbs_State StateBefore ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

Returns the state of the reference surface after  
         interference, this is the position relative to the  
         surface of a point very  close to the intersection  
         on the positive side of the tangent.") StateAfter;
		TopAbs_State StateAfter ();
		%feature("autodoc", "Args:
	Tran(TopAbs_Orientation)

Returns:
	static TopAbs_State

No detailed docstring for this function.") GetBefore;
		static TopAbs_State GetBefore (const TopAbs_Orientation Tran);
		%feature("autodoc", "Args:
	Tran(TopAbs_Orientation)

Returns:
	static TopAbs_State

No detailed docstring for this function.") GetAfter;
		static TopAbs_State GetAfter (const TopAbs_Orientation Tran);
};


%feature("shadow") TopTrans_SurfaceTransition::~TopTrans_SurfaceTransition %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopTrans_SurfaceTransition {
	void _kill_pointed() {
		delete $self;
	}
};
