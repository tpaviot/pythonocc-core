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

from typing import Any, Dict, Iterable, Iterator, List, Optional, Tuple

from OCC.Core.BRep import BRep_Tool, BRep_Builder
from OCC.Core.BRepTools import BRepTools_WireExplorer
from OCC.Core.gp import gp_Ax2, gp_Dir, gp_Pnt
from OCC.Core.HLRBRep import HLRBRep_Algo, HLRBRep_HLRToShape
from OCC.Core.HLRAlgo import HLRAlgo_Projector
from OCC.Core.TopAbs import (
    TopAbs_VERTEX,
    TopAbs_EDGE,
    TopAbs_FACE,
    TopAbs_WIRE,
    TopAbs_SHELL,
    TopAbs_SOLID,
    TopAbs_COMPOUND,
    TopAbs_COMPSOLID,
    TopAbs_ShapeEnum,
    TopAbs_Orientation,
)
from OCC.Core.TopExp import TopExp_Explorer, topexp
from OCC.Core.TopTools import (
    TopTools_ListIteratorOfListOfShape,
    TopTools_IndexedDataMapOfShapeListOfShape,
)
from OCC.Core.TopoDS import (
    Wire,
    Vertex,
    Edge,
    Face,
    Shell,
    Solid,
    Compound,
    CompSolid,
    TopoDS_Wire,
    TopoDS_Vertex,
    TopoDS_Edge,
    TopoDS_Face,
    TopoDS_Shell,
    TopoDS_Solid,
    TopoDS_Shape,
    TopoDS_Compound,
    TopoDS_CompSolid,
    TopoDS_Iterator,
)
from OCC.Core.GCPnts import (
    GCPnts_UniformAbscissa,
    GCPnts_QuasiUniformDeflection,
    GCPnts_UniformDeflection,
)
from OCC.Core.BRepAdaptor import BRepAdaptor_Curve

# Available discretization algorithms for edges and wires
DISCRETIZATION_ALGORITHMS = {
    "UniformAbscissa": GCPnts_UniformAbscissa,
    "QuasiUniformDeflection": GCPnts_QuasiUniformDeflection,
    "UniformDeflection": GCPnts_UniformDeflection,
}


def _number_of_topo(iterable: Iterable) -> int:
    """Counts the number of items in an iterable."""
    return sum(1 for _ in iterable)


def ordered_vertices_from_wire(wire: TopoDS_Wire) -> Iterator[TopoDS_Vertex]:
    """
    Get an iterator over the vertices of a wire in connection order.
    :param wire: The wire to explore.
    :return: An iterator of vertices.
    """
    wire_exp = WireExplorer(wire)
    return wire_exp.ordered_vertices()


def ordered_edges_from_wire(wire: TopoDS_Wire) -> Iterator[TopoDS_Edge]:
    """
    Get an iterator over the edges of a wire in connection order.
    :param wire: The wire to explore.
    :return: An iterator of edges.
    """
    wire_exp = WireExplorer(wire)
    return wire_exp.ordered_edges()


class WireExplorer:
    """
    A class to explore a TopoDS_Wire, providing access to its vertices and edges in order.
    """

    def __init__(self, wire: TopoDS_Wire) -> None:
        """
        Initializes the WireExplorer.
        :param wire: The wire to explore.
        """
        if not isinstance(wire, TopoDS_Wire):
            raise AssertionError("not a TopoDS_Wire")
        self.wire = wire
        self.wire_explorer = BRepTools_WireExplorer(self.wire)
        self.done = False

    def _reinitialize(self) -> None:
        """Re-initializes the underlying BRepTools_WireExplorer."""
        self.wire_explorer = BRepTools_WireExplorer(self.wire)
        self.done = False

    def _loop_topo(self, edges: Optional[bool] = True) -> Iterator[Any]:
        """
        Internal loop to traverse the wire's topology.
        :param edges: If True, iterates over edges, otherwise iterates over vertices.
        :return: An iterator of edges or vertices.
        """
        if self.done:
            self._reinitialize()
        topology_type = Edge if edges else Vertex
        seq = []

        while self.wire_explorer.More():
            # loop edges
            if edges:
                current_item = self.wire_explorer.Current()
            # loop vertices
            else:
                current_item = self.wire_explorer.CurrentVertex()
            seq.append(topology_type(current_item))
            self.wire_explorer.Next()

        self.done = True
        return iter(seq)

    def ordered_edges(self) -> Iterator[TopoDS_Edge]:
        """
        Returns an iterator over the edges of the wire in connection order.
        """
        return self._loop_topo(edges=True)

    def ordered_vertices(self) -> Iterator[TopoDS_Vertex]:
        """
        Returns an iterator over the vertices of the wire in connection order.
        """
        return self._loop_topo(edges=False)


