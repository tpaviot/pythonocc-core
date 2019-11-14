#ifndef STEPGEOM_HXX
#define STEPGEOM_HXX

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

#include<StepGeom_Array1OfBoundaryCurve.hxx>
#include<StepGeom_Array1OfCartesianPoint.hxx>
#include<StepGeom_Array1OfCompositeCurveSegment.hxx>
#include<StepGeom_Array1OfCurve.hxx>
#include<StepGeom_Array1OfPcurveOrSurface.hxx>
#include<StepGeom_Array1OfSurfaceBoundary.hxx>
#include<StepGeom_Array1OfTrimmingSelect.hxx>
#include<StepGeom_Array2OfCartesianPoint.hxx>
#include<StepGeom_Array2OfSurfacePatch.hxx>
#include<StepGeom_Axis1Placement.hxx>
#include<StepGeom_Axis2Placement.hxx>
#include<StepGeom_Axis2Placement2d.hxx>
#include<StepGeom_Axis2Placement3d.hxx>
#include<StepGeom_BSplineCurve.hxx>
#include<StepGeom_BSplineCurveForm.hxx>
#include<StepGeom_BSplineCurveWithKnots.hxx>
#include<StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve.hxx>
#include<StepGeom_BSplineSurface.hxx>
#include<StepGeom_BSplineSurfaceForm.hxx>
#include<StepGeom_BSplineSurfaceWithKnots.hxx>
#include<StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface.hxx>
#include<StepGeom_BezierCurve.hxx>
#include<StepGeom_BezierCurveAndRationalBSplineCurve.hxx>
#include<StepGeom_BezierSurface.hxx>
#include<StepGeom_BezierSurfaceAndRationalBSplineSurface.hxx>
#include<StepGeom_BoundaryCurve.hxx>
#include<StepGeom_BoundedCurve.hxx>
#include<StepGeom_BoundedSurface.hxx>
#include<StepGeom_CartesianPoint.hxx>
#include<StepGeom_CartesianTransformationOperator.hxx>
#include<StepGeom_CartesianTransformationOperator2d.hxx>
#include<StepGeom_CartesianTransformationOperator3d.hxx>
#include<StepGeom_Circle.hxx>
#include<StepGeom_CompositeCurve.hxx>
#include<StepGeom_CompositeCurveOnSurface.hxx>
#include<StepGeom_CompositeCurveSegment.hxx>
#include<StepGeom_Conic.hxx>
#include<StepGeom_ConicalSurface.hxx>
#include<StepGeom_Curve.hxx>
#include<StepGeom_CurveBoundedSurface.hxx>
#include<StepGeom_CurveOnSurface.hxx>
#include<StepGeom_CurveReplica.hxx>
#include<StepGeom_CylindricalSurface.hxx>
#include<StepGeom_DegeneratePcurve.hxx>
#include<StepGeom_DegenerateToroidalSurface.hxx>
#include<StepGeom_Direction.hxx>
#include<StepGeom_ElementarySurface.hxx>
#include<StepGeom_Ellipse.hxx>
#include<StepGeom_EvaluatedDegeneratePcurve.hxx>
#include<StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx.hxx>
#include<StepGeom_GeometricRepresentationContext.hxx>
#include<StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext.hxx>
#include<StepGeom_GeometricRepresentationContextAndParametricRepresentationContext.hxx>
#include<StepGeom_GeometricRepresentationItem.hxx>
#include<StepGeom_HArray1OfBoundaryCurve.hxx>
#include<StepGeom_HArray1OfCartesianPoint.hxx>
#include<StepGeom_HArray1OfCompositeCurveSegment.hxx>
#include<StepGeom_HArray1OfCurve.hxx>
#include<StepGeom_HArray1OfPcurveOrSurface.hxx>
#include<StepGeom_HArray1OfSurfaceBoundary.hxx>
#include<StepGeom_HArray1OfTrimmingSelect.hxx>
#include<StepGeom_HArray2OfCartesianPoint.hxx>
#include<StepGeom_HArray2OfSurfacePatch.hxx>
#include<StepGeom_Hyperbola.hxx>
#include<StepGeom_IntersectionCurve.hxx>
#include<StepGeom_KnotType.hxx>
#include<StepGeom_Line.hxx>
#include<StepGeom_OffsetCurve3d.hxx>
#include<StepGeom_OffsetSurface.hxx>
#include<StepGeom_OrientedSurface.hxx>
#include<StepGeom_OuterBoundaryCurve.hxx>
#include<StepGeom_Parabola.hxx>
#include<StepGeom_Pcurve.hxx>
#include<StepGeom_PcurveOrSurface.hxx>
#include<StepGeom_Placement.hxx>
#include<StepGeom_Plane.hxx>
#include<StepGeom_Point.hxx>
#include<StepGeom_PointOnCurve.hxx>
#include<StepGeom_PointOnSurface.hxx>
#include<StepGeom_PointReplica.hxx>
#include<StepGeom_Polyline.hxx>
#include<StepGeom_PreferredSurfaceCurveRepresentation.hxx>
#include<StepGeom_QuasiUniformCurve.hxx>
#include<StepGeom_QuasiUniformCurveAndRationalBSplineCurve.hxx>
#include<StepGeom_QuasiUniformSurface.hxx>
#include<StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface.hxx>
#include<StepGeom_RationalBSplineCurve.hxx>
#include<StepGeom_RationalBSplineSurface.hxx>
#include<StepGeom_RectangularCompositeSurface.hxx>
#include<StepGeom_RectangularTrimmedSurface.hxx>
#include<StepGeom_ReparametrisedCompositeCurveSegment.hxx>
#include<StepGeom_SeamCurve.hxx>
#include<StepGeom_SphericalSurface.hxx>
#include<StepGeom_Surface.hxx>
#include<StepGeom_SurfaceBoundary.hxx>
#include<StepGeom_SurfaceCurve.hxx>
#include<StepGeom_SurfaceCurveAndBoundedCurve.hxx>
#include<StepGeom_SurfaceOfLinearExtrusion.hxx>
#include<StepGeom_SurfaceOfRevolution.hxx>
#include<StepGeom_SurfacePatch.hxx>
#include<StepGeom_SurfaceReplica.hxx>
#include<StepGeom_SweptSurface.hxx>
#include<StepGeom_ToroidalSurface.hxx>
#include<StepGeom_TransitionCode.hxx>
#include<StepGeom_TrimmedCurve.hxx>
#include<StepGeom_TrimmingMember.hxx>
#include<StepGeom_TrimmingPreference.hxx>
#include<StepGeom_TrimmingSelect.hxx>
#include<StepGeom_UniformCurve.hxx>
#include<StepGeom_UniformCurveAndRationalBSplineCurve.hxx>
#include<StepGeom_UniformSurface.hxx>
#include<StepGeom_UniformSurfaceAndRationalBSplineSurface.hxx>
#include<StepGeom_Vector.hxx>
#include<StepGeom_VectorOrDirection.hxx>

#endif // STEPGEOM_HXX
