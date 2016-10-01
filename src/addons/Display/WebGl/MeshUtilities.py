##Copyright 2011-2016 Thomas Paviot (tpaviot@gmail.com)
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

from OCC.BRep import BRep_Tool_Curve
from OCC.TopoDS import topods_Edge
from OCC.TopAbs import TopAbs_FACE, TopAbs_EDGE
from OCC.TopExp import TopExp_Explorer

def get_faces_from_shape(a_topods_shape):
    """ Returns a list of faces from a TopoDS_Shape
    """
    faces = []
    # get faces
    face_explorer = TopExp_Explorer()
    face_explorer.Init(a_topods_shape, TopAbs_FACE)
    faces = []
    hashes = []
    while face_explorer.More():
        current_face = face_explorer.Current()
        current_item_hash = current_face.__hash__()
        if not current_item_hash in hashes:
            hashes.append(current_item_hash)
            faces.append(current_face)
        face_explorer.Next()
    return faces

def get_edges_from_shape(a_topods_shape):
    """ Returns a list of edges from a topods_shape
    """
    edge_explorer = TopExp_Explorer()
    edge_explorer.Init(a_topods_shape, TopAbs_EDGE)
    edges = []
    hashes = []
    while edge_explorer.More():
        current_edge = edge_explorer.Current()
        current_item_hash = current_edge.__hash__()
        if not current_item_hash in hashes:
            hashes.append(current_item_hash)
            edges.append(current_edge)
        edge_explorer.Next()
    return edges

def mesh_edge(a_topods_edge):
    """ Take a TopoDS_Edge and returns a list of points
    """
    edg = topods_Edge(a_topods_edge)
    assert not edg.IsNull()  # This might be to remove
    # build a curve from the edge
    curve_handle, U1, U2 = BRep_Tool_Curve(edg)
    curve = curve_handle.GetObject()
    if curve is None:
        return False
    IS_LINE = curve.IsInstance('Geom_Line')
    points = []
    if IS_LINE:
        p1 = curve.Value(U1)
        p2 = curve.Value(U2)
        points.append(p1.Coord())
        points.append(p2.Coord())
    else:
        U = U1
        nbp = 10  # this is related to edge quality. TODO: compute the best quality
        dU = (U2 - U1)/nbp
        while U <= U2:
            p = curve.Value(U)
            points.append(p.Coord())
            U += dU
    return points
