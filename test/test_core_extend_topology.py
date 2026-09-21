#!/usr/bin/env python

##Copyright 2009-2016 Thomas Paviot (tpaviot@gmail.com)
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

from OCC.Core.BRepPrimAPI import (
    BRepPrimAPI_MakeTorus,
    BRepPrimAPI_MakeBox,
    BRepPrimAPI_MakeSphere,
)
from OCC.Extend.TopologyUtils import (
    TopologyExplorer,
    WireExplorer,
    discretize_edge,
    discretize_wire,
    dump_topology_to_string,
    get_type_as_string,
    get_sorted_hlr_edges,
    list_of_shapes_to_compound,
)
from OCC.Core.TopoDS import TopoDS_Face, TopoDS_Edge


def get_test_box_shape(len_x=10.0, len_y=20.0, len_z=30.0):
    return BRepPrimAPI_MakeBox(len_x, len_y, len_z).Shape()


def get_test_sphere_shape(radius=10.0):
    return BRepPrimAPI_MakeSphere(radius).Shape()


topo = TopologyExplorer(get_test_box_shape())


def test_discretize_edge():
    tor = BRepPrimAPI_MakeTorus(50, 20).Shape()
    topo = TopologyExplorer(tor)
    for edge in topo.edges():
        pnts = discretize_edge(edge)
        assert pnts


def test_discretize_wire():
    tor = BRepPrimAPI_MakeTorus(50, 20).Shape()
    topo = TopologyExplorer(tor)
    for wire in topo.wires():
        pnts = discretize_wire(wire)
        assert pnts


def test_loop_faces():
    i = 0
    for face in topo.faces():
        i += 1
        assert isinstance(face, TopoDS_Face)
    assert i == 6


def test_loop_edges():
    i = 0
    for face in topo.edges():
        i += 1
        assert isinstance(face, TopoDS_Edge)
    assert i == 12


def test_number_of_topological_entities():
    assert topo.number_of_faces() == 6
    assert topo.number_of_edges() == 12
    assert topo.number_of_vertices() == 8
    assert topo.number_of_wires() == 6
    assert topo.number_of_solids() == 1
    assert topo.number_of_shells() == 1
    assert topo.number_of_compounds() == 0
    assert topo.number_of_comp_solids() == 0


def test_nested_iteration():
    """check nested looping"""
    for f in topo.faces():
        for e in topo.edges():
            assert isinstance(f, TopoDS_Face)
            assert isinstance(e, TopoDS_Edge)


def test_kept_reference():
    """did we keep a reference after looping several time through a list
    of topological entities?"""
    _faces = list(topo.faces())
    _tmp = [f.IsNull() == 0 for f in _faces]
    _tmp.extend(f.IsNull() == 0 for f in _faces)
    assert all(_tmp)


def test_edge_face():
    edg = next(topo.edges())
    face = next(topo.faces())
    faces_from_edge = list(topo.faces_from_edge(edg))
    assert len(faces_from_edge) == topo.number_of_faces_from_edge(edg)
    edges_from_face = list(topo.edges_from_face(face))
    assert len(edges_from_face) == topo.number_of_edges_from_face(face)


def test_edge_wire():
    edg = next(topo.edges())
    wire = next(topo.wires())
    wires_from_edge = list(topo.wires_from_edge(edg))
    assert len(wires_from_edge) == topo.number_of_wires_from_edge(edg)
    edges_from_wire = list(topo.edges_from_wire(wire))
    assert len(edges_from_wire) == topo.number_of_edges_from_wire(wire)


def test_vertex_edge():
    edge = next(topo.edges())
    verts_from_edge = list(topo.vertices_from_edge(edge))
    assert len(verts_from_edge) == topo.number_of_vertices_from_edge(edge)


def test_vertex_face():
    vert = next(topo.vertices())
    face = next(topo.faces())
    faces_from_vertex = list(topo.faces_from_vertex(vert))
    assert len(faces_from_vertex) == topo.number_of_faces_from_vertex(vert)
    verts_from_face = list(topo.vertices_from_face(face))
    assert len(verts_from_face) == topo.number_of_vertices_from_face(face)


