import numpy as np
import pytest
from OCC.Core.Geom import Geom_Line, Geom_Plane
from OCC.Core.Geom2d import Geom2d_Line
from OCC.Core.GeomAPI import GeomAPI_PointsToBSpline
from OCC.Core.GeomEval import GeomEval_CircularHelixCurve
from OCC.Core.gp import gp_Ax2, gp_Dir, gp_Dir2d, gp_Pnt, gp_Pnt2d
from OCC.Core.Poly import Poly_Array1OfTriangle
from OCC.Core.TColgp import (
    TColgp_Array1OfDir,
    TColgp_Array1OfDir2d,
    TColgp_Array1OfPnt,
    TColgp_Array1OfPnt2d,
    TColgp_Array1OfVec,
    TColgp_Array1OfVec2d,
    TColgp_Array1OfXY,
    TColgp_Array1OfXYZ,
    TColgp_Array2OfDir,
    TColgp_Array2OfDir2d,
    TColgp_Array2OfPnt,
    TColgp_Array2OfPnt2d,
    TColgp_Array2OfVec,
    TColgp_Array2OfVec2d,
    TColgp_Array2OfXY,
    TColgp_Array2OfXYZ,
)
from OCC.Core.TColStd import (
    TColStd_Array1OfInteger,
    TColStd_Array1OfReal,
    TColStd_Array2OfInteger,
    TColStd_Array2OfReal,
)
from OCC.Core.TShort import TShort_Array1OfShortReal, TShort_Array2OfShortReal

RNG = np.random.default_rng(0)


@pytest.fixture
def array_types_2d():
    return {
        TColgp_Array1OfPnt2d,
        TColgp_Array1OfVec2d,
        TColgp_Array1OfDir2d,
        TColgp_Array1OfXY,
        TColgp_Array2OfPnt2d,
        TColgp_Array2OfVec2d,
        TColgp_Array2OfDir2d,
        TColgp_Array2OfXY,
    }


@pytest.fixture
def normalizing_array_types():
    return {
        TColgp_Array1OfDir,
        TColgp_Array1OfDir2d,
        TColgp_Array2OfDir,
        TColgp_Array2OfDir2d,
    }


@pytest.mark.parametrize(
    "type_,arr",
    [
        (TShort_Array1OfShortReal, RNG.random(500).astype(np.float32)),
        (TColStd_Array1OfInteger, np.arange(500).astype(int)),
        (TColStd_Array1OfReal, RNG.random(500)),
        (TShort_Array2OfShortReal, RNG.random((101, 201)).astype(np.float32)),
        (TColStd_Array2OfInteger, np.arange(101 * 201).reshape(101, 201).astype(int)),
        (TColStd_Array2OfReal, RNG.random((101, 201))),
        (Poly_Array1OfTriangle, np.arange(303).reshape(-1, 3).astype(int)),
    ],
)
def test_standard_array(type_, arr):
    arr_occ = type_.from_numpy_array(arr)
    arr_out = arr_occ.to_numpy_array()
    assert np.all(arr_out == arr)


@pytest.mark.parametrize(
    "type_",
    (
        TColgp_Array1OfPnt,
        TColgp_Array1OfVec,
        TColgp_Array1OfDir,
        TColgp_Array1OfXYZ,
        TColgp_Array1OfPnt2d,
        TColgp_Array1OfVec2d,
        TColgp_Array1OfDir2d,
        TColgp_Array1OfXY,
    ),
)
def test_array1_of_gp(type_, array_types_2d, normalizing_array_types):
    points = RNG.random((10001, 3))

    p = points[:, :-1] if type_ in array_types_2d else points

    gp_arr = type_.from_numpy_array(p)
    assert gp_arr.Size() == len(points)
    np_arr_out = gp_arr.to_numpy_array()

    if type_ in normalizing_array_types:
        # gp_Dir normalizes in C++, may differ by a few ulps (FMA on aarch64)
        assert np.allclose(
            np_arr_out, p / np.linalg.norm(p, axis=-1, keepdims=True), rtol=0, atol=1e-15
        )
    else:
        assert np.all(np_arr_out == p)


@pytest.mark.parametrize(
    "type_",
    (
        TColgp_Array2OfPnt,
        TColgp_Array2OfVec,
        TColgp_Array2OfDir,
        TColgp_Array2OfXYZ,
        TColgp_Array2OfPnt2d,
        TColgp_Array2OfVec2d,
        TColgp_Array2OfDir2d,
        TColgp_Array2OfXY,
    ),
)
def test_array2_of_gp(type_, array_types_2d, normalizing_array_types):
    points = RNG.random((201, 101, 3))

    p = points[..., :-1] if type_ in array_types_2d else points
    arr_occ = type_.from_numpy_array(p)
    np_arr_out = arr_occ.to_numpy_array()

    if type_ in normalizing_array_types:
        # gp_Dir normalizes in C++, may differ by a few ulps (FMA on aarch64)
        assert np.allclose(
            np_arr_out, p / np.linalg.norm(p, axis=-1, keepdims=True), rtol=0, atol=1e-15
        )
    else:
        assert np.all(np_arr_out == p)


@pytest.mark.parametrize(
    "line",
    (
        Geom2d_Line(gp_Pnt2d(0.0, 0.0), gp_Dir2d(1.0, 0.15)),
        Geom_Line(gp_Pnt(0.0, 0.0, 0.0), gp_Dir(1.0, 0.15, 0.0)),
    ),
)
def test_curve_eval(line):
    u = np.arange(5, dtype=float)
    points = line.eval_numpy_array(u)
    assert np.all(np.linalg.norm(points, axis=1) == u)


