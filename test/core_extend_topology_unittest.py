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

import pickle
import unittest
import os
from math import sqrt
import warnings
from contextlib import contextmanager

from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeTorus, BRepPrimAPI_MakeBox
from OCC.Extend.TopologyUtils import (TopologyExplorer, WireExplorer,
                                      discretize_edge, discretize_wire)
from OCC.Core.TopoDS import TopoDS_Face, TopoDS_Edge


def get_test_box_shape():
    return BRepPrimAPI_MakeBox(10, 20, 30).Shape()


def get_test_sphere_shape():
    return BRepPrimAPI_MakeSphere(10.).Shape()

topo = TopologyExplorer(get_test_box_shape())
assert topo


class TestExtendTopology(unittest.TestCase):
    
    def test_discretize_edge(self):
        tor = BRepPrimAPI_MakeTorus(50, 20).Shape()
        topo = TopologyExplorer(tor)
        for edge in topo.edges():
            discretize_edge(edge)

    def test_discretize_wire(self):
        tor = BRepPrimAPI_MakeTorus(50, 20).Shape()
        topo = TopologyExplorer(tor)
        for wire in topo.wires():
            discretize_wire(wire)


    def test_loop_faces(self):
        i = 0
        for face in topo.faces():
            i += 1
            assert(isinstance(face, TopoDS_Face))
        assert i == 6


    def test_loop_edges(self):
        i = 0
        for face in topo.edges():
            i += 1
            assert(isinstance(face, TopoDS_Edge))
        assert i == 12


    def test_number_of_topological_entities(self):
        assert topo.number_of_faces() == 6
        assert topo.number_of_edges() == 12
        assert topo.number_of_vertices() == 8
        assert topo.number_of_wires() == 6
        assert topo.number_of_solids() == 1
        assert topo.number_of_shells() == 1
        assert topo.number_of_compounds() == 0
        assert topo.number_of_comp_solids() == 0


    def test_nested_iteration(self):
        '''check nested looping'''
        for f in topo.faces():
            for e in topo.edges():
                assert isinstance(f, TopoDS_Face)
                assert isinstance(e, TopoDS_Edge)


    def test_kept_reference(self):
        '''did we keep a reference after looping several time through a list
        of topological entities?'''
        _tmp = []
        _faces = [i for i in topo.faces()]
        for f in _faces:
            _tmp.append(f.IsNull() == 0)
        for f in _faces:
            _tmp.append(f.IsNull() == 0)
        assert all(_tmp)


    def test_edge_face(self):
        edg = next(topo.edges())
        face = next(topo.faces())
        faces_from_edge = [i for i in topo.faces_from_edge(edg)]
        assert len(faces_from_edge) == topo.number_of_faces_from_edge(edg)
        edges_from_face = [i for i in topo.edges_from_face(face)]
        assert len(edges_from_face) == topo.number_of_edges_from_face(face)


    def test_edge_wire(self):
        edg = next(topo.edges())
        wire = next(topo.wires())
        wires_from_edge = [i for i in topo.wires_from_edge(edg)]
        assert len(wires_from_edge) == topo.number_of_wires_from_edge(edg)
        edges_from_wire = [i for i in topo.edges_from_wire(wire)]
        assert len(edges_from_wire) == topo.number_of_edges_from_wire(wire)


    def test_vertex_edge(self):
        vert = next(topo.vertices())
        edge = next(topo.edges())
        verts_from_edge = [i for i in topo.vertices_from_edge(edge)]
        assert len(verts_from_edge) == topo.number_of_vertices_from_edge(edge)
        edges_from_vert = [i for i in topo.edges_from_vertex(vert)]
        assert len(edges_from_vert) == topo.number_of_edges_from_vertex(vert)


    def test_vertex_face(self):
        vert = next(topo.vertices())
        face = next(topo.faces())
        faces_from_vertex = [i for i in topo.faces_from_vertex(vert)]
        assert len(faces_from_vertex) == topo.number_of_faces_from_vertex(vert)
        verts_from_face = [i for i in topo.vertices_from_face(face)]
        assert len(verts_from_face) == topo.number_of_vertices_from_face(face)


    def test_face_solid(self):
        face = next(topo.faces())
        solid = next(topo.solids())
        faces_from_solid = [i for i in topo.faces_from_solids(solid)]
        assert len(faces_from_solid) == topo.number_of_faces_from_solids(solid)
        solids_from_face = [i for i in topo.solids_from_face(face)]
        assert len(solids_from_face) == topo.number_of_solids_from_face(face)


    def test_wire_face(self):
        wire = next(topo.wires())
        face = next(topo.faces())
        faces_from_wire = [i for i in topo.faces_from_wire(wire)]
        assert len(faces_from_wire) == topo.number_of_faces_from_wires(wire)
        wires_from_face = [i for i in topo.wires_from_face(face)]
        assert len(wires_from_face) == topo.number_of_wires_from_face(face)


    def test_edges_out_of_scope(self):
        # check pointers going out of scope
        face = next(topo.faces())
        _edges = []
        for edg in TopologyExplorer(face).edges():
            _edges.append(edg)
        for edg in _edges:
            assert not edg.IsNull()


    def test_wires_out_of_scope(self):
        # check pointers going out of scope
        wire = next(topo.wires())
        _edges, _vertices = [], []
        for edg in WireExplorer(wire).ordered_edges():
            _edges.append(edg)
        for edg in _edges:
            assert not edg.IsNull()
        for vert in WireExplorer(wire).ordered_vertices():
            _vertices.append(vert)
        for v in _vertices:
            assert not v.IsNull()

def suite():
    test_suite = unittest.TestSuite()
    test_suite.addTest(unittest.makeSuite(TestExtendTopology))
    return test_suite

if __name__ == "__main__":
    unittest.main()
