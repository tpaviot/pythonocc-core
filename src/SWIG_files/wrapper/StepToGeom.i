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
%define STEPTOGEOMDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=STEPTOGEOMDOCSTRING) StepToGeom

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


%include StepToGeom_headers.i

/* templates */
/* end templates declaration */


/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */


%rename(steptogeom) StepToGeom;
%nodefaultctor StepToGeom;
class StepToGeom {
	public:
		%feature("compactdefaultargs") MakeAxis1Placement;
		%feature("autodoc", "	:param SA:
	:type SA: Handle_StepGeom_Axis1Placement &
	:rtype: Handle_Geom_Axis1Placement
") MakeAxis1Placement;
		static Handle_Geom_Axis1Placement MakeAxis1Placement (const Handle_StepGeom_Axis1Placement & SA);
		%feature("compactdefaultargs") MakeAxis2Placement;
		%feature("autodoc", "	:param SA:
	:type SA: Handle_StepGeom_Axis2Placement3d &
	:rtype: Handle_Geom_Axis2Placement
") MakeAxis2Placement;
		static Handle_Geom_Axis2Placement MakeAxis2Placement (const Handle_StepGeom_Axis2Placement3d & SA);
		%feature("compactdefaultargs") MakeAxisPlacement;
		%feature("autodoc", "	:param SA:
	:type SA: Handle_StepGeom_Axis2Placement2d &
	:rtype: Handle_Geom2d_AxisPlacement
") MakeAxisPlacement;
		static Handle_Geom2d_AxisPlacement MakeAxisPlacement (const Handle_StepGeom_Axis2Placement2d & SA);
		%feature("compactdefaultargs") MakeBSplineCurve;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_BSplineCurve &
	:rtype: Handle_Geom_BSplineCurve
") MakeBSplineCurve;
		static Handle_Geom_BSplineCurve MakeBSplineCurve (const Handle_StepGeom_BSplineCurve & SC);
		%feature("compactdefaultargs") MakeBSplineCurve2d;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_BSplineCurve &
	:rtype: Handle_Geom2d_BSplineCurve
") MakeBSplineCurve2d;
		static Handle_Geom2d_BSplineCurve MakeBSplineCurve2d (const Handle_StepGeom_BSplineCurve & SC);
		%feature("compactdefaultargs") MakeBSplineSurface;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_BSplineSurface &
	:rtype: Handle_Geom_BSplineSurface
") MakeBSplineSurface;
		static Handle_Geom_BSplineSurface MakeBSplineSurface (const Handle_StepGeom_BSplineSurface & SS);
		%feature("compactdefaultargs") MakeBoundedCurve;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_BoundedCurve &
	:rtype: Handle_Geom_BoundedCurve
") MakeBoundedCurve;
		static Handle_Geom_BoundedCurve MakeBoundedCurve (const Handle_StepGeom_BoundedCurve & SC);
		%feature("compactdefaultargs") MakeBoundedCurve2d;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_BoundedCurve &
	:rtype: Handle_Geom2d_BoundedCurve
") MakeBoundedCurve2d;
		static Handle_Geom2d_BoundedCurve MakeBoundedCurve2d (const Handle_StepGeom_BoundedCurve & SC);
		%feature("compactdefaultargs") MakeBoundedSurface;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_BoundedSurface &
	:rtype: Handle_Geom_BoundedSurface
") MakeBoundedSurface;
		static Handle_Geom_BoundedSurface MakeBoundedSurface (const Handle_StepGeom_BoundedSurface & SS);
		%feature("compactdefaultargs") MakeCartesianPoint;
		%feature("autodoc", "	:param SP:
	:type SP: Handle_StepGeom_CartesianPoint &
	:rtype: Handle_Geom_CartesianPoint
") MakeCartesianPoint;
		static Handle_Geom_CartesianPoint MakeCartesianPoint (const Handle_StepGeom_CartesianPoint & SP);
		%feature("compactdefaultargs") MakeCartesianPoint2d;
		%feature("autodoc", "	:param SP:
	:type SP: Handle_StepGeom_CartesianPoint &
	:rtype: Handle_Geom2d_CartesianPoint
") MakeCartesianPoint2d;
		static Handle_Geom2d_CartesianPoint MakeCartesianPoint2d (const Handle_StepGeom_CartesianPoint & SP);
		%feature("compactdefaultargs") MakeCircle;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Circle &
	:rtype: Handle_Geom_Circle
") MakeCircle;
		static Handle_Geom_Circle MakeCircle (const Handle_StepGeom_Circle & SC);
		%feature("compactdefaultargs") MakeCircle2d;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Circle &
	:rtype: Handle_Geom2d_Circle
") MakeCircle2d;
		static Handle_Geom2d_Circle MakeCircle2d (const Handle_StepGeom_Circle & SC);
		%feature("compactdefaultargs") MakeConic;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Conic &
	:rtype: Handle_Geom_Conic
") MakeConic;
		static Handle_Geom_Conic MakeConic (const Handle_StepGeom_Conic & SC);
		%feature("compactdefaultargs") MakeConic2d;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Conic &
	:rtype: Handle_Geom2d_Conic
") MakeConic2d;
		static Handle_Geom2d_Conic MakeConic2d (const Handle_StepGeom_Conic & SC);
		%feature("compactdefaultargs") MakeConicalSurface;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_ConicalSurface &
	:rtype: Handle_Geom_ConicalSurface
") MakeConicalSurface;
		static Handle_Geom_ConicalSurface MakeConicalSurface (const Handle_StepGeom_ConicalSurface & SS);
		%feature("compactdefaultargs") MakeCurve;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Curve &
	:rtype: Handle_Geom_Curve
") MakeCurve;
		static Handle_Geom_Curve MakeCurve (const Handle_StepGeom_Curve & SC);
		%feature("compactdefaultargs") MakeCurve2d;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Curve &
	:rtype: Handle_Geom2d_Curve
") MakeCurve2d;
		static Handle_Geom2d_Curve MakeCurve2d (const Handle_StepGeom_Curve & SC);
		%feature("compactdefaultargs") MakeCylindricalSurface;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_CylindricalSurface &
	:rtype: Handle_Geom_CylindricalSurface
") MakeCylindricalSurface;
		static Handle_Geom_CylindricalSurface MakeCylindricalSurface (const Handle_StepGeom_CylindricalSurface & SS);
		%feature("compactdefaultargs") MakeDirection;
		%feature("autodoc", "	:param SD:
	:type SD: Handle_StepGeom_Direction &
	:rtype: Handle_Geom_Direction
") MakeDirection;
		static Handle_Geom_Direction MakeDirection (const Handle_StepGeom_Direction & SD);
		%feature("compactdefaultargs") MakeDirection2d;
		%feature("autodoc", "	:param SD:
	:type SD: Handle_StepGeom_Direction &
	:rtype: Handle_Geom2d_Direction
") MakeDirection2d;
		static Handle_Geom2d_Direction MakeDirection2d (const Handle_StepGeom_Direction & SD);
		%feature("compactdefaultargs") MakeElementarySurface;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_ElementarySurface &
	:rtype: Handle_Geom_ElementarySurface
") MakeElementarySurface;
		static Handle_Geom_ElementarySurface MakeElementarySurface (const Handle_StepGeom_ElementarySurface & SS);
		%feature("compactdefaultargs") MakeEllipse;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Ellipse &
	:rtype: Handle_Geom_Ellipse
") MakeEllipse;
		static Handle_Geom_Ellipse MakeEllipse (const Handle_StepGeom_Ellipse & SC);
		%feature("compactdefaultargs") MakeEllipse2d;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Ellipse &
	:rtype: Handle_Geom2d_Ellipse
") MakeEllipse2d;
		static Handle_Geom2d_Ellipse MakeEllipse2d (const Handle_StepGeom_Ellipse & SC);
		%feature("compactdefaultargs") MakeHyperbola;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Hyperbola &
	:rtype: Handle_Geom_Hyperbola
") MakeHyperbola;
		static Handle_Geom_Hyperbola MakeHyperbola (const Handle_StepGeom_Hyperbola & SC);
		%feature("compactdefaultargs") MakeHyperbola2d;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Hyperbola &
	:rtype: Handle_Geom2d_Hyperbola
") MakeHyperbola2d;
		static Handle_Geom2d_Hyperbola MakeHyperbola2d (const Handle_StepGeom_Hyperbola & SC);
		%feature("compactdefaultargs") MakeLine;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Line &
	:rtype: Handle_Geom_Line
") MakeLine;
		static Handle_Geom_Line MakeLine (const Handle_StepGeom_Line & SC);
		%feature("compactdefaultargs") MakeLine2d;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Line &
	:rtype: Handle_Geom2d_Line
") MakeLine2d;
		static Handle_Geom2d_Line MakeLine2d (const Handle_StepGeom_Line & SC);
		%feature("compactdefaultargs") MakeParabola;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Parabola &
	:rtype: Handle_Geom_Parabola
") MakeParabola;
		static Handle_Geom_Parabola MakeParabola (const Handle_StepGeom_Parabola & SC);
		%feature("compactdefaultargs") MakeParabola2d;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Parabola &
	:rtype: Handle_Geom2d_Parabola
") MakeParabola2d;
		static Handle_Geom2d_Parabola MakeParabola2d (const Handle_StepGeom_Parabola & SC);
		%feature("compactdefaultargs") MakePlane;
		%feature("autodoc", "	:param SP:
	:type SP: Handle_StepGeom_Plane &
	:rtype: Handle_Geom_Plane
") MakePlane;
		static Handle_Geom_Plane MakePlane (const Handle_StepGeom_Plane & SP);
		%feature("compactdefaultargs") MakePolyline;
		%feature("autodoc", "	:param SPL:
	:type SPL: Handle_StepGeom_Polyline &
	:rtype: Handle_Geom_BSplineCurve
") MakePolyline;
		static Handle_Geom_BSplineCurve MakePolyline (const Handle_StepGeom_Polyline & SPL);
		%feature("compactdefaultargs") MakePolyline2d;
		%feature("autodoc", "	:param SPL:
	:type SPL: Handle_StepGeom_Polyline &
	:rtype: Handle_Geom2d_BSplineCurve
") MakePolyline2d;
		static Handle_Geom2d_BSplineCurve MakePolyline2d (const Handle_StepGeom_Polyline & SPL);
		%feature("compactdefaultargs") MakeRectangularTrimmedSurface;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_RectangularTrimmedSurface &
	:rtype: Handle_Geom_RectangularTrimmedSurface
") MakeRectangularTrimmedSurface;
		static Handle_Geom_RectangularTrimmedSurface MakeRectangularTrimmedSurface (const Handle_StepGeom_RectangularTrimmedSurface & SS);
		%feature("compactdefaultargs") MakeSphericalSurface;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_SphericalSurface &
	:rtype: Handle_Geom_SphericalSurface
") MakeSphericalSurface;
		static Handle_Geom_SphericalSurface MakeSphericalSurface (const Handle_StepGeom_SphericalSurface & SS);
		%feature("compactdefaultargs") MakeSurface;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_Surface &
	:rtype: Handle_Geom_Surface
") MakeSurface;
		static Handle_Geom_Surface MakeSurface (const Handle_StepGeom_Surface & SS);
		%feature("compactdefaultargs") MakeSurfaceOfLinearExtrusion;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_SurfaceOfLinearExtrusion &
	:rtype: Handle_Geom_SurfaceOfLinearExtrusion
") MakeSurfaceOfLinearExtrusion;
		static Handle_Geom_SurfaceOfLinearExtrusion MakeSurfaceOfLinearExtrusion (const Handle_StepGeom_SurfaceOfLinearExtrusion & SS);
		%feature("compactdefaultargs") MakeSurfaceOfRevolution;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_SurfaceOfRevolution &
	:rtype: Handle_Geom_SurfaceOfRevolution
") MakeSurfaceOfRevolution;
		static Handle_Geom_SurfaceOfRevolution MakeSurfaceOfRevolution (const Handle_StepGeom_SurfaceOfRevolution & SS);
		%feature("compactdefaultargs") MakeSweptSurface;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_SweptSurface &
	:rtype: Handle_Geom_SweptSurface
") MakeSweptSurface;
		static Handle_Geom_SweptSurface MakeSweptSurface (const Handle_StepGeom_SweptSurface & SS);
		%feature("compactdefaultargs") MakeToroidalSurface;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_ToroidalSurface &
	:rtype: Handle_Geom_ToroidalSurface
") MakeToroidalSurface;
		static Handle_Geom_ToroidalSurface MakeToroidalSurface (const Handle_StepGeom_ToroidalSurface & SS);
		%feature("compactdefaultargs") MakeTransformation2d;
		%feature("autodoc", "	:param SCTO:
	:type SCTO: Handle_StepGeom_CartesianTransformationOperator2d &
	:param CT:
	:type CT: gp_Trsf2d
	:rtype: bool
") MakeTransformation2d;
		static Standard_Boolean MakeTransformation2d (const Handle_StepGeom_CartesianTransformationOperator2d & SCTO,gp_Trsf2d & CT);
		%feature("compactdefaultargs") MakeTransformation3d;
		%feature("autodoc", "	:param SCTO:
	:type SCTO: Handle_StepGeom_CartesianTransformationOperator3d &
	:param CT:
	:type CT: gp_Trsf
	:rtype: bool
") MakeTransformation3d;
		static Standard_Boolean MakeTransformation3d (const Handle_StepGeom_CartesianTransformationOperator3d & SCTO,gp_Trsf & CT);
		%feature("compactdefaultargs") MakeTrimmedCurve;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_TrimmedCurve &
	:rtype: Handle_Geom_TrimmedCurve
") MakeTrimmedCurve;
		static Handle_Geom_TrimmedCurve MakeTrimmedCurve (const Handle_StepGeom_TrimmedCurve & SC);
		%feature("compactdefaultargs") MakeTrimmedCurve2d;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_TrimmedCurve &
	:rtype: Handle_Geom2d_BSplineCurve
") MakeTrimmedCurve2d;
		static Handle_Geom2d_BSplineCurve MakeTrimmedCurve2d (const Handle_StepGeom_TrimmedCurve & SC);
		%feature("compactdefaultargs") MakeVectorWithMagnitude;
		%feature("autodoc", "	:param SV:
	:type SV: Handle_StepGeom_Vector &
	:rtype: Handle_Geom_VectorWithMagnitude
") MakeVectorWithMagnitude;
		static Handle_Geom_VectorWithMagnitude MakeVectorWithMagnitude (const Handle_StepGeom_Vector & SV);
		%feature("compactdefaultargs") MakeVectorWithMagnitude2d;
		%feature("autodoc", "	:param SV:
	:type SV: Handle_StepGeom_Vector &
	:rtype: Handle_Geom2d_VectorWithMagnitude
") MakeVectorWithMagnitude2d;
		static Handle_Geom2d_VectorWithMagnitude MakeVectorWithMagnitude2d (const Handle_StepGeom_Vector & SV);
};


%extend StepToGeom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
