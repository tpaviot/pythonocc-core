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
##GNU Lesser General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

"""TopologyTesselator: a mesh whose face i, edge i and vertex i are the
sub-shapes of index i in TopologyExplorer order. It is checked against
TopologyExplorer, against the geometry, and against a reference written with
the Python API, which reads the same OCCT triangulation."""

import threading
import time

import numpy as np
import pytest

from OCC.Core.BRep import BRep_Builder, BRep_Tool
from OCC.Core.BRepAdaptor import BRepAdaptor_Curve
from OCC.Core.BRepAlgoAPI import BRepAlgoAPI_Cut
from OCC.Core.BRepBndLib import brepbndlib
from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_MakeEdge, BRepBuilderAPI_MakeVertex
from OCC.Core.BRepExtrema import BRepExtrema_DistShapeShape
from OCC.Core.BRepLib import BRepLib_ToolTriangulatedShape
from OCC.Core.BRepMesh import BRepMesh_IncrementalMesh
from OCC.Core.BRepPrimAPI import (
    BRepPrimAPI_MakeBox,
    BRepPrimAPI_MakeCylinder,
    BRepPrimAPI_MakeSphere,
    BRepPrimAPI_MakeTorus,
)
from OCC.Core.BRepTools import breptools
from OCC.Core.Bnd import Bnd_Box
from OCC.Core.GCPnts import GCPnts_QuasiUniformDeflection
from OCC.Core.Tesselator import TopologyTesselator
from OCC.Core.TopAbs import TopAbs_EDGE, TopAbs_FACE, TopAbs_REVERSED, TopAbs_VERTEX
from OCC.Core.TopExp import topexp
from OCC.Core.TopLoc import TopLoc_Location
from OCC.Core.TopoDS import TopoDS_Compound, TopoDS_Shape, topods
from OCC.Core.TopTools import (
    TopTools_IndexedDataMapOfShapeListOfShape,
    TopTools_IndexedMapOfShape,
)
from OCC.Core.gp import gp_Ax1, gp_Ax2, gp_Dir, gp_Pnt, gp_Trsf, gp_Vec
from OCC.Extend.DataExchange import read_step_file, read_step_file_with_names_colors
from OCC.Extend.TopologyUtils import TopologyExplorer


def tessellate(shape, mesh_quality=1.0, deviation=None):
    tess = TopologyTesselator(shape)
    if deviation is not None:
        tess.SetDeviation(deviation)
    tess.Compute(mesh_quality=mesh_quality)
    return tess


def face_triangles(tess, index):
    first, count = tess.FaceRanges()[index]
    return tess.TriangleIndices()[first : first + count]


def edge_points(tess, index):
    first, count = tess.EdgeRanges()[index]
    return tess.EdgePositions()[first : first + count]


def distance(point, shape):
    vertex = BRepBuilderAPI_MakeVertex(gp_Pnt(*map(float, point))).Vertex()
    return BRepExtrema_DistShapeShape(vertex, shape).Value()


