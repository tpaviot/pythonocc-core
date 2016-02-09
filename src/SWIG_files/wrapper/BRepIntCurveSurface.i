/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include BRepIntCurveSurface_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepIntCurveSurface_Inter;
class BRepIntCurveSurface_Inter {
	public:
		%feature("compactdefaultargs") BRepIntCurveSurface_Inter;
		%feature("autodoc", "	* Empty constructor;

	:rtype: None
") BRepIntCurveSurface_Inter;
		 BRepIntCurveSurface_Inter ();
		%feature("compactdefaultargs") Init;
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
		%feature("compactdefaultargs") Init;
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
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* returns True if there is a current face.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Sets the explorer to the next face.

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* returns the current Intersection point.

	:rtype: IntCurveSurface_IntersectionPoint
") Point;
		IntCurveSurface_IntersectionPoint Point ();
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	* returns the current geometric Point

	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt ();
		%feature("compactdefaultargs") U;
		%feature("autodoc", "	* returns the U parameter of the current point on the current face.

	:rtype: float
") U;
		Standard_Real U ();
		%feature("compactdefaultargs") V;
		%feature("autodoc", "	* returns the V parameter of the current point on the current face.

	:rtype: float
") V;
		Standard_Real V ();
		%feature("compactdefaultargs") W;
		%feature("autodoc", "	* returns the parameter of the current point on the curve.

	:rtype: float
") W;
		Standard_Real W ();
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	* returns the current state (IN or ON)

	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	* returns the transition of the line on the surface (IN or OUT or UNKNOWN)

	:rtype: IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* returns the current face.

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
};


