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

from math import pi, radians

from OCC.Core.BRepBndLib import brepbndlib_Add, brepbndlib_AddOptimal, brepbndlib_AddOBB
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakePrism, BRepPrimAPI_MakeSphere
from OCC.Core.BRepBuilderAPI import (BRepBuilderAPI_MakeEdge,
                                     BRepBuilderAPI_MakeVertex,
                                     BRepBuilderAPI_MakeWire,
                                     BRepBuilderAPI_MakeFace, BRepBuilderAPI_MakeEdge2d,
                                     BRepBuilderAPI_Transform)
from OCC.Core.BRepBuilderAPI import BRepBuilderAPI_GTransform
from OCC.Core.BRepFill import BRepFill_Filling
from OCC.Core.Bnd import Bnd_Box, Bnd_OBB
from OCC.Core.GeomAbs import (GeomAbs_C0, GeomAbs_Plane, GeomAbs_Cylinder, GeomAbs_Cone,
                              GeomAbs_Sphere, GeomAbs_Torus, GeomAbs_BezierSurface, GeomAbs_BSplineSurface,
                              GeomAbs_SurfaceOfRevolution, GeomAbs_SurfaceOfExtrusion, GeomAbs_OffsetSurface,
                              GeomAbs_OtherSurface)
from OCC.Core.BRepAdaptor import BRepAdaptor_Surface, BRepAdaptor_Curve
from OCC.Core.GeomAPI import GeomAPI_PointsToBSpline
from OCC.Core.GProp import GProp_GProps
from OCC.Core.BRepGProp import (brepgprop_LinearProperties,
                                brepgprop_SurfaceProperties,
                                brepgprop_VolumeProperties)
from OCC.Core.TColgp import TColgp_Array1OfPnt
from OCC.Core.TopoDS import TopoDS_Face
from OCC.Core.gp import (gp_Vec, gp_Pnt, gp_Trsf, gp_OX, gp_OY,
                         gp_OZ, gp_XYZ, gp_Ax2, gp_Dir, gp_GTrsf, gp_Mat)

from OCC.Extend.TopologyUtils import is_edge, is_face

#
# assert utils
#
def assert_shape_not_null(shp):
    if shp is None:
        raise AssertionError("Shape is Null.")


def assert_isdone(inst, message):
    if not inst.IsDone():
        raise AssertionError(message)


def assert_real_equal(a, b, eps=1e-6):
    if abs(a - b) >= eps:
        raise AssertionError("a and be are not equal")


def point_list_to_TColgp_Array1OfPnt(li):
    pts = TColgp_Array1OfPnt(0, len(li) - 1)
    for n, i in enumerate(li):
        pts.SetValue(n, i)
    return pts

#
# 0D
def make_vertex(*args):
    vert = BRepBuilderAPI_MakeVertex(*args)
    assert_isdone(vert, 'failed to produce edge')
    result = vert.Vertex()
    return result

#
# 1D
#
def make_edge(*args):
    edge = BRepBuilderAPI_MakeEdge(*args)
    assert_isdone(edge, 'failed to produce edge')
    result = edge.Edge()
    return result


def make_edge2d(*args):
    edge = BRepBuilderAPI_MakeEdge2d(*args)
    assert_isdone(edge, 'failed to produce edge')
    result = edge.Edge()
    return result


def make_wire(*args):
    # if we get an iterable, than add all edges to wire builder
    if isinstance(args[0], (list, tuple)):
        wire = BRepBuilderAPI_MakeWire()
        for i in args[0]:
            wire.Add(i)
        wire.Build()
        return wire.Wire()
    wire = BRepBuilderAPI_MakeWire(*args)
    assert_isdone(wire, 'failed to produce wire')
    return wire.Wire()


def points_to_bspline(pnts):
    pts = TColgp_Array1OfPnt(0, len(pnts) - 1)
    for n, i in enumerate(pnts):
        pts.SetValue(n, i)
    crv = GeomAPI_PointsToBSpline(pts)
    return crv.Curve()


def edge_to_bezier(topods_edge):
    """ take an edge and returns:
    * a bool is_bezier
    * the bezier curve
    * degrees
    * poles
    """
    ad = BRepAdaptor_Curve(topods_edge)
    if ad.IsRational():
        return True, ad.Bezier(), ad.Degree()
    else:
        return False, None, None
