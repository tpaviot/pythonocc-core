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

from OCC.Core.BRep import BRep_Tool, BRep_Builder
from OCC.Core.BRepTools import BRepTools_WireExplorer
from OCC.Core.gp import gp_Ax2, gp_Dir, gp_Pnt
from OCC.Core.HLRBRep import HLRBRep_Algo, HLRBRep_HLRToShape
from OCC.Core.HLRAlgo import HLRAlgo_Projector
from OCC.Core.TopAbs import (TopAbs_VERTEX, TopAbs_EDGE, TopAbs_FACE, TopAbs_WIRE,
                             TopAbs_SHELL, TopAbs_SOLID, TopAbs_COMPOUND,
                             TopAbs_COMPSOLID)
from OCC.Core.TopExp import TopExp_Explorer, topexp_MapShapesAndAncestors
from OCC.Core.TopTools import (TopTools_ListIteratorOfListOfShape,
                               TopTools_IndexedDataMapOfShapeListOfShape)
from OCC.Core.TopoDS import (topods, TopoDS_Wire, TopoDS_Vertex, TopoDS_Edge,
                             TopoDS_Face, TopoDS_Shell, TopoDS_Solid,
                             TopoDS_Compound, TopoDS_CompSolid, topods_Edge,
                             topods_Vertex, TopoDS_Iterator)
from OCC.Core.GCPnts import (GCPnts_UniformAbscissa,
                             GCPnts_QuasiUniformDeflection,
                             GCPnts_UniformDeflection)
from OCC.Core.BRepAdaptor import BRepAdaptor_Curve


class WireExplorer:
    '''
    Wire traversal
    '''
    def __init__(self, wire):
        if not isinstance(wire, TopoDS_Wire):
            raise AsssertionError('not a TopoDS_Wire')
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
        occ_seq = []
        while self.wire_explorer.More():
            # loop edges
            if edges:
                current_item = self.wire_explorer.Current()
            # loop vertices
            else:
                current_item = self.wire_explorer.CurrentVertex()
            occ_seq.append(current_item)
            self.wire_explorer.Next()

        # Convert occ_seq to python list
        for elem in occ_seq:
            topo_to_add = topologyType(elem)
            seq.append(topo_to_add)
        self.done = True
        return iter(seq)

    def ordered_edges(self):
        return self._loop_topo(edges=True)

    def ordered_vertices(self):
        return self._loop_topo(edges=False)


class TopologyExplorer:
    '''
    Topology traversal
    '''

    def __init__(self, myShape, ignore_orientation=True):
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
        self.topExp = TopExp_Explorer()

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

        if topologyType not in topoTypes.keys():
            raise AssertionError("%s not one of %s" % (topologyType, topoTypes.keys()))
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
        while self.topExp.More():
            current_item = self.topExp.Current()
            topo_to_add = self.topoFactory[topologyType](current_item)
            seq.append(topo_to_add)
            self.topExp.Next()

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
            return iter(filter_orientation_seq)
        else:
            return iter(seq)

    def faces(self):
        '''
        loops over all faces
        '''
        return self._loop_topo(TopAbs_FACE)

    def _number_of_topo(self, iterable):
        n = 0
        for _ in iterable:
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
        if results.Size() == 0:
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
        for _ in self._loop_topo(TopAbs_EDGE, face):
            cnt += 1
        return cnt

    # ======================================================================
    # VERTEX <-> EDGE
    # ======================================================================
    def vertices_from_edge(self, edg):
        return self._loop_topo(TopAbs_VERTEX, edg)

    def number_of_vertices_from_edge(self, edg):
        cnt = 0
        for _ in self._loop_topo(TopAbs_VERTEX, edg):
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
        for _ in self._loop_topo(TopAbs_EDGE, wire):
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
        for _ in self._loop_topo(TopAbs_WIRE, face):
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
        for _ in self._loop_topo(TopAbs_VERTEX, face):
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
        for _ in self._loop_topo(TopAbs_FACE, solid):
            cnt += 1
        return cnt


def dump_topology_to_string(shape, level=0, buffer=""):
    """
    Return the details of an object from the top down
    """
    brt = BRep_Tool()
    s = shape.ShapeType()
    if s == TopAbs_VERTEX:
        pnt = brt.Pnt(topods_Vertex(shape))
        print(".." * level  + "<Vertex %i: %s %s %s>\n" % (hash(shape), pnt.X(), pnt.Y(), pnt.Z()))
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

def discretize_wire(a_topods_wire, deflection=0.5):
    """ Returns a set of points
    """
    if not is_wire(a_topods_wire):
        raise AssertionError("You must provide a TopoDS_Wire to the discretize_wire function.")
    wire_explorer = WireExplorer(a_topods_wire)
    wire_pnts = []
    # loop over ordered edges
    for edg in wire_explorer.ordered_edges():
        edg_pnts = discretize_edge(edg, deflection)
        wire_pnts += edg_pnts
    return wire_pnts


