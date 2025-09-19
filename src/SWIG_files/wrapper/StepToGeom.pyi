from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.StepGeom import *
from OCC.Core.StepData import *
from OCC.Core.Geom import *
from OCC.Core.Geom2d import *
from OCC.Core.gp import *
from OCC.Core.StepKinematics import *
from OCC.Core.StepRepr import *
from OCC.Core.TColStd import *

class steptogeom:
    @staticmethod
    def MakeAxis1Placement(
        SA: StepGeom_Axis1Placement,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_Axis1Placement: ...
    @overload
    @staticmethod
    def MakeAxis2Placement(
        SA: StepGeom_Axis2Placement3d,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_Axis2Placement: ...
    @overload
    @staticmethod
    def MakeAxis2Placement(SP: StepGeom_SuParameters) -> Geom_Axis2Placement: ...
    @staticmethod
    def MakeAxisPlacement(
        SA: StepGeom_Axis2Placement2d,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom2d_AxisPlacement: ...
    @staticmethod
    def MakeBSplineCurve(
        SC: StepGeom_BSplineCurve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_BSplineCurve: ...
    @staticmethod
    def MakeBSplineCurve2d(
        SC: StepGeom_BSplineCurve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom2d_BSplineCurve: ...
    @staticmethod
    def MakeBSplineSurface(
        SS: StepGeom_BSplineSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_BSplineSurface: ...
    @staticmethod
    def MakeBoundedCurve(
        SC: StepGeom_BoundedCurve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_BoundedCurve: ...
    @staticmethod
    def MakeBoundedCurve2d(
        SC: StepGeom_BoundedCurve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom2d_BoundedCurve: ...
    @staticmethod
    def MakeBoundedSurface(
        SS: StepGeom_BoundedSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_BoundedSurface: ...
    @staticmethod
    def MakeCartesianPoint(
        SP: StepGeom_CartesianPoint,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_CartesianPoint: ...
    @staticmethod
    def MakeCartesianPoint2d(
        SP: StepGeom_CartesianPoint,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom2d_CartesianPoint: ...
    @staticmethod
    def MakeCircle(
        SC: StepGeom_Circle,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_Circle: ...
    @staticmethod
    def MakeCircle2d(
        SC: StepGeom_Circle,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom2d_Circle: ...
    @staticmethod
    def MakeConic(
        SC: StepGeom_Conic,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_Conic: ...
    @staticmethod
    def MakeConic2d(
        SC: StepGeom_Conic,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom2d_Conic: ...
    @staticmethod
    def MakeConicalSurface(
        SS: StepGeom_ConicalSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_ConicalSurface: ...
    @staticmethod
    def MakeCurve(
        SC: StepGeom_Curve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_Curve: ...
    @staticmethod
    def MakeCurve2d(
        SC: StepGeom_Curve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom2d_Curve: ...
    @staticmethod
    def MakeCylindricalSurface(
        SS: StepGeom_CylindricalSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_CylindricalSurface: ...
    @staticmethod
    def MakeDirection(SD: StepGeom_Direction) -> Geom_Direction: ...
    @staticmethod
    def MakeDirection2d(SD: StepGeom_Direction) -> Geom2d_Direction: ...
    @staticmethod
    def MakeElementarySurface(
        SS: StepGeom_ElementarySurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_ElementarySurface: ...
    @staticmethod
    def MakeEllipse(
        SC: StepGeom_Ellipse,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_Ellipse: ...
    @staticmethod
    def MakeEllipse2d(
        SC: StepGeom_Ellipse,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom2d_Ellipse: ...
    @staticmethod
    def MakeHyperbola(
        SC: StepGeom_Hyperbola,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_Hyperbola: ...
    @staticmethod
    def MakeHyperbola2d(
        SC: StepGeom_Hyperbola,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom2d_Hyperbola: ...
    @staticmethod
    def MakeLine(
        SC: StepGeom_Line,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_Line: ...
    @staticmethod
    def MakeLine2d(
        SC: StepGeom_Line,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom2d_Line: ...
    @staticmethod
    def MakeParabola(
        SC: StepGeom_Parabola,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_Parabola: ...
    @staticmethod
    def MakeParabola2d(
        SC: StepGeom_Parabola,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom2d_Parabola: ...
    @staticmethod
    def MakePlane(
        SP: StepGeom_Plane,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_Plane: ...
    @staticmethod
    def MakePolyline(
        SPL: StepGeom_Polyline,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_BSplineCurve: ...
    @staticmethod
    def MakePolyline2d(
        SPL: StepGeom_Polyline,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom2d_BSplineCurve: ...
    @staticmethod
    def MakeRectangularTrimmedSurface(
        SS: StepGeom_RectangularTrimmedSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_RectangularTrimmedSurface: ...
    @staticmethod
    def MakeSphericalSurface(
        SS: StepGeom_SphericalSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_SphericalSurface: ...
    @staticmethod
    def MakeSurface(
        SS: StepGeom_Surface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_Surface: ...
    @staticmethod
    def MakeSurfaceOfLinearExtrusion(
        SS: StepGeom_SurfaceOfLinearExtrusion,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_SurfaceOfLinearExtrusion: ...
    @staticmethod
    def MakeSurfaceOfRevolution(
        SS: StepGeom_SurfaceOfRevolution,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_SurfaceOfRevolution: ...
    @staticmethod
    def MakeSweptSurface(
        SS: StepGeom_SweptSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_SweptSurface: ...
    @staticmethod
    def MakeToroidalSurface(
        SS: StepGeom_ToroidalSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_ToroidalSurface: ...
    @staticmethod
    def MakeTransformation2d(
        SCTO: StepGeom_CartesianTransformationOperator2d,
        CT: gp_Trsf2d,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> bool: ...
    @staticmethod
    def MakeTransformation3d(
        SCTO: StepGeom_CartesianTransformationOperator3d,
        CT: gp_Trsf,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> bool: ...
    @staticmethod
    def MakeTrimmedCurve(
        SC: StepGeom_TrimmedCurve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_TrimmedCurve: ...
    @staticmethod
    def MakeTrimmedCurve2d(
        SC: StepGeom_TrimmedCurve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom2d_BSplineCurve: ...
    @staticmethod
    def MakeVectorWithMagnitude(
        SV: StepGeom_Vector,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> Geom_VectorWithMagnitude: ...
    @staticmethod
    def MakeVectorWithMagnitude2d(
        SV: StepGeom_Vector,
    ) -> Geom2d_VectorWithMagnitude: ...
    @staticmethod
    def MakeYprRotation(
        SR: StepKinematics_SpatialRotation, theCntxt: StepRepr_GlobalUnitAssignedContext
    ) -> TColStd_HArray1OfReal: ...

# harray1 classes
# harray2 classes
# hsequence classes
