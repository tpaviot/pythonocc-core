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
"StepToGeom module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_steptogeom.html"
%enddef
%module (package="OCC.Core", docstring=STEPTOGEOMDOCSTRING) StepToGeom


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


%{
#include<StepToGeom_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepGeom_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<Message_module.hxx>
#include<StepShape_module.hxx>
#include<StepBasic_module.hxx>
#include<StepGeom_module.hxx>
#include<StepRepr_module.hxx>
#include<StepElement_module.hxx>
#include<Interface_module.hxx>
#include<StepData_module.hxx>
#include<MoniTool_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepGeom.i
%import Geom.i
%import Geom2d.i
%import gp.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%rename(steptogeom) StepToGeom;
%nodefaultctor StepToGeom;
class StepToGeom {
	public:
		%feature("compactdefaultargs") MakeAxis1Placement;
		%feature("autodoc", "	:param SA:
	:type SA: opencascade::handle<StepGeom_Axis1Placement> &
	:rtype: opencascade::handle<Geom_Axis1Placement>
") MakeAxis1Placement;
		static opencascade::handle<Geom_Axis1Placement> MakeAxis1Placement (const opencascade::handle<StepGeom_Axis1Placement> & SA);
		%feature("compactdefaultargs") MakeAxis2Placement;
		%feature("autodoc", "	:param SA:
	:type SA: opencascade::handle<StepGeom_Axis2Placement3d> &
	:rtype: opencascade::handle<Geom_Axis2Placement>
") MakeAxis2Placement;
		static opencascade::handle<Geom_Axis2Placement> MakeAxis2Placement (const opencascade::handle<StepGeom_Axis2Placement3d> & SA);
		%feature("compactdefaultargs") MakeAxisPlacement;
		%feature("autodoc", "	:param SA:
	:type SA: opencascade::handle<StepGeom_Axis2Placement2d> &
	:rtype: opencascade::handle<Geom2d_AxisPlacement>
") MakeAxisPlacement;
		static opencascade::handle<Geom2d_AxisPlacement> MakeAxisPlacement (const opencascade::handle<StepGeom_Axis2Placement2d> & SA);
		%feature("compactdefaultargs") MakeBSplineCurve;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_BSplineCurve> &
	:rtype: opencascade::handle<Geom_BSplineCurve>
") MakeBSplineCurve;
		static opencascade::handle<Geom_BSplineCurve> MakeBSplineCurve (const opencascade::handle<StepGeom_BSplineCurve> & SC);
		%feature("compactdefaultargs") MakeBSplineCurve2d;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_BSplineCurve> &
	:rtype: opencascade::handle<Geom2d_BSplineCurve>
") MakeBSplineCurve2d;
		static opencascade::handle<Geom2d_BSplineCurve> MakeBSplineCurve2d (const opencascade::handle<StepGeom_BSplineCurve> & SC);
		%feature("compactdefaultargs") MakeBSplineSurface;
		%feature("autodoc", "	:param SS:
	:type SS: opencascade::handle<StepGeom_BSplineSurface> &
	:rtype: opencascade::handle<Geom_BSplineSurface>
") MakeBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> MakeBSplineSurface (const opencascade::handle<StepGeom_BSplineSurface> & SS);
		%feature("compactdefaultargs") MakeBoundedCurve;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_BoundedCurve> &
	:rtype: opencascade::handle<Geom_BoundedCurve>
") MakeBoundedCurve;
		static opencascade::handle<Geom_BoundedCurve> MakeBoundedCurve (const opencascade::handle<StepGeom_BoundedCurve> & SC);
		%feature("compactdefaultargs") MakeBoundedCurve2d;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_BoundedCurve> &
	:rtype: opencascade::handle<Geom2d_BoundedCurve>
") MakeBoundedCurve2d;
		static opencascade::handle<Geom2d_BoundedCurve> MakeBoundedCurve2d (const opencascade::handle<StepGeom_BoundedCurve> & SC);
		%feature("compactdefaultargs") MakeBoundedSurface;
		%feature("autodoc", "	:param SS:
	:type SS: opencascade::handle<StepGeom_BoundedSurface> &
	:rtype: opencascade::handle<Geom_BoundedSurface>
") MakeBoundedSurface;
		static opencascade::handle<Geom_BoundedSurface> MakeBoundedSurface (const opencascade::handle<StepGeom_BoundedSurface> & SS);
		%feature("compactdefaultargs") MakeCartesianPoint;
		%feature("autodoc", "	:param SP:
	:type SP: opencascade::handle<StepGeom_CartesianPoint> &
	:rtype: opencascade::handle<Geom_CartesianPoint>
") MakeCartesianPoint;
		static opencascade::handle<Geom_CartesianPoint> MakeCartesianPoint (const opencascade::handle<StepGeom_CartesianPoint> & SP);
		%feature("compactdefaultargs") MakeCartesianPoint2d;
		%feature("autodoc", "	:param SP:
	:type SP: opencascade::handle<StepGeom_CartesianPoint> &
	:rtype: opencascade::handle<Geom2d_CartesianPoint>
") MakeCartesianPoint2d;
		static opencascade::handle<Geom2d_CartesianPoint> MakeCartesianPoint2d (const opencascade::handle<StepGeom_CartesianPoint> & SP);
		%feature("compactdefaultargs") MakeCircle;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_Circle> &
	:rtype: opencascade::handle<Geom_Circle>
") MakeCircle;
		static opencascade::handle<Geom_Circle> MakeCircle (const opencascade::handle<StepGeom_Circle> & SC);
		%feature("compactdefaultargs") MakeCircle2d;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_Circle> &
	:rtype: opencascade::handle<Geom2d_Circle>
") MakeCircle2d;
		static opencascade::handle<Geom2d_Circle> MakeCircle2d (const opencascade::handle<StepGeom_Circle> & SC);
		%feature("compactdefaultargs") MakeConic;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_Conic> &
	:rtype: opencascade::handle<Geom_Conic>
") MakeConic;
		static opencascade::handle<Geom_Conic> MakeConic (const opencascade::handle<StepGeom_Conic> & SC);
		%feature("compactdefaultargs") MakeConic2d;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_Conic> &
	:rtype: opencascade::handle<Geom2d_Conic>
") MakeConic2d;
		static opencascade::handle<Geom2d_Conic> MakeConic2d (const opencascade::handle<StepGeom_Conic> & SC);
		%feature("compactdefaultargs") MakeConicalSurface;
		%feature("autodoc", "	:param SS:
	:type SS: opencascade::handle<StepGeom_ConicalSurface> &
	:rtype: opencascade::handle<Geom_ConicalSurface>
") MakeConicalSurface;
		static opencascade::handle<Geom_ConicalSurface> MakeConicalSurface (const opencascade::handle<StepGeom_ConicalSurface> & SS);
		%feature("compactdefaultargs") MakeCurve;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_Curve> &
	:rtype: opencascade::handle<Geom_Curve>
") MakeCurve;
		static opencascade::handle<Geom_Curve> MakeCurve (const opencascade::handle<StepGeom_Curve> & SC);
		%feature("compactdefaultargs") MakeCurve2d;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_Curve> &
	:rtype: opencascade::handle<Geom2d_Curve>
") MakeCurve2d;
		static opencascade::handle<Geom2d_Curve> MakeCurve2d (const opencascade::handle<StepGeom_Curve> & SC);
		%feature("compactdefaultargs") MakeCylindricalSurface;
		%feature("autodoc", "	:param SS:
	:type SS: opencascade::handle<StepGeom_CylindricalSurface> &
	:rtype: opencascade::handle<Geom_CylindricalSurface>
") MakeCylindricalSurface;
		static opencascade::handle<Geom_CylindricalSurface> MakeCylindricalSurface (const opencascade::handle<StepGeom_CylindricalSurface> & SS);
		%feature("compactdefaultargs") MakeDirection;
		%feature("autodoc", "	:param SD:
	:type SD: opencascade::handle<StepGeom_Direction> &
	:rtype: opencascade::handle<Geom_Direction>
") MakeDirection;
		static opencascade::handle<Geom_Direction> MakeDirection (const opencascade::handle<StepGeom_Direction> & SD);
		%feature("compactdefaultargs") MakeDirection2d;
		%feature("autodoc", "	:param SD:
	:type SD: opencascade::handle<StepGeom_Direction> &
	:rtype: opencascade::handle<Geom2d_Direction>
") MakeDirection2d;
		static opencascade::handle<Geom2d_Direction> MakeDirection2d (const opencascade::handle<StepGeom_Direction> & SD);
		%feature("compactdefaultargs") MakeElementarySurface;
		%feature("autodoc", "	:param SS:
	:type SS: opencascade::handle<StepGeom_ElementarySurface> &
	:rtype: opencascade::handle<Geom_ElementarySurface>
") MakeElementarySurface;
		static opencascade::handle<Geom_ElementarySurface> MakeElementarySurface (const opencascade::handle<StepGeom_ElementarySurface> & SS);
		%feature("compactdefaultargs") MakeEllipse;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_Ellipse> &
	:rtype: opencascade::handle<Geom_Ellipse>
") MakeEllipse;
		static opencascade::handle<Geom_Ellipse> MakeEllipse (const opencascade::handle<StepGeom_Ellipse> & SC);
		%feature("compactdefaultargs") MakeEllipse2d;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_Ellipse> &
	:rtype: opencascade::handle<Geom2d_Ellipse>
") MakeEllipse2d;
		static opencascade::handle<Geom2d_Ellipse> MakeEllipse2d (const opencascade::handle<StepGeom_Ellipse> & SC);
		%feature("compactdefaultargs") MakeHyperbola;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_Hyperbola> &
	:rtype: opencascade::handle<Geom_Hyperbola>
") MakeHyperbola;
		static opencascade::handle<Geom_Hyperbola> MakeHyperbola (const opencascade::handle<StepGeom_Hyperbola> & SC);
		%feature("compactdefaultargs") MakeHyperbola2d;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_Hyperbola> &
	:rtype: opencascade::handle<Geom2d_Hyperbola>
") MakeHyperbola2d;
		static opencascade::handle<Geom2d_Hyperbola> MakeHyperbola2d (const opencascade::handle<StepGeom_Hyperbola> & SC);
		%feature("compactdefaultargs") MakeLine;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_Line> &
	:rtype: opencascade::handle<Geom_Line>
") MakeLine;
		static opencascade::handle<Geom_Line> MakeLine (const opencascade::handle<StepGeom_Line> & SC);
		%feature("compactdefaultargs") MakeLine2d;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_Line> &
	:rtype: opencascade::handle<Geom2d_Line>
") MakeLine2d;
		static opencascade::handle<Geom2d_Line> MakeLine2d (const opencascade::handle<StepGeom_Line> & SC);
		%feature("compactdefaultargs") MakeParabola;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_Parabola> &
	:rtype: opencascade::handle<Geom_Parabola>
") MakeParabola;
		static opencascade::handle<Geom_Parabola> MakeParabola (const opencascade::handle<StepGeom_Parabola> & SC);
		%feature("compactdefaultargs") MakeParabola2d;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_Parabola> &
	:rtype: opencascade::handle<Geom2d_Parabola>
") MakeParabola2d;
		static opencascade::handle<Geom2d_Parabola> MakeParabola2d (const opencascade::handle<StepGeom_Parabola> & SC);
		%feature("compactdefaultargs") MakePlane;
		%feature("autodoc", "	:param SP:
	:type SP: opencascade::handle<StepGeom_Plane> &
	:rtype: opencascade::handle<Geom_Plane>
") MakePlane;
		static opencascade::handle<Geom_Plane> MakePlane (const opencascade::handle<StepGeom_Plane> & SP);
		%feature("compactdefaultargs") MakePolyline;
		%feature("autodoc", "	:param SPL:
	:type SPL: opencascade::handle<StepGeom_Polyline> &
	:rtype: opencascade::handle<Geom_BSplineCurve>
") MakePolyline;
		static opencascade::handle<Geom_BSplineCurve> MakePolyline (const opencascade::handle<StepGeom_Polyline> & SPL);
		%feature("compactdefaultargs") MakePolyline2d;
		%feature("autodoc", "	:param SPL:
	:type SPL: opencascade::handle<StepGeom_Polyline> &
	:rtype: opencascade::handle<Geom2d_BSplineCurve>
") MakePolyline2d;
		static opencascade::handle<Geom2d_BSplineCurve> MakePolyline2d (const opencascade::handle<StepGeom_Polyline> & SPL);
		%feature("compactdefaultargs") MakeRectangularTrimmedSurface;
		%feature("autodoc", "	:param SS:
	:type SS: opencascade::handle<StepGeom_RectangularTrimmedSurface> &
	:rtype: opencascade::handle<Geom_RectangularTrimmedSurface>
") MakeRectangularTrimmedSurface;
		static opencascade::handle<Geom_RectangularTrimmedSurface> MakeRectangularTrimmedSurface (const opencascade::handle<StepGeom_RectangularTrimmedSurface> & SS);
		%feature("compactdefaultargs") MakeSphericalSurface;
		%feature("autodoc", "	:param SS:
	:type SS: opencascade::handle<StepGeom_SphericalSurface> &
	:rtype: opencascade::handle<Geom_SphericalSurface>
") MakeSphericalSurface;
		static opencascade::handle<Geom_SphericalSurface> MakeSphericalSurface (const opencascade::handle<StepGeom_SphericalSurface> & SS);
		%feature("compactdefaultargs") MakeSurface;
		%feature("autodoc", "	:param SS:
	:type SS: opencascade::handle<StepGeom_Surface> &
	:rtype: opencascade::handle<Geom_Surface>
") MakeSurface;
		static opencascade::handle<Geom_Surface> MakeSurface (const opencascade::handle<StepGeom_Surface> & SS);
		%feature("compactdefaultargs") MakeSurfaceOfLinearExtrusion;
		%feature("autodoc", "	:param SS:
	:type SS: opencascade::handle<StepGeom_SurfaceOfLinearExtrusion> &
	:rtype: opencascade::handle<Geom_SurfaceOfLinearExtrusion>
") MakeSurfaceOfLinearExtrusion;
		static opencascade::handle<Geom_SurfaceOfLinearExtrusion> MakeSurfaceOfLinearExtrusion (const opencascade::handle<StepGeom_SurfaceOfLinearExtrusion> & SS);
		%feature("compactdefaultargs") MakeSurfaceOfRevolution;
		%feature("autodoc", "	:param SS:
	:type SS: opencascade::handle<StepGeom_SurfaceOfRevolution> &
	:rtype: opencascade::handle<Geom_SurfaceOfRevolution>
") MakeSurfaceOfRevolution;
		static opencascade::handle<Geom_SurfaceOfRevolution> MakeSurfaceOfRevolution (const opencascade::handle<StepGeom_SurfaceOfRevolution> & SS);
		%feature("compactdefaultargs") MakeSweptSurface;
		%feature("autodoc", "	:param SS:
	:type SS: opencascade::handle<StepGeom_SweptSurface> &
	:rtype: opencascade::handle<Geom_SweptSurface>
") MakeSweptSurface;
		static opencascade::handle<Geom_SweptSurface> MakeSweptSurface (const opencascade::handle<StepGeom_SweptSurface> & SS);
		%feature("compactdefaultargs") MakeToroidalSurface;
		%feature("autodoc", "	:param SS:
	:type SS: opencascade::handle<StepGeom_ToroidalSurface> &
	:rtype: opencascade::handle<Geom_ToroidalSurface>
") MakeToroidalSurface;
		static opencascade::handle<Geom_ToroidalSurface> MakeToroidalSurface (const opencascade::handle<StepGeom_ToroidalSurface> & SS);
		%feature("compactdefaultargs") MakeTransformation2d;
		%feature("autodoc", "	:param SCTO:
	:type SCTO: opencascade::handle<StepGeom_CartesianTransformationOperator2d> &
	:param CT:
	:type CT: gp_Trsf2d
	:rtype: bool
") MakeTransformation2d;
		static Standard_Boolean MakeTransformation2d (const opencascade::handle<StepGeom_CartesianTransformationOperator2d> & SCTO,gp_Trsf2d & CT);
		%feature("compactdefaultargs") MakeTransformation3d;
		%feature("autodoc", "	:param SCTO:
	:type SCTO: opencascade::handle<StepGeom_CartesianTransformationOperator3d> &
	:param CT:
	:type CT: gp_Trsf
	:rtype: bool
") MakeTransformation3d;
		static Standard_Boolean MakeTransformation3d (const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & SCTO,gp_Trsf & CT);
		%feature("compactdefaultargs") MakeTrimmedCurve;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_TrimmedCurve> &
	:rtype: opencascade::handle<Geom_TrimmedCurve>
") MakeTrimmedCurve;
		static opencascade::handle<Geom_TrimmedCurve> MakeTrimmedCurve (const opencascade::handle<StepGeom_TrimmedCurve> & SC);
		%feature("compactdefaultargs") MakeTrimmedCurve2d;
		%feature("autodoc", "	:param SC:
	:type SC: opencascade::handle<StepGeom_TrimmedCurve> &
	:rtype: opencascade::handle<Geom2d_BSplineCurve>
") MakeTrimmedCurve2d;
		static opencascade::handle<Geom2d_BSplineCurve> MakeTrimmedCurve2d (const opencascade::handle<StepGeom_TrimmedCurve> & SC);
		%feature("compactdefaultargs") MakeVectorWithMagnitude;
		%feature("autodoc", "	:param SV:
	:type SV: opencascade::handle<StepGeom_Vector> &
	:rtype: opencascade::handle<Geom_VectorWithMagnitude>
") MakeVectorWithMagnitude;
		static opencascade::handle<Geom_VectorWithMagnitude> MakeVectorWithMagnitude (const opencascade::handle<StepGeom_Vector> & SV);
		%feature("compactdefaultargs") MakeVectorWithMagnitude2d;
		%feature("autodoc", "	:param SV:
	:type SV: opencascade::handle<StepGeom_Vector> &
	:rtype: opencascade::handle<Geom2d_VectorWithMagnitude>
") MakeVectorWithMagnitude2d;
		static opencascade::handle<Geom2d_VectorWithMagnitude> MakeVectorWithMagnitude2d (const opencascade::handle<StepGeom_Vector> & SV);
};


%extend StepToGeom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
