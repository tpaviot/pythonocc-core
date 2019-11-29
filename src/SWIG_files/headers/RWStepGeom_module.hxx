#ifndef RWSTEPGEOM_HXX
#define RWSTEPGEOM_HXX

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

#include<RWStepGeom_RWAxis1Placement.hxx>
#include<RWStepGeom_RWAxis2Placement2d.hxx>
#include<RWStepGeom_RWAxis2Placement3d.hxx>
#include<RWStepGeom_RWBSplineCurve.hxx>
#include<RWStepGeom_RWBSplineCurveWithKnots.hxx>
#include<RWStepGeom_RWBSplineCurveWithKnotsAndRationalBSplineCurve.hxx>
#include<RWStepGeom_RWBSplineSurface.hxx>
#include<RWStepGeom_RWBSplineSurfaceWithKnots.hxx>
#include<RWStepGeom_RWBSplineSurfaceWithKnotsAndRationalBSplineSurface.hxx>
#include<RWStepGeom_RWBezierCurve.hxx>
#include<RWStepGeom_RWBezierCurveAndRationalBSplineCurve.hxx>
#include<RWStepGeom_RWBezierSurface.hxx>
#include<RWStepGeom_RWBezierSurfaceAndRationalBSplineSurface.hxx>
#include<RWStepGeom_RWBoundaryCurve.hxx>
#include<RWStepGeom_RWBoundedCurve.hxx>
#include<RWStepGeom_RWBoundedSurface.hxx>
#include<RWStepGeom_RWCartesianPoint.hxx>
#include<RWStepGeom_RWCartesianTransformationOperator.hxx>
#include<RWStepGeom_RWCartesianTransformationOperator3d.hxx>
#include<RWStepGeom_RWCircle.hxx>
#include<RWStepGeom_RWCompositeCurve.hxx>
#include<RWStepGeom_RWCompositeCurveOnSurface.hxx>
#include<RWStepGeom_RWCompositeCurveSegment.hxx>
#include<RWStepGeom_RWConic.hxx>
#include<RWStepGeom_RWConicalSurface.hxx>
#include<RWStepGeom_RWCurve.hxx>
#include<RWStepGeom_RWCurveBoundedSurface.hxx>
#include<RWStepGeom_RWCurveReplica.hxx>
#include<RWStepGeom_RWCylindricalSurface.hxx>
#include<RWStepGeom_RWDegeneratePcurve.hxx>
#include<RWStepGeom_RWDegenerateToroidalSurface.hxx>
#include<RWStepGeom_RWDirection.hxx>
#include<RWStepGeom_RWElementarySurface.hxx>
#include<RWStepGeom_RWEllipse.hxx>
#include<RWStepGeom_RWEvaluatedDegeneratePcurve.hxx>
#include<RWStepGeom_RWGeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx.hxx>
#include<RWStepGeom_RWGeometricRepresentationContext.hxx>
#include<RWStepGeom_RWGeometricRepresentationContextAndGlobalUnitAssignedContext.hxx>
#include<RWStepGeom_RWGeometricRepresentationContextAndParametricRepresentationContext.hxx>
#include<RWStepGeom_RWGeometricRepresentationItem.hxx>
#include<RWStepGeom_RWHyperbola.hxx>
#include<RWStepGeom_RWIntersectionCurve.hxx>
#include<RWStepGeom_RWLine.hxx>
#include<RWStepGeom_RWOffsetCurve3d.hxx>
#include<RWStepGeom_RWOffsetSurface.hxx>
#include<RWStepGeom_RWOrientedSurface.hxx>
#include<RWStepGeom_RWOuterBoundaryCurve.hxx>
#include<RWStepGeom_RWParabola.hxx>
#include<RWStepGeom_RWPcurve.hxx>
#include<RWStepGeom_RWPlacement.hxx>
#include<RWStepGeom_RWPlane.hxx>
#include<RWStepGeom_RWPoint.hxx>
#include<RWStepGeom_RWPointOnCurve.hxx>
#include<RWStepGeom_RWPointOnSurface.hxx>
#include<RWStepGeom_RWPointReplica.hxx>
#include<RWStepGeom_RWPolyline.hxx>
#include<RWStepGeom_RWQuasiUniformCurve.hxx>
#include<RWStepGeom_RWQuasiUniformCurveAndRationalBSplineCurve.hxx>
#include<RWStepGeom_RWQuasiUniformSurface.hxx>
#include<RWStepGeom_RWQuasiUniformSurfaceAndRationalBSplineSurface.hxx>
#include<RWStepGeom_RWRationalBSplineCurve.hxx>
#include<RWStepGeom_RWRationalBSplineSurface.hxx>
#include<RWStepGeom_RWRectangularCompositeSurface.hxx>
#include<RWStepGeom_RWRectangularTrimmedSurface.hxx>
#include<RWStepGeom_RWReparametrisedCompositeCurveSegment.hxx>
#include<RWStepGeom_RWSeamCurve.hxx>
#include<RWStepGeom_RWSphericalSurface.hxx>
#include<RWStepGeom_RWSurface.hxx>
#include<RWStepGeom_RWSurfaceCurve.hxx>
#include<RWStepGeom_RWSurfaceCurveAndBoundedCurve.hxx>
#include<RWStepGeom_RWSurfaceOfLinearExtrusion.hxx>
#include<RWStepGeom_RWSurfaceOfRevolution.hxx>
#include<RWStepGeom_RWSurfacePatch.hxx>
#include<RWStepGeom_RWSurfaceReplica.hxx>
#include<RWStepGeom_RWSweptSurface.hxx>
#include<RWStepGeom_RWToroidalSurface.hxx>
#include<RWStepGeom_RWTrimmedCurve.hxx>
#include<RWStepGeom_RWUniformCurve.hxx>
#include<RWStepGeom_RWUniformCurveAndRationalBSplineCurve.hxx>
#include<RWStepGeom_RWUniformSurface.hxx>
#include<RWStepGeom_RWUniformSurfaceAndRationalBSplineSurface.hxx>
#include<RWStepGeom_RWVector.hxx>

#endif // RWSTEPGEOM_HXX
