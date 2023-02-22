#!/usr/bin/env python

##Copyright 2011-2015 Jelle Feringa (jelleferinga@gmail.com)
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

'''
This modules makes the construction of geometry a little easier
'''

from __future__ import with_statement
from functools import wraps
import warnings
import operator
import math

from OCC.Core.BRep import BRep_Tool
from OCC.Core.BRepAdaptor import BRepAdaptor_Curve
from OCC.Core.BRepOffset import BRepOffset_Skin
from OCC.Core.Geom import Geom_TrimmedCurve
from OCC.Core.GeomConvert import GeomConvert_ApproxCurve
from OCC.Core.GeomLProp import GeomLProp_SLProps
from OCC.Core.BRepBuilderAPI import (BRepBuilderAPI_MakeFace,
                                BRepBuilderAPI_Transform,
                                BRepBuilderAPI_Sewing,
                                BRepBuilderAPI_MakePolygon,
                                BRepBuilderAPI_MakeWire,
                                BRepBuilderAPI_MakeSolid,
                                BRepBuilderAPI_MakeShell,
                                BRepBuilderAPI_MakeEdge2d,
                                BRepBuilderAPI_MakeEdge,
                                BRepBuilderAPI_MakeVertex,
                                BRepBuilderAPI_FindPlane)
from OCC.Core.BRepPrimAPI import (BRepPrimAPI_MakeBox, BRepPrimAPI_MakePrism)
from OCC.Core.BRepOffsetAPI import BRepOffsetAPI_MakeEvolved
from OCC.Core.GeomAbs import (GeomAbs_Arc, GeomAbs_C2, GeomAbs_C0, GeomAbs_Tangent,
                         GeomAbs_Intersection, GeomAbs_G1, GeomAbs_G2,
                         GeomAbs_C1)
from OCC.Core.TopAbs import TopAbs_REVERSED
from OCC.Core.TopoDS import (TopoDS_Wire, TopoDS_Solid, TopoDS_Vertex, TopoDS_Shape,
                        TopoDS_Builder, TopoDS_Compound)
from OCC.Core.TColgp import TColgp_SequenceOfVec, TColgp_HArray1OfPnt
from OCC.Core.gp import (gp_Vec, gp_Pnt, gp_Dir, gp_Trsf, gp_Ax1, gp_Quaternion,
                    gp_Circ, gp_Pln)

from OCC.Extend.Common import (TOLERANCE, assert_isdone, to_tcol_, to_adaptor_3d,
                             vertex2pnt, smooth_pnts, points_to_bspline,
                             project_point_on_curve)
from OCC.Extend.types_lut import ShapeToTopology
from OCC.Extend.TopologyUtils import TopologyExplorer


EPSILON = TOLERANCE = 1e-6
ST = ShapeToTopology()


def point_to_vector(self):
    return gp_Vec(self.XYZ())


def vector_to_point(self):
    return gp_Pnt(self.XYZ())


def dir_to_vec(self):
    return gp_Vec(self)


def vec_to_dir(self):
    return gp_Dir(self)


def add_vector_to_point(self, vec):
    return (self.as_vec() + vec).as_pnt()


def gp_Pnt_get_state(self):
    '''pack as a tuple

    used for copying / serializing the instance
    '''
    return self.XYZ().Coord()


def gp_Pnt_set_state(self, state):
    '''unpack tuple and return instance...

    used for copying / serializing the instance
    '''
    self.__init__(*state)


def gp_Pnt_equal(self, other):
    return self.IsEqual(other, TOLERANCE)


def gp_pnt_print(self):
    x = self.X()
    y = self.Y()
    z = self.Z()
    return '< gp_Pnt: {0}, {1}, {2} >'.format(x, y, z)


def gp_vec_print(self):
    x = self.X()
    y = self.Y()
    z = self.Z()
    magn = self.Magnitude()
    return '< gp_Vec: {0}, {1}, {2}, magnitude: {3} >'.format(x, y, z, magn)


