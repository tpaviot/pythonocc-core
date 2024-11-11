#!/usr/bin/env python

##Copyright 2009-2018 Thomas Paviot (tpaviot@gmail.com)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU Lesser General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU Lesser General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

from OCC.Core.gp import (
    gp,
    gp_Pnt,
    gp_Pnt2d,
    gp_Ax3,
    gp_Vec,
    gp_Pln,
    gp_Elips,
    gp_Dir2d,
    gp_Ax22d,
    gp_Parab2d,
    gp_Dir,
)
from OCC.Core.Geom2d import (
    Geom2d_OffsetCurve,
    Geom2d_Circle,
    Geom2d_TrimmedCurve,
    Geom2d_Parabola,
)
from OCC.Core.Geom2dAdaptor import Geom2dAdaptor_Curve
from OCC.Core.Geom2dAPI import Geom2dAPI_Interpolate, Geom2dAPI_PointsToBSpline
from OCC.Core.GCPnts import GCPnts_UniformAbscissa
from OCC.Core.Geom import (
    Geom_Circle,
    Geom_SphericalSurface,
    Geom_OffsetSurface,
    Geom_SurfaceOfRevolution,
    Geom_RectangularTrimmedSurface,
    Geom_BSplineCurve,
    Geom_Ellipse,
)
from OCC.Core.GeomAPI import (
    GeomAPI_PointsToBSpline,
    GeomAPI_ExtremaSurfaceSurface,
    GeomAPI_ProjectPointOnCurve,
    GeomAPI_ProjectPointOnSurf,
    GeomAPI_PointsToBSplineSurface,
)
from OCC.Core.Precision import precision
from OCC.Core.IntAna import IntAna_IntConicQuad
from OCC.Core.GC import GC_MakeEllipse, GC_MakeSegment, GC_MakePlane
from OCC.Core.GCE2d import GCE2d_MakeParabola, GCE2d_MakeEllipse, GCE2d_MakeSegment
from OCC.Core.Geom2dConvert import geom2dconvert
from OCC.Core.GccEnt import gccent
from OCC.Core.gce import gce_MakeCirc2d
from OCC.Core.GccAna import GccAna_Lin2d2Tan, GccAna_Circ2d2TanRad

from OCC.Core.BRepBuilderAPI import (
    BRepBuilderAPI_MakeVertex,
    BRepBuilderAPI_MakeEdge2d,
    BRepBuilderAPI_MakeEdge,
    BRepBuilderAPI_MakeFace,
)
from OCC.Core.TColgp import (
    TColgp_Array1OfPnt,
    TColgp_Array1OfPnt2d,
    TColgp_HArray1OfPnt2d,
    TColgp_Array2OfPnt,
)
from OCC.Core.GeomFill import (
    GeomFill_Pipe,
    GeomFill_BSplineCurves,
    GeomFill_CoonsStyle,
    GeomFill_StretchStyle,
    GeomFill_IsDarboux,
    GeomFill_IsFrenet,
    GeomFill_CurvedStyle,
    GeomFill_IsConstantNormal,
    GeomFill_IsCorrectedFrenet,
    GeomFill_IsGuidePlan,
    GeomFill_IsGuideAC,
    GeomFill_IsGuideACWithContact,
    GeomFill_IsGuidePlanWithContact,
)
from OCC.Core.Convert import Convert_TgtThetaOver2
from OCC.Core.BRepAdaptor import BRepAdaptor_Curve

#
# Utility functions
#


def _Tcol_dim_1(li, _type):
    """function factory for 1-dimensional TCol* types"""
    pts = _type(0, len(li) - 1)
    for n, i in enumerate(li):
        pts.SetValue(n, i)
    return pts


def point_list_to_TColgp_Array1OfPnt(li):
    pts = TColgp_Array1OfPnt(0, len(li) - 1)
    for n, i in enumerate(li):
        pts.SetValue(n, i)
    return pts


def point2d_list_to_TColgp_Array1OfPnt2d(li):
    return _Tcol_dim_1(li, TColgp_Array1OfPnt2d)