class TopologyExplorer:
    """
    A class to explore the topology of a TopoDS_Shape.
    This class allows for traversing the topological hierarchy of a shape,
    providing methods to access sub-shapes like faces, edges, and vertices.
    It can also be used to find relationships between different topological entities,
    for example, finding all faces connected to a specific edge.
    """

    def __init__(
        self, my_shape: TopoDS_Shape, ignore_orientation: Optional[bool] = True
    ) -> None:
        """
        Initializes the TopologyExplorer.
        :param my_shape: The shape which topology will be traversed.
        :param ignore_orientation: If True, filters out topological entities
            that have the same geometry but different orientations. For example,
            a cube has 12 unique geometric edges, but 24 edges when considering
            orientation. Setting this to True will return 12 edges.
            Defaults to True.
        """
        self.my_shape = my_shape
        self.ignore_orientation = ignore_orientation

        # the topology_factory dicts maps topology types and functions that can
        # create this topology
        self.topology_factory = {
            TopAbs_VERTEX: Vertex,
            TopAbs_EDGE: Edge,
            TopAbs_FACE: Face,
            TopAbs_WIRE: Wire,
            TopAbs_SHELL: Shell,
            TopAbs_SOLID: Solid,
            TopAbs_COMPOUND: Compound,
            TopAbs_COMPSOLID: CompSolid,
        }

    def _loop_topo(
        self,
        topology_type: TopAbs_ShapeEnum,
        topological_entity=None,
        topology_type_to_avoid=None,
    ) -> Iterator[Any]:
        """
        Generic method to iterate over sub-shapes of a given type.
        :param topology_type: The type of sub-shapes to iterate over (e.g., TopAbs_FACE).
        :param topological_entity: The shape to explore. If None, explores the shape
            provided in the constructor. Defaults to None.
        :param topology_type_to_avoid: A type of sub-shape to avoid during traversal.
            Defaults to None.
        :return: An iterator of the found sub-shapes.
        """
        topo_types = {
            TopAbs_VERTEX: TopoDS_Vertex,
            TopAbs_EDGE: TopoDS_Edge,
            TopAbs_FACE: TopoDS_Face,
            TopAbs_WIRE: TopoDS_Wire,
            TopAbs_SHELL: TopoDS_Shell,
            TopAbs_SOLID: TopoDS_Solid,
            TopAbs_COMPOUND: TopoDS_Compound,
            TopAbs_COMPSOLID: TopoDS_CompSolid,
        }
        topology_explorer = TopExp_Explorer()
        if topology_type not in topo_types:
            raise AssertionError(f"{topology_type} not one of {topo_types.keys()}")
        # use self.my_shape if nothing is specified
        if topological_entity is None and topology_type_to_avoid is None:
            topology_explorer.Init(self.my_shape, topology_type)
        elif topological_entity is None:
            topology_explorer.Init(self.my_shape, topology_type, topology_type_to_avoid)
        elif topology_type_to_avoid is None:
            topology_explorer.Init(topological_entity, topology_type)
        elif topology_type_to_avoid:
            topology_explorer.Init(
                topological_entity, topology_type, topology_type_to_avoid
            )
        seq = []
        while topology_explorer.More():
            current_item = topology_explorer.Current()
            topo_to_add = self.topology_factory[topology_type](current_item)
            seq.append(topo_to_add)
            topology_explorer.Next()

        if self.ignore_orientation:
            # filter out those entities that share the same TShape
            # but do *not* share the same orientation
            filter_orientation_seq: List = []
            filter_orientation_hash_codes = {}
            for i in seq:
                i_hash_code = hash(i)
                if i_hash_code not in filter_orientation_hash_codes:
                    filter_orientation_seq.append(i)
                    filter_orientation_hash_codes[i_hash_code] = [
                        len(filter_orientation_seq) - 1
                    ]
                else:
                    index_list = filter_orientation_hash_codes[i_hash_code]
                    unique = not any(
                        i.IsSame(filter_orientation_seq[j]) for j in index_list
                    )
                    if unique:
                        filter_orientation_seq.append(i)
                        index_list.append(len(filter_orientation_seq) - 1)
            return iter(filter_orientation_seq)

        return iter(seq)

    def faces(self) -> Iterator[TopoDS_Face]:
        """
        Returns an iterator over all faces in the shape.
        """
        return self._loop_topo(TopAbs_FACE)

    def number_of_faces(self) -> int:
        """Returns the number of faces in the shape."""
        return _number_of_topo(self.faces())

    def vertices(self) -> Iterator[TopoDS_Vertex]:
        """
        Returns an iterator over all vertices in the shape.
        """
        return self._loop_topo(TopAbs_VERTEX)

    def number_of_vertices(self) -> int:
        """Returns the number of vertices in the shape."""
        return _number_of_topo(self.vertices())

    def edges(self) -> Iterator[TopoDS_Edge]:
        """
        Returns an iterator over all edges in the shape.
        """
        return self._loop_topo(TopAbs_EDGE)

    def number_of_edges(self) -> int:
        """Returns the number of edges in the shape."""
        return _number_of_topo(self.edges())

    def wires(self) -> Iterator[TopoDS_Wire]:
        """
        Returns an iterator over all wires in the shape.
        """
        return self._loop_topo(TopAbs_WIRE)

    def number_of_wires(self) -> int:
        """Returns the number of wires in the shape."""
        return _number_of_topo(self.wires())

    def shells(self) -> Iterator[TopoDS_Shell]:
        """
        Returns an iterator over all shells in the shape.
        """
        return self._loop_topo(TopAbs_SHELL, None)

    def number_of_shells(self) -> int:
        """Returns the number of shells in the shape."""
        return _number_of_topo(self.shells())

    def solids(self) -> Iterator[TopoDS_Solid]:
        """
        Returns an iterator over all solids in the shape.
        """
        return self._loop_topo(TopAbs_SOLID, None)

    def number_of_solids(self) -> int:
        """Returns the number of solids in the shape."""
        return _number_of_topo(self.solids())

    def comp_solids(self) -> Iterator[TopoDS_CompSolid]:
        """
        Returns an iterator over all composite solids in the shape.
        """
        return self._loop_topo(TopAbs_COMPSOLID)

    def number_of_comp_solids(self) -> int:
        """Returns the number of composite solids in the shape."""
        return _number_of_topo(self.comp_solids())

    def compounds(self) -> Iterator[TopoDS_Compound]:
        """
        Returns an iterator over all compounds in the shape.
        """
        return self._loop_topo(TopAbs_COMPOUND)

    def number_of_compounds(self) -> int:
        """Returns the number of compounds in the shape."""
        return _number_of_topo(self.compounds())

    def number_of_ordered_vertices_from_wire(self, wire: TopoDS_Wire) -> int:
        """
        Returns the number of vertices in a wire, in connection order.
        :param wire: The wire to query.
        :return: The number of ordered vertices.
        """
        return _number_of_topo(ordered_vertices_from_wire(wire))

    def number_of_ordered_edges_from_wire(self, wire: TopoDS_Wire) -> int:
        """
        Returns the number of edges in a wire, in connection order.
        :param wire: The wire to query.
        :return: The number of ordered edges.
        """
        return _number_of_topo(ordered_edges_from_wire(wire))

    def _map_shapes_and_ancestors(
        self, topology_type_1, topology_type_2, topological_entity
    ):
        """
        Maps shapes to their ancestors of a different type.
        For example, can be used to find all faces (ancestors, type 2) that an edge (shape, type 1) belongs to.
        :param topology_type_1: The TopAbs_ShapeEnum of the entity.
        :param topology_type_2: The TopAbs_ShapeEnum of the ancestors to find.
        :param topological_entity: The topological entity itself.
        :return: An iterator of the ancestor shapes.
        """
        topo_set = set()
        topo_set_hash_codes = {}
        _map = TopTools_IndexedDataMapOfShapeListOfShape()
        topexp.MapShapesAndAncestors(
            self.my_shape, topology_type_1, topology_type_2, _map
        )
        results = _map.FindFromKey(topological_entity)
        if results.Size() == 0:
            yield None

        topology_iterator = TopTools_ListIteratorOfListOfShape(results)
        while topology_iterator.More():
            topo_entity = self.topology_factory[topology_type_2](
                topology_iterator.Value()
            )
            topo_entity_hash_code = hash(topo_entity)
            # return the entity if not in set
            # to assure we're not returning entities several times
            if topo_entity not in topo_set:
                if self.ignore_orientation:
                    if topo_entity_hash_code not in topo_set_hash_codes:
                        topo_set_hash_codes[topo_entity_hash_code] = [topo_entity]
                        yield topo_entity
                    else:
                        unique = not any(
                            i.IsSame(topo_entity)
                            for i in topo_set_hash_codes[topo_entity_hash_code]
                        )
                        if unique:
                            topo_set_hash_codes[topo_entity_hash_code].append(
                                topo_entity
                            )
                            yield topo_entity
                else:
                    yield topo_entity

            topo_set.add(topo_entity)
            topology_iterator.Next()

    def get_topology_summary(self) -> Dict[str, int]:
        """
        Returns a dictionary with a summary of the number of topological elements in the shape.
        """
        return {
            "number_of_vertices": self.number_of_vertices(),
            "number_of_edges": self.number_of_edges(),
            "number_of_wires": self.number_of_wires(),
            "number_of_faces": self.number_of_faces(),
            "number_of_shells": self.number_of_shells(),
            "number_of_solids": self.number_of_solids(),
            "number_of_compounds": self.number_of_compounds(),
            "number_of_comp_solids": self.number_of_comp_solids(),
        }

    def _number_shapes_ancestors(
        self, topology_type_1, topology_type_2, topological_entity
    ):
        """
        Returns the number of ancestors of a given type for a topological entity.
        For example, to find out how many faces an edge belongs to:
        _number_shapes_ancestors(TopAbs_EDGE, TopAbs_FACE, edge)
        :param topology_type_1: The TopAbs_ShapeEnum of the entity.
        :param topology_type_2: The TopAbs_ShapeEnum of the ancestors to count.
        :param topological_entity: The topological entity itself.
        :return: The number of ancestor shapes.
        """
        topo_set = set()
        _map = TopTools_IndexedDataMapOfShapeListOfShape()
        topexp.MapShapesAndAncestors(
            self.my_shape, topology_type_1, topology_type_2, _map
        )
        results = _map.FindFromKey(topological_entity)
        if results.Size() == 0:
            return None
        topology_iterator = TopTools_ListIteratorOfListOfShape(results)
        while topology_iterator.More():
            topo_set.add(topology_iterator.Value())
            topology_iterator.Next()
        return len(topo_set)

    # ======================================================================
    # EDGE <-> FACE
    # ======================================================================
    def faces_from_edge(self, edge: TopoDS_Edge) -> Iterator[TopoDS_Face]:
        """
        Get the faces connected to an edge.
        :param edge: The edge to query.
        :return: An iterator of faces connected to the edge.
        """
        return self._map_shapes_and_ancestors(TopAbs_EDGE, TopAbs_FACE, edge)

    def number_of_faces_from_edge(self, edge: TopoDS_Edge) -> int:
        """
        Get the number of faces connected to an edge.
        :param edge: The edge to query.
        :return: The number of faces connected to the edge.
        """
        return self._number_shapes_ancestors(TopAbs_EDGE, TopAbs_FACE, edge)

    def edges_from_face(self, face: TopoDS_Face) -> Iterator[TopoDS_Edge]:
        """
        Get the edges that make up a face.
        :param face: The face to query.
        :return: An iterator of edges.
        """
        return self._loop_topo(TopAbs_EDGE, face)

    def number_of_edges_from_face(self, face: TopoDS_Face) -> int:
        """
        Get the number of edges that make up a face.
        :param face: The face to query.
        :return: The number of edges.
        """
        return sum(1 for _ in self._loop_topo(TopAbs_EDGE, face))

    # ======================================================================
    # VERTEX <-> EDGE
    # ======================================================================
    def vertices_from_edge(self, edge: TopoDS_Edge) -> Iterator[TopoDS_Vertex]:
        """
        Get the vertices that make up an edge.
        :param edge: The edge to query.
        :return: An iterator of vertices.
        """
        return self._loop_topo(TopAbs_VERTEX, edge)

    def number_of_vertices_from_edge(self, edge: TopoDS_Edge) -> int:
        """
        Get the number of vertices that make up an edge.
        :param edge: The edge to query.
        :return: The number of vertices.
        """
        return sum(1 for _ in self._loop_topo(TopAbs_VERTEX, edge))

    def edges_from_vertex(self, vertex: TopoDS_Vertex) -> Iterator[TopoDS_Edge]:
        """
        Get the edges connected to a vertex.
        :param vertex: The vertex to query.
        :return: An iterator of edges connected to the vertex.
        """
        return self._map_shapes_and_ancestors(TopAbs_VERTEX, TopAbs_EDGE, vertex)

    def number_of_edges_from_vertex(self, vertex: TopoDS_Vertex) -> int:
        """
        Get the number of edges connected to a vertex.
        :param vertex: The vertex to query.
        :return: The number of edges connected to the vertex.
        """
        return self._number_shapes_ancestors(TopAbs_VERTEX, TopAbs_EDGE, vertex)

    # ======================================================================
    # WIRE <-> EDGE
    # ======================================================================
    def edges_from_wire(self, wire: TopoDS_Wire) -> Iterator[TopoDS_Edge]:
        """
        Get the edges that make up a wire.
        :param wire: The wire to query.
        :return: An iterator of edges.
        """
        return self._loop_topo(TopAbs_EDGE, wire)

    def number_of_edges_from_wire(self, wire: TopoDS_Wire) -> int:
        """
        Get the number of edges that make up a wire.
        :param wire: The wire to query.
        :return: The number of edges.
        """
        return sum(1 for _ in self._loop_topo(TopAbs_EDGE, wire))

    def wires_from_edge(self, edg: TopoDS_Edge) -> Iterator[TopoDS_Wire]:
        """
        Get the wires an edge belongs to.
        :param edg: The edge to query.
        :return: An iterator of wires.
        """
        return self._map_shapes_and_ancestors(TopAbs_EDGE, TopAbs_WIRE, edg)

    def wires_from_vertex(self, edg: TopoDS_Vertex) -> Iterator[TopoDS_Wire]:
        """
        Get the wires connected to a vertex.
        :param edg: The vertex to query.
        :return: An iterator of wires.
        """
        return self._map_shapes_and_ancestors(TopAbs_VERTEX, TopAbs_WIRE, edg)

    def number_of_wires_from_edge(self, edg: TopoDS_Edge) -> int:
        """
        Get the number of wires an edge belongs to.
        :param edg: The edge to query.
        :return: The number of wires.
        """
        return self._number_shapes_ancestors(TopAbs_EDGE, TopAbs_WIRE, edg)

    # ======================================================================
    # WIRE <-> FACE
    # ======================================================================
    def wires_from_face(self, face: TopoDS_Face) -> Iterator[TopoDS_Wire]:
        """
        Get the wires that make up a face.
        :param face: The face to query.
        :return: An iterator of wires.
        """
        return self._loop_topo(TopAbs_WIRE, face)

    def number_of_wires_from_face(self, face: TopoDS_Face) -> int:
        """
        Get the number of wires that make up a face.
        :param face: The face to query.
        :return: The number of wires.
        """
        return sum(1 for _ in self._loop_topo(TopAbs_WIRE, face))

    def faces_from_wire(self, wire: TopoDS_Wire) -> Iterator[TopoDS_Face]:
        """
        Get the faces a wire belongs to.
        :param wire: The wire to query.
        :return: An iterator of faces.
        """
        return self._map_shapes_and_ancestors(TopAbs_WIRE, TopAbs_FACE, wire)

    def number_of_faces_from_wires(self, wire: TopoDS_Wire) -> int:
        """
        Get the number of faces a wire belongs to.
        :param wire: The wire to query.
        :return: The number of faces.
        """
        return self._number_shapes_ancestors(TopAbs_WIRE, TopAbs_FACE, wire)

    # ======================================================================
    # VERTEX <-> FACE
    # ======================================================================
    def faces_from_vertex(self, vertex: TopoDS_Vertex) -> Iterator[TopoDS_Face]:
        """
        Get the faces connected to a vertex.
        :param vertex: The vertex to query.
        :return: An iterator of faces.
        """
        return self._map_shapes_and_ancestors(TopAbs_VERTEX, TopAbs_FACE, vertex)

    def number_of_faces_from_vertex(self, vertex: TopoDS_Vertex) -> int:
        """
        Get the number of faces connected to a vertex.
        :param vertex: The vertex to query.
        :return: The number of faces.
        """
        return self._number_shapes_ancestors(TopAbs_VERTEX, TopAbs_FACE, vertex)

    def vertices_from_face(self, face: TopoDS_Face) -> Iterator[TopoDS_Vertex]:
        """
        Get the vertices that make up a face.
        :param face: The face to query.
        :return: An iterator of vertices.
        """
        return self._loop_topo(TopAbs_VERTEX, face)

    def number_of_vertices_from_face(self, face: TopoDS_Face) -> int:
        """
        Get the number of vertices that make up a face.
        :param face: The face to query.
        :return: The number of vertices.
        """
        return sum(1 for _ in self._loop_topo(TopAbs_VERTEX, face))

    # ======================================================================
    # FACE <-> SOLID
    # ======================================================================
    def solids_from_face(self, face: TopoDS_Face) -> Iterator[TopoDS_Solid]:
        """
        Get the solids a face belongs to.
        :param face: The face to query.
        :return: An iterator of solids.
        """
        return self._map_shapes_and_ancestors(TopAbs_FACE, TopAbs_SOLID, face)

    def number_of_solids_from_face(self, face: TopoDS_Face) -> int:
        """
        Get the number of solids a face belongs to.
        :param face: The face to query.
        :return: The number of solids.
        """
        return self._number_shapes_ancestors(TopAbs_FACE, TopAbs_SOLID, face)

    def faces_from_solids(self, solid: TopoDS_Solid) -> Iterator[TopoDS_Face]:
        """
        Get the faces that make up a solid.
        :param solid: The solid to query.
        :return: An iterator of faces.
        """
        return self._loop_topo(TopAbs_FACE, solid)

    def number_of_faces_from_solids(self, solid: TopoDS_Solid) -> int:
        """
        Get the number of faces that make up a solid.
        :param solid: The solid to query.
        :return: The number of faces.
        """
        return sum(1 for _ in self._loop_topo(TopAbs_FACE, solid))

    # ======================================================================
    # FACE <-> SHELL
    # ======================================================================
    def shells_from_face(self, face: TopoDS_Face) -> Iterator[TopoDS_Shell]:
        """
        Get the shells a face belongs to.
        :param face: The face to query.
        :return: An iterator of shells.
        """
        return self._map_shapes_and_ancestors(TopAbs_FACE, TopAbs_SHELL, face)

    def number_of_shells_from_face(self, face: TopoDS_Face) -> int:
        """
        Get the number of shells a face belongs to.
        :param face: The face to query.
        :return: The number of shells.
        """
        return self._number_shapes_ancestors(TopAbs_FACE, TopAbs_SHELL, face)

    def faces_from_shell(self, shell: TopoDS_Shell) -> Iterator[TopoDS_Face]:
        """
        Get the faces that make up a shell.
        :param shell: The shell to query.
        :return: An iterator of faces.
        """
        return self._loop_topo(TopAbs_FACE, shell)

    def number_of_faces_from_shell(self, shell: TopoDS_Shell) -> int:
        """
        Get the number of faces that make up a shell.
        :param shell: The shell to query.
        :return: The number of faces.
        """
        return sum(1 for _ in self._loop_topo(TopAbs_FACE, shell))

    # ======================================================================
    # SHELL <-> SOLID
    # ======================================================================
    def solids_from_shell(self, shell: TopoDS_Shell) -> Iterator[TopoDS_Solid]:
        """
        Get the solids a shell belongs to.
        :param shell: The shell to query.
        :return: An iterator of solids.
        """
        return self._map_shapes_and_ancestors(TopAbs_SHELL, TopAbs_SOLID, shell)

    def number_of_solids_from_shell(self, shell: TopoDS_Shell) -> int:
        """
        Get the number of solids a shell belongs to.
        :param shell: The shell to query.
        :return: The number of solids.
        """
        return self._number_shapes_ancestors(TopAbs_FACE, TopAbs_SOLID, shell)

    def shells_from_solid(self, solid: TopoDS_Solid) -> Iterator[TopoDS_Shell]:
        """
        Get the shells that make up a solid.
        :param solid: The solid to query.
        :return: An iterator of shells.
        """
        return self._loop_topo(TopAbs_SHELL, solid)

    def number_of_shells_from_solid(self, solid: TopoDS_Solid) -> int:
        """
        Get the number of shells that make up a solid.
        :param solid: The solid to query.
        :return: The number of shells.
        """
        return sum(1 for _ in self._loop_topo(TopAbs_SHELL, solid))


