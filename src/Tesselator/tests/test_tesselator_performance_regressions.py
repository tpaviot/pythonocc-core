"""Correctness contracts for bounded extraction, indexed exports and mesh reuse.

Run with a rebuilt OCC.Core.Tesselator, or use the same sys.modules override as
an isolated SWIG build. These tests do not assert machine-dependent timings.
"""
import json
from xml.etree import ElementTree

import numpy as np
import pytest

from OCC.Core.BRep import BRep_Builder
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeCone, BRepPrimAPI_MakeTorus
from OCC.Core.Tesselator import ShapeTesselator, TopologyTesselator
from OCC.Core.TopLoc import TopLoc_Location
from OCC.Core.TopoDS import TopoDS_Compound
from OCC.Core.gp import gp_Trsf, gp_Vec


def instances(base, count):
    shape = TopoDS_Compound()
    builder = BRep_Builder()
    builder.MakeCompound(shape)
    for i in range(count):
        trsf = gp_Trsf()
        trsf.SetTranslation(gp_Vec(30 * i, 0, 0))
        builder.Add(shape, base.Moved(TopLoc_Location(trsf)))
    return shape


def compute(cls, shape, quality=0.5, reuse=False, parallel=False):
    tess = cls(shape)
    tess.SetDeviation(0.2)
    tess.Compute(mesh_quality=quality, reuse_mesh=reuse, parallel=parallel)
    return tess


def triangle_count(tess):
    return tess.TriangleCount() if isinstance(tess, TopologyTesselator) else tess.ObjGetTriangleCount()


@pytest.mark.parametrize('cls', [ShapeTesselator, TopologyTesselator])
def test_reuse_refines_but_default_still_coarsens(cls):
    shape = BRepPrimAPI_MakeTorus(10, 3).Shape()
    coarse = compute(cls, shape, quality=2)
    fine = compute(cls, shape, quality=0.5, reuse=True)
    assert triangle_count(fine) > triangle_count(coarse)
    reused = compute(cls, shape, quality=2, reuse=True)
    assert triangle_count(reused) == triangle_count(fine)
    rebuilt = compute(cls, shape, quality=2)
    assert triangle_count(rebuilt) == triangle_count(coarse)


@pytest.mark.parametrize('quality', [0, -1, float('nan'), float('inf')])
@pytest.mark.parametrize('cls', [ShapeTesselator, TopologyTesselator])
def test_invalid_quality_is_a_python_exception(cls, quality):
    with pytest.raises(ValueError, match='mesh quality'):
        compute(cls, BRepPrimAPI_MakeBox(1, 2, 3).Shape(), quality=quality)


@pytest.mark.parametrize('curved', [False, True])
def test_shape_batch_boundaries_preserve_order_and_parallel_results(curved):
    # Cross both the face-count limit and the temporary-memory limit.
    base = BRepPrimAPI_MakeTorus(10, 3).Shape() if curved else BRepPrimAPI_MakeBox(1, 2, 3).Shape()
    count = 32 if curved else 50
    quality = 0.25 if curved else 1
    one = compute(ShapeTesselator, base, quality)
    shape = instances(base, count)
    serial = compute(ShapeTesselator, shape, quality, reuse=True)
    parallel = compute(ShapeTesselator, shape, quality, reuse=True, parallel=True)
    nodes = np.asarray(one.GetVerticesPositionAsTuple()).reshape(-1, 3)
    expected = np.concatenate([nodes + (30 * i, 0, 0) for i in range(count)])
    actual = np.asarray(serial.GetVerticesPositionAsTuple()).reshape(-1, 3)
    # Transforming in double precision before converting to float can round
    # differently from translating already-rounded coordinates.
    np.testing.assert_allclose(actual, expected, atol=1e-4, rtol=1e-6)
    np.testing.assert_array_equal(parallel.GetVerticesPositionAsTuple(), serial.GetVerticesPositionAsTuple())
    np.testing.assert_array_equal(parallel.GetNormalsAsTuple(), serial.GetNormalsAsTuple())
    assert serial.ObjGetTriangleCount() == count * one.ObjGetTriangleCount()
    assert serial.ObjGetVertexCount() == count * one.ObjGetVertexCount()


