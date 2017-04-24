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
%module (package="OCC") GeomToStep

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


%include GeomToStep_headers.i


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

class GeomToStep_Root {
	public:
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
};


%extend GeomToStep_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeAxis1Placement;
class GeomToStep_MakeAxis1Placement : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax1
	:rtype: None
") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement (const gp_Ax1 & A);
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2d
	:rtype: None
") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement (const gp_Ax2d & A);
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", "	:param A:
	:type A: Handle_Geom_Axis1Placement &
	:rtype: None
") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement (const Handle_Geom_Axis1Placement & A);
		%feature("compactdefaultargs") GeomToStep_MakeAxis1Placement;
		%feature("autodoc", "	:param A:
	:type A: Handle_Geom2d_AxisPlacement &
	:rtype: None
") GeomToStep_MakeAxis1Placement;
		 GeomToStep_MakeAxis1Placement (const Handle_Geom2d_AxisPlacement & A);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Axis1Placement
") Value;
		Handle_StepGeom_Axis1Placement Value ();
};


%extend GeomToStep_MakeAxis1Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeAxis2Placement2d;
class GeomToStep_MakeAxis2Placement2d : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement2d;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2
	:rtype: None
") GeomToStep_MakeAxis2Placement2d;
		 GeomToStep_MakeAxis2Placement2d (const gp_Ax2 & A);
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement2d;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax22d
	:rtype: None
") GeomToStep_MakeAxis2Placement2d;
		 GeomToStep_MakeAxis2Placement2d (const gp_Ax22d & A);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Axis2Placement2d
") Value;
		Handle_StepGeom_Axis2Placement2d Value ();
};


%extend GeomToStep_MakeAxis2Placement2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeAxis2Placement3d;
class GeomToStep_MakeAxis2Placement3d : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", "	:rtype: None
") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d ();
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2
	:rtype: None
") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d (const gp_Ax2 & A);
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax3
	:rtype: None
") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d (const gp_Ax3 & A);
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d (const gp_Trsf & T);
		%feature("compactdefaultargs") GeomToStep_MakeAxis2Placement3d;
		%feature("autodoc", "	:param A:
	:type A: Handle_Geom_Axis2Placement &
	:rtype: None
") GeomToStep_MakeAxis2Placement3d;
		 GeomToStep_MakeAxis2Placement3d (const Handle_Geom_Axis2Placement & A);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Axis2Placement3d
") Value;
		Handle_StepGeom_Axis2Placement3d Value ();
};