def make_edge2d(shape):
    spline = BRepBuilderAPI_MakeEdge2d(shape)
    spline.Build()
    return spline.Shape()


def make_edge(shape):
    spline = BRepBuilderAPI_MakeEdge(shape)
    spline.Build()
    return spline.Shape()


def make_vertex(pnt):
    if isinstance(pnt, gp_Pnt2d):
        vertex = BRepBuilderAPI_MakeVertex(gp_Pnt(pnt.X(), pnt.Y(), 0))
    else:
        vertex = BRepBuilderAPI_MakeVertex(pnt)
    vertex.Build()
    return vertex.Shape()


def make_face(shape):
    tol_degen = 1e-6
    face = BRepBuilderAPI_MakeFace(shape, tol_degen)
    face.Build()
    return face.Shape()


def test_point_from_curve():
    """Test: point from curve"""
    radius, abscissa = 5.0, 3.0
    C = Geom2d_Circle(gp.OX2d(), radius, True)
    geom2d_adaptor_curve = Geom2dAdaptor_Curve(C)
    uniform_abscissa = GCPnts_UniformAbscissa(geom2d_adaptor_curve, abscissa)

    assert uniform_abscissa.IsDone()

    N = uniform_abscissa.NbPoints()
    aSequence = []
    for count in range(1, N + 1):
        P = gp_Pnt2d()
        C.D0(uniform_abscissa.Parameter(count), P)
        Parameter = uniform_abscissa.Parameter(count)
        assert isinstance(Parameter, float)
        aSequence.append(P)

    Abscissa = uniform_abscissa.Abscissa()
    assert Abscissa == abscissa


def test_project_point_on_curve():
    """Test: project point on curve"""
    P = gp_Pnt(1.0, 2.0, 3.0)
    radius = 5.0

    C = Geom_Circle(gp.XOY(), radius)
    PPC = GeomAPI_ProjectPointOnCurve(P, C)
    N = PPC.NearestPoint()
    assert isinstance(N, gp_Pnt)
    nb_results = PPC.NbPoints()
    assert nb_results > 0
    edg = make_edge(C)
    assert edg is not None

    for i in range(1, nb_results + 1):
        Q = PPC.Point(i)
        assert isinstance(Q, gp_Pnt)
        distance = PPC.Distance(i)
        # in any case, it should be > 1
        assert distance > 1.0

    assert PPC.LowerDistance() > 0.0

    for i in range(1, nb_results + 1):
        Q = PPC.Point(i)
        assert isinstance(Q, gp_Pnt)
        distance = PPC.Distance(i)
        # in any case, it should be > 1
        assert distance > 1.0


def test_point_from_projections():
    """Test: point from projections"""
    P = gp_Pnt(7.0, 8.0, 9.0)
    radius = 5
    SP = Geom_SphericalSurface(gp_Ax3(gp.XOY()), radius)
    PPS = GeomAPI_ProjectPointOnSurf(P, SP)
    N = PPS.NearestPoint()
    assert isinstance(N, gp_Pnt)
    nb_results = PPS.NbPoints()
    assert nb_results > 0

    for i in range(1, nb_results + 1):
        Q = PPS.Point(i)
        assert isinstance(Q, gp_Pnt)
        distance = PPS.Distance(i)
        # in any case, it should be > 1
        assert distance > 1.0

    lower_d = PPS.LowerDistance()
    assert lower_d > 1.0
    for i in range(1, nb_results + 1):
        Q = PPS.Point(i)
        distance = PPS.Distance(i)


