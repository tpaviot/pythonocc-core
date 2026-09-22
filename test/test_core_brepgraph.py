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

"""Tests of the BRepGraph package, the graph based BRep representation new
in OCCT 8.0. The BRepGraph class is a graph, its views (Shapes, Topo, Refs,
Editor) are nested classes wrapped as BRepGraph_ShapesView, BRepGraph_TopoView
and so on; the node ids are aliases of BRepGraph_NodeId::Typed<Kind>,
wrapped as BRepGraph_FaceId, BRepGraph_EdgeId..."""

import pytest

from OCC.Core.BRepGProp import brepgprop
from OCC.Core.BRepGraph import (
    BRepGraph_EdgeId,
    BRepGraph_FaceId,
    BRepGraph_NodeId,
    BRepGraph_ShapesView,
    BRepGraph_ShapesView_Result,
    BRepGraph_Tool_Face,
    BRepGraph_Tool_Vertex,
    BRepGraph_Validate,
    BRepGraph_VertexId,
    brepgraph,
)
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeSphere
from OCC.Core.GProp import GProp_GProps
from OCC.Core.TopAbs import TopAbs_SOLID
from OCC.Core.TopoDS import TopoDS_Shape


@pytest.fixture
def box_graph():
    graph = brepgraph()
    box = BRepPrimAPI_MakeBox(10.0, 20.0, 30.0).Shape()
    result = graph.Shapes().Add(box)
    return graph, box, result


def test_empty_graph():
    graph = brepgraph()
    assert graph.IsEmpty()
    assert graph.IsValid()
    assert graph.Topo().Faces().Nb() == 0
    graph.Clear()
    assert graph.IsEmpty()


def test_add_shape(box_graph):
    graph, box, result = box_graph
    assert isinstance(result, BRepGraph_ShapesView_Result)
    assert result.IsOk()
    assert result.Status == BRepGraph_ShapesView.AddStatus_Success
    assert result.TopologyRoot.IsValid()
    assert result.TopologyRoot.NodeKind == BRepGraph_NodeId.Kind_Solid
    assert not graph.IsEmpty()
    assert graph.ValidateRelations()
    assert graph.Shapes().HasNode(box)
    assert graph.Shapes().FindNode(box) == result.TopologyRoot


def test_topology_counts(box_graph):
    graph, _, _ = box_graph
    topo = graph.Topo()
    assert topo.Solids().Nb() == 1
    assert topo.Shells().Nb() == 1
    assert topo.Faces().Nb() == 6
    assert topo.Wires().Nb() == 6
    assert topo.Edges().Nb() == 12
    assert topo.Vertices().Nb() == 8
    # ids are 0-based and contiguous, EndId is one past the last one
    assert topo.Faces().StartId().Index == 0
    assert topo.Faces().EndId().Index == 6


def test_typed_ids():
    face_id = BRepGraph_FaceId(3)
    assert face_id.IsValid()
    assert face_id.Index == 3
    assert BRepGraph_FaceId.Start().Index == 0
    assert not BRepGraph_FaceId.Invalid().IsValid()
    assert face_id == BRepGraph_FaceId(3)
    assert face_id != BRepGraph_FaceId(4)
    # a typed id carries its kind, the plain node id both kind and index
    node_id = BRepGraph_NodeId(BRepGraph_NodeId.Kind_Face, 3)
    assert node_id.NodeKind == BRepGraph_NodeId.Kind_Face
    assert node_id.Index == 3
    assert BRepGraph_FaceId.FromNodeId(node_id) == face_id
    assert BRepGraph_NodeId.IsTopologyKind(BRepGraph_NodeId.Kind_Face)
    assert not BRepGraph_NodeId.IsAssemblyKind(BRepGraph_NodeId.Kind_Face)


def test_geometry_of_nodes(box_graph):
    graph, _, _ = box_graph
    topo = graph.Topo()
    for index in range(topo.Faces().Nb()):
        face_id = BRepGraph_FaceId(index)
        surface = topo.Faces().Surface(face_id)
        assert surface.DynamicType().Name() == "Geom_Plane"
        # the same through the BRepGraph_Tool static helpers
        assert BRepGraph_Tool_Face.HasSurface(graph, face_id)
        assert BRepGraph_Tool_Face.Tolerance(graph, face_id) == pytest.approx(1e-7)
        umin, umax, vmin, vmax = BRepGraph_Tool_Face.Bounds(graph, face_id)
        assert umax > umin and vmax > vmin
    for index in range(topo.Edges().Nb()):
        assert topo.Edges().NbFaces(BRepGraph_EdgeId(index)) == 2
    corners = {
        tuple(
            round(c)
            for c in BRepGraph_Tool_Vertex.Pnt(graph, BRepGraph_VertexId(index)).Coord()
        )
        for index in range(topo.Vertices().Nb())
    }
    assert corners == {(x, y, z) for x in (0, 10) for y in (0, 20) for z in (0, 30)}


def test_reconstruct_shape(box_graph):
    graph, box, result = box_graph
    for shape in (
        graph.Shapes().Shape(result.TopologyRoot),
        graph.Shapes().Reconstruct(result.TopologyRoot),
    ):
        assert isinstance(shape, TopoDS_Shape)
        assert not shape.IsNull()
        assert shape.ShapeType() == TopAbs_SOLID
        props = GProp_GProps()
        brepgprop.VolumeProperties(shape, props)
        assert props.Mass() == pytest.approx(6000.0)
    # the original shape is kept
    assert graph.Shapes().HasOriginal(result.TopologyRoot)
    assert graph.Shapes().Original(result.TopologyRoot).IsSame(box)


def test_several_shapes_and_removal(box_graph):
    graph, box, _ = box_graph
    sphere = BRepPrimAPI_MakeSphere(5.0).Shape()
    result = graph.Shapes().Add(sphere)
    assert result.IsOk()
    topo = graph.Topo()
    assert topo.Solids().Nb() == 2
    assert topo.Faces().Nb() == 7
    assert graph.Shapes().RemoveShape(box)
    assert not graph.Shapes().HasNode(box)
    assert graph.Shapes().HasNode(sphere)
    # the solid node is deactivated, not deleted: the nodes are kept until
    # the graph is compacted, and its faces are still active
    assert topo.Solids().Nb() == 2
    assert topo.Solids().NbActive() == 1
    assert topo.Faces().NbActive() == 7


def test_validate(box_graph):
    graph, _, _ = box_graph
    result = BRepGraph_Validate.Perform(graph)
    assert result.IsValid()
    assert result.NbIssues(BRepGraph_Validate.Severity_Error) == 0
    result = BRepGraph_Validate.Perform(graph, BRepGraph_Validate.Mode_Audit)
    assert result.IsValid()