%extend GeomToStep_MakeAxis2Placement3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeBSplineCurveWithKnots;
class GeomToStep_MakeBSplineCurveWithKnots : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnots;
		%feature("autodoc", "	:param Bsplin:
	:type Bsplin: Handle_Geom_BSplineCurve &
	:rtype: None
") GeomToStep_MakeBSplineCurveWithKnots;
		 GeomToStep_MakeBSplineCurveWithKnots (const Handle_Geom_BSplineCurve & Bsplin);
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnots;
		%feature("autodoc", "	:param Bsplin:
	:type Bsplin: Handle_Geom2d_BSplineCurve &
	:rtype: None
") GeomToStep_MakeBSplineCurveWithKnots;
		 GeomToStep_MakeBSplineCurveWithKnots (const Handle_Geom2d_BSplineCurve & Bsplin);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_BSplineCurveWithKnots
") Value;
		Handle_StepGeom_BSplineCurveWithKnots Value ();
};


%extend GeomToStep_MakeBSplineCurveWithKnots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
class GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		%feature("autodoc", "	:param Bsplin:
	:type Bsplin: Handle_Geom_BSplineCurve &
	:rtype: None
") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		 GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve (const Handle_Geom_BSplineCurve & Bsplin);
		%feature("compactdefaultargs") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		%feature("autodoc", "	:param Bsplin:
	:type Bsplin: Handle_Geom2d_BSplineCurve &
	:rtype: None
") GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve;
		 GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve (const Handle_Geom2d_BSplineCurve & Bsplin);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve
") Value;
		Handle_StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve Value ();
};


%extend GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeBSplineSurfaceWithKnots;
class GeomToStep_MakeBSplineSurfaceWithKnots : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeBSplineSurfaceWithKnots;
		%feature("autodoc", "	:param Bsplin:
	:type Bsplin: Handle_Geom_BSplineSurface &
	:rtype: None
") GeomToStep_MakeBSplineSurfaceWithKnots;
		 GeomToStep_MakeBSplineSurfaceWithKnots (const Handle_Geom_BSplineSurface & Bsplin);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_BSplineSurfaceWithKnots
") Value;
		Handle_StepGeom_BSplineSurfaceWithKnots Value ();
};


%extend GeomToStep_MakeBSplineSurfaceWithKnots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface;
class GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface;
		%feature("autodoc", "	:param Bsplin:
	:type Bsplin: Handle_Geom_BSplineSurface &
	:rtype: None
") GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface;
		 GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface (const Handle_Geom_BSplineSurface & Bsplin);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface
") Value;
		Handle_StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface Value ();
};


%extend GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeBoundedCurve;
class GeomToStep_MakeBoundedCurve : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeBoundedCurve;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_BoundedCurve &
	:rtype: None
") GeomToStep_MakeBoundedCurve;
		 GeomToStep_MakeBoundedCurve (const Handle_Geom_BoundedCurve & C);
		%feature("compactdefaultargs") GeomToStep_MakeBoundedCurve;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_BoundedCurve &
	:rtype: None
") GeomToStep_MakeBoundedCurve;
		 GeomToStep_MakeBoundedCurve (const Handle_Geom2d_BoundedCurve & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_BoundedCurve
") Value;
		Handle_StepGeom_BoundedCurve Value ();
};


%extend GeomToStep_MakeBoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeBoundedSurface;
class GeomToStep_MakeBoundedSurface : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeBoundedSurface;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_BoundedSurface &
	:rtype: None
") GeomToStep_MakeBoundedSurface;
		 GeomToStep_MakeBoundedSurface (const Handle_Geom_BoundedSurface & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_BoundedSurface
") Value;
		Handle_StepGeom_BoundedSurface Value ();
};


%extend GeomToStep_MakeBoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeCartesianPoint;
class GeomToStep_MakeCartesianPoint : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint (const gp_Pnt & P);
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint (const gp_Pnt2d & P);
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", "	:param P:
	:type P: Handle_Geom_CartesianPoint &
	:rtype: None
") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint (const Handle_Geom_CartesianPoint & P);
		%feature("compactdefaultargs") GeomToStep_MakeCartesianPoint;
		%feature("autodoc", "	:param P:
	:type P: Handle_Geom2d_CartesianPoint &
	:rtype: None
") GeomToStep_MakeCartesianPoint;
		 GeomToStep_MakeCartesianPoint (const Handle_Geom2d_CartesianPoint & P);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_CartesianPoint
") Value;
		Handle_StepGeom_CartesianPoint Value ();
};


%extend GeomToStep_MakeCartesianPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeCircle;
class GeomToStep_MakeCircle : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeCircle;
		%feature("autodoc", "	:param C:
	:type C: gp_Circ
	:rtype: None
") GeomToStep_MakeCircle;
		 GeomToStep_MakeCircle (const gp_Circ & C);
		%feature("compactdefaultargs") GeomToStep_MakeCircle;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Circle &
	:rtype: None
") GeomToStep_MakeCircle;
		 GeomToStep_MakeCircle (const Handle_Geom_Circle & C);
		%feature("compactdefaultargs") GeomToStep_MakeCircle;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Circle &
	:rtype: None
") GeomToStep_MakeCircle;
		 GeomToStep_MakeCircle (const Handle_Geom2d_Circle & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Circle
") Value;
		Handle_StepGeom_Circle Value ();
};


%extend GeomToStep_MakeCircle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeConic;
class GeomToStep_MakeConic : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeConic;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Conic &
	:rtype: None
") GeomToStep_MakeConic;
		 GeomToStep_MakeConic (const Handle_Geom_Conic & C);
		%feature("compactdefaultargs") GeomToStep_MakeConic;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Conic &
	:rtype: None
") GeomToStep_MakeConic;
		 GeomToStep_MakeConic (const Handle_Geom2d_Conic & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Conic
") Value;
		Handle_StepGeom_Conic Value ();
};


%extend GeomToStep_MakeConic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeConicalSurface;
class GeomToStep_MakeConicalSurface : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeConicalSurface;
		%feature("autodoc", "	:param CSurf:
	:type CSurf: Handle_Geom_ConicalSurface &
	:rtype: None
") GeomToStep_MakeConicalSurface;
		 GeomToStep_MakeConicalSurface (const Handle_Geom_ConicalSurface & CSurf);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_ConicalSurface
") Value;
		Handle_StepGeom_ConicalSurface Value ();
};


%extend GeomToStep_MakeConicalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeCurve;
class GeomToStep_MakeCurve : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeCurve;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Curve &
	:rtype: None
") GeomToStep_MakeCurve;
		 GeomToStep_MakeCurve (const Handle_Geom_Curve & C);
		%feature("compactdefaultargs") GeomToStep_MakeCurve;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: None
") GeomToStep_MakeCurve;
		 GeomToStep_MakeCurve (const Handle_Geom2d_Curve & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Curve
") Value;
		Handle_StepGeom_Curve Value ();
};


%extend GeomToStep_MakeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeCylindricalSurface;
class GeomToStep_MakeCylindricalSurface : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeCylindricalSurface;
		%feature("autodoc", "	:param CSurf:
	:type CSurf: Handle_Geom_CylindricalSurface &
	:rtype: None
") GeomToStep_MakeCylindricalSurface;
		 GeomToStep_MakeCylindricalSurface (const Handle_Geom_CylindricalSurface & CSurf);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_CylindricalSurface
") Value;
		Handle_StepGeom_CylindricalSurface Value ();
};


%extend GeomToStep_MakeCylindricalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeDirection;
class GeomToStep_MakeDirection : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeDirection;
		%feature("autodoc", "	:param D:
	:type D: gp_Dir
	:rtype: None
") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection (const gp_Dir & D);
		%feature("compactdefaultargs") GeomToStep_MakeDirection;
		%feature("autodoc", "	:param D:
	:type D: gp_Dir2d
	:rtype: None
") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection (const gp_Dir2d & D);
		%feature("compactdefaultargs") GeomToStep_MakeDirection;
		%feature("autodoc", "	:param D:
	:type D: Handle_Geom_Direction &
	:rtype: None
") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection (const Handle_Geom_Direction & D);
		%feature("compactdefaultargs") GeomToStep_MakeDirection;
		%feature("autodoc", "	:param D:
	:type D: Handle_Geom2d_Direction &
	:rtype: None
") GeomToStep_MakeDirection;
		 GeomToStep_MakeDirection (const Handle_Geom2d_Direction & D);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Direction
") Value;
		Handle_StepGeom_Direction Value ();
};


%extend GeomToStep_MakeDirection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeElementarySurface;
class GeomToStep_MakeElementarySurface : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeElementarySurface;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_ElementarySurface &
	:rtype: None
") GeomToStep_MakeElementarySurface;
		 GeomToStep_MakeElementarySurface (const Handle_Geom_ElementarySurface & S);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_ElementarySurface
") Value;
		Handle_StepGeom_ElementarySurface Value ();
};


%extend GeomToStep_MakeElementarySurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeEllipse;
class GeomToStep_MakeEllipse : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeEllipse;
		%feature("autodoc", "	:param C:
	:type C: gp_Elips
	:rtype: None
") GeomToStep_MakeEllipse;
		 GeomToStep_MakeEllipse (const gp_Elips & C);
		%feature("compactdefaultargs") GeomToStep_MakeEllipse;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Ellipse &
	:rtype: None
") GeomToStep_MakeEllipse;
		 GeomToStep_MakeEllipse (const Handle_Geom_Ellipse & C);
		%feature("compactdefaultargs") GeomToStep_MakeEllipse;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Ellipse &
	:rtype: None
") GeomToStep_MakeEllipse;
		 GeomToStep_MakeEllipse (const Handle_Geom2d_Ellipse & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Ellipse
") Value;
		Handle_StepGeom_Ellipse Value ();
};


%extend GeomToStep_MakeEllipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeHyperbola;
class GeomToStep_MakeHyperbola : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeHyperbola;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Hyperbola &
	:rtype: None
") GeomToStep_MakeHyperbola;
		 GeomToStep_MakeHyperbola (const Handle_Geom2d_Hyperbola & C);
		%feature("compactdefaultargs") GeomToStep_MakeHyperbola;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Hyperbola &
	:rtype: None
") GeomToStep_MakeHyperbola;
		 GeomToStep_MakeHyperbola (const Handle_Geom_Hyperbola & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Hyperbola
") Value;
		Handle_StepGeom_Hyperbola Value ();
};


%extend GeomToStep_MakeHyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeLine;
class GeomToStep_MakeLine : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin
	:rtype: None
") GeomToStep_MakeLine;
		 GeomToStep_MakeLine (const gp_Lin & L);
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", "	:param L:
	:type L: gp_Lin2d
	:rtype: None
") GeomToStep_MakeLine;
		 GeomToStep_MakeLine (const gp_Lin2d & L);
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Line &
	:rtype: None
") GeomToStep_MakeLine;
		 GeomToStep_MakeLine (const Handle_Geom_Line & C);
		%feature("compactdefaultargs") GeomToStep_MakeLine;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Line &
	:rtype: None
") GeomToStep_MakeLine;
		 GeomToStep_MakeLine (const Handle_Geom2d_Line & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Line
") Value;
		Handle_StepGeom_Line Value ();
};


%extend GeomToStep_MakeLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeParabola;
class GeomToStep_MakeParabola : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeParabola;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Parabola &
	:rtype: None
") GeomToStep_MakeParabola;
		 GeomToStep_MakeParabola (const Handle_Geom2d_Parabola & C);
		%feature("compactdefaultargs") GeomToStep_MakeParabola;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Parabola &
	:rtype: None
") GeomToStep_MakeParabola;
		 GeomToStep_MakeParabola (const Handle_Geom_Parabola & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Parabola
") Value;
		Handle_StepGeom_Parabola Value ();
};


%extend GeomToStep_MakeParabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakePlane;
class GeomToStep_MakePlane : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakePlane;
		%feature("autodoc", "	:param P:
	:type P: gp_Pln
	:rtype: None
") GeomToStep_MakePlane;
		 GeomToStep_MakePlane (const gp_Pln & P);
		%feature("compactdefaultargs") GeomToStep_MakePlane;
		%feature("autodoc", "	:param P:
	:type P: Handle_Geom_Plane &
	:rtype: None
") GeomToStep_MakePlane;
		 GeomToStep_MakePlane (const Handle_Geom_Plane & P);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Plane
") Value;
		Handle_StepGeom_Plane Value ();
};


%extend GeomToStep_MakePlane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakePolyline;
class GeomToStep_MakePolyline : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakePolyline;
		%feature("autodoc", "	:param P:
	:type P: TColgp_Array1OfPnt
	:rtype: None
") GeomToStep_MakePolyline;
		 GeomToStep_MakePolyline (const TColgp_Array1OfPnt & P);
		%feature("compactdefaultargs") GeomToStep_MakePolyline;
		%feature("autodoc", "	:param P:
	:type P: TColgp_Array1OfPnt2d
	:rtype: None
") GeomToStep_MakePolyline;
		 GeomToStep_MakePolyline (const TColgp_Array1OfPnt2d & P);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Polyline
") Value;
		Handle_StepGeom_Polyline Value ();
};


%extend GeomToStep_MakePolyline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeRectangularTrimmedSurface;
class GeomToStep_MakeRectangularTrimmedSurface : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeRectangularTrimmedSurface;
		%feature("autodoc", "	:param RTSurf:
	:type RTSurf: Handle_Geom_RectangularTrimmedSurface &
	:rtype: None
") GeomToStep_MakeRectangularTrimmedSurface;
		 GeomToStep_MakeRectangularTrimmedSurface (const Handle_Geom_RectangularTrimmedSurface & RTSurf);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_RectangularTrimmedSurface
") Value;
		Handle_StepGeom_RectangularTrimmedSurface Value ();
};


%extend GeomToStep_MakeRectangularTrimmedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeSphericalSurface;
class GeomToStep_MakeSphericalSurface : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeSphericalSurface;
		%feature("autodoc", "	:param CSurf:
	:type CSurf: Handle_Geom_SphericalSurface &
	:rtype: None
") GeomToStep_MakeSphericalSurface;
		 GeomToStep_MakeSphericalSurface (const Handle_Geom_SphericalSurface & CSurf);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_SphericalSurface
") Value;
		Handle_StepGeom_SphericalSurface Value ();
};


%extend GeomToStep_MakeSphericalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeSurface;
class GeomToStep_MakeSurface : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeSurface;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom_Surface &
	:rtype: None
") GeomToStep_MakeSurface;
		 GeomToStep_MakeSurface (const Handle_Geom_Surface & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Surface
") Value;
		Handle_StepGeom_Surface Value ();
};


%extend GeomToStep_MakeSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeSurfaceOfLinearExtrusion;
class GeomToStep_MakeSurfaceOfLinearExtrusion : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeSurfaceOfLinearExtrusion;
		%feature("autodoc", "	:param CSurf:
	:type CSurf: Handle_Geom_SurfaceOfLinearExtrusion &
	:rtype: None
") GeomToStep_MakeSurfaceOfLinearExtrusion;
		 GeomToStep_MakeSurfaceOfLinearExtrusion (const Handle_Geom_SurfaceOfLinearExtrusion & CSurf);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_SurfaceOfLinearExtrusion
") Value;
		Handle_StepGeom_SurfaceOfLinearExtrusion Value ();
};


%extend GeomToStep_MakeSurfaceOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeSurfaceOfRevolution;
class GeomToStep_MakeSurfaceOfRevolution : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeSurfaceOfRevolution;
		%feature("autodoc", "	:param RevSurf:
	:type RevSurf: Handle_Geom_SurfaceOfRevolution &
	:rtype: None
") GeomToStep_MakeSurfaceOfRevolution;
		 GeomToStep_MakeSurfaceOfRevolution (const Handle_Geom_SurfaceOfRevolution & RevSurf);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_SurfaceOfRevolution
") Value;
		Handle_StepGeom_SurfaceOfRevolution Value ();
};


%extend GeomToStep_MakeSurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeSweptSurface;
class GeomToStep_MakeSweptSurface : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeSweptSurface;
		%feature("autodoc", "	:param S:
	:type S: Handle_Geom_SweptSurface &
	:rtype: None
") GeomToStep_MakeSweptSurface;
		 GeomToStep_MakeSweptSurface (const Handle_Geom_SweptSurface & S);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_SweptSurface
") Value;
		Handle_StepGeom_SweptSurface Value ();
};


%extend GeomToStep_MakeSweptSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeToroidalSurface;
class GeomToStep_MakeToroidalSurface : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeToroidalSurface;
		%feature("autodoc", "	:param TorSurf:
	:type TorSurf: Handle_Geom_ToroidalSurface &
	:rtype: None
") GeomToStep_MakeToroidalSurface;
		 GeomToStep_MakeToroidalSurface (const Handle_Geom_ToroidalSurface & TorSurf);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_ToroidalSurface
") Value;
		Handle_StepGeom_ToroidalSurface Value ();
};


%extend GeomToStep_MakeToroidalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor GeomToStep_MakeVector;
class GeomToStep_MakeVector : public GeomToStep_Root {
	public:
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec
	:rtype: None
") GeomToStep_MakeVector;
		 GeomToStep_MakeVector (const gp_Vec & V);
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec2d
	:rtype: None
") GeomToStep_MakeVector;
		 GeomToStep_MakeVector (const gp_Vec2d & V);
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom_Vector &
	:rtype: None
") GeomToStep_MakeVector;
		 GeomToStep_MakeVector (const Handle_Geom_Vector & V);
		%feature("compactdefaultargs") GeomToStep_MakeVector;
		%feature("autodoc", "	:param V:
	:type V: Handle_Geom2d_Vector &
	:rtype: None
") GeomToStep_MakeVector;
		 GeomToStep_MakeVector (const Handle_Geom2d_Vector & V);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StepGeom_Vector
") Value;
		Handle_StepGeom_Vector Value ();
};


%extend GeomToStep_MakeVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