def test_face_solid():
    face = next(topo.faces())
    solid = next(topo.solids())
    faces_from_solid = list(topo.faces_from_solids(solid))
    assert len(faces_from_solid) == topo.number_of_faces_from_solids(solid)
    solids_from_face = list(topo.solids_from_face(face))
    assert len(solids_from_face) == topo.number_of_solids_from_face(face)


def test_wire_face():
    wire = next(topo.wires())
    face = next(topo.faces())
    faces_from_wire = list(topo.faces_from_wire(wire))
    assert len(faces_from_wire) == topo.number_of_faces_from_wires(wire)
    wires_from_face = list(topo.wires_from_face(face))
    assert len(wires_from_face) == topo.number_of_wires_from_face(face)


def test_edges_out_of_scope():
    # check pointers going out of scope
    face = next(topo.faces())
    _edges = list(TopologyExplorer(face).edges())
    for edg in _edges:
        assert not edg.IsNull()


def test_wires_out_of_scope():
    # check pointers going out of scope
    wire = next(topo.wires())
    _edges, _vertices = [], []
    _edges.extend(iter(WireExplorer(wire).ordered_edges()))
    for edg in _edges:
        assert not edg.IsNull()
    _vertices.extend(iter(WireExplorer(wire).ordered_vertices()))
    for v in _vertices:
        assert not v.IsNull()


def test_dump_topology_to_string():
    box_shp = get_test_box_shape()
    dump_topology_to_string(box_shp)


def test_get_type_as_string():
    box_shp = get_test_box_shape()
    assert get_type_as_string(box_shp) == "Solid"


def test_get_sorted_hlr_edges():
    box_shp = get_test_box_shape()
    get_sorted_hlr_edges(box_shp)


def test_list_of_shapes_to_compound():
    box_shp = get_test_box_shape()
    sph_shp = get_test_sphere_shape(20.0)
    result, all_shape_converted = list_of_shapes_to_compound([box_shp, sph_shp])
    assert all_shape_converted
    assert get_type_as_string(result) == "Compound"


def test_topology_summary():
    assert topo.get_topology_summary() == {
        "number_of_vertices": 8,
        "number_of_edges": 12,
        "number_of_wires": 6,
        "number_of_faces": 6,
        "number_of_shells": 1,
        "number_of_solids": 1,
        "number_of_compounds": 0,
        "number_of_comp_solids": 0,
    }


def test_get_type_as_string_shell():
    shell = next(TopologyExplorer(get_test_box_shape()).shells())
    assert get_type_as_string(shell) == "Shell"


def test_number_of_solids_from_shell():
    topo_box = TopologyExplorer(get_test_box_shape())
    shell = next(topo_box.shells())
    assert topo_box.number_of_solids_from_shell(shell) == 1
    assert len(list(topo_box.solids_from_shell(shell))) == 1


def test_no_ancestor():
    # a face alone has no solid ancestor: nothing is returned, not None
    face = next(TopologyExplorer(get_test_box_shape()).faces())
    topo_face = TopologyExplorer(face)
    assert list(topo_face.solids_from_face(face)) == []
    assert topo_face.number_of_solids_from_face(face) == 0
    # an entity that is not part of the explored shape has no ancestor
    other_edge = next(TopologyExplorer(get_test_sphere_shape()).edges())
    assert list(topo_face.faces_from_edge(other_edge)) == []
    assert topo_face.number_of_faces_from_edge(other_edge) == 0


def test_ancestors_count_consistency():
    # counts must match the iterated ancestors, with or without orientation:
    # a box vertex belongs to 3 edges, each one present with 2 orientations
    for ignore_orientation, nb_edges in ((True, 3), (False, 6)):
        topo_box = TopologyExplorer(get_test_box_shape(), ignore_orientation)
        for vertex in topo_box.vertices():
            edges = list(topo_box.edges_from_vertex(vertex))
            assert len(edges) == nb_edges
            assert topo_box.number_of_edges_from_vertex(vertex) == nb_edges


def test_ancestors_after_shape_change():
    topo_explorer = TopologyExplorer(get_test_box_shape())
    edge = next(topo_explorer.edges())
    assert topo_explorer.number_of_faces_from_edge(edge) == 2
    # the ancestors maps must be rebuilt for the new shape
    topo_explorer.my_shape = get_test_sphere_shape()
    assert topo_explorer.number_of_faces_from_edge(edge) == 0