def gp_ax1_print(self):
    pX, pY, pZ = self.Location().Coord()
    dX, dY, dZ = self.Direction().Coord()
    return "< gp_Ax1: location: {pX}, {pY}, {pZ}, direction: {dX}, {dY}, {dZ} >".format(**vars())


def gp_trsf_print(self):
    _f = lambda x: [self.Value(x, i) for i in range(1, 5)]
    a, b, c, d = _f(1)
    e, f, g, h = _f(2)
    i, j, k, l = _f(3)
    return "< gp_Trsf:\n {a:.3f}, {b:.3f}, {c:.3f}, {d:.3f}\n {e:.3f}, {f:.3f}, {g:.3f}, {h:.3f}\n {i:.3f}, {j:.3f}, {k:.3f}, {l:.3f} >".format(**vars())


def gp_quat_print(self):
    w, x, y, z = self.W(), self.X(), self.Y(), self.Z()
    vec = gp_Vec()
    angle = math.degrees(self.GetVectorAndAngle(vec))
    return "< gp_Quaternion: w:{w}, x:{x}, y:{y}, z:{z} >\nvector:{vec} angle:{angle}".format(**vars())


def _apply(pnt, other, _operator):
    if isinstance(other, gp_Pnt):
        return gp_Pnt(*map(lambda x: _operator(*x), zip(pnt.Coord(), other.Coord())))
    else:
        return gp_Pnt(*map(lambda x: _operator(x, other), pnt.Coord()))


def gp_pnt_add(self, other):
    return _apply(self, other, operator.add)


def gp_pnt_sub(self, other):
    return _apply(self, other, operator.sub)


def gp_pnt_mul(self, other):
    return _apply(self, other, operator.mul)


def gp_pnt_div(self, other):
    return _apply(self, other, operator.div)


# easier conversion between data types
gp_Vec.as_pnt = vector_to_point
gp_Pnt.as_vec = point_to_vector
gp_Pnt.add_vec = add_vector_to_point
gp_Dir.as_vec = dir_to_vec
gp_Vec.as_dir = vec_to_dir
# for copying / serializing
gp_Pnt.__getstate__ = gp_Pnt_get_state
gp_Pnt.__setstate__ = gp_Pnt_set_state
gp_Vec.__getstate__ = gp_Pnt_get_state
gp_Vec.__setstate__ = gp_Pnt_set_state
# equality, not identity comparison
gp_Pnt.__eq__ = gp_Pnt_equal
# print gp_Pnt() should return something informative...
gp_Vec.__repr__ = gp_vec_print
gp_Vec.__str__ = gp_vec_print
gp_Pnt.__repr__ = gp_pnt_print
gp_Pnt.__str__ = gp_pnt_print
gp_Ax1.__repr__ = gp_ax1_print
gp_Ax1.__str__ = gp_ax1_print
gp_Trsf.__repr__ = gp_trsf_print
gp_Trsf.__str__ = gp_trsf_print
gp_Quaternion.__repr__ = gp_quat_print
gp_Quaternion.__str__ = gp_quat_print
#gp_Pnt.__eq__ = gp_equal
gp_Pnt.__add__ = gp_pnt_add
gp_Pnt.__sub__ = gp_pnt_sub
gp_Pnt.__mul__ = gp_pnt_mul
gp_Pnt.__div__ = gp_pnt_div

#===========================================================================
# ---TOPOLOGY---
#===========================================================================


@wraps(BRepBuilderAPI_MakeSolid)
def make_solid(*args):
    sld = BRepBuilderAPI_MakeSolid(*args)
    with assert_isdone(sld, 'failed to produce solid'):
        result = sld.Solid()
        return result