def make_bspline_curve():
    poles = TColgp_Array1OfPnt(1, 20)
    for i in range(1, 21):
        poles.SetValue(i, gp_Pnt(i, np.sin(i / 3) * 5, np.cos(i / 5) * 3))
    return GeomAPI_PointsToBSpline(poles).Curve()


@pytest.mark.parametrize(
    "curve",
    (
        make_bspline_curve(),
        GeomEval_CircularHelixCurve(gp_Ax2(), 10.0, 5.0),
        Geom_Line(gp_Pnt(0.0, 0.0, 0.0), gp_Dir(1.0, 0.15, 0.0)),
    ),
)
def test_curve_eval_as_value(curve):
    # the BSpline points are evaluated on a grid when the parameters are
    # sorted, the other curves and unsorted parameters by Value
    rng = np.random.default_rng(0)
    for u in (np.linspace(0.0, 1.0, 101), rng.uniform(0.0, 1.0, 101)):
        expected = np.array([curve.Value(param).Coord() for param in u])
        assert np.allclose(curve.eval_numpy_array(u), expected, rtol=0, atol=1e-12)
    assert curve.eval_numpy_array(np.array([])).shape == (0, 3)


def test_surface_eval():
    n_vec = np.array([1.0, 0.15, 0.0])
    u = np.arange(5, dtype=float)
    v = np.arange(6, dtype=float)

    plane = Geom_Plane(gp_Pnt(0.0, 0.0, 0.0), gp_Dir(*n_vec))
    uv = np.dstack(np.meshgrid(u, v, indexing="ij")).reshape(-1, 2)
    arr_out = plane.eval_numpy_array(uv).reshape(len(u), len(v), -1)

    v_vec = np.array([0.0, 0.0, 1.0])
    u_vec = np.cross(v_vec, n_vec / np.linalg.norm(n_vec))
    res = u[:, None, None] * u_vec + v[None, :, None] * v_vec

    assert np.all(res == arr_out)


@pytest.mark.parametrize(
    "line,ndim",
    (
        (Geom2d_Line(gp_Pnt2d(0.0, 0.0), gp_Dir2d(1.0, 0.15)), 2),
        (Geom_Line(gp_Pnt(0.0, 0.0, 0.0), gp_Dir(1.0, 0.15, 0.0)), 3),
    ),
)
def test_curve_derivative_eval(line, ndim):
    u = np.arange(5, dtype=float)
    vectors = line.eval_derivative_numpy_array(u, 1)

    gp_line = line.Lin() if isinstance(line, Geom_Line) else line.Lin2d()

    direction = np.array([gp_line.Direction().Coord(i + 1) for i in range(ndim)])
    assert np.all(vectors == direction)


def test_surface_derivative_eval():
    n_vec = np.array([1.0, 0.15, 0.0])
    u = np.arange(5, dtype=float)
    v = np.arange(6, dtype=float)

    plane = Geom_Plane(gp_Pnt(0.0, 0.0, 0.0), gp_Dir(*n_vec))
    uv = np.dstack(np.meshgrid(u, v, indexing="ij")).reshape(-1, 2)
    arr_out = plane.eval_derivative_numpy_array(uv, 0, 1).reshape(len(u), len(v), -1)
    assert np.allclose(arr_out @ n_vec, 0.0, atol=1e-12)
    arr_out = plane.eval_derivative_numpy_array(uv, 1, 0).reshape(len(u), len(v), -1)
    assert np.allclose(arr_out @ n_vec, 0.0, atol=1e-12)


@pytest.mark.parametrize(
    "type_,good_arr,bad_arr",
    [
        # a numpy array larger than the OCCT array used to write out of bounds
        (TColStd_Array1OfReal, np.zeros(500), RNG.random(600)),
        (TColStd_Array2OfReal, np.zeros((10, 20)), RNG.random((20, 10))),
        (TColgp_Array1OfPnt, np.zeros((500, 3)), RNG.random((600, 3))),
        # 2 coordinates for 3d points: the 3rd one was read out of bounds
        (TColgp_Array1OfPnt, np.zeros((500, 3)), RNG.random((500, 2))),
        (TColgp_Array2OfPnt, np.zeros((10, 20, 3)), RNG.random((10, 20, 2))),
    ],
)
def test_add_numpy_array_with_wrong_shape(type_, good_arr, bad_arr):
    occ_array = type_.from_numpy_array(good_arr)
    with pytest.raises(ValueError):
        occ_array.AddDataFromNumpyArray(bad_arr)


def test_array1_lower_bound():
    # the data is written from the lower bound of the array
    occ_array = TColStd_Array1OfReal(5, 9)
    occ_array.AddDataFromNumpyArray(np.arange(5.0))
    assert [occ_array.Value(i) for i in range(5, 10)] == [0.0, 1.0, 2.0, 3.0, 4.0]
    assert np.all(occ_array.to_numpy_array() == np.arange(5.0))


def test_nested_iteration():
    occ_array = TColStd_Array1OfReal.from_numpy_array(np.arange(3.0))
    pairs = [(a, b) for a in occ_array for b in occ_array]
    assert len(pairs) == 9
    assert list(occ_array) == [0.0, 1.0, 2.0]
