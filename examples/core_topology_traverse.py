#!/usr/bin/env python

##Copyright 2008-2015 Jelle Feringa (jelleferinga@gmail.com)
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

from __future__ import print_function
import sys

from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeSphere
from OCC.BRep import BRep_Tool
from OCC.BRepTools import BRepTools_WireExplorer
from OCC.TopAbs import (TopAbs_VERTEX, TopAbs_EDGE, TopAbs_FACE, TopAbs_WIRE,
                        TopAbs_SHELL, TopAbs_SOLID, TopAbs_COMPOUND,
                        TopAbs_COMPSOLID)
from OCC.TopExp import TopExp_Explorer, topexp_MapShapesAndAncestors
from OCC.TopTools import (TopTools_ListOfShape,
                          TopTools_ListIteratorOfListOfShape,
                          TopTools_IndexedDataMapOfShapeListOfShape)
from OCC.TopoDS import (topods, TopoDS_Wire, TopoDS_Vertex, TopoDS_Edge,
                        TopoDS_Face, TopoDS_Shell, TopoDS_Solid,
                        TopoDS_Compound, TopoDS_CompSolid, topods_Edge,
                        topods_Vertex, TopoDS_Iterator)


class WireExplorer(object):
    '''
    Wire traversal
    '''
    def __init__(self, wire):
        assert isinstance(wire, TopoDS_Wire), 'not a TopoDS_Wire'
        self.wire = wire
        self.wire_explorer = BRepTools_WireExplorer(self.wire)
        self.done = False

    def _reinitialize(self):
        self.wire_explorer = BRepTools_WireExplorer(self.wire)
        self.done = False

    def _loop_topo(self, edges=True):
        if self.done:
            self._reinitialize()
        topologyType = topods_Edge if edges else topods_Vertex
        seq = []
        hashes = []  # list that stores hashes to avoid redundancy
        occ_seq = TopTools_ListOfShape()
        while self.wire_explorer.More():
            # loop edges
            if edges:
                current_item = self.wire_explorer.Current()
            # loop vertices
            else:
                current_item = self.wire_explorer.CurrentVertex()
            current_item_hash = current_item.__hash__()
            if not current_item_hash in hashes:
                hashes.append(current_item_hash)
                occ_seq.Append(current_item)
            self.wire_explorer.Next()

        # Convert occ_seq to python list
        occ_iterator = TopTools_ListIteratorOfListOfShape(occ_seq)
        while occ_iterator.More():
            topo_to_add = topologyType(occ_iterator.Value())
            seq.append(topo_to_add)
            occ_iterator.Next()
        self.done = True
        return iter(seq)

    def ordered_edges(self):
        return self._loop_topo(edges=True)

    def ordered_vertices(self):
        return self._loop_topo(edges=False)


