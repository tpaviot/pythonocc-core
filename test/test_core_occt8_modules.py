##Copyright 2026 Thomas Paviot (tpaviot@gmail.com)
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
##GNU General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

"""Modules new in OCCT 8: GeomGridEval, Geom2dGridEval, HelixGeom, HelixBRep
and BRepPreviewAPI"""

import math

import pytest
from OCC.Core.BRepGProp import brepgprop
from OCC.Core.BRepPreviewAPI import BRepPreviewAPI_MakeBox
from OCC.Core.Geom import Geom_Circle
from OCC.Core.Geom2d import Geom2d_Circle
from OCC.Core.Geom2dGridEval import Geom2dGridEval_Curve
from OCC.Core.GeomGridEval import GeomGridEval_Curve
from OCC.Core.gp import gp_Ax2, gp_Ax2d, gp_Ax3, gp_Circ, gp_Circ2d, gp_Pnt
from OCC.Core.GProp import GProp_GProps
from OCC.Core.HelixBRep import HelixBRep_BuilderHelix
from OCC.Core.HelixGeom import HelixGeom_BuilderHelix
from OCC.Core.TColGeom import TColGeom_SequenceOfCurve
from OCC.Core.TColStd import TColStd_Array1OfBoolean, TColStd_Array1OfReal
from OCC.Core.TopoDS import TopoDS_Edge, TopoDS_Face, TopoDS_Solid, TopoDS_Wire


def make_params(*values: float) -> TColStd_Array1OfReal:
    params = TColStd_Array1OfReal(1, len(values))
    for i, value in enumerate(values, start=1):
        params.SetValue(i, value)
    return params


def test_geom_grid_eval_curve() -> None:
    circle = Geom_Circle(gp_Circ(gp_Ax2(), 2.0))
    params = make_params(0.0, 0.5, 1.0, 2.5)
    points = GeomGridEval_Curve(circle).EvaluateGrid(params)
    assert len(points) == 4
    for param, point in zip(params, points, strict=True):
        assert point.IsEqual(circle.Value(param), 1e-12)
    assert points.to_numpy_array().shape == (4, 3)


def test_geom2d_grid_eval_curve() -> None:
    circle = Geom2d_Circle(gp_Circ2d(gp_Ax2d(), 3.0))
    params = make_params(0.0, 1.0, 2.0)
    points = Geom2dGridEval_Curve(circle).EvaluateGrid(params)
    for param, point in zip(params, points, strict=True):
        assert point.IsEqual(circle.Value(param), 1e-12)


def test_helix_brep_builder() -> None:
    builder = HelixBRep_BuilderHelix()
    heights = make_params(10.0)
    pitches = make_params(2.0)
    is_pitches = TColStd_Array1OfBoolean(1, 1)
    is_pitches.SetValue(1, True)
    builder.SetParameters(gp_Ax3(), 5.0, heights, pitches, is_pitches)
    builder.Perform()
    assert builder.ErrorStatus() == 0
    helix = builder.Shape()
    assert isinstance(helix, TopoDS_Wire)
    # 5 turns of a helix of radius 2.5 and pitch 2
    props = GProp_GProps()
    brepgprop.LinearProperties(helix, props)
    expected_length = 5 * math.hypot(2 * math.pi * 2.5, 2.0)
    assert props.Mass() == pytest.approx(expected_length, rel=1e-4)


def test_helix_geom_builder() -> None:
    # the curves are returned as a sequence, not an opaque pointer
    builder = HelixGeom_BuilderHelix()
    builder.SetCurveParameters(0.0, 4 * 2 * math.pi, 4.0, 10.0, 0.0, False)
    builder.Perform()
    assert builder.ErrorStatus() == 0
    curves = builder.Curves()
    assert isinstance(curves, TColGeom_SequenceOfCurve)
    assert curves.Length() > 0
    first_point = curves.Value(1).Value(curves.Value(1).FirstParameter())
    assert first_point.Distance(gp_Pnt(10, 0, 0)) < 1e-6


@pytest.mark.parametrize(
    ("corner", "expected_type"),
    [
        (gp_Pnt(1, 2, 3), TopoDS_Solid),
        (gp_Pnt(1, 2, 0), TopoDS_Face),
        (gp_Pnt(0, 0, 3), TopoDS_Edge),
    ],
)
def test_preview_box(corner: gp_Pnt, expected_type: type) -> None:
    # the preview box degenerates to a face or an edge
    maker = BRepPreviewAPI_MakeBox()
    maker.Init(gp_Pnt(0, 0, 0), corner)
    maker.Build()
    assert isinstance(maker.Shape(), expected_type)