def test_points_from_intersection():
    """Test: points from intersection"""
    plane = gp_Pln(gp_Ax3(gp.XOY()))
    MinorRadius, MajorRadius = 5, 8
    EL = gp_Elips(gp.YOZ(), MajorRadius, MinorRadius)
    int_conic_quad = IntAna_IntConicQuad(
        EL, plane, precision.Angular(), precision.Confusion()
    )
    assert int_conic_quad.IsDone()
    nb_results = int_conic_quad.NbPoints()
    assert nb_results > 0
    for i in range(1, nb_results + 1):
        P = int_conic_quad.Point(i)
        assert isinstance(P, gp_Pnt)
    aPlane = GC_MakePlane(plane).Value()
    aSurface = Geom_RectangularTrimmedSurface(
        aPlane, -8.0, 8.0, -12.0, 12.0, True, True
    )
    assert aSurface is not None
    an_ellips = GC_MakeEllipse(EL).Value()
    assert isinstance(an_ellips, Geom_Ellipse)
    nb_results = int_conic_quad.NbPoints()
    assert nb_results > 0
    for i in range(1, nb_results + 1):
        P = int_conic_quad.Point(i)
        assert isinstance(P, gp_Pnt)


def test_parabola():
    """Test: parabola"""
    # P is the vertex point
    # P and D give the axis of symmetry
    # 6 is the focal length of the parabola
    P = gp_Pnt2d(2.0, 3.0)
    D = gp_Dir2d(4.0, 5.0)
    A = gp_Ax22d(P, D, True)
    Para = gp_Parab2d(A, 6)
    a_parabola = GCE2d_MakeParabola(Para)
    gParabola = a_parabola.Value()
    assert isinstance(gParabola, Geom2d_Parabola)
    aTrimmedCurve = Geom2d_TrimmedCurve(gParabola, -100, 100, True)
    assert aTrimmedCurve is not None


def test_axis():
    """Test: axis"""
    point_1 = gp_Pnt(2, 3, 4)
    D = gp_Dir(4, 5, 6)
    A = gp_Ax3(point_1, D)
    assert A.Direct()
    AXDirection = A.XDirection()
    assert isinstance(AXDirection, gp_Dir)
    AYDirection = A.YDirection()
    assert isinstance(AYDirection, gp_Dir)
    point_2 = gp_Pnt(5, 3, 4)
    A2 = gp_Ax3(point_2, D)
    A2.YReverse()
    # axis3 is now left handed
    assert not A2.Direct()

    assert isinstance(A2.XDirection(), gp_Dir)

    assert isinstance(A2.YDirection(), gp_Dir)


def test_bspline():
    """Test: bspline"""
    array = [gp_Pnt2d(0, 0)]
    array.append(gp_Pnt2d(1, 2))
    array.append(gp_Pnt2d(2, 3))
    array.append(gp_Pnt2d(4, 3))
    array.append(gp_Pnt2d(5, 5))

    xxx = point2d_list_to_TColgp_Array1OfPnt2d(array)
    spline_1 = Geom2dAPI_PointsToBSpline(xxx).Curve()
    assert spline_1 is not None

    harray = TColgp_HArray1OfPnt2d(1, 5)
    harray.SetValue(1, gp_Pnt2d(7 + 0, 0))
    harray.SetValue(2, gp_Pnt2d(7 + 1, 2))
    harray.SetValue(3, gp_Pnt2d(7 + 2, 3))
    harray.SetValue(4, gp_Pnt2d(7 + 4, 3))
    harray.SetValue(5, gp_Pnt2d(7 + 5, 5))

    anInterpolation = Geom2dAPI_Interpolate(harray, False, 0.01)
    anInterpolation.Perform()
    spline_2 = anInterpolation.Curve()
    assert spline_2 is not None

    harray2 = TColgp_HArray1OfPnt2d(1, 5)
    harray2.SetValue(1, gp_Pnt2d(11 + 0, 0))
    harray2.SetValue(2, gp_Pnt2d(11 + 1, 2))
    harray2.SetValue(3, gp_Pnt2d(11 + 2, 3))
    harray2.SetValue(4, gp_Pnt2d(11 + 4, 3))
    harray2.SetValue(5, gp_Pnt2d(11 + 5, 5))

    anInterpolation2 = Geom2dAPI_Interpolate(harray2, True, 0.01)
    anInterpolation2.Perform()
    spline_3 = anInterpolation2.Curve()
    assert spline_3 is not None
    i = 0
    for P in array:
        i = i + 1
        make_vertex(P)
    for j in range(harray.Lower(), harray.Upper() + 1):
        i = i + 1
        P = harray.Value(j)
        make_vertex(P)

    for j in range(harray2.Lower(), harray2.Upper() + 1):
        i = i + 1
        P = harray2.Value(j)
        make_vertex(P)