class Topo(object):
    '''
    Topology traversal
    '''

    def __init__(self, myShape, ignore_orientation=False):
        """

        implements topology traversal from any TopoDS_Shape
        this class lets you find how various topological entities are connected from one to another
        find the faces connected to an edge, find the vertices this edge is made from, get all faces connected to
        a vertex, and find out how many topological elements are connected from a source

        *note* when traversing TopoDS_Wire entities, its advised to use the specialized
        ``WireExplorer`` class, which will return the vertices / edges in the expected order

        :param myShape: the shape which topology will be traversed

        :param ignore_orientation: filter out TopoDS_* entities of similar TShape but different Orientation

        for instance, a cube has 24 edges, 4 edges for each of 6 faces

        that results in 48 vertices, while there are only 8 vertices that have a unique
        geometric coordinate

        in certain cases ( computing a graph from the topology ) its preferable to return
        topological entities that share similar geometry, though differ in orientation
        by setting the ``ignore_orientation`` variable
        to True, in case of a cube, just 12 edges and only 8 vertices will be returned

        for further reference see TopoDS_Shape IsEqual / IsSame methods

        """
        self.myShape = myShape
        self.ignore_orientation = ignore_orientation

        # the topoFactory dicts maps topology types and functions that can
        # create this topology
        self.topoFactory = {
            TopAbs_VERTEX: topods.Vertex,
            TopAbs_EDGE: topods.Edge,
            TopAbs_FACE: topods.Face,
            TopAbs_WIRE: topods.Wire,
            TopAbs_SHELL: topods.Shell,
            TopAbs_SOLID: topods.Solid,
            TopAbs_COMPOUND: topods.Compound,
            TopAbs_COMPSOLID: topods.CompSolid
        }

    def _loop_topo(self, topologyType, topologicalEntity=None, topologyTypeToAvoid=None):
        '''
        this could be a faces generator for a python TopoShape class
        that way you can just do:
        for face in srf.faces:
            processFace(face)
        '''
        topoTypes = {TopAbs_VERTEX: TopoDS_Vertex,
                     TopAbs_EDGE: TopoDS_Edge,
                     TopAbs_FACE: TopoDS_Face,
                     TopAbs_WIRE: TopoDS_Wire,
                     TopAbs_SHELL: TopoDS_Shell,
                     TopAbs_SOLID: TopoDS_Solid,
                     TopAbs_COMPOUND: TopoDS_Compound,
                     TopAbs_COMPSOLID: TopoDS_CompSolid}

        assert topologyType in topoTypes.keys(), '%s not one of %s' % (topologyType, topoTypes.keys())
        self.topExp = TopExp_Explorer()
        # use self.myShape if nothing is specified
        if topologicalEntity is None and topologyTypeToAvoid is None:
            self.topExp.Init(self.myShape, topologyType)
        elif topologicalEntity is None and topologyTypeToAvoid is not None:
            self.topExp.Init(self.myShape, topologyType, topologyTypeToAvoid)
        elif topologyTypeToAvoid is None:
            self.topExp.Init(topologicalEntity, topologyType)
        elif topologyTypeToAvoid:
            self.topExp.Init(topologicalEntity,
                             topologyType,
                             topologyTypeToAvoid)
        seq = []
        hashes = []  # list that stores hashes to avoid redundancy
        occ_seq = TopTools_ListOfShape()
        while self.topExp.More():
            current_item = self.topExp.Current()
            current_item_hash = current_item.__hash__()

            if not current_item_hash in hashes:
                hashes.append(current_item_hash)
                occ_seq.Append(current_item)

            self.topExp.Next()
        # Convert occ_seq to python list
        occ_iterator = TopTools_ListIteratorOfListOfShape(occ_seq)
        while occ_iterator.More():
            topo_to_add = self.topoFactory[topologyType](occ_iterator.Value())
            seq.append(topo_to_add)
            occ_iterator.Next()

        if self.ignore_orientation:
            # filter out those entities that share the same TShape
            # but do *not* share the same orientation
            filter_orientation_seq = []
            for i in seq:
                _present = False
                for j in filter_orientation_seq:
                    if i.IsSame(j):
                        _present = True
                        break
                if _present is False:
                    filter_orientation_seq.append(i)
            return filter_orientation_seq
        else:
            return iter(seq)

    def faces(self):
        '''
        loops over all faces
        '''
        return self._loop_topo(TopAbs_FACE)

    def _number_of_topo(self, iterable):
        n = 0
        for i in iterable:
            n += 1
        return n

    def number_of_faces(self):
        return self._number_of_topo(self.faces())

    def vertices(self):
        '''
        loops over all vertices
        '''
        return self._loop_topo(TopAbs_VERTEX)

    def number_of_vertices(self):
        return self._number_of_topo(self.vertices())

    def edges(self):
        '''
        loops over all edges
        '''
        return self._loop_topo(TopAbs_EDGE)

    def number_of_edges(self):
        return self._number_of_topo(self.edges())

    def wires(self):
        '''
        loops over all wires
        '''
        return self._loop_topo(TopAbs_WIRE)

    def number_of_wires(self):
        return self._number_of_topo(self.wires())

    def shells(self):
        '''
        loops over all shells
        '''
        return self._loop_topo(TopAbs_SHELL, None)

    def number_of_shells(self):
        return self._number_of_topo(self.shells())

    def solids(self):
        '''
        loops over all solids
        '''
        return self._loop_topo(TopAbs_SOLID, None)

    def number_of_solids(self):
        return self._number_of_topo(self.solids())

    def comp_solids(self):
        '''
        loops over all compound solids
        '''
        return self._loop_topo(TopAbs_COMPSOLID)

    def number_of_comp_solids(self):
        return self._number_of_topo(self.comp_solids())

    def compounds(self):
        '''
        loops over all compounds
        '''
        return self._loop_topo(TopAbs_COMPOUND)

    def number_of_compounds(self):
        return self._number_of_topo(self.compounds())

    def ordered_vertices_from_wire(self, wire):
        '''
        @param wire: TopoDS_Wire
        '''
        we = WireExplorer(wire)
        return we.ordered_vertices()

    def number_of_ordered_vertices_from_wire(self, wire):
        return self._number_of_topo(self.ordered_vertices_from_wire(wire))

    def ordered_edges_from_wire(self, wire):
        '''
        @param wire: TopoDS_Wire
        '''
        we = WireExplorer(wire)
        return we.ordered_edges()

    def number_of_ordered_edges_from_wire(self, wire):
        return self._number_of_topo(self.ordered_edges_from_wire(wire))

    def _map_shapes_and_ancestors(self, topoTypeA, topoTypeB, topologicalEntity):
        '''
        using the same method
        @param topoTypeA:
        @param topoTypeB:
        @param topologicalEntity:
        '''
        topo_set = set()
        _map = TopTools_IndexedDataMapOfShapeListOfShape()
        topexp_MapShapesAndAncestors(self.myShape, topoTypeA, topoTypeB, _map)
        results = _map.FindFromKey(topologicalEntity)
        if results.IsEmpty():
            yield None

        topology_iterator = TopTools_ListIteratorOfListOfShape(results)
        while topology_iterator.More():

            topo_entity = self.topoFactory[topoTypeB](topology_iterator.Value())

            # return the entity if not in set
            # to assure we're not returning entities several times
            if not topo_entity in topo_set:
                if self.ignore_orientation:
                    unique = True
                    for i in topo_set:
                        if i.IsSame(topo_entity):
                            unique = False
                            break
                    if unique:
                        yield topo_entity
                else:
                    yield topo_entity

            topo_set.add(topo_entity)
            topology_iterator.Next()

    def _number_shapes_ancestors(self, topoTypeA, topoTypeB, topologicalEntity):
        '''returns the number of shape ancestors
        If you want to know how many edges a faces has:
        _number_shapes_ancestors(self, TopAbs_EDGE, TopAbs_FACE, edg)
        will return the number of edges a faces has
        @param topoTypeA:
        @param topoTypeB:
        @param topologicalEntity:
        '''
        topo_set = set()
        _map = TopTools_IndexedDataMapOfShapeListOfShape()
        topexp_MapShapesAndAncestors(self.myShape, topoTypeA, topoTypeB, _map)
        results = _map.FindFromKey(topologicalEntity)
        if results.IsEmpty():
            return None
        topology_iterator = TopTools_ListIteratorOfListOfShape(results)
        while topology_iterator.More():
            topo_set.add(topology_iterator.Value())
            topology_iterator.Next()
        return len(topo_set)

    # ======================================================================
    # EDGE <-> FACE
    # ======================================================================
    def faces_from_edge(self, edge):
        """

        :param edge:
        :return:
        """
        return self._map_shapes_and_ancestors(TopAbs_EDGE, TopAbs_FACE, edge)

    def number_of_faces_from_edge(self, edge):
        """

        :param edge:
        :return:
        """
        return self._number_shapes_ancestors(TopAbs_EDGE, TopAbs_FACE, edge)

    def edges_from_face(self, face):
        """

        :param face:
        :return:
        """
        return self._loop_topo(TopAbs_EDGE, face)

    def number_of_edges_from_face(self, face):
        cnt = 0
        for i in self._loop_topo(TopAbs_EDGE, face):
            cnt += 1
        return cnt

    # ======================================================================
    # VERTEX <-> EDGE
    # ======================================================================
    def vertices_from_edge(self, edg):
        return self._loop_topo(TopAbs_VERTEX, edg)

    def number_of_vertices_from_edge(self, edg):
        cnt = 0
        for i in self._loop_topo(TopAbs_VERTEX, edg):
            cnt += 1
        return cnt

    def edges_from_vertex(self, vertex):
        return self._map_shapes_and_ancestors(TopAbs_VERTEX, TopAbs_EDGE, vertex)

    def number_of_edges_from_vertex(self, vertex):
        return self._number_shapes_ancestors(TopAbs_VERTEX, TopAbs_EDGE, vertex)

    # ======================================================================
    # WIRE <-> EDGE
    # ======================================================================
    def edges_from_wire(self, wire):
        return self._loop_topo(TopAbs_EDGE, wire)

    def number_of_edges_from_wire(self, wire):
        cnt = 0
        for i in self._loop_topo(TopAbs_EDGE, wire):
            cnt += 1
        return cnt

    def wires_from_edge(self, edg):
        return self._map_shapes_and_ancestors(TopAbs_EDGE, TopAbs_WIRE, edg)

    def wires_from_vertex(self, edg):
        return self._map_shapes_and_ancestors(TopAbs_VERTEX, TopAbs_WIRE, edg)

    def number_of_wires_from_edge(self, edg):
        return self._number_shapes_ancestors(TopAbs_EDGE, TopAbs_WIRE, edg)

    # ======================================================================
    # WIRE <-> FACE
    # ======================================================================
    def wires_from_face(self, face):
        return self._loop_topo(TopAbs_WIRE, face)

    def number_of_wires_from_face(self, face):
        cnt = 0
        for i in self._loop_topo(TopAbs_WIRE, face):
            cnt += 1
        return cnt

    def faces_from_wire(self, wire):
        return self._map_shapes_and_ancestors(TopAbs_WIRE, TopAbs_FACE, wire)

    def number_of_faces_from_wires(self, wire):
        return self._number_shapes_ancestors(TopAbs_WIRE, TopAbs_FACE, wire)

    # ======================================================================
    # VERTEX <-> FACE
    # ======================================================================
    def faces_from_vertex(self, vertex):
        return self._map_shapes_and_ancestors(TopAbs_VERTEX, TopAbs_FACE, vertex)

    def number_of_faces_from_vertex(self, vertex):
        return self._number_shapes_ancestors(TopAbs_VERTEX, TopAbs_FACE, vertex)

    def vertices_from_face(self, face):
        return self._loop_topo(TopAbs_VERTEX, face)

    def number_of_vertices_from_face(self, face):
        cnt = 0
        for i in self._loop_topo(TopAbs_VERTEX, face):
            cnt += 1
        return cnt

    # ======================================================================
    # FACE <-> SOLID
    # ======================================================================
    def solids_from_face(self, face):
        return self._map_shapes_and_ancestors(TopAbs_FACE, TopAbs_SOLID, face)

    def number_of_solids_from_face(self, face):
        return self._number_shapes_ancestors(TopAbs_FACE, TopAbs_SOLID, face)

    def faces_from_solids(self, solid):
        return self._loop_topo(TopAbs_FACE, solid)

    def number_of_faces_from_solids(self, solid):
        cnt = 0
        for i in self._loop_topo(TopAbs_FACE, solid):
            cnt += 1
        return cnt


