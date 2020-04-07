from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.StepGeom import *
from OCC.Core.Geom import *
from OCC.Core.Geom2d import *
from OCC.Core.gp import *


class steptogeom:
	@staticmethod
	def MakeAxis1Placement(SA: StepGeom_Axis1Placement) -> Geom_Axis1Placement: ...
	@staticmethod
	def MakeAxis2Placement(SA: StepGeom_Axis2Placement3d) -> Geom_Axis2Placement: ...
	@staticmethod
	def MakeAxisPlacement(SA: StepGeom_Axis2Placement2d) -> Geom2d_AxisPlacement: ...
	@staticmethod
	def MakeBSplineCurve(SC: StepGeom_BSplineCurve) -> Geom_BSplineCurve: ...
	@staticmethod
	def MakeBSplineCurve2d(SC: StepGeom_BSplineCurve) -> Geom2d_BSplineCurve: ...
	@staticmethod
	def MakeBSplineSurface(SS: StepGeom_BSplineSurface) -> Geom_BSplineSurface: ...
	@staticmethod
	def MakeBoundedCurve(SC: StepGeom_BoundedCurve) -> Geom_BoundedCurve: ...
	@staticmethod
	def MakeBoundedCurve2d(SC: StepGeom_BoundedCurve) -> Geom2d_BoundedCurve: ...
	@staticmethod
	def MakeBoundedSurface(SS: StepGeom_BoundedSurface) -> Geom_BoundedSurface: ...
	@staticmethod
	def MakeCartesianPoint(SP: StepGeom_CartesianPoint) -> Geom_CartesianPoint: ...
	@staticmethod
	def MakeCartesianPoint2d(SP: StepGeom_CartesianPoint) -> Geom2d_CartesianPoint: ...
	@staticmethod
	def MakeCircle(SC: StepGeom_Circle) -> Geom_Circle: ...
	@staticmethod
	def MakeCircle2d(SC: StepGeom_Circle) -> Geom2d_Circle: ...
	@staticmethod
	def MakeConic(SC: StepGeom_Conic) -> Geom_Conic: ...
	@staticmethod
	def MakeConic2d(SC: StepGeom_Conic) -> Geom2d_Conic: ...
	@staticmethod
	def MakeConicalSurface(SS: StepGeom_ConicalSurface) -> Geom_ConicalSurface: ...
	@staticmethod
	def MakeCurve(SC: StepGeom_Curve) -> Geom_Curve: ...
	@staticmethod
	def MakeCurve2d(SC: StepGeom_Curve) -> Geom2d_Curve: ...
	@staticmethod
	def MakeCylindricalSurface(SS: StepGeom_CylindricalSurface) -> Geom_CylindricalSurface: ...
	@staticmethod
	def MakeDirection(SD: StepGeom_Direction) -> Geom_Direction: ...
	@staticmethod
	def MakeDirection2d(SD: StepGeom_Direction) -> Geom2d_Direction: ...
	@staticmethod
	def MakeElementarySurface(SS: StepGeom_ElementarySurface) -> Geom_ElementarySurface: ...
	@staticmethod
	def MakeEllipse(SC: StepGeom_Ellipse) -> Geom_Ellipse: ...
	@staticmethod
	def MakeEllipse2d(SC: StepGeom_Ellipse) -> Geom2d_Ellipse: ...
	@staticmethod
	def MakeHyperbola(SC: StepGeom_Hyperbola) -> Geom_Hyperbola: ...
	@staticmethod
	def MakeHyperbola2d(SC: StepGeom_Hyperbola) -> Geom2d_Hyperbola: ...
	@staticmethod
	def MakeLine(SC: StepGeom_Line) -> Geom_Line: ...
	@staticmethod
	def MakeLine2d(SC: StepGeom_Line) -> Geom2d_Line: ...
	@staticmethod
	def MakeParabola(SC: StepGeom_Parabola) -> Geom_Parabola: ...
	@staticmethod
	def MakeParabola2d(SC: StepGeom_Parabola) -> Geom2d_Parabola: ...
	@staticmethod
	def MakePlane(SP: StepGeom_Plane) -> Geom_Plane: ...
	@staticmethod
	def MakePolyline(SPL: StepGeom_Polyline) -> Geom_BSplineCurve: ...
	@staticmethod
	def MakePolyline2d(SPL: StepGeom_Polyline) -> Geom2d_BSplineCurve: ...
	@staticmethod
	def MakeRectangularTrimmedSurface(SS: StepGeom_RectangularTrimmedSurface) -> Geom_RectangularTrimmedSurface: ...
	@staticmethod
	def MakeSphericalSurface(SS: StepGeom_SphericalSurface) -> Geom_SphericalSurface: ...
	@staticmethod
	def MakeSurface(SS: StepGeom_Surface) -> Geom_Surface: ...
	@staticmethod
	def MakeSurfaceOfLinearExtrusion(SS: StepGeom_SurfaceOfLinearExtrusion) -> Geom_SurfaceOfLinearExtrusion: ...
	@staticmethod
	def MakeSurfaceOfRevolution(SS: StepGeom_SurfaceOfRevolution) -> Geom_SurfaceOfRevolution: ...
	@staticmethod
	def MakeSweptSurface(SS: StepGeom_SweptSurface) -> Geom_SweptSurface: ...
	@staticmethod
	def MakeToroidalSurface(SS: StepGeom_ToroidalSurface) -> Geom_ToroidalSurface: ...
	@staticmethod
	def MakeTransformation2d(SCTO: StepGeom_CartesianTransformationOperator2d, CT: gp_Trsf2d) -> bool: ...
	@staticmethod
	def MakeTransformation3d(SCTO: StepGeom_CartesianTransformationOperator3d, CT: gp_Trsf) -> bool: ...
	@staticmethod
	def MakeTrimmedCurve(SC: StepGeom_TrimmedCurve) -> Geom_TrimmedCurve: ...
	@staticmethod
	def MakeTrimmedCurve2d(SC: StepGeom_TrimmedCurve) -> Geom2d_BSplineCurve: ...
	@staticmethod
	def MakeVectorWithMagnitude(SV: StepGeom_Vector) -> Geom_VectorWithMagnitude: ...
	@staticmethod
	def MakeVectorWithMagnitude2d(SV: StepGeom_Vector) -> Geom2d_VectorWithMagnitude: ...

