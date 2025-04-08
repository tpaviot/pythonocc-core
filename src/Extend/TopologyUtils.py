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

from typing import Any, Iterable, Iterator, List, Optional, Tuple

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


def _number_of_topo(iterable: Iterable) -> int:
    return sum(1 for _ in iterable)


def ordered_vertices_from_wire(wire: TopoDS_Wire) -> Iterator[TopoDS_Vertex]:
    wire_exp = WireExplorer(wire)
    return wire_exp.ordered_vertices()


def ordered_edges_from_wire(wire: TopoDS_Wire) -> Iterator[TopoDS_Edge]:
    wire_exp = WireExplorer(wire)
    return wire_exp.ordered_edges()


class WireExplorer:
    """
    Wire traversal
    """

    def __init__(self, wire: TopoDS_Wire) -> None:
        if not isinstance(wire, TopoDS_Wire):
            raise AssertionError("not a TopoDS_Wire")
        self.wire = wire
        self.wire_explorer = BRepTools_WireExplorer(self.wire)
        self.done = False

    def _reinitialize(self) -> None:
        self.wire_explorer = BRepTools_WireExplorer(self.wire)
        self.done = False

    def _loop_topo(self, edges: Optional[bool] = True) -> Iterator[Any]:
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
        return self._loop_topo(edges=True)

    def ordered_vertices(self) -> Iterator[TopoDS_Vertex]:
        return self._loop_topo(edges=False)