def test_curves2d_from_curves():
    """Test: curves 2d from curves"""
    major, minor = 12, 4
    axis = gp.OX2d()
    ell = GCE2d_MakeEllipse(axis, major, minor)
    E = ell.Value()
    TC = Geom2d_TrimmedCurve(E, -1, 2, True)
    spline = geom2dconvert.CurveToBSplineCurve(TC, Convert_TgtThetaOver2)
    assert spline is not None


def test_curves2d_from_offset():
    """Test: curves 2d from offset"""
    array = [gp_Pnt2d(-4, 0)]
    array.append(gp_Pnt2d(-7, 2))
    array.append(gp_Pnt2d(-6, 3))
    array.append(gp_Pnt2d(-4, 3))
    array.append(gp_Pnt2d(-3, 5))

    xxx = point2d_list_to_TColgp_Array1OfPnt2d(array)
    spline_1 = Geom2dAPI_PointsToBSpline(xxx).Curve()
    assert spline_1 is not None

    dist = 1
    offset_curve = Geom2d_OffsetCurve(spline_1, dist)
    assert offset_curve.IsCN(2)

    dist2 = 1.5
    offset_curve_2 = Geom2d_OffsetCurve(spline_1, dist2)
    assert offset_curve_2.IsCN(2)


def test_circles2d_from_curves():
    """Test: circles2d from curves"""
    point_1 = gp_Pnt2d(9, 6)
    point_2 = gp_Pnt2d(10, 4)
    point_3 = gp_Pnt2d(6, 7)
    C = gce_MakeCirc2d(point_1, point_2, point_3).Value()

    QC = gccent.Outside(C)
    point_4 = gp_Pnt2d(-2, 7)
    point_5 = gp_Pnt2d(12, -3)
    L = GccAna_Lin2d2Tan(point_4, point_5, precision.Confusion()).ThisSolution(1)

    QL = gccent.Unqualified(L)
    radius = 2.0
    TR = GccAna_Circ2d2TanRad(QC, QL, radius, precision.Confusion())

    assert TR.IsDone()

    nb_sol = TR.NbSolutions()
    for k in range(1, nb_sol + 1):
        circ = TR.ThisSolution(k)
        # find the solution circle
        pnt1 = gp_Pnt2d()
        parsol, pararg = TR.Tangency1(k, pnt1)
        assert parsol > 0.0
        assert pararg > 0.0
        # find the first tangent point
        pnt2 = gp_Pnt2d()
        parsol, pararg = TR.Tangency2(k, pnt2)
        assert parsol > 0.0
        assert pararg > 0.0
        # find the second tangent point

    a_line = GCE2d_MakeSegment(L, -2, 20).Value()
    assert isinstance(a_line, Geom2d_TrimmedCurve)
    nb_sol = TR.NbSolutions()
    for k in range(1, nb_sol + 1):
        circ = TR.ThisSolution(k)
        aCircle = Geom2d_Circle(circ)
        assert isinstance(aCircle, Geom2d_Circle)
        # find the solution circle (index, outvalue, outvalue, gp_Pnt2d)
        pnt3 = gp_Pnt2d()
        parsol, pararg = TR.Tangency1(k, pnt3)
        assert parsol > 0.0
        assert pararg > 0.0
        # find the first tangent point
        pnt4 = gp_Pnt2d()
        parsol, pararg = TR.Tangency2(k, pnt4)
        assert parsol > 0.0
        assert pararg > 0.0