# harray1 classes
# harray2 classes
# hsequence classes

steptogeom_MakeAxis1Placement = steptogeom.MakeAxis1Placement
steptogeom_MakeAxis2Placement = steptogeom.MakeAxis2Placement
steptogeom_MakeAxisPlacement = steptogeom.MakeAxisPlacement
steptogeom_MakeBSplineCurve = steptogeom.MakeBSplineCurve
steptogeom_MakeBSplineCurve2d = steptogeom.MakeBSplineCurve2d
steptogeom_MakeBSplineSurface = steptogeom.MakeBSplineSurface
steptogeom_MakeBoundedCurve = steptogeom.MakeBoundedCurve
steptogeom_MakeBoundedCurve2d = steptogeom.MakeBoundedCurve2d
steptogeom_MakeBoundedSurface = steptogeom.MakeBoundedSurface
steptogeom_MakeCartesianPoint = steptogeom.MakeCartesianPoint
steptogeom_MakeCartesianPoint2d = steptogeom.MakeCartesianPoint2d
steptogeom_MakeCircle = steptogeom.MakeCircle
steptogeom_MakeCircle2d = steptogeom.MakeCircle2d
steptogeom_MakeConic = steptogeom.MakeConic
steptogeom_MakeConic2d = steptogeom.MakeConic2d
steptogeom_MakeConicalSurface = steptogeom.MakeConicalSurface
steptogeom_MakeCurve = steptogeom.MakeCurve
steptogeom_MakeCurve2d = steptogeom.MakeCurve2d
steptogeom_MakeCylindricalSurface = steptogeom.MakeCylindricalSurface
steptogeom_MakeDirection = steptogeom.MakeDirection
steptogeom_MakeDirection2d = steptogeom.MakeDirection2d
steptogeom_MakeElementarySurface = steptogeom.MakeElementarySurface
steptogeom_MakeEllipse = steptogeom.MakeEllipse
steptogeom_MakeEllipse2d = steptogeom.MakeEllipse2d
steptogeom_MakeHyperbola = steptogeom.MakeHyperbola
steptogeom_MakeHyperbola2d = steptogeom.MakeHyperbola2d
steptogeom_MakeLine = steptogeom.MakeLine
steptogeom_MakeLine2d = steptogeom.MakeLine2d
steptogeom_MakeParabola = steptogeom.MakeParabola
steptogeom_MakeParabola2d = steptogeom.MakeParabola2d
steptogeom_MakePlane = steptogeom.MakePlane
steptogeom_MakePolyline = steptogeom.MakePolyline
steptogeom_MakePolyline2d = steptogeom.MakePolyline2d
steptogeom_MakeRectangularTrimmedSurface = steptogeom.MakeRectangularTrimmedSurface
steptogeom_MakeSphericalSurface = steptogeom.MakeSphericalSurface
steptogeom_MakeSurface = steptogeom.MakeSurface
steptogeom_MakeSurfaceOfLinearExtrusion = steptogeom.MakeSurfaceOfLinearExtrusion
steptogeom_MakeSurfaceOfRevolution = steptogeom.MakeSurfaceOfRevolution
steptogeom_MakeSweptSurface = steptogeom.MakeSweptSurface
steptogeom_MakeToroidalSurface = steptogeom.MakeToroidalSurface
steptogeom_MakeTransformation2d = steptogeom.MakeTransformation2d
steptogeom_MakeTransformation3d = steptogeom.MakeTransformation3d
steptogeom_MakeTrimmedCurve = steptogeom.MakeTrimmedCurve
steptogeom_MakeTrimmedCurve2d = steptogeom.MakeTrimmedCurve2d
steptogeom_MakeVectorWithMagnitude = steptogeom.MakeVectorWithMagnitude
steptogeom_MakeVectorWithMagnitude2d = steptogeom.MakeVectorWithMagnitude2d
