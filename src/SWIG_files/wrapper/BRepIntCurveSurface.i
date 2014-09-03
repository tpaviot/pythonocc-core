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
%module (package="OCC") BRepIntCurveSurface

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

%include BRepIntCurveSurface_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepIntCurveSurface_Inter;
class BRepIntCurveSurface_Inter {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor;") BRepIntCurveSurface_Inter;
		 BRepIntCurveSurface_Inter ();
		%feature("autodoc", "Args:
	Sh(TopoDS_Shape)
	Cu(GeomAdaptor_Curve)
	Tol(Standard_Real)

Returns:
	None

Load the Shape, the curve  and initialize the  
          tolerance used for the classification.") Init;
		void Init (const TopoDS_Shape & Sh,const GeomAdaptor_Curve & Cu,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Sh(TopoDS_Shape)
	L(gp_Lin)
	Tol(Standard_Real)

Returns:
	None

Load the Shape, the curve  and initialize the  
          tolerance used for the classification.") Init;
		void Init (const TopoDS_Shape & Sh,const gp_Lin & L,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

returns True if there is a current face.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the explorer to the next face.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	IntCurveSurface_IntersectionPoint

returns the current Intersection point.") Point;
		IntCurveSurface_IntersectionPoint Point ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

returns the current geometric Point") Pnt;
		const gp_Pnt & Pnt ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the U parameter of the current point  
         on the current face.") U;
		Standard_Real U ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the V parameter of the current point  
         on the current face.") V;
		Standard_Real V ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returns the  parameter of the current point  
         on the curve.") W;
		Standard_Real W ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_State

returns the current state  (IN or ON)") State;
		TopAbs_State State ();
		%feature("autodoc", "Args:
	None
Returns:
	IntCurveSurface_TransitionOnCurve

returns the transition of the line on the surface (IN or OUT or UNKNOWN)") Transition;
		IntCurveSurface_TransitionOnCurve Transition ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

returns the current face.") Face;
		const TopoDS_Face & Face ();
};


%feature("shadow") BRepIntCurveSurface_Inter::~BRepIntCurveSurface_Inter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepIntCurveSurface_Inter {
	void _kill_pointed() {
		delete $self;
	}
};