def test_surface_from_curves():
    """Test: surfaces from curves"""
    array = [gp_Pnt(-4, 0, 2)]
    array.append(gp_Pnt(-7, 2, 2))
    array.append(gp_Pnt(-6, 3, 1))
    array.append(gp_Pnt(-4, 3, -1))
    array.append(gp_Pnt(-3, 5, -2))

    aaa = point_list_to_TColgp_Array1OfPnt(array)
    spline_1 = GeomAPI_PointsToBSpline(aaa).Curve()

    a2 = [gp_Pnt(-4, 0, 2)]
    a2.append(gp_Pnt(-2, 2, 0))
    a2.append(gp_Pnt(2, 3, -1))
    a2.append(gp_Pnt(3, 7, -2))
    a2.append(gp_Pnt(4, 9, -1))
    bbb = point_list_to_TColgp_Array1OfPnt(a2)
    spline_2 = GeomAPI_PointsToBSpline(bbb).Curve()

    a_geom_fill_1 = GeomFill_BSplineCurves(spline_1, spline_2, GeomFill_StretchStyle)

    spline_3 = Geom_BSplineCurve.DownCast(spline_1.Translated(gp_Vec(10, 0, 0)))
    spline_4 = Geom_BSplineCurve.DownCast(spline_2.Translated(gp_Vec(10, 0, 0)))
    a_geom_fill_2 = GeomFill_BSplineCurves(spline_3, spline_4, GeomFill_CoonsStyle)

    spline_5 = Geom_BSplineCurve.DownCast(spline_1.Translated(gp_Vec(20, 0, 0)))
    spline_6 = Geom_BSplineCurve.DownCast(spline_2.Translated(gp_Vec(20, 0, 0)))
    a_geom_fill_3 = GeomFill_BSplineCurves(spline_5, spline_6, GeomFill_CurvedStyle)

    a_bspline_surface_1 = a_geom_fill_1.Surface()
    assert a_bspline_surface_1 is not None
    a_bspline_surface_2 = a_geom_fill_2.Surface()
    assert a_bspline_surface_2 is not None
    a_bspline_surface_3 = a_geom_fill_3.Surface()
    assert a_bspline_surface_3 is not None


def test_pipes():
    """Test: pipes"""
    a1 = [gp_Pnt(-4, 0, 2)]
    a1.append(gp_Pnt(-5, 1, 0))
    a1.append(gp_Pnt(-6, 2, -2))
    a1.append(gp_Pnt(-5, 4, -7))
    a1.append(gp_Pnt(-3, 5, -12))

    xxx = point_list_to_TColgp_Array1OfPnt(a1)
    spline_1 = GeomAPI_PointsToBSpline(xxx).Curve()

    a_pipe = GeomFill_Pipe(spline_1, True)
    a_pipe.Perform(False, False)
    aSurface = a_pipe.Surface()
    assert aSurface is not None

    E = GC_MakeEllipse(gp.XOY(), 2, 1).Value()
    a_pipe2 = GeomFill_Pipe(spline_1, E, GeomFill_IsConstantNormal)
    a_pipe2.Perform(False, False)
    a_surface_2 = a_pipe2.Surface()
    a_surface_2.Translate(gp_Vec(5, 0, 0))

    TC1 = GC_MakeSegment(gp_Pnt(1, 1, 1), gp_Pnt(2, 2, 2)).Value()
    TC2 = GC_MakeSegment(gp_Pnt(1, 1, 0), gp_Pnt(3, 2, 1)).Value()
    # TODO: following lines bug with occt-770
    # a_pipe3 = GeomFill_Pipe(spline_1, TC1, TC2)
    # a_pipe3.Perform(False, False)
    # aSurface3 = a_pipe3.Surface()
    # aSurface3.Translate(gp_Vec(10, 0, 0))

    for mode in [
        GeomFill_IsConstantNormal,
        GeomFill_IsCorrectedFrenet,
        GeomFill_IsDarboux,
        GeomFill_IsFrenet,
        GeomFill_IsGuideAC,
        GeomFill_IsGuideACWithContact,
        GeomFill_IsGuidePlan,
        GeomFill_IsGuidePlanWithContact,
    ]:
        E = GC_MakeEllipse(gp.XOY(), 2, 1).Value()
        a_pipe2 = GeomFill_Pipe(spline_1, TC1, TC2, mode)
        a_pipe2.Perform(False, False)
        a_surface_2 = a_pipe2.Surface()
        a_surface_2.Translate(gp_Vec(5, 5, 0))