def dumpTopology(shape, level=0):
    """
     Print the details of an object from the top down
    """
    brt = BRep_Tool()
    s = shape.ShapeType()
    if s == TopAbs_VERTEX:
        pnt = brt.Pnt(topods_Vertex(shape))
        print(".." * level  + "<Vertex %i: %s %s %s>" % (hash(shape), pnt.X(), pnt.Y(), pnt.Z()))
    else:
        print(".." * level, end="")
        print(shapeTypeString(shape))
    it = TopoDS_Iterator(shape)
    while it.More():
        shp = it.Value()
        it.Next()
        dumpTopology(shp, level + 1)


def shapeTypeString(shape):
    st = shape.ShapeType()
    s = "?"
    if st == TopAbs_VERTEX:
        s = "Vertex"
    if st == TopAbs_SOLID:
        s = "Solid"
    if st == TopAbs_EDGE:
        s = "Edge"
    if st == TopAbs_FACE:
        s = "Face"
    if st == TopAbs_SHELL:
        s = "Shell"
    if st == TopAbs_WIRE:
        s = "Wire"
    if st == TopAbs_COMPOUND:
        s = "Compound."
    if st == TopAbs_COMPSOLID:
        s = "Compsolid."
    return "%s: %i" % (s, hash(shape))


def get_test_box_shape():
    return BRepPrimAPI_MakeBox(10, 20, 30).Shape()