def dump_topology_to_string(
    shape: TopoDS_Shape, level: Optional[int] = 0, buffer: Optional[str] = ""
) -> None:
    """
    Prints the topological structure of a shape to the console.
    Recursively iterates through the shape's sub-shapes and prints their type and hash.
    For vertices, it also prints their coordinates.
    :param shape: The shape to dump.
    :param level: The current recursion level, used for indentation.
    :param buffer: A string buffer (not currently used).
    """
    brt = BRep_Tool()
    s = shape.ShapeType()
    if s == TopAbs_VERTEX:
        pnt = brt.Pnt(Vertex(shape))
        print(".." * level + f"<Vertex {hash(shape)}: {pnt.X()} {pnt.Y()} {pnt.Z()}>\n")
    else:
        print(".." * level, end="")
        print(shape)
    it = TopoDS_Iterator(shape)
    while it.More() and level < 5:  # LEVEL MAX
        shp = it.Value()
        it.Next()
        dump_topology_to_string(shp, level + 1, buffer)


#
# Edge and wire discretizers
#


def discretize_wire(
    a_wire: TopoDS_Wire,
    deflection: float = 0.5,
    algorithm: str = "QuasiUniformDeflection",
) -> List[gp_Pnt]:
    """
    Discretizes a wire into a list of points.
    This function takes a TopoDS_Wire and generates a sequence of points
    that approximate the wire's geometry. The precision of the discretization
    is controlled by the `deflection` parameter.
    :param a_wire: The wire to discretize.
    :param deflection: The maximum allowed deviation between the wire and the
        discretized points. A smaller value results in a more accurate
        approximation and more points. Defaults to 0.5.
    :param algorithm: The discretization algorithm to use. Can be one of
        "UniformAbscissa", "QuasiUniformDeflection", or "UniformDeflection".
        Defaults to "QuasiUniformDeflection".
    :return: A list of gp_Pnt objects representing the discretized wire.
    """
    if not is_wire(a_wire):
        raise AssertionError(
            "You must provide a TopoDS_Wire to the discretize_wire function."
        )

    if algorithm not in DISCRETIZATION_ALGORITHMS:
        raise AssertionError(
            f"Algorithm must be one of {list(DISCRETIZATION_ALGORITHMS.keys())}"
        )

    wire_explorer = WireExplorer(a_wire)
    wire_pnts = []
    # loop over ordered edges
    for edg in wire_explorer.ordered_edges():
        edg_pnts = discretize_edge(edg, deflection, algorithm)
        wire_pnts.extend(edg_pnts)
    return wire_pnts


