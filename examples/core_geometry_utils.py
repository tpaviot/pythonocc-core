##Copyright 2009-2014 Jelle Ferina (jelleferinga@gmail.com)
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
from OCC.BRepBndLib import brepbndlib_Add

from OCC.BRepBuilderAPI import (BRepBuilderAPI_MakeEdge,
                                BRepBuilderAPI_MakeVertex,
                                BRepBuilderAPI_MakeWire,
                                BRepBuilderAPI_MakeFace)
from OCC.BRepFill import BRepFill_Filling
from OCC.Bnd import Bnd_Box
from OCC.GeomAbs import GeomAbs_C0
from OCC.GeomAPI import GeomAPI_PointsToBSpline
from OCC.TColgp import TColgp_Array1OfPnt
from OCC.gp import gp_Vec, gp_Pnt


def make_edge(*args):
    edge = BRepBuilderAPI_MakeEdge(*args)
    result = edge.Edge()
    return result


def make_vertex(*args):
    vert = BRepBuilderAPI_MakeVertex(*args)
    result = vert.Vertex()
    return result


def make_n_sided(edges, continuity=GeomAbs_C0):
    n_sided = BRepFill_Filling()  # TODO Checck optional NbIter=6)
    for edg in edges:
        n_sided.Add(edg, continuity)
    n_sided.Build()
    face = n_sided.Face()
    return face


def make_wire(*args):
    # if we get an iterable, than add all edges to wire builder
    if isinstance(args[0], list) or isinstance(args[0], tuple):
        wire = BRepBuilderAPI_MakeWire()
        for i in args[0]:
            wire.Add(i)
        wire.Build()
        return wire.Wire()
    wire = BRepBuilderAPI_MakeWire(*args)
    return wire.Wire()


def make_face(*args):
    face = BRepBuilderAPI_MakeFace(*args)
    assert (face.IsDone())
    result = face.Face()
    return result


def points_to_bspline(pnts):
    pts = TColgp_Array1OfPnt(0, len(pnts) - 1)
    for n, i in enumerate(pnts):
        pts.SetValue(n, i)
    crv = GeomAPI_PointsToBSpline(pts)
    return crv.Curve()


def point_list_to_TColgp_Array1OfPnt(li):
    pts = TColgp_Array1OfPnt(0, len(li) - 1)
    for n, i in enumerate(li):
        pts.SetValue(n, i)
    return pts


def get_boundingbox(shape, tol=1e-6, as_vec=False):
    """ return the bounding box of the TopoDS_Shape `shape`

    Parameters
    ----------

    shape : TopoDS_Shape or a subclass such as TopoDS_Face
        the shape to compute the bounding box from

    tol: float
        tolerance of the computed boundingbox

    as_vec : bool
        wether to return the lower and upper point of the bounding box as gp_Vec instances

    Returns
    -------
        if `as_vec` is True, return a tuple of gp_Vec instances
         for the lower and another for the upper X,Y,Z values representing the bounding box

        if `as_vec` is False, return a tuple of lower and then upper X,Y,Z values
         representing the bounding box
    """
    bbox = Bnd_Box()
    bbox.SetGap(tol)
    brepbndlib_Add(shape, bbox)
    xmin, ymin, zmin, xmax, ymax, zmax = bbox.Get()
    if as_vec is False:
        return xmin, ymin, zmin, xmax, ymax, zmax
    else:
        return gp_Vec(xmin, ymin, zmin), gp_Vec(xmax, ymax, zmax)


def midpoint(pntA, pntB):
    """ computes the point that lies in the middle between pntA and pntB

    Parameters
    ----------

    pntA, pntB : gp_Pnt

    Returns
    -------

    gp_Pnt

    """
    vec1 = gp_Vec(pntA.XYZ())
    vec2 = gp_Vec(pntB.XYZ())
    veccie = (vec1 + vec2) / 2.
    return gp_Pnt(veccie.XYZ())


def center_boundingbox(shape):
    """ compute the center point of a TopoDS_Shape, based on its bounding box

    Parameters
    ----------

    shape : TopoDS_Shape instance or a subclass like TopoDS_Face

    Returns
    -------

    gp_Pnt

    """
    xmin, ymin, zmin, xmax, ymax, zmax = get_boundingbox(shape, 1e-6)
    return midpoint(gp_Pnt(xmin, ymin, zmin), gp_Pnt(xmax, ymax, zmax))