def discretize_edge(a_topods_edge, deflection=0.2, algorithm="QuasiUniformDeflection"):
    """ Take a TopoDS_Edge and returns a list of points
    The more deflection is small, the more the discretization is precise,
    i.e. the more points you get in the returned points
    algorithm: to choose in ["UniformAbscissa", "QuasiUniformDeflection"]
    """
    if not is_edge(a_topods_edge):
        raise AssertionError("You must provide a TopoDS_Edge to the discretize_edge function.")
    if a_topods_edge.IsNull():
        print("Warning : TopoDS_Edge is null. discretize_edge will return an empty list of points.")
        return []
    curve_adaptator = BRepAdaptor_Curve(a_topods_edge)
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
    if not discretizer.NbPoints() > 0:
        raise AssertionError("Discretizer nb points not > 0.")

    points = []
    for i in range(1, discretizer.NbPoints() + 1):
        p = curve_adaptator.Value(discretizer.Parameter(i))
        points.append(p.Coord())
    return points

#
# TopoDS_Shape type utils
#
def is_vertex(topods_shape):
    if not hasattr(topods_shape, "ShapeType"):
        return False
    return topods_shape.ShapeType() == TopAbs_VERTEX


def is_solid(topods_shape):
    if not hasattr(topods_shape, "ShapeType"):
        return False
    return topods_shape.ShapeType() == TopAbs_SOLID


def is_edge(topods_shape):
    if not hasattr(topods_shape, "ShapeType"):
        return False
    return topods_shape.ShapeType() == TopAbs_EDGE


def is_face(topods_shape):
    if not hasattr(topods_shape, "ShapeType"):
        return False
    return topods_shape.ShapeType() == TopAbs_FACE


def is_shell(topods_shape):
    if not hasattr(topods_shape, "ShapeType"):
        return False
    return topods_shape.ShapeType() == TopAbs_SHELL


def is_wire(topods_shape):
    if not hasattr(topods_shape, "ShapeType"):
        return False
    return topods_shape.ShapeType() == TopAbs_WIRE


def is_compound(topods_shape):
    if not hasattr(topods_shape, "ShapeType"):
        return False
    return topods_shape.ShapeType() == TopAbs_COMPOUND


def is_compsolid(topods_shape):
    if not hasattr(topods_shape, "ShapeType"):
        return False
    return topods_shape.ShapeType() == TopAbs_COMPSOLID


def get_type_as_string(topods_shape):
    """ just get the type string, remove TopAbs_ and lowercas all ending letters
    """
    types = {TopAbs_VERTEX: "Vertex", TopAbs_COMPSOLID: "CompSolid", TopAbs_FACE: "Face",
             TopAbs_WIRE: "Wire", TopAbs_EDGE: "Edge", TopAbs_COMPOUND: "Compound",
             TopAbs_COMPSOLID: "CompSolid", TopAbs_SOLID: "Solid"}
    return types[topods_shape.ShapeType()]


def get_sorted_hlr_edges(topods_shape, position=gp_Pnt(), direction=gp_Dir(), export_hidden_edges=True):
    """ Return hidden and visible edges as two lists of edges
    """
    hlr = HLRBRep_Algo()
    hlr.Add(topods_shape)

    projector = HLRAlgo_Projector(gp_Ax2(position, direction))

    hlr.Projector(projector)
    hlr.Update()
    hlr.Hide()

    hlr_shapes = HLRBRep_HLRToShape(hlr)

    # visible edges
    visible = []
    visible_sharp_edges_as_compound = hlr_shapes.VCompound()
    if visible_sharp_edges_as_compound:
        visible += list(TopologyExplorer(visible_sharp_edges_as_compound).edges())
    visible_smooth_edges_as_compound = hlr_shapes.Rg1LineVCompound()
    if visible_smooth_edges_as_compound:
        visible += list(TopologyExplorer(visible_sharp_edges_as_compound).edges())
    #visible_sewn_edges_as_compound = hlr_shapes.RgNLineVCompound()
    #if visible_sewn_edges_as_compound:
    #    visible += list(TopologyExplorer(visible_sewn_edges_as_compound).edges())
    visible_contour_edges_as_compound = hlr_shapes.OutLineVCompound()
    if visible_contour_edges_as_compound:
        visible += list(TopologyExplorer(visible_contour_edges_as_compound).edges())
    #visible_isoparameter_edges_as_compound = hlr_shapes.IsoLineVCompound()
    #if visible_isoparameter_edges_as_compound:
    #    visible += list(TopologyExplorer(visible_isoparameter_edges_as_compound).edges())
    # hidden edges
    hidden = []
    if export_hidden_edges:
        hidden_sharp_edges_as_compound = hlr_shapes.HCompound()
        if hidden_sharp_edges_as_compound:
            hidden += list(TopologyExplorer(hidden_sharp_edges_as_compound).edges())
        hidden_contour_edges_as_compound = hlr_shapes.OutLineHCompound()
        if hidden_contour_edges_as_compound:
            hidden += list(TopologyExplorer(hidden_contour_edges_as_compound).edges())

    return visible, hidden


def list_of_shapes_to_compound(list_of_shapes):
    """ takes a list of shape in input, gather all shapes into one compound
    returns the compund and a boolean, True if all shapes were added to the compund,
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
        else:
            the_builder.Add(the_compound, shp)
    return the_compound, all_shapes_converted