def test_bezier_surfaces():
    """Test: Bezier surfaces"""
    array1 = TColgp_Array2OfPnt(1, 3, 1, 3)
    array2 = TColgp_Array2OfPnt(1, 3, 1, 3)
    array3 = TColgp_Array2OfPnt(1, 3, 1, 3)
    array4 = TColgp_Array2OfPnt(1, 3, 1, 3)

    array1.SetValue(1, 1, gp_Pnt(1, 1, 1))
    array1.SetValue(1, 2, gp_Pnt(2, 1, 2))
    array1.SetValue(1, 3, gp_Pnt(3, 1, 1))
    array1.SetValue(2, 1, gp_Pnt(1, 2, 1))
    array1.SetValue(2, 2, gp_Pnt(2, 2, 2))
    array1.SetValue(2, 3, gp_Pnt(3, 2, 0))
    array1.SetValue(3, 1, gp_Pnt(1, 3, 2))
    array1.SetValue(3, 2, gp_Pnt(2, 3, 1))
    array1.SetValue(3, 3, gp_Pnt(3, 3, 0))

    array2.SetValue(1, 1, gp_Pnt(3, 1, 1))
    array2.SetValue(1, 2, gp_Pnt(4, 1, 1))
    array2.SetValue(1, 3, gp_Pnt(5, 1, 2))
    array2.SetValue(2, 1, gp_Pnt(3, 2, 0))
    array2.SetValue(2, 2, gp_Pnt(4, 2, 1))
    array2.SetValue(2, 3, gp_Pnt(5, 2, 2))
    array2.SetValue(3, 1, gp_Pnt(3, 3, 0))
    array2.SetValue(3, 2, gp_Pnt(4, 3, 0))
    array2.SetValue(3, 3, gp_Pnt(5, 3, 1))

    array3.SetValue(1, 1, gp_Pnt(1, 3, 2))
    array3.SetValue(1, 2, gp_Pnt(2, 3, 1))
    array3.SetValue(1, 3, gp_Pnt(3, 3, 0))
    array3.SetValue(2, 1, gp_Pnt(1, 4, 1))
    array3.SetValue(2, 2, gp_Pnt(2, 4, 0))
    array3.SetValue(2, 3, gp_Pnt(3, 4, 1))
    array3.SetValue(3, 1, gp_Pnt(1, 5, 1))
    array3.SetValue(3, 2, gp_Pnt(2, 5, 1))
    array3.SetValue(3, 3, gp_Pnt(3, 5, 2))

    array4.SetValue(1, 1, gp_Pnt(3, 3, 0))
    array4.SetValue(1, 2, gp_Pnt(4, 3, 0))
    array4.SetValue(1, 3, gp_Pnt(5, 3, 1))
    array4.SetValue(2, 1, gp_Pnt(3, 4, 1))
    array4.SetValue(2, 2, gp_Pnt(4, 4, 1))
    array4.SetValue(2, 3, gp_Pnt(5, 4, 1))
    array4.SetValue(3, 1, gp_Pnt(3, 5, 2))
    array4.SetValue(3, 2, gp_Pnt(4, 5, 2))
    array4.SetValue(3, 3, gp_Pnt(5, 5, 1))

    # BZ1, BZ2, BZ3, BZ4 = map(Geom_BezierSurface, [array1, array2, array3, array4])
    # bezierarray = TColGeom_Array2OfBezierSurface(1, 2, 1, 2)
    # bezierarray.SetValue(1, 1, BZ1)
    # bezierarray.SetValue(1, 2, BZ2)
    # bezierarray.SetValue(2, 1, BZ3)
    # bezierarray.SetValue(2, 2, BZ4)

    # BB = GeomConvert_CompBezierSurfacesToBSplineSurface(bezierarray)
    # assert BB.IsDone())
    # poles = BB.Poles().Array2()
    # uknots = BB.UKnots().Array1()
    # vknots = BB.VKnots().Array1()
    # umult = BB.UMultiplicities().Array1()
    # vmult = BB.VMultiplicities().Array1()
    # udeg = BB.UDegree()
    # vdeg = BB.VDegree()

    # BsplineSURF = Geom_BSplineSurface(
    #     poles, uknots, vknots, umult, vmult, udeg, vdeg, False, False
    # )
    # BsplineSURF.Translate(gp_Vec(0, 0, 2))