def test_shared_triangulations_parallel_topology_and_repeated_compute():
    shape = instances(BRepPrimAPI_MakeTorus(10, 3).Shape(), 16)
    serial = compute(TopologyTesselator, shape)
    parallel = compute(TopologyTesselator, shape, reuse=True, parallel=True)
    names = ('Positions', 'Normals', 'TriangleIndices', 'FaceRanges', 'EdgePositions', 'EdgeRanges', 'VertexPositions')
    snapshots = {name: getattr(serial, name)() for name in names}
    for name in names:
        np.testing.assert_array_equal(getattr(parallel, name)(), snapshots[name])
    parallel.Compute(mesh_quality=0.5, parallel=True, reuse_mesh=True)
    for name in names:
        np.testing.assert_array_equal(getattr(parallel, name)(), snapshots[name])
    # Replacing the buffers must not accumulate ranges from the last compute.
    parallel.Compute(mesh_quality=2, parallel=False)
    assert parallel.TriangleCount() < serial.TriangleCount()
    assert parallel.FaceCount() == serial.FaceCount()
    assert parallel.EdgeCount() == serial.EdgeCount()


@pytest.mark.parametrize('cone', [False, True])
def test_cached_exports_match_triangle_soup_including_singular_corners(cone):
    shape = BRepPrimAPI_MakeCone(10, 0, 20).Shape() if cone else BRepPrimAPI_MakeTorus(10, 3).Shape()
    tess = compute(ShapeTesselator, shape, quality=0.25)
    document = json.loads(tess.ExportShapeToThreejsJSONString('mesh'))
    xml = ElementTree.fromstring(tess.ExportShapeToX3DTriangleSet())
    for values, key, element, attr in (
        (tess.GetVerticesPositionAsTuple(), 'position', 'Coordinate', 'point'),
        (tess.GetNormalsAsTuple(), 'normal', 'Normal', 'vector'),
    ):
        expected = np.asarray(values)
        np.testing.assert_allclose(document['data']['attributes'][key]['array'], expected, rtol=5e-6, atol=1e-10)
        clamped = np.where(np.abs(expected) < np.float32(1e-3), 0, expected)
        np.testing.assert_allclose(np.fromstring(xml.find(element).attrib[attr], sep=' '), clamped, rtol=5e-6, atol=1e-10)


def test_mesh_only_face_preserves_corner_normals_without_uv_nodes():
    from OCC.Core.Poly import Poly_Triangle, Poly_Triangulation
    from OCC.Core.TopoDS import TopoDS_Face
    from OCC.Core.gp import gp_Pnt

    triangulation = Poly_Triangulation(4, 2, False)
    for i, point in enumerate([(0, 0, 0), (2, 0, 0), (2, 2, 0), (0, 2, 0)], 1):
        triangulation.SetNode(i, gp_Pnt(*point))
    triangulation.SetTriangle(1, Poly_Triangle(1, 2, 3))
    triangulation.SetTriangle(2, Poly_Triangle(1, 3, 4))
    face = TopoDS_Face()
    BRep_Builder().MakeFace(face, triangulation)
    tess = compute(ShapeTesselator, face, reuse=True)
    assert tess.ObjGetTriangleCount() == 2
    assert tess.ObjGetVertexCount() == 10  # four nodes plus six singular corners
    np.testing.assert_array_equal(np.asarray(tess.GetNormalsAsTuple()).reshape(-1, 3), [(0, 0, 1)] * 6)


def test_empty_topology_repeated_compute_has_empty_buffers():
    shape = TopoDS_Compound()
    BRep_Builder().MakeCompound(shape)
    tess = TopologyTesselator(shape)
    for _ in range(2):
        tess.Compute(reuse_mesh=True)
        assert tess.FaceCount() == tess.EdgeCount() == tess.VertexCount() == 0
        assert tess.Positions().shape == tess.Normals().shape == (0, 3)
        assert tess.TriangleIndices().shape == (0, 3)
        assert tess.FaceRanges().shape == tess.EdgeRanges().shape == (0, 2)