@wraps(BRepBuilderAPI_MakeShell)
def make_shell(*args):
    shell = BRepBuilderAPI_MakeShell(*args)
    st = ShapeToTopology()
    with assert_isdone(shell, 'failed to produce shell'):
        result = shell.Shell()
        return st(result)


@wraps(BRepBuilderAPI_MakeFace)
def make_face(*args):
    face = BRepBuilderAPI_MakeFace(*args)
    with assert_isdone(face, 'failed to produce face'):
        result = face.Face()
        return result


@wraps(BRepBuilderAPI_MakeEdge2d)
def make_edge2d(*args):
    edge = BRepBuilderAPI_MakeEdge2d(*args)
    with assert_isdone(edge, 'failed to produce edge'):
        result = edge.Edge()
    return result


@wraps(BRepBuilderAPI_MakeEdge)
def make_edge(*args):
    edge = BRepBuilderAPI_MakeEdge(*args)
    with assert_isdone(edge, 'failed to produce edge'):
        result = edge.Edge()
        return result


@wraps(BRepBuilderAPI_MakeVertex)
def make_vertex(*args):
    vert = BRepBuilderAPI_MakeVertex(*args)
    with assert_isdone(vert, 'failed to produce vertex'):
        result = vert.Vertex()
        return result

@wraps(BRepBuilderAPI_MakeWire)
def make_wire(*args):
    # if we get an iterable, than add all edges to wire builder
    if isinstance(args[0], list) or isinstance(args[0], tuple):
        wire = BRepBuilderAPI_MakeWire()
        for i in args[0]:
            wire.Add(i)
        wire.Build()
        return wire.Wire()

    wire = BRepBuilderAPI_MakeWire(*args)
    wire.Build()
    with assert_isdone(wire, 'failed to produce wire'):
        result = wire.Wire()
        return result


@wraps(BRepBuilderAPI_MakePolygon)
def make_polygon(args, closed=False):
    poly = BRepBuilderAPI_MakePolygon()
    for pt in args:
        # support nested lists
        if isinstance(pt, list) or isinstance(pt, tuple):
            for i in pt:
                poly.Add(i)
        else:
            poly.Add(pt)
    if closed:
        poly.Close()
    poly.Build()

    with assert_isdone(poly, 'failed to produce wire'):
        result = poly.Wire()
        return result


@wraps(BRepBuilderAPI_MakePolygon)
def make_closed_polygon(*args):
    poly = BRepBuilderAPI_MakePolygon()
    for pt in args:
        if isinstance(pt, list) or isinstance(pt, tuple):
            for i in pt:
                poly.Add(i)
        else:
            poly.Add(pt)
    poly.Build()
    poly.Close()
    with assert_isdone(poly, 'failed to produce wire'):
        result = poly.Wire()
        return result

#===========================================================================
# PRIMITIVES
#===========================================================================


def make_circle(pnt, radius):
    '''
    returns an edge
    @param pnt:
    @param radius:
    '''
    circ = gp_Circ()
    circ.SetLocation(pnt)
    circ.SetRadius(radius)
    return make_edge(circ)


def make_line(pnt1, pnt2):
    return make_edge(pnt1, pnt2)


def make_evolved(spine, profile):
    evol = BRepOffsetAPI_MakeEvolved(spine, profile)
    with assert_isdone(evol, 'failed buillding evolved'):
        evol.Build()
        return evol.Evolved()


def make_pipe(spine, profile):
    from OCC.Core.BRepOffsetAPI import BRepOffsetAPI_MakePipe
    pipe = BRepOffsetAPI_MakePipe(spine, profile)
    with assert_isdone(pipe, 'failed building pipe'):
        pipe.Build()
        return pipe.Shape()


def make_prism(profile, vec):
    '''
    makes a finite prism
    '''
    pri = BRepPrimAPI_MakePrism(profile, vec, True)
    with assert_isdone(pri, 'failed building prism'):
        pri.Build()
        return pri.Shape()