def get_test_sphere_shape():
    return BRepPrimAPI_MakeSphere(10.).Shape()

## Tests
topo = Topo(get_test_box_shape())
assert topo


def test_loop_faces():
    i = 0
    for face in topo.faces():
        i += 1
        assert(isinstance(face, TopoDS_Face))
    assert(i == 6)


def test_loop_edges():
    i = 0
    for face in topo.edges():
        i += 1
        assert(isinstance(face, TopoDS_Edge))
    assert(i == 12)


def number_of_topological_entities():
    assert(topo.number_of_faces() == 6)
    assert(topo.number_of_edges() == 12)
    assert(topo.number_of_vertices() == 8)
    assert(topo.number_of_wires() == 6)
    assert(topo.number_of_solids() == 1)
    assert(topo.number_of_shells() == 1)
    assert(topo.number_of_compounds() == 0)
    assert(topo.number_of_comp_solids() == 0)


def test_nested_iteration():
    '''check nested looping'''
    for f in topo.faces():
        for e in topo.edges():
            assert isinstance(f, TopoDS_Face)
            assert isinstance(e, TopoDS_Edge)


def test_kept_reference():
    '''did we keep a reference after looping several time through a list
    of topological entities?'''
    _tmp = []
    _faces = [i for i in topo.faces()]
    for f in _faces:
        _tmp.append(0 == f.IsNull())
    for f in _faces:
        _tmp.append(0 == f.IsNull())
    assert(all(_tmp))


