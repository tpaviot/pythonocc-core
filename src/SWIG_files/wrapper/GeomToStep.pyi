from enum import IntEnum
from typing import overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.gp import *
from OCC.Core.StepData import *
from OCC.Core.Geom import *
from OCC.Core.Geom2d import *
from OCC.Core.StepGeom import *
from OCC.Core.TColgp import *

class GeomToStep_Root:
    def IsDone(self) -> bool: ...

class GeomToStep_MakeAxis1Placement(GeomToStep_Root):
    @overload
    def __init__(
        self,
        A: gp_Ax1,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        A: gp_Ax2d,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        A: Geom_Axis1Placement,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        A: Geom2d_AxisPlacement,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_Axis1Placement: ...

class GeomToStep_MakeAxis2Placement2d(GeomToStep_Root):
    @overload
    def __init__(
        self,
        A: gp_Ax2,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        A: gp_Ax22d,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_Axis2Placement2d: ...

class GeomToStep_MakeAxis2Placement3d(GeomToStep_Root):
    @overload
    def __init__(
        self, theLocalFactors: Optional[StepData_Factors] = StepData_Factors()
    ) -> None: ...
    @overload
    def __init__(
        self,
        A: gp_Ax2,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        A: gp_Ax3,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        T: gp_Trsf,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        A: Geom_Axis2Placement,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_Axis2Placement3d: ...

class GeomToStep_MakeBSplineCurveWithKnots(GeomToStep_Root):
    @overload
    def __init__(
        self,
        Bsplin: Geom_BSplineCurve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        Bsplin: Geom2d_BSplineCurve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_BSplineCurveWithKnots: ...

class GeomToStep_MakeBSplineCurveWithKnotsAndRationalBSplineCurve(GeomToStep_Root):
    @overload
    def __init__(
        self,
        Bsplin: Geom_BSplineCurve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        Bsplin: Geom2d_BSplineCurve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve: ...

class GeomToStep_MakeBSplineSurfaceWithKnots(GeomToStep_Root):
    def __init__(
        self,
        Bsplin: Geom_BSplineSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_BSplineSurfaceWithKnots: ...

class GeomToStep_MakeBSplineSurfaceWithKnotsAndRationalBSplineSurface(GeomToStep_Root):
    def __init__(
        self,
        Bsplin: Geom_BSplineSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface: ...

class GeomToStep_MakeBoundedCurve(GeomToStep_Root):
    @overload
    def __init__(
        self,
        C: Geom_BoundedCurve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        C: Geom2d_BoundedCurve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_BoundedCurve: ...

class GeomToStep_MakeBoundedSurface(GeomToStep_Root):
    def __init__(
        self,
        C: Geom_BoundedSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_BoundedSurface: ...

class GeomToStep_MakeCartesianPoint(GeomToStep_Root):
    @overload
    def __init__(self, P: gp_Pnt, aFactor: float) -> None: ...
    @overload
    def __init__(self, P: gp_Pnt2d, aFactor: float) -> None: ...
    @overload
    def __init__(self, P: Geom_CartesianPoint, aFactor: float) -> None: ...
    @overload
    def __init__(self, P: Geom2d_CartesianPoint) -> None: ...
    def Value(self) -> StepGeom_CartesianPoint: ...

class GeomToStep_MakeCircle(GeomToStep_Root):
    @overload
    def __init__(
        self,
        C: gp_Circ,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        C: Geom_Circle,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        C: Geom2d_Circle,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_Circle: ...

class GeomToStep_MakeConic(GeomToStep_Root):
    @overload
    def __init__(
        self,
        C: Geom_Conic,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        C: Geom2d_Conic,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_Conic: ...

class GeomToStep_MakeConicalSurface(GeomToStep_Root):
    def __init__(
        self,
        CSurf: Geom_ConicalSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_ConicalSurface: ...

class GeomToStep_MakeCurve(GeomToStep_Root):
    @overload
    def __init__(
        self,
        C: Geom_Curve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        C: Geom2d_Curve,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_Curve: ...

class GeomToStep_MakeCylindricalSurface(GeomToStep_Root):
    def __init__(
        self,
        CSurf: Geom_CylindricalSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_CylindricalSurface: ...

class GeomToStep_MakeDirection(GeomToStep_Root):
    @overload
    def __init__(self, D: gp_Dir) -> None: ...
    @overload
    def __init__(self, D: gp_Dir2d) -> None: ...
    @overload
    def __init__(self, D: Geom_Direction) -> None: ...
    @overload
    def __init__(self, D: Geom2d_Direction) -> None: ...
    def Value(self) -> StepGeom_Direction: ...

class GeomToStep_MakeElementarySurface(GeomToStep_Root):
    def __init__(
        self,
        S: Geom_ElementarySurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_ElementarySurface: ...

class GeomToStep_MakeEllipse(GeomToStep_Root):
    @overload
    def __init__(
        self,
        C: gp_Elips,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        C: Geom_Ellipse,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        C: Geom2d_Ellipse,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_Ellipse: ...

class GeomToStep_MakeHyperbola(GeomToStep_Root):
    @overload
    def __init__(
        self,
        C: Geom2d_Hyperbola,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        C: Geom_Hyperbola,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_Hyperbola: ...

class GeomToStep_MakeLine(GeomToStep_Root):
    @overload
    def __init__(
        self,
        L: gp_Lin,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        L: gp_Lin2d,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        C: Geom_Line,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        C: Geom2d_Line,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_Line: ...

class GeomToStep_MakeParabola(GeomToStep_Root):
    @overload
    def __init__(
        self,
        C: Geom2d_Parabola,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        C: Geom_Parabola,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_Parabola: ...

class GeomToStep_MakePlane(GeomToStep_Root):
    @overload
    def __init__(
        self,
        P: gp_Pln,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        P: Geom_Plane,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_Plane: ...

class GeomToStep_MakePolyline(GeomToStep_Root):
    @overload
    def __init__(
        self,
        P: TColgp_Array1OfPnt,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        P: TColgp_Array1OfPnt2d,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_Polyline: ...

class GeomToStep_MakeRectangularTrimmedSurface(GeomToStep_Root):
    def __init__(
        self,
        RTSurf: Geom_RectangularTrimmedSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_RectangularTrimmedSurface: ...

class GeomToStep_MakeSphericalSurface(GeomToStep_Root):
    def __init__(
        self,
        CSurf: Geom_SphericalSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_SphericalSurface: ...

class GeomToStep_MakeSurface(GeomToStep_Root):
    def __init__(
        self,
        C: Geom_Surface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_Surface: ...

class GeomToStep_MakeSurfaceOfLinearExtrusion(GeomToStep_Root):
    def __init__(
        self,
        CSurf: Geom_SurfaceOfLinearExtrusion,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_SurfaceOfLinearExtrusion: ...

class GeomToStep_MakeSurfaceOfRevolution(GeomToStep_Root):
    def __init__(
        self,
        RevSurf: Geom_SurfaceOfRevolution,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_SurfaceOfRevolution: ...

class GeomToStep_MakeSweptSurface(GeomToStep_Root):
    def __init__(
        self,
        S: Geom_SweptSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_SweptSurface: ...

class GeomToStep_MakeToroidalSurface(GeomToStep_Root):
    def __init__(
        self,
        TorSurf: Geom_ToroidalSurface,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_ToroidalSurface: ...

class GeomToStep_MakeVector(GeomToStep_Root):
    @overload
    def __init__(
        self,
        V: gp_Vec,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        V: gp_Vec2d,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        V: Geom_Vector,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    @overload
    def __init__(
        self,
        V: Geom2d_Vector,
        theLocalFactors: Optional[StepData_Factors] = StepData_Factors(),
    ) -> None: ...
    def Value(self) -> StepGeom_Vector: ...

# harray1 classes
# harray2 classes
# hsequence classes