def make_offset_shape(shapeToOffset, offsetDistance, tolerance=TOLERANCE,
                      offsetMode=BRepOffset_Skin, intersection=False,
                      selfintersection=False, joinType=GeomAbs_Arc):
    '''
    builds an offsetted shell from a shape
    construct an offsetted version of the shape
    '''
    from OCC.Core.BRepOffsetAPI import BRepOffsetAPI_MakeOffsetShape
    try:
        offset = BRepOffsetAPI_MakeOffsetShape(shapeToOffset,
                                               offsetDistance,
                                               tolerance,
                                               offsetMode,
                                               intersection,
                                               selfintersection,
                                               joinType)
        if offset.IsDone():
            return offset.Shape()
        else:
            return None
    except RuntimeError('failed to offset shape'):
        return None


def make_offset(wire_or_face, offsetDistance, altitude=0, joinType=GeomAbs_Arc):
    '''
    builds a offsetted wire or face from a wire or face
    construct an offsetted version of the shape

    @param wire_or_face:        the wire or face to offset
    @param offsetDistance:      the distance to offset
    @param altitude:            move the offsetted shape to altitude
    from the normal of the wire or face
    @param joinType:            the type of offset you want
    can be one of GeomAbs_Arc, GeomAbs_Tangent, GeomAbs_Intersection

    note: a shape that has a negative offsetDistance will return
    a sharp corner
    '''
    from OCC.Core.BRepOffsetAPI import BRepOffsetAPI_MakeOffset
    _joints = [GeomAbs_Arc, GeomAbs_Tangent, GeomAbs_Intersection]
    assert joinType in _joints, '%s is not one of %s' % (joinType, _joints)
    try:
        offset = BRepOffsetAPI_MakeOffset(wire_or_face, joinType)
        offset.Perform(offsetDistance, altitude)
        if offset.IsDone():
            return ST(offset.Shape())
        else:
            return None
    except RuntimeError('failed to offset shape'):
        return None


def make_loft(elements, ruled=False, tolerance=TOLERANCE, continuity=GeomAbs_C2, check_compatibility=True):
    from OCC.Core.BRepOffsetAPI import BRepOffsetAPI_ThruSections
    sections = BRepOffsetAPI_ThruSections(False, ruled, tolerance)
    for i in elements:
        if isinstance(i, TopoDS_Wire):
            sections.AddWire(i)
        elif isinstance(i, TopoDS_Vertex):
            sections.AddVertex(i)
        else:
            raise TypeError('elements is a list of TopoDS_Wire or TopoDS_Vertex, found a %s fool' % i.__class__)

    sections.CheckCompatibility(check_compatibility)
    sections.SetContinuity(continuity)
    sections.Build()
    with assert_isdone(sections, 'failed lofting'):
        te = ShapeToTopology()
        loft = te(sections.Shape())
        return loft


def make_ruled(edgeA, edgeB):
    from OCC.Core.BRepFill import brepfill_Face
    return brepfill_Face(edgeA, edgeB)


def make_plane(center=gp_Pnt(0, 0, 0),
               vec_normal=gp_Vec(0, 0, 1),
               extent_x_min=-100.,
               extent_x_max=100.,
               extent_y_min=-100.,
               extent_y_max=100.,
               depth=0.):
    if depth != 0:
        center = center.add_vec(gp_Vec(0, 0, depth))
    PL = gp_Pln(center, vec_normal.as_dir())
    face = make_face(PL,
                     extent_x_min,
                     extent_x_max,
                     extent_y_min,
                     extent_y_max)
    return face