def discretize_edge(
    a_edge: TopoDS_Edge,
    deflection: float = 0.2,
    algorithm: str = "QuasiUniformDeflection",
) -> List[Tuple[float, float, float]]:
    """
    Discretizes an edge into a list of points.
    This function takes a TopoDS_Edge and generates a sequence of points
    that approximate the edge's geometry. The precision of the discretization
    is controlled by the `deflection` parameter.
    :param a_edge: The edge to discretize.
    :param deflection: The maximum allowed deviation between the edge and the
        discretized points. A smaller value results in a more accurate
        approximation and more points. Defaults to 0.2.
    :param algorithm: The discretization algorithm to use. Can be one of
        "UniformAbscissa", "QuasiUniformDeflection", or "UniformDeflection".
        Defaults to "QuasiUniformDeflection".
    :return: A list of gp_Pnt objects representing the discretized edge.
    """
    if not is_edge(a_edge):
        raise AssertionError(
            "You must provide a TopoDS_Edge to the discretize_edge function."
        )
    if a_edge.IsNull():
        print(
            "Warning : TopoDS_Edge is null. discretize_edge will return an empty list of points."
        )
        return []
    if algorithm not in DISCRETIZATION_ALGORITHMS:
        raise AssertionError(
            f"Algorithm must be one of {list(DISCRETIZATION_ALGORITHMS.keys())}"
        )

    curve_adaptator = BRepAdaptor_Curve(a_edge)
    first = curve_adaptator.FirstParameter()
    last = curve_adaptator.LastParameter()

    discretizer_class = DISCRETIZATION_ALGORITHMS[algorithm]
    discretizer = discretizer_class()
    discretizer.Initialize(curve_adaptator, deflection, first, last)

    if not discretizer.IsDone():
        raise RuntimeError("Discretizer not done.")
    if discretizer.NbPoints() <= 0:
        raise AssertionError("Discretizer nb points not > 0.")

    points = []
    for i in range(1, discretizer.NbPoints() + 1):
        p = curve_adaptator.Value(discretizer.Parameter(i))
        points.append(p.Coord())

    if a_edge.Orientation() == TopAbs_Orientation.TopAbs_REVERSED:
        points.reverse()

    return points