def test_surfaces_from_offsets():
    """Test: surfaces from offsets"""
    array1 = [gp_Pnt(-4, 5, 5)]
    array1.append(gp_Pnt(-3, 6, 6))
    array1.append(gp_Pnt(-1, 7, 7))
    array1.append(gp_Pnt(0, 8, 8))
    array1.append(gp_Pnt(2, 9, 9))
    spline_1 = GeomAPI_PointsToBSpline(point_list_to_TColgp_Array1OfPnt(array1)).Curve()

    array2 = [gp_Pnt(-4, 5, 2)]
    array2.append(gp_Pnt(-3, 6, 3))
    array2.append(gp_Pnt(-1, 7, 4))
    array2.append(gp_Pnt(0, 8, 5))
    array2.append(gp_Pnt(2, 9, 6))
    spline_2 = GeomAPI_PointsToBSpline(point_list_to_TColgp_Array1OfPnt(array2)).Curve()

    a_geom_fill_1 = GeomFill_BSplineCurves(spline_1, spline_2, GeomFill_StretchStyle)
    aGeomSurface = a_geom_fill_1.Surface()

    offset = 1
    GOS = Geom_OffsetSurface(aGeomSurface, offset)
    offset = 2
    GOS1 = Geom_OffsetSurface(aGeomSurface, offset)
    offset = 3
    GOS2 = Geom_OffsetSurface(aGeomSurface, offset)

    face1 = make_face(aGeomSurface)
    assert face1 is not None
    face2 = make_face(GOS)
    assert face2 is not None
    face3 = make_face(GOS1)
    assert face3 is not None
    face4 = make_face(GOS2)
    assert face4 is not None


def test_surfaces_from_revolution():
    """Test: surfaces from revolution"""
    array = [gp_Pnt(0, 0, 1)]
    array.append(gp_Pnt(1, 2, 2))
    array.append(gp_Pnt(2, 3, 3))
    array.append(gp_Pnt(4, 3, 4))
    array.append(gp_Pnt(5, 5, 5))
    aCurve = GeomAPI_PointsToBSpline(point_list_to_TColgp_Array1OfPnt(array)).Curve()
    SOR = Geom_SurfaceOfRevolution(aCurve, gp.OX())
    edge = make_edge(aCurve)
    assert edge is not None
    face = make_face(SOR)
    assert face is not None