def make_oriented_box(v_corner, v_x, v_y, v_z):
    """
    produces an oriented box
    oriented meaning here that the x,y,z axis do not have to be
    cartesian aligned

    :param v_corner: the lower corner
    :param v_x: gp_Vec that describes the X-axis
    :param v_y: gp_Vec that describes the Y-axis
    :param v_z: gp_Vec that describes the Z-axis
    :return: TopoDS_Solid
    """
    from OCC.Core.BRepOffsetAPI import BRepOffsetAPI_MakePipe
    verts = map(lambda x: x.as_pnt(), [v_corner, v_corner+v_x, v_corner+v_x+v_y, v_corner+v_y])
    p = make_polygon(verts, closed=True)
    li = make_line(v_corner.as_pnt(), (v_corner+v_z).as_pnt())
    bmp = BRepOffsetAPI_MakePipe(p, li)
    bmp.Build()
    shp = bmp.Shape()

    bottom = make_face(p)
    top = translate_topods_from_vector(bottom, v_z, True)
    oriented_bbox = make_solid(sew_shapes([bottom, shp, top]))
    return oriented_bbox


@wraps(BRepPrimAPI_MakeBox)
def make_box(*args):
    box = BRepPrimAPI_MakeBox(*args)
    box.Build()
    with assert_isdone(box, 'failed to built a cube...'):
        return box.Shape()


def make_n_sided(edges, points, continuity=GeomAbs_C0):
    """
    builds an n-sided patch, respecting the constraints defined by *edges*
    and *points*

    a simplified call to the BRepFill_Filling class
    its simplified in the sense that to all constraining edges and points
    the same level of *continuity* will be applied

    *continuity* represents:

    GeomAbs_C0 : the surface has to pass by 3D representation of the edge
    GeomAbs_G1 : the surface has to pass by 3D representation of the edge
    and to respect tangency with the given face
    GeomAbs_G2 : the surface has to pass by 3D representation of the edge
    and to respect tangency and curvature with the given face.

    NOTE: it is not required to set constraining points.
    just leave the tuple or list empty

    :param edges: the constraining edges
    :param points: the constraining points
    :param continuity: GeomAbs_0, 1, 2
    :return: TopoDS_Face
    """
    from OCC.Core.BRepFill import BRepFill_Filling
    n_sided = BRepFill_Filling()
    for edg in edges:
        n_sided.Add(edg, continuity)
    for pt in points:
        n_sided.Add(pt)
    n_sided.Build()
    face = n_sided.Face()
    return face


def make_n_sections(edges):
    from OCC.Core.TopTools import TopTools_SequenceOfShape
    from OCC.Core.BRepFill import BRepFill_NSections
    seq = TopTools_SequenceOfShape()
    for i in edges:
        seq.Append(i)
    n_sec = BRepFill_NSections(seq)
    return n_sec


def make_coons(edges):
    from OCC.Core.GeomFill import GeomFill_BSplineCurves, GeomFill_StretchStyle
    if len(edges) == 4:
        spl1, spl2, spl3, spl4 = edges
        srf = GeomFill_BSplineCurves(spl1, spl2, spl3, spl4, GeomFill_StretchStyle)
    elif len(edges) == 3:
        spl1, spl2, spl3 = edges
        srf = GeomFill_BSplineCurves(spl1, spl2, spl3, GeomFill_StretchStyle)
    elif len(edges) == 2:
        spl1, spl2 = edges
        srf = GeomFill_BSplineCurves(spl1, spl2, GeomFill_StretchStyle)
    else:
        raise ValueError('give 2,3 or 4 curves')
    return srf.Surface()


def make_constrained_surface_from_edges(edges):
    '''
    DOESNT RESPECT BOUNDARIES
    '''
    from OCC.Core.GeomPlate import GeomPlate_MakeApprox, GeomPlate_BuildPlateSurface
    from OCC.Core.BRepFill import BRepFill_CurveConstraint
    bpSrf = GeomPlate_BuildPlateSurface(3, 15, 2)
    for edg in edges:
        c = BRepAdaptor_Curve()
        c.ChangeCurve().Initialize(edg)
        constraint = BRepFill_CurveConstraint(c, 0)
        bpSrf.Add(constraint)
    bpSrf.Perform()
    maxSeg, maxDeg, critOrder = 9, 8, 0
    tol = 1e-4
    srf = bpSrf.Surface()
    plate = GeomPlate_MakeApprox(srf, tol, maxSeg, maxDeg, tol, critOrder)
    uMin, uMax, vMin, vMax = srf.Bounds()
    face = make_face(plate.Surface(), uMin, uMax, vMin, vMax)
    return face


