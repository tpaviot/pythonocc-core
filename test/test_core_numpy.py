import numpy as np
import pytest
from OCC.Core.Geom import Geom_Line, Geom_Plane
from OCC.Core.Geom2d import Geom2d_Line
from OCC.Core.gp import gp_Dir, gp_Dir2d, gp_Pnt, gp_Pnt2d
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
        (TShort_Array1OfShortReal, np.random.rand(500).astype(np.float32)),
        (TColStd_Array1OfInteger, np.arange(500).astype(int)),
        (TColStd_Array1OfReal, np.random.rand(500)),
        (TShort_Array2OfShortReal, np.random.rand(101, 201).astype(np.float32)),
        (TColStd_Array2OfInteger, np.arange(101 * 201).reshape(101, 201).astype(int)),
        (TColStd_Array2OfReal, np.random.rand(101, 201)),
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
    points = np.random.rand(10001, 3)

    p = points[:, :-1] if type_ in array_types_2d else points

    gp_arr = type_.from_numpy_array(p)
    assert gp_arr.Size() == len(points)
    np_arr_out = gp_arr.to_numpy_array()

    if type_ in normalizing_array_types:
        assert np.all(np_arr_out == p / np.linalg.norm(p, axis=-1, keepdims=True))
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
    points = np.random.rand(201, 101, 3)

    p = points[..., :-1] if type_ in array_types_2d else points
    arr_occ = type_.from_numpy_array(p)
    np_arr_out = arr_occ.to_numpy_array()

    if type_ in normalizing_array_types:
        assert np.all(np_arr_out == p / np.linalg.norm(p, axis=-1, keepdims=True))
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