class TopologyExplorer:
    """
    Topology traversal
    """

    def __init__(
        self, my_shape: TopoDS_Shape, ignore_orientation: Optional[bool] = True
    ) -> None:
        """
        implements topology traversal from any TopoDS_Shape
        this class lets you find how various topological entities are connected from one to another
        find the faces connected to an edge, find the vertices this edge is made from, get all faces connected to
        a vertex, and find out how many topological elements are connected from a source

        *note* when traversing TopoDS_Wire entities, its advised to use the specialized
        ``WireExplorer`` class, which will return the vertices / edges in the expected order

        :param my_shape: the shape which topology will be traversed

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
        this could be a faces generator for a python TopoShape class
        that way you can just do:
        for face in srf.faces:
            processFace(face)
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
        loops over all faces
        """
        return self._loop_topo(TopAbs_FACE)

    def number_of_faces(self) -> int:
        return _number_of_topo(self.faces())

    def vertices(self) -> Iterator[TopoDS_Vertex]:
        """
        loops over all vertices
        """
        return self._loop_topo(TopAbs_VERTEX)

    def number_of_vertices(self) -> int:
        return _number_of_topo(self.vertices())

    def edges(self) -> Iterator[TopoDS_Edge]:
        """
        loops over all edges
        """
        return self._loop_topo(TopAbs_EDGE)

    def number_of_edges(self) -> int:
        return _number_of_topo(self.edges())

    def wires(self) -> Iterator[TopoDS_Wire]:
        """
        loops over all wires
        """
        return self._loop_topo(TopAbs_WIRE)

    def number_of_wires(self) -> int:
        return _number_of_topo(self.wires())

    def shells(self) -> Iterator[TopoDS_Shell]:
        """
        loops over all shells
        """
        return self._loop_topo(TopAbs_SHELL, None)

    def number_of_shells(self) -> int:
        return _number_of_topo(self.shells())

    def solids(self) -> Iterator[TopoDS_Solid]:
        """
        loops over all solids
        """
        return self._loop_topo(TopAbs_SOLID, None)

    def number_of_solids(self) -> int:
        return _number_of_topo(self.solids())

    def comp_solids(self) -> Iterator[TopoDS_CompSolid]:
        """
        loops over all compound solids
        """
        return self._loop_topo(TopAbs_COMPSOLID)

    def number_of_comp_solids(self) -> int:
        return _number_of_topo(self.comp_solids())

    def compounds(self) -> Iterator[TopoDS_Compound]:
        """
        loops over all compounds
        """
        return self._loop_topo(TopAbs_COMPOUND)

    def number_of_compounds(self) -> int:
        return _number_of_topo(self.compounds())

    def number_of_ordered_vertices_from_wire(self, wire: TopoDS_Wire) -> int:
        return _number_of_topo(ordered_vertices_from_wire(wire))

    def number_of_ordered_edges_from_wire(self, wire: TopoDS_Wire) -> int:
        return _number_of_topo(ordered_edges_from_wire(wire))

    def _map_shapes_and_ancestors(
        self, topology_type_1, topology_type_2, topological_entity
    ):
        """
        using the same method
        @param topoTypeA:
        @param topoTypeB:
        @param topological_entity:
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

    def _number_shapes_ancestors(
        self, topology_type_1, topology_type_2, topological_entity
    ):
        """returns the number of shape ancestors
        If you want to know how many edges a faces has:
        _number_shapes_ancestors(self, TopAbs_EDGE, TopAbs_FACE, edg)
        will return the number of edges a faces has
        @param topoTypeA:
        @param topoTypeB:
        @param topological_entity:
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
    def faces_from_edge(self, edge: TopoDS_Edge):
        """

        :param edge:
        :return:
        """
        return self._map_shapes_and_ancestors(TopAbs_EDGE, TopAbs_FACE, edge)

    def number_of_faces_from_edge(self, edge: TopoDS_Edge) -> int:
        """

        :param edge:
        :return:
        """
        return self._number_shapes_ancestors(TopAbs_EDGE, TopAbs_FACE, edge)

    def edges_from_face(self, face: TopoDS_Face) -> Iterator[TopoDS_Edge]:
        """

        :param face:
        :return:
        """
        return self._loop_topo(TopAbs_EDGE, face)

    def number_of_edges_from_face(self, face: TopoDS_Face) -> int:
        return sum(1 for _ in self._loop_topo(TopAbs_EDGE, face))

    # ======================================================================
    # VERTEX <-> EDGE
    # ======================================================================
    def vertices_from_edge(self, edge: TopoDS_Edge) -> Iterator[TopoDS_Vertex]:
        return self._loop_topo(TopAbs_VERTEX, edge)

    def number_of_vertices_from_edge(self, edge: TopoDS_Edge) -> int:
        return sum(1 for _ in self._loop_topo(TopAbs_VERTEX, edge))

    def edges_from_vertex(self, vertex):
        return self._map_shapes_and_ancestors(TopAbs_VERTEX, TopAbs_EDGE, vertex)

    def number_of_edges_from_vertex(self, vertex: TopoDS_Vertex) -> int:
        return self._number_shapes_ancestors(TopAbs_VERTEX, TopAbs_EDGE, vertex)

    # ======================================================================
    # WIRE <-> EDGE
    # ======================================================================
    def edges_from_wire(self, wire: TopoDS_Wire) -> Iterator[TopoDS_Edge]:
        return self._loop_topo(TopAbs_EDGE, wire)

    def number_of_edges_from_wire(self, wire: TopoDS_Wire) -> int:
        return sum(1 for _ in self._loop_topo(TopAbs_EDGE, wire))

    def wires_from_edge(self, edg):
        return self._map_shapes_and_ancestors(TopAbs_EDGE, TopAbs_WIRE, edg)

    def wires_from_vertex(self, edg):
        return self._map_shapes_and_ancestors(TopAbs_VERTEX, TopAbs_WIRE, edg)

    def number_of_wires_from_edge(self, edg):
        return self._number_shapes_ancestors(TopAbs_EDGE, TopAbs_WIRE, edg)

    # ======================================================================
    # WIRE <-> FACE
    # ======================================================================
    def wires_from_face(self, face: TopoDS_Face) -> Iterator[TopoDS_Wire]:
        return self._loop_topo(TopAbs_WIRE, face)

    def number_of_wires_from_face(self, face: TopoDS_Face) -> int:
        return sum(1 for _ in self._loop_topo(TopAbs_WIRE, face))

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

    def vertices_from_face(self, face: TopoDS_Face) -> Iterator[TopoDS_Vertex]:
        return self._loop_topo(TopAbs_VERTEX, face)

    def number_of_vertices_from_face(self, face: TopoDS_Face) -> int:
        return sum(1 for _ in self._loop_topo(TopAbs_VERTEX, face))

    # ======================================================================
    # FACE <-> SOLID
    # ======================================================================
    def solids_from_face(self, face):
        return self._map_shapes_and_ancestors(TopAbs_FACE, TopAbs_SOLID, face)

    def number_of_solids_from_face(self, face):
        return self._number_shapes_ancestors(TopAbs_FACE, TopAbs_SOLID, face)

    def faces_from_solids(self, solid: TopoDS_Solid) -> Iterator[TopoDS_Face]:
        return self._loop_topo(TopAbs_FACE, solid)

    def number_of_faces_from_solids(self, solid: TopoDS_Solid) -> int:
        return sum(1 for _ in self._loop_topo(TopAbs_FACE, solid))