def test_distances():
    """Test: distances"""
    array1 = [gp_Pnt(-5, 1, 2)]
    array1.append(gp_Pnt(-5, 2, 2))
    array1.append(gp_Pnt(-5.3, 3, 1))
    array1.append(gp_Pnt(-5, 4, 1))
    array1.append(gp_Pnt(-5, 5, 2))
    spline_1 = GeomAPI_PointsToBSpline(point_list_to_TColgp_Array1OfPnt(array1)).Curve()
    array2 = [gp_Pnt(4, 1, 2)]
    array2.append(gp_Pnt(4, 2, 2))
    array2.append(gp_Pnt(3.7, 3, 1))
    array2.append(gp_Pnt(4, 4, 1))
    array2.append(gp_Pnt(4, 5, 2))
    spline_2 = GeomAPI_PointsToBSpline(point_list_to_TColgp_Array1OfPnt(array2)).Curve()
    a_geom_fill_1 = GeomFill_BSplineCurves(spline_1, spline_2, GeomFill_StretchStyle)
    aSurf1 = a_geom_fill_1.Surface()

    array3 = TColgp_Array2OfPnt(1, 5, 1, 5)
    array3.SetValue(1, 1, gp_Pnt(-4, -4, 5))
    array3.SetValue(1, 2, gp_Pnt(-4, -2, 5))
    array3.SetValue(1, 3, gp_Pnt(-4, 0, 4))
    array3.SetValue(1, 4, gp_Pnt(-4, 2, 5))
    array3.SetValue(1, 5, gp_Pnt(-4, 4, 5))

    array3.SetValue(2, 1, gp_Pnt(-2, -4, 4))
    array3.SetValue(2, 2, gp_Pnt(-2, -2, 4))
    array3.SetValue(2, 3, gp_Pnt(-2, 0, 4))
    array3.SetValue(2, 4, gp_Pnt(-2, 2, 4))
    array3.SetValue(2, 5, gp_Pnt(-2, 5, 4))

    array3.SetValue(3, 1, gp_Pnt(0, -4, 3.5))
    array3.SetValue(3, 2, gp_Pnt(0, -2, 3.5))
    array3.SetValue(3, 3, gp_Pnt(0, 0, 3.5))
    array3.SetValue(3, 4, gp_Pnt(0, 2, 3.5))
    array3.SetValue(3, 5, gp_Pnt(0, 5, 3.5))

    array3.SetValue(4, 1, gp_Pnt(2, -4, 4))
    array3.SetValue(4, 2, gp_Pnt(2, -2, 4))
    array3.SetValue(4, 3, gp_Pnt(2, 0, 3.5))
    array3.SetValue(4, 4, gp_Pnt(2, 2, 5))
    array3.SetValue(4, 5, gp_Pnt(2, 5, 4))

    array3.SetValue(5, 1, gp_Pnt(4, -4, 5))
    array3.SetValue(5, 2, gp_Pnt(4, -2, 5))
    array3.SetValue(5, 3, gp_Pnt(4, 0, 5))
    array3.SetValue(5, 4, gp_Pnt(4, 2, 6))
    array3.SetValue(5, 5, gp_Pnt(4, 5, 5))

    aSurf2 = GeomAPI_PointsToBSplineSurface(array3).Surface()
    ESS = GeomAPI_ExtremaSurfaceSurface(aSurf1, aSurf2)
    dist = ESS.LowerDistance()
    assert dist > 1.20
    assert dist < 1.25
    a, b = gp_Pnt(), gp_Pnt()
    ESS.NearestPoints(a, b)

    NbExtrema = ESS.NbExtrema()
    for k in range(1, NbExtrema + 1):
        point_3, point_4 = gp_Pnt(), gp_Pnt()
        ESS.Points(k, point_3, point_4)
        aCurve = GC_MakeSegment(point_3, point_4).Value()
        assert aCurve is not None


def test_curve_adaptor():
    # related to issue #1057 https://github.com/tpaviot/pythonocc-core/issues/1057
    p1 = gp_Pnt(5, -5, 0)
    p2 = gp_Pnt(5, 5, 0)
    ed1 = BRepBuilderAPI_MakeEdge(p2, p1).Edge()
    c1 = BRepAdaptor_Curve(ed1)
    assert isinstance(c1, BRepAdaptor_Curve)
    # assert isinstance(c1.Curve(), GeomAdaptor_Curve))
    # should pass on all platforms
    # assert isinstance(c1.Curve().Curve(), Geom_Curve))
    # c2 = BRepAdaptor_Curve(ed1).Curve()
    # only works on linux
    # if sys.platform == "linux":
    #     assert isinstance(c2.Curve(), Geom_Curve))
    #     assert
    #         isinstance(BRepAdaptor_Curve(ed1).Curve().Curve(), Geom_Curve)
    #     )
