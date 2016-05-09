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
%module (package="OCC") StepToGeom

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


%include StepToGeom_headers.i


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

class StepToGeom_MakeAxis1Placement {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SA:
	:type SA: Handle_StepGeom_Axis1Placement &
	:param CA:
	:type CA: Handle_Geom_Axis1Placement &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Axis1Placement & SA,Handle_Geom_Axis1Placement & CA);
};


class StepToGeom_MakeAxis2Placement {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SA:
	:type SA: Handle_StepGeom_Axis2Placement3d &
	:param CA:
	:type CA: Handle_Geom_Axis2Placement &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Axis2Placement3d & SA,Handle_Geom_Axis2Placement & CA);
};


class StepToGeom_MakeAxisPlacement {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SA:
	:type SA: Handle_StepGeom_Axis2Placement2d &
	:param CA:
	:type CA: Handle_Geom2d_AxisPlacement &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Axis2Placement2d & SA,Handle_Geom2d_AxisPlacement & CA);
};


class StepToGeom_MakeBSplineCurve {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_BSplineCurve &
	:param CC:
	:type CC: Handle_Geom_BSplineCurve &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_BSplineCurve & SC,Handle_Geom_BSplineCurve & CC);
};


class StepToGeom_MakeBSplineCurve2d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_BSplineCurve &
	:param CC:
	:type CC: Handle_Geom2d_BSplineCurve &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_BSplineCurve & SC,Handle_Geom2d_BSplineCurve & CC);
};


class StepToGeom_MakeBSplineSurface {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_BSplineSurface &
	:param CS:
	:type CS: Handle_Geom_BSplineSurface &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_BSplineSurface & SS,Handle_Geom_BSplineSurface & CS);
};


class StepToGeom_MakeBoundedCurve {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_BoundedCurve &
	:param CC:
	:type CC: Handle_Geom_BoundedCurve &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_BoundedCurve & SC,Handle_Geom_BoundedCurve & CC);
};


class StepToGeom_MakeBoundedCurve2d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_BoundedCurve &
	:param CC:
	:type CC: Handle_Geom2d_BoundedCurve &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_BoundedCurve & SC,Handle_Geom2d_BoundedCurve & CC);
};


class StepToGeom_MakeBoundedSurface {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_BoundedSurface &
	:param CS:
	:type CS: Handle_Geom_BoundedSurface &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_BoundedSurface & SS,Handle_Geom_BoundedSurface & CS);
};


class StepToGeom_MakeCartesianPoint {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SP:
	:type SP: Handle_StepGeom_CartesianPoint &
	:param CP:
	:type CP: Handle_Geom_CartesianPoint &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_CartesianPoint & SP,Handle_Geom_CartesianPoint & CP);
};


class StepToGeom_MakeCartesianPoint2d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SP:
	:type SP: Handle_StepGeom_CartesianPoint &
	:param CP:
	:type CP: Handle_Geom2d_CartesianPoint &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_CartesianPoint & SP,Handle_Geom2d_CartesianPoint & CP);
};


class StepToGeom_MakeCircle {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Circle &
	:param CC:
	:type CC: Handle_Geom_Circle &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Circle & SC,Handle_Geom_Circle & CC);
};


class StepToGeom_MakeCircle2d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Circle &
	:param CC:
	:type CC: Handle_Geom2d_Circle &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Circle & SC,Handle_Geom2d_Circle & CC);
};


class StepToGeom_MakeConic {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Conic &
	:param CC:
	:type CC: Handle_Geom_Conic &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Conic & SC,Handle_Geom_Conic & CC);
};


class StepToGeom_MakeConic2d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Conic &
	:param CC:
	:type CC: Handle_Geom2d_Conic &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Conic & SC,Handle_Geom2d_Conic & CC);
};


class StepToGeom_MakeConicalSurface {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_ConicalSurface &
	:param CS:
	:type CS: Handle_Geom_ConicalSurface &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_ConicalSurface & SS,Handle_Geom_ConicalSurface & CS);
};


class StepToGeom_MakeCurve {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Curve &
	:param CC:
	:type CC: Handle_Geom_Curve &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Curve & SC,Handle_Geom_Curve & CC);
};


class StepToGeom_MakeCurve2d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Curve &
	:param CC:
	:type CC: Handle_Geom2d_Curve &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Curve & SC,Handle_Geom2d_Curve & CC);
};


class StepToGeom_MakeCylindricalSurface {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_CylindricalSurface &
	:param CS:
	:type CS: Handle_Geom_CylindricalSurface &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_CylindricalSurface & SS,Handle_Geom_CylindricalSurface & CS);
};


class StepToGeom_MakeDirection {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SD:
	:type SD: Handle_StepGeom_Direction &
	:param CD:
	:type CD: Handle_Geom_Direction &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Direction & SD,Handle_Geom_Direction & CD);
};


class StepToGeom_MakeDirection2d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SD:
	:type SD: Handle_StepGeom_Direction &
	:param CD:
	:type CD: Handle_Geom2d_Direction &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Direction & SD,Handle_Geom2d_Direction & CD);
};


class StepToGeom_MakeElementarySurface {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_ElementarySurface &
	:param CS:
	:type CS: Handle_Geom_ElementarySurface &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_ElementarySurface & SS,Handle_Geom_ElementarySurface & CS);
};


class StepToGeom_MakeEllipse {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Ellipse &
	:param CC:
	:type CC: Handle_Geom_Ellipse &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Ellipse & SC,Handle_Geom_Ellipse & CC);
};


class StepToGeom_MakeEllipse2d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Ellipse &
	:param CC:
	:type CC: Handle_Geom2d_Ellipse &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Ellipse & SC,Handle_Geom2d_Ellipse & CC);
};


