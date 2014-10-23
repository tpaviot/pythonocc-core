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
		%feature("autodoc", "	* Empty constructor;

	:rtype: None
") BRepIntCurveSurface_Inter;
		 BRepIntCurveSurface_Inter ();
		%feature("autodoc", "	* Load the Shape, the curve and initialize the tolerance used for the classification.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param Cu:
	:type Cu: GeomAdaptor_Curve &
	:param Tol:
	:type Tol: float
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & Sh,const GeomAdaptor_Curve & Cu,const Standard_Real Tol);
		%feature("autodoc", "	* Load the Shape, the curve and initialize the tolerance used for the classification.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param L:
	:type L: gp_Lin
	:param Tol:
	:type Tol: float
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & Sh,const gp_Lin & L,const Standard_Real Tol);
		%feature("autodoc", "	* returns True if there is a current face.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	* Sets the explorer to the next face.

	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	* returns the current Intersection point.

	:rtype: IntCurveSurface_IntersectionPoint
") Point;
		IntCurveSurface_IntersectionPoint Point ();
		%feature("autodoc", "	* returns the current geometric Point

	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt ();
		%feature("autodoc", "	* returns the U parameter of the current point on the current face.

	:rtype: float
") U;
		Standard_Real U ();
		%feature("autodoc", "	* returns the V parameter of the current point on the current face.

	:rtype: float
") V;
		Standard_Real V ();
		%feature("autodoc", "	* returns the parameter of the current point on the curve.

	:rtype: float
") W;
		Standard_Real W ();
		%feature("autodoc", "	* returns the current state (IN or ON)

	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("autodoc", "	* returns the transition of the line on the surface (IN or OUT or UNKNOWN)

	:rtype: IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition ();
		%feature("autodoc", "	* returns the current face.

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
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