def check_against_topology(shape, tess, tolerance):
    """Face i's triangles lie on face i, edge i's points on edge i, and vertex
    i is vertex i of TopologyExplorer."""
    topology = TopologyExplorer(shape)
    faces = list(topology.faces())
    edges = list(topology.edges())
    vertices = list(topology.vertices())
    assert tess.FaceCount() == len(faces)
    assert tess.EdgeCount() == len(edges)
    assert tess.VertexCount() == len(vertices)
    assert int(tess.FaceRanges()[:, 1].sum()) == tess.TriangleCount()
    positions = tess.Positions()
    owners = np.full(tess.NodeCount(), -1)
    for index, face in enumerate(faces):
        nodes = np.unique(face_triangles(tess, index))
        # each face has its own nodes
        assert (owners[nodes] == -1).all()
        owners[nodes] = index
        for node in nodes[:: max(1, len(nodes) // 8)]:
            assert distance(positions[node], face) < tolerance, f"face {index}"
    for index, edge in enumerate(edges):
        for point in edge_points(tess, index)[::4]:
            assert distance(point, edge) < tolerance, f"edge {index}"
    for index, vertex in enumerate(vertices):
        expected = BRep_Tool.Pnt(vertex).Coord()
        assert np.allclose(tess.VertexPositions()[index], expected, atol=1e-4)


def test_box_faces_edges_and_vertices_follow_the_explorer():
    box = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    tess = tessellate(box)
    assert (tess.FaceCount(), tess.EdgeCount(), tess.VertexCount()) == (6, 12, 8)
    assert tess.TriangleCount() == 12
    assert tess.NodeCount() == 24
    assert tess.FaceRanges().tolist() == [[2 * i, 2] for i in range(6)]
    assert tess.EdgeRanges()[:, 1].tolist() == [2] * 12
    for array, dtype, columns in [
        (tess.Positions(), np.float32, 3),
        (tess.Normals(), np.float32, 3),
        (tess.TriangleIndices(), np.uint32, 3),
        (tess.FaceRanges(), np.uint32, 2),
        (tess.EdgePositions(), np.float32, 3),
        (tess.EdgeRanges(), np.uint32, 2),
        (tess.VertexPositions(), np.float32, 3),
    ]:
        assert array.dtype == dtype
        assert array.shape[1] == columns
    check_against_topology(box, tess, 1e-5)


def test_curved_faces_lie_on_their_faces():
    shape = BRepAlgoAPI_Cut(
        BRepPrimAPI_MakeBox(10, 10, 10).Shape(),
        BRepPrimAPI_MakeCylinder(gp_Ax2(gp_Pnt(5, 5, -1), gp_Dir(0, 0, 1)), 2, 12).Shape(),
    ).Shape()
    tess = tessellate(shape, mesh_quality=0.5)
    check_against_topology(shape, tess, 0.1)


def faces_out(tess, center):
    """Each triangle's winding and its normals point away from `center`, for
    a convex solid."""
    positions = tess.Positions().astype(np.float64)
    normals = tess.Normals().astype(np.float64)
    for triangle in tess.TriangleIndices():
        a, b, c = positions[triangle]
        cross = np.cross(b - a, c - a)
        outward = (a + b + c) / 3 - center
        if np.linalg.norm(cross) < 1e-9:
            continue
        assert np.dot(cross, outward) > 0
        assert np.dot(normals[triangle].sum(axis=0), outward) > 0


@pytest.mark.parametrize("reversed_", [False, True])
@pytest.mark.parametrize("mirrored", [False, True])
def test_front_faces_face_out_whatever_the_orientation_and_location(reversed_, mirrored):
    shape = BRepPrimAPI_MakeBox(gp_Pnt(1, 2, 3), 4, 5, 6).Shape()
    center = np.array([3.0, 4.5, 6.0])
    if mirrored:
        trsf = gp_Trsf()
        trsf.SetMirror(gp_Ax2(gp_Pnt(0, 0, 0), gp_Dir(1, 0, 0)))
        shape = shape.Moved(TopLoc_Location(trsf))
        center[0] = -center[0]
    if reversed_:
        # a reversed solid's faces face in
        shape = shape.Reversed()
    tess = tessellate(shape)
    if reversed_:
        center_inside_out = center
        positions = tess.Positions().astype(np.float64)
        for triangle in tess.TriangleIndices():
            a, b, c = positions[triangle]
            outward = (a + b + c) / 3 - center_inside_out
            assert np.dot(np.cross(b - a, c - a), outward) < 0
    else:
        faces_out(tess, center)


def test_sphere_degenerated_edges_have_no_points():
    sphere = BRepPrimAPI_MakeSphere(5).Shape()
    tess = tessellate(sphere)
    edges = list(TopologyExplorer(sphere).edges())
    for index, edge in enumerate(edges):
        count = tess.EdgeRanges()[index][1]
        assert (count == 0) == BRep_Tool.Degenerated(edge)
    faces_out(tess, np.zeros(3))
    assert np.allclose(np.linalg.norm(tess.Normals(), axis=1), 1, atol=1e-5)


def test_free_edges_and_vertices_keep_their_index():
    builder = BRep_Builder()
    compound = TopoDS_Compound()
    builder.MakeCompound(compound)
    builder.Add(compound, BRepPrimAPI_MakeBox(1, 1, 1).Shape())
    builder.Add(compound, BRepBuilderAPI_MakeEdge(gp_Pnt(5, 0, 0), gp_Pnt(5, 3, 4)).Edge())
    builder.Add(compound, BRepBuilderAPI_MakeVertex(gp_Pnt(-2, -2, -2)).Vertex())
    tess = tessellate(compound)
    assert (tess.FaceCount(), tess.EdgeCount(), tess.VertexCount()) == (6, 13, 11)
    free = edge_points(tess, 12)
    assert free.tolist() == [[5, 0, 0], [5, 3, 4]]
    assert tess.VertexPositions()[10].tolist() == [-2, -2, -2]
    check_against_topology(compound, tess, 1e-5)


def test_an_unmeshed_shape_keeps_every_face_with_an_empty_range():
    tess = tessellate(BRepPrimAPI_MakeBox(10, 10, 10).Shape(), deviation=0.0)
    assert tess.FaceRanges().tolist() == [[0, 0]] * 6
    assert tess.TriangleCount() == 0
    assert tess.VertexCount() == 8


def test_the_mesh_quality_scales_the_triangles():
    torus = BRepPrimAPI_MakeTorus(10, 3).Shape()
    coarse = tessellate(torus, mesh_quality=2.0).TriangleCount()
    breptools.Clean(torus)
    fine = tessellate(torus, mesh_quality=0.25).TriangleCount()
    assert fine > 4 * coarse
    with pytest.raises(ValueError, match="mesh quality"):
        TopologyTesselator(torus).Compute(mesh_quality=0)


def test_the_default_deviation_is_the_shape_tesselator_s():
    from OCC.Core.Tesselator import ShapeTesselator

    box = BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    assert TopologyTesselator(box).GetDeviation() == ShapeTesselator(box).GetDeviation()
    assert TopologyTesselator(box).GetDeviation() == pytest.approx(0.6)


def test_compute_releases_the_gil():
    """another Python thread runs while a shape is meshed"""
    torus = BRepPrimAPI_MakeTorus(10, 3).Shape()
    ticks = []
    done = threading.Event()

    def count():
        while not done.is_set():
            ticks.append(time.perf_counter())
            time.sleep(0.0005)

    thread = threading.Thread(target=count)
    tess = TopologyTesselator(torus)
    thread.start()
    time.sleep(0.01)
    start = time.perf_counter()
    tess.Compute(mesh_quality=0.15, parallel=False)
    end = time.perf_counter()
    done.set()
    thread.join()
    assert end - start > 0.05, "the meshing is too fast to tell"
    assert sum(start < tick < end for tick in ticks) > 5


# -- A reference written with the Python API ---------------------------------


def reference(shape, deviation, mesh_quality=1.0):
    """The same mesh, read from the triangulation with the Python API, in the
    order and with the rules of TopologyTesselator."""
    linear = deviation * mesh_quality
    if linear > 0:
        breptools.Clean(shape)
        BRepMesh_IncrementalMesh(shape, linear, False, 0.5 * mesh_quality, True)

    def transform_of(location):
        if location.IsIdentity():
            return None
        trsf = location.Transformation()
        matrix = np.array(
            [[trsf.Value(row, column) for column in range(1, 5)] for row in range(1, 4)]
        )
        return matrix, abs(trsf.ScaleFactor()), trsf.IsNegative()

    faces = TopTools_IndexedMapOfShape()
    topexp.MapShapes(shape, TopAbs_FACE, faces)
    positions, normals, indices, face_ranges, placed = [], [], [], [], {}
    nodes_so_far = triangles_so_far = 0
    for index in range(1, faces.Extent() + 1):
        face = topods.Face(faces.FindKey(index))
        location = TopLoc_Location()
        triangulation = BRep_Tool.Triangulation(face, location)
        if triangulation is None or triangulation.NbTriangles() == 0:
            face_ranges.append((triangles_so_far, 0))
            continue
        if not triangulation.HasNormals():
            BRepLib_ToolTriangulatedShape.ComputeNormals(face, triangulation)
        node_handle = triangulation.MapNodeArray()
        normal_handle = triangulation.MapNormalArray()
        triangle_handle = triangulation.MapTriangleArray()
        nodes = node_handle.Array1().to_numpy_array()
        face_normals = normal_handle.Array1().to_numpy_array().reshape(-1, 3).astype(np.float64)
        triangles = triangle_handle.Array1().to_numpy_array() - 1
        transform = transform_of(location)
        inside_out = False
        if transform is not None:
            matrix, scale, mirrored = transform
            nodes = nodes @ matrix[:, :3].T + matrix[:, 3]
            face_normals = face_normals @ (matrix[:, :3] / scale).T
            inside_out = mirrored
        if face.Orientation() == TopAbs_REVERSED:
            face_normals = -face_normals
            inside_out = not inside_out
        if inside_out:
            triangles = triangles[:, [0, 2, 1]]
        placed[index] = (nodes, triangulation, location)
        positions.append(nodes)
        normals.append(face_normals)
        indices.append(triangles + nodes_so_far)
        face_ranges.append((triangles_so_far, len(triangles)))
        nodes_so_far += len(nodes)
        triangles_so_far += len(triangles)

    edges = TopTools_IndexedMapOfShape()
    topexp.MapShapes(shape, TopAbs_EDGE, edges)
    edge_faces = TopTools_IndexedDataMapOfShapeListOfShape()
    topexp.MapShapesAndAncestors(shape, TopAbs_EDGE, TopAbs_FACE, edge_faces)
    edge_nodes, edge_ranges, so_far = [], [], 0
    for index in range(1, edges.Extent() + 1):
        edge = topods.Edge(edges.FindKey(index))
        points = np.zeros((0, 3))
        if not BRep_Tool.Degenerated(edge):
            location = TopLoc_Location()
            polygon = BRep_Tool.Polygon3D(edge, location)
            if polygon is not None:
                points = polygon.Nodes().to_numpy_array()
                transform = transform_of(location)
                if transform is not None:
                    points = points @ transform[0][:, :3].T + transform[0][:, 3]
            elif edge_faces.Contains(edge):
                for face in edge_faces.FindFromKey(edge):
                    meshed = placed.get(faces.FindIndex(face))
                    if meshed is None:
                        continue
                    nodes, triangulation, location = meshed
                    on_triangulation = BRep_Tool.PolygonOnTriangulation(
                        edge, triangulation, location
                    )
                    if on_triangulation is None:
                        continue
                    points = nodes[on_triangulation.Nodes().to_numpy_array() - 1]
                    break
            if not len(points) and linear > 0:
                sampler = GCPnts_QuasiUniformDeflection(BRepAdaptor_Curve(edge), linear)
                if sampler.IsDone():
                    points = np.array(
                        [sampler.Value(i).Coord() for i in range(1, sampler.NbPoints() + 1)]
                    )
        edge_ranges.append((so_far, len(points)))
        if len(points):
            edge_nodes.append(points)
            so_far += len(points)

    vertices = TopTools_IndexedMapOfShape()
    topexp.MapShapes(shape, TopAbs_VERTEX, vertices)
    vertex_points = [
        BRep_Tool.Pnt(topods.Vertex(vertices.FindKey(i))).Coord()
        for i in range(1, vertices.Extent() + 1)
    ]

    def stack(arrays, columns, dtype):
        if not arrays:
            return np.zeros((0, columns), dtype=dtype)
        return np.concatenate(arrays).astype(dtype)

    return {
        "Positions": stack(positions, 3, np.float32),
        "Normals": stack(normals, 3, np.float32),
        "TriangleIndices": stack(indices, 3, np.uint32),
        "FaceRanges": np.array(face_ranges, dtype=np.uint32).reshape(-1, 2),
        "EdgePositions": stack(edge_nodes, 3, np.float32),
        "EdgeRanges": np.array(edge_ranges, dtype=np.uint32).reshape(-1, 2),
        "VertexPositions": np.array(vertex_points, dtype=np.float32).reshape(-1, 3),
    }


def default_deviation(shape):
    box = Bnd_Box()
    brepbndlib.Add(shape, box)
    xmin, ymin, zmin, xmax, ymax, zmax = box.Get()
    return max(xmax - xmin, ymax - ymin, zmax - zmin) * 2e-2


def models():
    yield "box", BRepPrimAPI_MakeBox(10, 20, 30).Shape()
    yield "cylinder", BRepPrimAPI_MakeCylinder(5, 10).Shape()
    yield "sphere", BRepPrimAPI_MakeSphere(7).Shape()
    yield "torus", BRepPrimAPI_MakeTorus(10, 3).Shape()
    yield "reversed", BRepPrimAPI_MakeBox(3, 4, 5).Shape().Reversed()
    compound = TopoDS_Compound()
    builder = BRep_Builder()
    builder.MakeCompound(compound)
    builder.Add(compound, BRepPrimAPI_MakeBox(1, 1, 1).Shape())
    builder.Add(compound, BRepBuilderAPI_MakeEdge(gp_Pnt(5, 0, 0), gp_Pnt(6, 1, 2)).Edge())
    yield "free edge", compound
    mirror = gp_Trsf()
    mirror.SetMirror(gp_Ax2(gp_Pnt(0, 0, 0), gp_Dir(1, 0, 0)))
    yield "mirrored", BRepPrimAPI_MakeCylinder(2, 3).Shape().Moved(TopLoc_Location(mirror))
    rotation = gp_Trsf()
    rotation.SetRotation(gp_Ax1(gp_Pnt(1, 2, 3), gp_Dir(1, 1, 0)), 0.7)
    rotation.SetTranslationPart(gp_Vec(10, -3, 2))
    yield "rotated", BRepPrimAPI_MakeSphere(4).Shape().Moved(TopLoc_Location(rotation))
    scale = gp_Trsf()
    scale.SetScale(gp_Pnt(0, 0, 0), 2.5)
    yield "scaled", BRepPrimAPI_MakeTorus(5, 1).Shape().Moved(TopLoc_Location(scale))
    yield "step assembly", read_step_file("./test_io/as1-oc-214.stp")
    for index, (part, (name, _)) in enumerate(
        read_step_file_with_names_colors("./test_io/as1-oc-214.stp").items()
    ):
        if index < 4:
            yield f"step part {name}", part
    yield "unmeshed", BRepPrimAPI_MakeBox(1, 2, 3).Shape()


def ulps(a, b):
    """The largest difference of two float32 arrays, in units in the last
    place; -0 and +0 are one apart."""
    return int(
        np.abs(a.view(np.int32).astype(np.int64) - b.view(np.int32).astype(np.int64)).max(
            initial=0
        )
    )


@pytest.mark.parametrize("name,shape", list(models()), ids=lambda v: v if isinstance(v, str) else "")
def test_the_same_mesh_as_the_python_reference(name, shape):
    """The same ranges and indices, the same positions to one float32 ulp, and
    the same normals to one ulp of 1: the order of the float64 operations may
    differ, and a C++ compiler may fuse them."""
    # The default deviation is read from the bounding box, which uses the
    # triangulation when there is one: both are given the same.
    deviation = 0.0 if name == "unmeshed" else default_deviation(shape)
    expected = reference(shape, deviation)
    tess = tessellate(shape, deviation=deviation)
    for method in ("TriangleIndices", "FaceRanges", "EdgeRanges"):
        assert np.array_equal(getattr(tess, method)(), expected[method]), method
    for method in ("Positions", "EdgePositions", "VertexPositions"):
        found = getattr(tess, method)()
        assert found.shape == expected[method].shape, method
        assert ulps(found, expected[method]) <= 1, method
    assert tess.Normals().shape == expected["Normals"].shape
    assert np.abs(tess.Normals() - expected["Normals"]).max(initial=0) <= 2.0**-23