def add_wire_to_face(face, wire, reverse=False):
    '''
    apply a wire to a face
    use reverse to set the orientation of the wire to opposite
    @param face:
    @param wire:
    @param reverse:
    '''
    face = BRepBuilderAPI_MakeFace(face)
    if reverse:
        wire.Reverse()
    face.Add(wire)
    result = face.Face()
    return result


def sew_shapes(shapes, tolerance=0.001):
    sew = BRepBuilderAPI_Sewing(tolerance)
    for shp in shapes:
        if isinstance(shp, list):
            for i in shp:
                sew.Add(i)
        else:
            sew.Add(shp)
    sew.Perform()
    print("n degenerated shapes", sew.NbDegeneratedShapes())
    print("n deleted faces:", sew.NbDeletedFaces())
    print("n free edges", sew.NbFreeEdges())
    print("n multiple edges:", sew.NbMultipleEdges())
    result = ShapeToTopology()(sew.SewedShape())
    return result

#===========================================================================
# ---BOOL---
#===========================================================================


def boolean_cut(shapeToCutFrom, cuttingShape):
    from OCC.Core.BRepAlgoAPI import BRepAlgoAPI_Cut
    try:
        cut = BRepAlgoAPI_Cut(shapeToCutFrom, cuttingShape)
        print("Can work?", cut.BuilderCanWork())
        _error = {0: '- Ok',
                  1: '- The Object is created but Nothing is Done',
                  2: '- Null source shapes is not allowed',
                  3: '- Check types of the arguments',
                  4: '- Can not allocate memory for the DSFiller',
                  5: '- The Builder can not work with such types of arguments',
                  6: '- Unknown operation is not allowed',
                  7: '- Can not allocate memory for the Builder',
                  }
        print("Error status:", _error[cut.ErrorStatus()])
        cut.RefineEdges()
        cut.FuseEdges()
        shp = cut.Shape()
        cut.Destroy()
        return shp
    except:
        print("Failed to boolean cut")
        return shapeToCutFrom


def boolean_fuse(shapeToCutFrom, joiningShape):
    from OCC.Core.BRepAlgoAPI import BRepAlgoAPI_Fuse
    join = BRepAlgoAPI_Fuse(shapeToCutFrom, joiningShape)
    join.RefineEdges()
    join.FuseEdges()
    shape = join.Shape()
    join.Destroy()
    return shape


def trim_wire(wire, shapeLimit1, shapeLimit2, periodic=False):
    '''return the trimmed wire that lies between `shapeLimit1`
    and `shapeLimit2`
    returns TopoDS_Edge
    '''
    adap = to_adaptor_3d(wire)
    bspl = adap.BSpline()
    if periodic:
        if bspl.IsClosed():
            bspl.SetPeriodic()
        else:
            warnings.warn('the wire to be trimmed is not closed, hence cannot be made periodic')
    p1 = project_point_on_curve(bspl, shapeLimit1)[0]
    p2 = project_point_on_curve(bspl, shapeLimit2)[0]
    a, b = sorted([p1, p2])
    tr = Geom_TrimmedCurve(bspl, a, b)
    return make_edge(tr)

#===========================================================================
# ---FIXES---
#===========================================================================


def fix_shape(shp, tolerance=1e-3):
    from OCC.Core.ShapeFix import ShapeFix_Shape
    fix = ShapeFix_Shape(shp)
    fix.SetFixFreeShellMode(True)
    sf = fix.FixShellTool()
    sf.SetFixOrientationMode(True)
    fix.LimitTolerance(tolerance)
    fix.Perform()
    return fix.Shape()