def test_edge_face():
    edg = next(topo.edges())
    face = next(topo.faces())
    faces_from_edge = [i for i in topo.faces_from_edge(edg)]
    assert(len(faces_from_edge) == topo.number_of_faces_from_edge(edg))
    edges_from_face = [i for i in topo.edges_from_face(face)]
    assert(len(edges_from_face) == topo.number_of_edges_from_face(face))


def test_edge_wire():
    edg = next(topo.edges())
    wire = next(topo.wires())
    wires_from_edge = [i for i in topo.wires_from_edge(edg)]
    assert(len(wires_from_edge) == topo.number_of_wires_from_edge(edg))
    edges_from_wire = [i for i in topo.edges_from_wire(wire)]
    assert(len(edges_from_wire) == topo.number_of_edges_from_wire(wire))


def test_vertex_edge():
    vert = next(topo.vertices())
    edge = next(topo.edges())
    verts_from_edge = [i for i in topo.vertices_from_edge(edge)]
    assert(len(verts_from_edge) == topo.number_of_vertices_from_edge(edge))
    edges_from_vert = [i for i in topo.edges_from_vertex(vert)]
    assert(len(edges_from_vert) == topo.number_of_edges_from_vertex(vert))


def test_vertex_face():
    vert = next(topo.vertices())
    face = next(topo.faces())
    faces_from_vertex = [i for i in topo.faces_from_vertex(vert)]
    assert(len(faces_from_vertex) == topo.number_of_faces_from_vertex(vert))
    verts_from_face = [i for i in topo.vertices_from_face(face)]
    assert(len(verts_from_face) == topo.number_of_vertices_from_face(face))


def test_face_solid():
    face = next(topo.faces())
    solid = next(topo.solids())
    faces_from_solid = [i for i in topo.faces_from_solids(solid)]
    assert(len(faces_from_solid) == topo.number_of_faces_from_solids(solid))
    solids_from_face = [i for i in topo.solids_from_face(face)]
    assert(len(solids_from_face) == topo.number_of_solids_from_face(face))


def test_wire_face():
    wire = next(topo.wires())
    face = next(topo.faces())
    faces_from_wire = [i for i in topo.faces_from_wire(wire)]
    assert(len(faces_from_wire) == topo.number_of_faces_from_wires(wire))
    wires_from_face = [i for i in topo.wires_from_face(face)]
    assert(len(wires_from_face) == topo.number_of_wires_from_face(face))


def test_edges_out_of_scope():
    # check pointers going out of scope
    face = next(topo.faces())
    _edges = []
    for edg in Topo(face).edges():
        _edges.append(edg)
    for edg in _edges:
        assert not edg.IsNull()


def test_wires_out_of_scope():
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

if __name__ == "__main__":
    test_kept_reference()
    test_wire_face()
    test_face_solid()
    test_vertex_face()
    test_vertex_edge()
    test_edge_wire()
    test_edge_face()
    test_nested_iteration()
    test_loop_edges()
    test_loop_faces()
    test_edges_out_of_scope()
    test_wires_out_of_scope()