#
# 2D
#
def make_n_sided(edges, continuity=GeomAbs_C0):
    n_sided = BRepFill_Filling()
    for edg in edges:
        n_sided.Add(edg, continuity)
    n_sided.Build()
    assert_isdone(n_sided, 'failed to produce n_sided')
    face = n_sided.Face()
    return face


def make_face(*args):
    face = BRepBuilderAPI_MakeFace(*args)
    assert_isdone(face, 'failed to produce face')
    result = face.Face()
    return result


def get_aligned_boundingbox(shape, tol=1e-6, optimal_BB=True):
    """ return the bounding box of the TopoDS_Shape `shape`

    Parameters
    ----------

    shape : TopoDS_Shape or a subclass such as TopoDS_Face
        the shape to compute the bounding box from

    tol: float
        tolerance of the computed boundingbox

    use_triangulation : bool, True by default
        This makes the computation more accurate

    Returns
    -------
        if `as_pnt` is True, return a tuple of gp_Pnt instances
         for the lower and another for the upper X,Y,Z values representing the bounding box

        if `as_pnt` is False, return a tuple of lower and then upper X,Y,Z values
         representing the bounding box
    """
    bbox = Bnd_Box()
    bbox.SetGap(tol)

    # note: useTriangulation is True by default, we set it explicitely, but t's not necessary
    if optimal_BB:
        use_triangulation = True
        use_shapetolerance = True
        brepbndlib_AddOptimal(shape, bbox, use_triangulation, use_shapetolerance)
    else:
        brepbndlib_Add(shape, bbox)
    xmin, ymin, zmin, xmax, ymax, zmax = bbox.Get()
    corner1 = gp_Pnt(xmin, ymin, zmin)
    corner2 = gp_Pnt(xmax, ymax, zmax)
    center = midpoint(corner1, corner2)
    dx = xmax - xmin
    dy = ymax - ymin
    dz = zmax - zmin
    box_shp = BRepPrimAPI_MakeBox(corner1, corner2).Shape()
    return center, [dx, dy, dz], box_shp


def get_oriented_boundingbox(shape, optimal_OBB=True):
    """ return the oriented bounding box of the TopoDS_Shape `shape`

    Parameters
    ----------

    shape : TopoDS_Shape or a subclass such as TopoDS_Face
        the shape to compute the bounding box from
    optimal_OBB : bool, True by default. If set to True, compute the
        optimal (i.e. the smallest oriented bounding box). Optimal OBB is
        a bit longer.
    Returns
    -------
        a list with center, x, y and z sizes

        a shape
    """
    obb = Bnd_OBB()
    if optimal_OBB:
        is_triangulationUsed = True
        is_optimal = True
        is_shapeToleranceUsed = False
        brepbndlib_AddOBB(shape, obb, is_triangulationUsed, is_optimal, is_shapeToleranceUsed)
    else:
        brepbndlib_AddOBB(shape, obb)

    # converts the bounding box to a shape
    aBaryCenter = obb.Center()
    aXDir = obb.XDirection()
    aYDir = obb.YDirection()
    aZDir = obb.ZDirection()
    aHalfX = obb.XHSize()
    aHalfY = obb.YHSize()
    aHalfZ = obb.ZHSize()

    ax = gp_XYZ(aXDir.X(), aXDir.Y(), aXDir.Z())
    ay = gp_XYZ(aYDir.X(), aYDir.Y(), aYDir.Z())
    az = gp_XYZ(aZDir.X(), aZDir.Y(), aZDir.Z())
    p = gp_Pnt(aBaryCenter.X(), aBaryCenter.Y(), aBaryCenter.Z())
    anAxes = gp_Ax2(p, gp_Dir(aZDir), gp_Dir(aXDir))
    anAxes.SetLocation(gp_Pnt(p.XYZ() - ax*aHalfX - ay*aHalfY - az*aHalfZ))
    aBox = BRepPrimAPI_MakeBox(anAxes, 2.0*aHalfX, 2.0*aHalfY, 2.0*aHalfZ).Shape()
    return aBaryCenter, [aHalfX, aHalfY, aHalfZ], aBox


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
    veccie = (vec1 + vec2) * 0.5
    return gp_Pnt(veccie.XYZ())


def _test_midpoint():
    p1 = gp_Pnt(0, 0, 0)
    p2 = gp_Pnt(4, 5, 6)
    p3 = midpoint(p1, p2)
    assert [p3.X(), p3.Y(), p3.Z()] == [2, 2.5, 3.]


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