def fix_face(shp, tolerance=1e-3):
    from OCC.Core.ShapeFix import ShapeFix_Face
    fix = ShapeFix_Face(shp)
    fix.SetMaxTolerance(tolerance)
    fix.Perform()
    return fix.Face()

#===========================================================================
# --- TRANSFORM ---
#===========================================================================


def translate_topods_from_vector(brep_or_iterable, vec, copy=False):
    '''
    translate a brep over a vector
    @param brep:    the Topo_DS to translate
    @param vec:     the vector defining the translation
    @param copy:    copies to brep if True
    '''
    st = ShapeToTopology()
    trns = gp_Trsf()
    trns.SetTranslation(vec)
    if issubclass(brep_or_iterable.__class__, TopoDS_Shape):
        brep_trns = BRepBuilderAPI_Transform(brep_or_iterable, trns, copy)
        brep_trns.Build()
        return st(brep_trns.Shape())
    else:
        return [translate_topods_from_vector(brep_or_iterable, vec, copy) for i in brep_or_iterable]


def scale_uniformal(brep, pnt, factor, copy=False):
    '''
    translate a brep over a vector
    @param brep:    the Topo_DS to translate
    @param pnt:     a gp_Pnt
    @param triple:  scaling factor
    @param copy:    copies to brep if True
    '''
    trns = gp_Trsf()
    trns.SetScale(pnt, factor)
    brep_trns = BRepBuilderAPI_Transform(brep, trns, copy)
    brep_trns.Build()
    return brep_trns.Shape()


def mirror_pnt_dir(brep, pnt, direction, copy=False):
    '''
    @param brep:
    @param line:
    '''
    trns = gp_Trsf()
    trns.SetMirror(gp_Ax1(pnt, direction))
    brep_trns = BRepBuilderAPI_Transform(brep, trns, copy)
    with assert_isdone(brep_trns, 'could not produce mirror'):
        brep_trns.Build()
        return brep_trns.Shape()


def mirror_axe2(brep, axe2, copy=False):
    '''
    @param brep:
    @param line:
    '''
    trns = gp_Trsf()
    trns.SetMirror(axe2)
    brep_trns = BRepBuilderAPI_Transform(brep, trns, copy)
    with assert_isdone(brep_trns, 'could not produce mirror'):
        brep_trns.Build()
        return brep_trns.Shape()


def rotate(brep, axe, degree, copy=False):
    '''
    @param brep:
    @param axe:
    @param degree:
    '''
    from math import radians
    trns = gp_Trsf()
    trns.SetRotation(axe, radians(degree))
    brep_trns = BRepBuilderAPI_Transform(brep, trns, copy)
    with assert_isdone(brep_trns, 'could not produce rotation'):
        brep_trns.Build()
        return ST(brep_trns.Shape())

#=============================================================================
# Not so sure where this should be located
#=============================================================================


def face_normal(face):
    from OCC.Core.BRepTools import breptools_UVBounds
    umin, umax, vmin, vmax = breptools_UVBounds(face)
    surf = BRep_Tool().Surface(face)
    props = GeomLProp_SLProps(surf, (umin+umax)/2., (vmin+vmax)/2., 1, TOLERANCE)
    norm = props.Normal()
    if face.Orientation() == TopAbs_REVERSED:
        norm.Reverse()
    return norm


def face_from_plane(_geom_plane, lowerLimit=-1000, upperLimit=1000):
    from OCC.Core.Geom import Geom_RectangularTrimmedSurface
    _trim_plane = make_face(Geom_RectangularTrimmedSurface(_geom_plane, lowerLimit, upperLimit, lowerLimit, upperLimit))
    return _trim_plane