#
# TopoDS_Shape type utils
#
def is_vertex(shape: TopoDS_Shape) -> bool:
    """Checks if a shape is a TopoDS_Vertex."""
    return hasattr(shape, "ShapeType") and shape.ShapeType() == TopAbs_VERTEX


def is_edge(shape: TopoDS_Shape) -> bool:
    """Checks if a shape is a TopoDS_Edge."""
    return hasattr(shape, "ShapeType") and shape.ShapeType() == TopAbs_EDGE


def is_wire(shape: TopoDS_Shape) -> bool:
    """Checks if a shape is a TopoDS_Wire."""
    return hasattr(shape, "ShapeType") and shape.ShapeType() == TopAbs_WIRE


def is_face(shape: TopoDS_Shape) -> bool:
    """Checks if a shape is a TopoDS_Face."""
    if not hasattr(shape, "ShapeType"):
        return False
    return shape.ShapeType() == TopAbs_FACE


def is_shell(shape: TopoDS_Shape) -> bool:
    """Checks if a shape is a TopoDS_Shell."""
    return hasattr(shape, "ShapeType") and shape.ShapeType() == TopAbs_SHELL


def is_solid(shape: TopoDS_Shape) -> bool:
    """Checks if a shape is a TopoDS_Solid."""
    if not hasattr(shape, "ShapeType"):
        return False
    return shape.ShapeType() == TopAbs_SOLID