def translate_shp(shp, vec, copy=False):
    trns = gp_Trsf()
    trns.SetTranslation(vec)
    brep_trns = BRepBuilderAPI_Transform(shp, trns, copy)
    brep_trns.Build()
    return brep_trns.Shape()


def rotate_shape(shape, axis, angle, unite="deg"):
    """ Rotate a shape around an axis, with a given angle.

    @param shape : the shape to rotate
    @point : the origin of the axis
    @vector : the axis direction
    @angle : the value of the rotation

    @return: the rotated shape.
    """
    assert_shape_not_null(shape)
    if unite == "deg":  # convert angle to radians
        angle = radians(angle)
    trns = gp_Trsf()
    trns.SetRotation(axis, angle)
    brep_trns = BRepBuilderAPI_Transform(shape, trns, False)
    brep_trns.Build()
    shp = brep_trns.Shape()
    return shp


def rotate_shp_3_axis(shape, rx, ry, rz, unity="deg"):
    """ Rotate a shape around (O,x), (O,y) and (O,z).

    @param rx_degree : rotation around (O,x)
    @param ry_degree : rotation around (O,y)
    @param rz_degree : rotation around (O,z)

    @return : the rotated shape.
    """
    assert_shape_not_null(shape)
    if unity == "deg":  # convert angle to radians
        rx = radians(rx)
        ry = radians(ry)
        rz = radians(rz)
    alpha = gp_Trsf()
    alpha.SetRotation(gp_OX(), rx)
    beta = gp_Trsf()
    beta.SetRotation(gp_OY(), ry)
    gamma = gp_Trsf()
    gamma.SetRotation(gp_OZ(), rz)
    brep_trns = BRepBuilderAPI_Transform(shape, alpha*beta*gamma, False)
    shp = brep_trns.Shape()
    return shp



def scale_shape(shape, fx, fy, fz):
    """ Scale a shape along the 3 directions
    @param fx : scale factor in the x direction
    @param fy : scale factor in the y direction
    @param fz : scale factor in the z direction

    @return : the scaled shape
    """
    assert_shape_not_null(shape)
    scale_trsf = gp_GTrsf()
    rot = gp_Mat(fx, 0., 0., 0., fy, 0., 0., 0., fz)
    scale_trsf.SetVectorialPart(rot)
    shp = BRepBuilderAPI_GTransform(shape, scale_trsf).Shape()
    return shp


def _test_scale_shape():
    box = BRepPrimAPI_MakeBox(10., 10., 10.).Shape()
    box2 = scale_shape(box, 2.0, 1.0, 1.0)
    # volume should be double
    box2_volume = measure_shape_volume(box2)
    assert_real_equal(box2_volume, 2000.)


def make_extrusion(face, length, vector=gp_Vec(0., 0., 1.)):
    ''' creates a extrusion from a face, along the vector vector.
    with a distance legnth. Note that the normal vector does not
    necessary be normalized.
    By default, the extrusion is along the z axis.
    '''
    vector.Normalize()
    vector.Scale(length)
    return BRepPrimAPI_MakePrism(face, vector).Shape()

##################################
# Recognize functions
##################################
def recognize_face(topods_face):
    """ returns True if the TopoDS_Face is a planar surface
    """
    if not isinstance(topods_face, TopoDS_Face):
        return "Not a face", None, None
    surf = BRepAdaptor_Surface(topods_face, True)
    surf_type = surf.GetType()
    if  surf_type == GeomAbs_Plane:
        kind = "Plane"
        # look for the properties of the plane
        # first get the related gp_Pln
        gp_pln = surf.Plane()
        location = gp_pln.Location()  # a point of the plane
        normal = gp_pln.Axis().Direction()  # the plane normal
        return kind, location, normal
    elif surf_type == GeomAbs_Cylinder:
        kind = "Cylinder"
        # look for the properties of the cylinder
        # first get the related gp_Cyl
        gp_cyl = surf.Cylinder()
        location = gp_cyl.Location()  # a point of the axis
        axis = gp_cyl.Axis().Direction()  # the cylinder axis
        # then export location and normal to the console output
        return kind, location, axis
    elif surf_type == GeomAbs_Cone:
        kind = "Cone"
        return kind, None, None
    elif surf_type == GeomAbs_Sphere:
        kind = "Sphere"
        return kind, None, None
    elif surf_type == GeomAbs_Torus:
        kind = "Torus"
        return kind, None, None
    elif surf_type == GeomAbs_BezierSurface:
        kind = "Bezier"
        return kind, None, None
    elif surf_type == GeomAbs_BSplineSurface:
        kind = "BSpline"
        return kind, None, None
    elif surf_type == GeomAbs_SurfaceOfRevolution:
        kind = "Revolution"
        return kind, None, None
    elif surf_type == GeomAbs_SurfaceOfExtrusion:
        kind = "Extrusion"
        return kind, None, None
    elif surf_type == GeomAbs_OffsetSurface:
        kind = "Offset"
        return kind, None, None
    elif surf_type == GeomAbs_OtherSurface:
        kind = "Other"
        return kind, None, None
    # nothing found
    return "Unknown", None, None