class StepToGeom_MakeHyperbola {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Hyperbola &
	:param CC:
	:type CC: Handle_Geom_Hyperbola &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Hyperbola & SC,Handle_Geom_Hyperbola & CC);
};


class StepToGeom_MakeHyperbola2d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Hyperbola &
	:param CC:
	:type CC: Handle_Geom2d_Hyperbola &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Hyperbola & SC,Handle_Geom2d_Hyperbola & CC);
};


class StepToGeom_MakeLine {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Line &
	:param CC:
	:type CC: Handle_Geom_Line &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Line & SC,Handle_Geom_Line & CC);
};


class StepToGeom_MakeLine2d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Line &
	:param CC:
	:type CC: Handle_Geom2d_Line &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Line & SC,Handle_Geom2d_Line & CC);
};


class StepToGeom_MakeParabola {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Parabola &
	:param CC:
	:type CC: Handle_Geom_Parabola &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Parabola & SC,Handle_Geom_Parabola & CC);
};


class StepToGeom_MakeParabola2d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_Parabola &
	:param CC:
	:type CC: Handle_Geom2d_Parabola &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Parabola & SC,Handle_Geom2d_Parabola & CC);
};


class StepToGeom_MakePlane {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SP:
	:type SP: Handle_StepGeom_Plane &
	:param CP:
	:type CP: Handle_Geom_Plane &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Plane & SP,Handle_Geom_Plane & CP);
};


class StepToGeom_MakePolyline2d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SPL:
	:type SPL: Handle_StepGeom_Polyline &
	:param CC:
	:type CC: Handle_Geom2d_BSplineCurve &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Polyline & SPL,Handle_Geom2d_BSplineCurve & CC);
};


class StepToGeom_MakeRectangularTrimmedSurface {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_RectangularTrimmedSurface &
	:param CS:
	:type CS: Handle_Geom_RectangularTrimmedSurface &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_RectangularTrimmedSurface & SS,Handle_Geom_RectangularTrimmedSurface & CS);
};


class StepToGeom_MakeSphericalSurface {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param Surf:
	:type Surf: Handle_StepGeom_SphericalSurface &
	:param CS:
	:type CS: Handle_Geom_SphericalSurface &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_SphericalSurface & Surf,Handle_Geom_SphericalSurface & CS);
};


class StepToGeom_MakeSurface {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_Surface &
	:param CS:
	:type CS: Handle_Geom_Surface &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Surface & SS,Handle_Geom_Surface & CS);
};


class StepToGeom_MakeSurfaceOfLinearExtrusion {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_SurfaceOfLinearExtrusion &
	:param CS:
	:type CS: Handle_Geom_SurfaceOfLinearExtrusion &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_SurfaceOfLinearExtrusion & SS,Handle_Geom_SurfaceOfLinearExtrusion & CS);
};


class StepToGeom_MakeSurfaceOfRevolution {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_SurfaceOfRevolution &
	:param CS:
	:type CS: Handle_Geom_SurfaceOfRevolution &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_SurfaceOfRevolution & SS,Handle_Geom_SurfaceOfRevolution & CS);
};


class StepToGeom_MakeSweptSurface {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_SweptSurface &
	:param CS:
	:type CS: Handle_Geom_SweptSurface &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_SweptSurface & SS,Handle_Geom_SweptSurface & CS);
};


class StepToGeom_MakeToroidalSurface {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SS:
	:type SS: Handle_StepGeom_ToroidalSurface &
	:param CS:
	:type CS: Handle_Geom_ToroidalSurface &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_ToroidalSurface & SS,Handle_Geom_ToroidalSurface & CS);
};


class StepToGeom_MakeTransformation2d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SCTO:
	:type SCTO: Handle_StepGeom_CartesianTransformationOperator2d &
	:param CT:
	:type CT: gp_Trsf2d
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_CartesianTransformationOperator2d & SCTO,gp_Trsf2d & CT);
};


class StepToGeom_MakeTransformation3d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SCTO:
	:type SCTO: Handle_StepGeom_CartesianTransformationOperator3d &
	:param CT:
	:type CT: gp_Trsf
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_CartesianTransformationOperator3d & SCTO,gp_Trsf & CT);
};


class StepToGeom_MakeTrimmedCurve {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_TrimmedCurve &
	:param CC:
	:type CC: Handle_Geom_TrimmedCurve &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_TrimmedCurve & SC,Handle_Geom_TrimmedCurve & CC);
};


class StepToGeom_MakeTrimmedCurve2d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SC:
	:type SC: Handle_StepGeom_TrimmedCurve &
	:param CC:
	:type CC: Handle_Geom2d_BSplineCurve &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_TrimmedCurve & SC,Handle_Geom2d_BSplineCurve & CC);
};


class StepToGeom_MakeVectorWithMagnitude {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SV:
	:type SV: Handle_StepGeom_Vector &
	:param CV:
	:type CV: Handle_Geom_VectorWithMagnitude &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Vector & SV,Handle_Geom_VectorWithMagnitude & CV);
};


class StepToGeom_MakeVectorWithMagnitude2d {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SV:
	:type SV: Handle_StepGeom_Vector &
	:param CV:
	:type CV: Handle_Geom2d_VectorWithMagnitude &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Vector & SV,Handle_Geom2d_VectorWithMagnitude & CV);
};


class StepToGeom_Root {
	public:
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
};


class StepToGeom_MakePolyline : public StepToGeom_Root {
	public:
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	:param SPL:
	:type SPL: Handle_StepGeom_Polyline &
	:param CC:
	:type CC: Handle_Geom_BSplineCurve &
	:rtype: bool
") Convert;
		static Standard_Boolean Convert (const Handle_StepGeom_Polyline & SPL,Handle_Geom_BSplineCurve & CC);
};


