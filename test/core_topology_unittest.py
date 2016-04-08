#!/usr/bin/env python

##Copyright 2009-2015 Thomas Paviot (tpaviot@gmail.com)
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

import unittest
import sys

sys.path.append('../src/addons/Utils')

from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeSphere
from OCC.TopoDS import TopoDS_Face, TopoDS_Edge

from Topology import Topo, WireExplorer

def get_test_box_shape():
    return BRepPrimAPI_MakeBox(10, 20, 30).Shape()


def get_test_sphere_shape():
    return BRepPrimAPI_MakeSphere(10.).Shape()


class TestTopo(unittest.TestCase):
    def setUp(self):
        self.topo = Topo(get_test_box_shape())
        assert self.topo

    def test_loop_faces(self):
        i = 0
        for face in self.topo.faces():
            i += 1
            assert(isinstance(face, TopoDS_Face))
        assert(i == 6)

    def test_loop_edges(self):
        i = 0
        for face in self.topo.edges():
            i += 1
            assert(isinstance(face, TopoDS_Edge))
        assert(i == 12)

    def number_of_topological_entities(self):
        assert(self.topo.number_of_faces() == 6)
        assert(self.topo.number_of_edges() == 12)
        assert(self.topo.number_of_vertices() == 8)
        assert(self.topo.number_of_wires() == 6)
        assert(self.topo.number_of_solids() == 1)
        assert(self.topo.number_of_shells() == 1)
        assert(self.topo.number_of_compounds() == 0)
        assert(self.topo.number_of_comp_solids() == 0)

    def test_nested_iteration(self):
        '''check nested looping'''
        for f in self.topo.faces():
            for e in self.topo.edges():
                assert isinstance(f, TopoDS_Face)
                assert isinstance(e, TopoDS_Edge)

    def test_kept_reference(self):
        '''did we keep a reference after looping several time through a list
        of topological entities?'''
        _tmp = []
        _faces = [i for i in self.topo.faces()]
        for f in _faces:
            _tmp.append(0 == f.IsNull())
        for f in _faces:
            _tmp.append(0 == f.IsNull())
        self.assert_(all(_tmp))

    def test_edge_face(self):
        edg = self.topo.edges().next()
        face = self.topo.faces().next()
        faces_from_edge = [i for i in self.topo.faces_from_edge(edg)]
        self.assert_(len(faces_from_edge) == self.topo.number_of_faces_from_edge(edg))
        edges_from_face = [i for i in self.topo.edges_from_face(face)]
        self.assert_(len(edges_from_face) == self.topo.number_of_edges_from_face(face))

    def test_edge_wire(self):
        edg = self.topo.edges().next()
        wire = self.topo.wires().next()
        wires_from_edge = [i for i in self.topo.wires_from_edge(edg)]
        self.assert_(len(wires_from_edge) == self.topo.number_of_wires_from_edge(edg))
        edges_from_wire = [i for i in self.topo.edges_from_wire(wire)]
        self.assert_(len(edges_from_wire) == self.topo.number_of_edges_from_wire(wire))

    def test_vertex_edge(self):
        vert = self.topo.vertices().next()
        edge = self.topo.edges().next()
        verts_from_edge = [i for i in self.topo.vertices_from_edge(edge)]
        self.assert_(len(verts_from_edge) == self.topo.number_of_vertices_from_edge(edge))
        edges_from_vert = [i for i in self.topo.edges_from_vertex(vert)]
        self.assert_(len(edges_from_vert) == self.topo.number_of_edges_from_vertex(vert))

    def test_vertex_face(self):
        vert = self.topo.vertices().next()
        face = self.topo.faces().next()
        faces_from_vertex = [i for i in self.topo.faces_from_vertex(vert)]
        self.assert_(len(faces_from_vertex) == self.topo.number_of_faces_from_vertex(vert))
        verts_from_face = [i for i in self.topo.vertices_from_face(face)]
        self.assert_(len(verts_from_face) == self.topo.number_of_vertices_from_face(face))

    def test_face_solid(self):
        face = self.topo.faces().next()
        solid = self.topo.solids().next()
        faces_from_solid = [i for i in self.topo.faces_from_solids(solid)]
        self.assert_(len(faces_from_solid) == self.topo.number_of_faces_from_solids(solid))
        solids_from_face = [i for i in self.topo.solids_from_face(face)]
        self.assert_(len(solids_from_face) == self.topo.number_of_solids_from_face(face))

    def test_wire_face(self):
        wire = self.topo.wires().next()
        face = self.topo.faces().next()
        faces_from_wire = [i for i in self.topo.faces_from_wire(wire)]
        self.assert_(len(faces_from_wire) == self.topo.number_of_faces_from_wires(wire))
        wires_from_face = [i for i in self.topo.wires_from_face(face)]
        self.assert_(len(wires_from_face) == self.topo.number_of_wires_from_face(face))

    def test_edges_out_of_scope(self):
        # check pointers going out of scope
        face = self.topo.faces().next()
        _edges = []
        for edg in Topo(face).edges():
            _edges.append(edg)
        for edg in _edges:
            assert not edg.IsNull()

    def test_wires_out_of_scope(self):
        # check pointers going out of scope
        wire = self.topo.wires().next()
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
    return test_suite

if __name__ == "__main__":
    unittest.main()