def is_compound(shape: TopoDS_Shape) -> bool:
    """Checks if a shape is a TopoDS_Compound."""
    return hasattr(shape, "ShapeType") and shape.ShapeType() == TopAbs_COMPOUND


def is_compsolid(shape: TopoDS_Shape) -> bool:
    """Checks if a shape is a TopoDS_CompSolid."""
    return hasattr(shape, "ShapeType") and shape.ShapeType() == TopAbs_COMPSOLID


def get_type_as_string(shape: TopoDS_Shape) -> str:
    """
    Returns the type of a TopoDS_Shape as a string.
    For example, for a TopoDS_Shape of type TopAbs_VERTEX, it returns "Vertex".
    """
    types = {
        TopAbs_VERTEX: "Vertex",
        TopAbs_WIRE: "Wire",
        TopAbs_EDGE: "Edge",
        TopAbs_FACE: "Face",
        TopAbs_SOLID: "Solid",
        TopAbs_COMPOUND: "Compound",
        TopAbs_COMPSOLID: "CompSolid",
    }
    return types.get(shape.ShapeType(), "Unknown")


def get_sorted_hlr_edges(
    shape: TopoDS_Shape,
    position: Optional[gp_Pnt] = None,
    direction: Optional[gp_Dir] = None,
    export_hidden_edges: Optional[bool] = True,
) -> Tuple[List, List]:
    """
    Performs Hidden Line Removal (HLR) on a shape and returns the visible and hidden edges.
    :param shape: The shape to process.
    :param position: The viewpoint position for the HLR algorithm.
        Defaults to the origin (0, 0, 0).
    :param direction: The view direction for the HLR algorithm.
        Defaults to the Z-axis (0, 0, 1).
    :param export_hidden_edges: If True, the hidden edges are also computed and returned.
        Defaults to True.
    :return: A tuple containing two lists: the first list contains the visible edges,
        and the second list contains the hidden edges.
    """
    if position is None:
        position = gp_Pnt()
    if not isinstance(position, gp_Pnt):
        raise TypeError("position must be a gp_Pnt")
    if direction is None:
        direction = gp_Dir()
    if not isinstance(direction, gp_Dir):
        raise TypeError("position must be a gp_Dir")

    hlr = HLRBRep_Algo()
    hlr.Add(shape)

    projector = HLRAlgo_Projector(gp_Ax2(position, direction))

    hlr.Projector(projector)
    hlr.Update()
    hlr.Hide()

    hlr_shapes = HLRBRep_HLRToShape(hlr)

    # visible edges
    visible = []
    if visible_sharp_edges_as_compound := hlr_shapes.VCompound():
        visible += list(TopologyExplorer(visible_sharp_edges_as_compound).edges())
    if visible_smooth_edges_as_compound := hlr_shapes.Rg1LineVCompound():
        visible += list(TopologyExplorer(visible_smooth_edges_as_compound).edges())
    if visible_contour_edges_as_compound := hlr_shapes.OutLineVCompound():
        visible += list(TopologyExplorer(visible_contour_edges_as_compound).edges())
    # hidden edges
    hidden = []
    if export_hidden_edges:
        if hidden_sharp_edges_as_compound := hlr_shapes.HCompound():
            hidden += list(TopologyExplorer(hidden_sharp_edges_as_compound).edges())
        if hidden_contour_edges_as_compound := hlr_shapes.OutLineHCompound():
            hidden += list(TopologyExplorer(hidden_contour_edges_as_compound).edges())

    return visible, hidden


def list_of_shapes_to_compound(
    list_of_shapes: List[TopoDS_Shape],
) -> Tuple[TopoDS_Compound, bool]:
    """
    Takes a list of shapes and gathers them into a single compound shape.
    :param list_of_shapes: A list of TopoDS_Shape objects.
    :return: A tuple containing:
        - The resulting TopoDS_Compound.
        - A boolean that is True if all shapes were successfully added to the compound,
          and False if any of the shapes were null and could not be added.
    """
    all_shapes_converted = True
    the_compound = TopoDS_Compound()
    the_builder = BRep_Builder()
    the_builder.MakeCompound(the_compound)
    for shp in list_of_shapes:
        # first ensure the shape is not Null
        if shp.IsNull():
            all_shapes_converted = False
            continue
        the_builder.Add(the_compound, shp)
    return the_compound, all_shapes_converted