def find_plane_from_shape(shape, tolerance=-1):
    try:
        fpl = BRepBuilderAPI_FindPlane(shape, tolerance)
        if fpl.Found():
            return fpl.Plane()
        else:
            return None
    except:
        raise AssertionError('couldnt find plane in %s' % (shape))


def fit_plane_through_face_vertices(_face):
    """
    :param _face:   OCC.KBE.face.Face instance
    :return:        Geom_Plane
    """
    from OCC.Core.GeomPlate import GeomPlate_BuildAveragePlane

    uvs_from_vertices = [_face.project_vertex(vertex2pnt(i)) for i in TopologyExplorer(_face).vertices()]
    normals = [gp_Vec(_face.DiffGeom.normal(*uv[0])) for uv in uvs_from_vertices]
    points = [i[1] for i in uvs_from_vertices]

    NORMALS = TColgp_SequenceOfVec()
    [NORMALS.Append(i) for i in normals]
    POINTS = to_tcol_(points, TColgp_HArray1OfPnt)

    pl = GeomPlate_BuildAveragePlane(NORMALS, POINTS).Plane()
    vec = gp_Vec(pl.Location(), _face.GlobalProperties.centre())
    pt = (pl.Location().as_vec() + vec).as_pnt()
    pl.SetLocation(pt)
    return pl


def project_edge_onto_plane(edg, plane):
    """
    :param edg:     kbe.edge.Edge
    :param plane:   Geom_Plane
    :return:        TopoDS_Edge projected on the plane
    """
    from OCC.Core.GeomProjLib import geomprojlib_ProjectOnPlane
    proj = geomprojlib_ProjectOnPlane(edg.adaptor.Curve().Curve(), plane, plane.Axis().Direction(), 1)
    return make_edge(proj)


def curve_to_bspline(crv, tolerance=TOLERANCE, continuity=GeomAbs_C1, sections=300, degree=12):
    approx_curve = GeomConvert_ApproxCurve(crv, tolerance, continuity, sections, degree)
    with assert_isdone(approx_curve, 'could not compute bspline from curve'):
        return approx_curve.Curve()


def compound(topo):
    '''
    accumulate a bunch of TopoDS_* in list `topo` to a TopoDS_Compound
    @param topo: list of TopoDS_* instances
    '''
    bd = TopoDS_Builder()
    comp = TopoDS_Compound()
    bd.MakeCompound(comp)
    for i in topo:
        bd.Add(comp, i)
    return comp


def geodesic_path(pntA, pntB, edgA, edgB, kbe_face, n_segments=20, _tolerance=0.1, n_iter=20):
    """
    :param pntA:        point to start from
    :param pntB:        point to move towards
    :param edgA:        edge to start from
    :param edgB:        edge to move towards
    :param kbe_face:    kbe.face.Face on which `edgA` and `edgB` lie
    :param n_segments:  the number of segments the geodesic is built from
    :param _tolerance:  tolerance when the geodesic is converged
    :param n_iter:      maximum number of iterations
    :return:            TopoDS_Edge
    """
    uvA, srf_pnt_A = kbe_face.project_vertex(pntA)
    uvB, srf_pnt_B = kbe_face.project_vertex(pntB)

    path = []
    for i in range(n_segments):
        t = i / float(n_segments)
        u = uvA[0] + t*(uvB[0] - uvA[0])
        v = uvA[1] + t*(uvB[1] - uvA[1])
        path.append(kbe_face.parameter_to_point(u, v))

    project_pnts = lambda x: [kbe_face.project_vertex(i)[1] for i in x]
    poly_length = lambda x: sum([x[i].Distance(x[i+1]) for i in range(len(x)-1)]) / len(x)

    length = poly_length(path)

    n = 0
    while True:
        path = smooth_pnts(path)
        path = project_pnts(path)
        newlength = poly_length(path)
        if abs(newlength-length) < _tolerance or n == n_iter:
            crv = points_to_bspline(path)
            return make_edge(crv)
        n += 1
