from enum import IntEnum
import typing
from typing import Any, overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *


class GeomAbs_BSplKnotDistribution(IntEnum):
    GeomAbs_NonUniform = 0
    GeomAbs_Uniform = 1
    GeomAbs_QuasiUniform = 2
    GeomAbs_PiecewiseBezier = 3

GeomAbs_NonUniform = GeomAbs_BSplKnotDistribution.GeomAbs_NonUniform
GeomAbs_Uniform = GeomAbs_BSplKnotDistribution.GeomAbs_Uniform
GeomAbs_QuasiUniform = GeomAbs_BSplKnotDistribution.GeomAbs_QuasiUniform
GeomAbs_PiecewiseBezier = GeomAbs_BSplKnotDistribution.GeomAbs_PiecewiseBezier

class GeomAbs_CurveType(IntEnum):
    GeomAbs_Line = 0
    GeomAbs_Circle = 1
    GeomAbs_Ellipse = 2
    GeomAbs_Hyperbola = 3
    GeomAbs_Parabola = 4
    GeomAbs_BezierCurve = 5
    GeomAbs_BSplineCurve = 6
    GeomAbs_OffsetCurve = 7
    GeomAbs_OtherCurve = 8

GeomAbs_Line = GeomAbs_CurveType.GeomAbs_Line
GeomAbs_Circle = GeomAbs_CurveType.GeomAbs_Circle
GeomAbs_Ellipse = GeomAbs_CurveType.GeomAbs_Ellipse
GeomAbs_Hyperbola = GeomAbs_CurveType.GeomAbs_Hyperbola
GeomAbs_Parabola = GeomAbs_CurveType.GeomAbs_Parabola
GeomAbs_BezierCurve = GeomAbs_CurveType.GeomAbs_BezierCurve
GeomAbs_BSplineCurve = GeomAbs_CurveType.GeomAbs_BSplineCurve
GeomAbs_OffsetCurve = GeomAbs_CurveType.GeomAbs_OffsetCurve
GeomAbs_OtherCurve = GeomAbs_CurveType.GeomAbs_OtherCurve

class GeomAbs_IsoType(IntEnum):
    GeomAbs_IsoU = 0
    GeomAbs_IsoV = 1
    GeomAbs_NoneIso = 2

GeomAbs_IsoU = GeomAbs_IsoType.GeomAbs_IsoU
GeomAbs_IsoV = GeomAbs_IsoType.GeomAbs_IsoV
GeomAbs_NoneIso = GeomAbs_IsoType.GeomAbs_NoneIso

class GeomAbs_JoinType(IntEnum):
    GeomAbs_Arc = 0
    GeomAbs_Tangent = 1
    GeomAbs_Intersection = 2

GeomAbs_Arc = GeomAbs_JoinType.GeomAbs_Arc
GeomAbs_Tangent = GeomAbs_JoinType.GeomAbs_Tangent
GeomAbs_Intersection = GeomAbs_JoinType.GeomAbs_Intersection

class GeomAbs_Shape(IntEnum):
    GeomAbs_C0 = 0
    GeomAbs_G1 = 1
    GeomAbs_C1 = 2
    GeomAbs_G2 = 3
    GeomAbs_C2 = 4
    GeomAbs_C3 = 5
    GeomAbs_CN = 6

GeomAbs_C0 = GeomAbs_Shape.GeomAbs_C0
GeomAbs_G1 = GeomAbs_Shape.GeomAbs_G1
GeomAbs_C1 = GeomAbs_Shape.GeomAbs_C1
GeomAbs_G2 = GeomAbs_Shape.GeomAbs_G2
GeomAbs_C2 = GeomAbs_Shape.GeomAbs_C2
GeomAbs_C3 = GeomAbs_Shape.GeomAbs_C3
GeomAbs_CN = GeomAbs_Shape.GeomAbs_CN

class GeomAbs_SurfaceType(IntEnum):
    GeomAbs_Plane = 0
    GeomAbs_Cylinder = 1
    GeomAbs_Cone = 2
    GeomAbs_Sphere = 3
    GeomAbs_Torus = 4
    GeomAbs_BezierSurface = 5
    GeomAbs_BSplineSurface = 6
    GeomAbs_SurfaceOfRevolution = 7
    GeomAbs_SurfaceOfExtrusion = 8
    GeomAbs_OffsetSurface = 9
    GeomAbs_OtherSurface = 10

GeomAbs_Plane = GeomAbs_SurfaceType.GeomAbs_Plane
GeomAbs_Cylinder = GeomAbs_SurfaceType.GeomAbs_Cylinder
GeomAbs_Cone = GeomAbs_SurfaceType.GeomAbs_Cone
GeomAbs_Sphere = GeomAbs_SurfaceType.GeomAbs_Sphere
GeomAbs_Torus = GeomAbs_SurfaceType.GeomAbs_Torus
GeomAbs_BezierSurface = GeomAbs_SurfaceType.GeomAbs_BezierSurface
GeomAbs_BSplineSurface = GeomAbs_SurfaceType.GeomAbs_BSplineSurface
GeomAbs_SurfaceOfRevolution = GeomAbs_SurfaceType.GeomAbs_SurfaceOfRevolution
GeomAbs_SurfaceOfExtrusion = GeomAbs_SurfaceType.GeomAbs_SurfaceOfExtrusion
GeomAbs_OffsetSurface = GeomAbs_SurfaceType.GeomAbs_OffsetSurface
GeomAbs_OtherSurface = GeomAbs_SurfaceType.GeomAbs_OtherSurface

# harray1 classes
# harray2 classes
# hsequence classes