##############################################################################
# Measure functions
##############################################################################
def measure_shape_volume(shape):
    """ Returns shape volume """
    inertia_props = GProp_GProps()
    brepgprop_VolumeProperties(shape, inertia_props)
    mass = inertia_props.Mass()
    return mass


def _test_measure_shape_volume():
    # first the colume of a box a,b,c should be a*b*c
    a = 10.
    b = 23.
    c = 98.1
    box = BRepPrimAPI_MakeBox(a, b, c).Shape()
    box_volume = measure_shape_volume(box)
    assert_real_equal(box_volume, a*b*c)
    # for a sphere of radius r, it should be 4/3.pi.r^3
    r = 9.8775  # a random radius
    sph = BRepPrimAPI_MakeSphere(r).Shape()
    sph_volume = measure_shape_volume(sph)
    assert_real_equal(sph_volume, 4./3.*pi*r*r*r)


def measure_shape_bounding_box(shape):
    """ Returns the dimension of the bounding box """
    bbox = Bnd_Box()
    brepbndlib_Add(shape, bbox)
    xmin, ymin, zmin, xmax, ymax, zmax = bbox.Get()
    dx = xmax - xmin
    dy = ymax - ymin
    dz = zmax - zmin
    return dx, dy, dz


def _test_measure_shape_bounding_box():
    # compute the bounding box of a sphere of radius centered at the origin
    sph = BRepPrimAPI_MakeSphere(5.).Shape()
    bb_dx, bb_dy, bb_dz = measure_shape_bounding_box(sph)
    assert_real_equal(bb_dx, 10.)
    assert_real_equal(bb_dy, 10.)
    assert_real_equal(bb_dz, 10.)


def measure_shape_mass_center_of_gravity(shape):
    """ Returns the shape center of gravity
    Returns a gp_Pnt if requested (set as_Pnt to True)
    or a list of 3 coordinates, by default."""
    inertia_props = GProp_GProps()
    if is_edge(shape):
        brepgprop_LinearProperties(shape, inertia_props)
        mass_property = "Length"
    elif is_face(shape):
        brepgprop_SurfaceProperties(shape, inertia_props)
        mass_property = "Area"
    else:
        brepgprop_VolumeProperties(shape, inertia_props)
        mass_property = "Volume"
    cog = inertia_props.CentreOfMass()
    mass = inertia_props.Mass()
    return cog, mass, mass_property


def _test_measure_shape_center_of_gravity():
    # we compute the cog of a sphere centered at a point P
    # then the cog must be P
    x, y, z = 10., 3., -2.44  # random values for point P
    vector = gp_Vec(x, y, z)
    sph = translate_shp(BRepPrimAPI_MakeSphere(20.).Shape(), vector)
    cog, mass, mass_property = measure_shape_mass_center_of_gravity(sph)
    assert_real_equal(cog.X(), x)
    assert_real_equal(cog.Y(), y)
    assert_real_equal(cog.Z(), z)
    assert mass_property == "Volume"


if __name__ == "__main__":
    # test assert shape is not null
    _test_midpoint()
    from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeTorus
    b = BRepPrimAPI_MakeTorus(30, 10).Shape()
    measure_shape_mass_center_of_gravity(b)
    get_oriented_boundingbox(b)
    from OCC.Extend.TopologyUtils import TopologyExplorer
    t = TopologyExplorer(b)
    for ed in t.edges():
        print(edge_to_bezier(ed))
    _test_midpoint()
    _test_scale_shape()
    _test_measure_shape_volume()
    _test_measure_shape_bounding_box()
    _test_measure_shape_center_of_gravity()