def dump_topology_to_string(
    shape: TopoDS_Shape, level: Optional[int] = 0, buffer: Optional[str] = ""
) -> None:
    """
    Return the details of an object from the top down
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
    a_wire: TopoDS_Wire, deflection: Optional[int] = 0.5
) -> List[gp_Pnt]:
    """Returns a set of points"""
    if not is_wire(a_wire):
        raise AssertionError(
            "You must provide a TopoDS_Wire to the discretize_wire function."
        )
    wire_explorer = WireExplorer(a_wire)
    wire_pnts = []
    # loop over ordered edges
    for edg in wire_explorer.ordered_edges():
        edg_pnts = discretize_edge(edg, deflection)
        wire_pnts += edg_pnts
    return wire_pnts


def discretize_edge(
    a_edge: TopoDS_Edge, deflection=0.2, algorithm="QuasiUniformDeflection"
):
    """Take a TopoDS_Edge and returns a list of points
    The more deflection is small, the more the discretization is precise,
    i.e. the more points you get in the returned points
    algorithm: to choose in ["UniformAbscissa", "QuasiUniformDeflection"]
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
    curve_adaptator = BRepAdaptor_Curve(a_edge)
    first = curve_adaptator.FirstParameter()
    last = curve_adaptator.LastParameter()

    if algorithm == "QuasiUniformDeflection":
        discretizer = GCPnts_QuasiUniformDeflection()
    elif algorithm == "UniformAbscissa":
        discretizer = GCPnts_UniformAbscissa()
    elif algorithm == "UniformDeflection":
        discretizer = GCPnts_UniformDeflection()
    else:
        raise AssertionError("Unknown algorithm")
    discretizer.Initialize(curve_adaptator, deflection, first, last)

    if not discretizer.IsDone():
        raise AssertionError("Discretizer not done.")
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
    if not hasattr(shape, "ShapeType"):
        return False
    return shape.ShapeType() == TopAbs_VERTEX


def is_solid(shape: TopoDS_Shape) -> bool:
    if not hasattr(shape, "ShapeType"):
        return False
    return shape.ShapeType() == TopAbs_SOLID


def is_edge(shape: TopoDS_Shape) -> bool:
    if not hasattr(shape, "ShapeType"):
        return False
    return shape.ShapeType() == TopAbs_EDGE


def is_face(shape: TopoDS_Shape) -> bool:
    if not hasattr(shape, "ShapeType"):
        return False
    return shape.ShapeType() == TopAbs_FACE


def is_shell(shape: TopoDS_Shape) -> bool:
    if not hasattr(shape, "ShapeType"):
        return False
    return shape.ShapeType() == TopAbs_SHELL


def is_wire(shape: TopoDS_Shape) -> bool:
    if not hasattr(shape, "ShapeType"):
        return False
    return shape.ShapeType() == TopAbs_WIRE


def is_compound(shape: TopoDS_Shape) -> bool:
    if not hasattr(shape, "ShapeType"):
        return False
    return shape.ShapeType() == TopAbs_COMPOUND


def is_compsolid(shape: TopoDS_Shape) -> bool:
    if not hasattr(shape, "ShapeType"):
        return False
    return shape.ShapeType() == TopAbs_COMPSOLID


def get_type_as_string(shape: TopoDS_Shape) -> str:
    """just get the type string, remove TopAbs_ and lowercas all ending letters"""
    types = {
        TopAbs_VERTEX: "Vertex",
        TopAbs_WIRE: "Wire",
        TopAbs_EDGE: "Edge",
        TopAbs_FACE: "Face",
        TopAbs_SOLID: "Solid",
        TopAbs_COMPOUND: "Compound",
        TopAbs_COMPSOLID: "CompSolid",
    }
    return types[shape.ShapeType()]


def get_sorted_hlr_edges(
    shape: TopoDS_Shape,
    position: Optional[gp_Pnt] = None,
    direction: Optional[gp_Dir] = None,
    export_hidden_edges: Optional[bool] = True,
) -> Tuple[List, List]:
    """Return hidden and visible edges as two lists of edges"""
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
    # visible_isoparameter_edges_as_compound = hlr_shapes.IsoLineVCompound()
    # if visible_isoparameter_edges_as_compound:
    #    visible += list(TopologyExplorer(visible_isoparameter_edges_as_compound).edges())
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
    """takes a list of shape in input, gather all shapes into one compound
    returns the compound and a boolean, True if all shapes were added to the compound,
    False otherwise
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
