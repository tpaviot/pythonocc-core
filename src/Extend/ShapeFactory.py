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

from math import radians
from typing import Any, List, Tuple, Union

from OCC.Core.BRepBndLib import brepbndlib
from OCC.Core.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakePrism
from OCC.Core.BRepBuilderAPI import (
    BRepBuilderAPI_MakeEdge,
    BRepBuilderAPI_MakeVertex,
    BRepBuilderAPI_MakeWire,
    BRepBuilderAPI_MakeFace,
    BRepBuilderAPI_MakeEdge2d,
    BRepBuilderAPI_Transform,
    BRepBuilderAPI_GTransform,
)
from OCC.Core.BRepFill import BRepFill_Filling
from OCC.Core.Bnd import Bnd_Box, Bnd_OBB
from OCC.Core.GeomAbs import (
    GeomAbs_Shape,
    GeomAbs_C0,
    GeomAbs_Plane,
    GeomAbs_Cylinder,
    GeomAbs_Cone,
    GeomAbs_Sphere,
    GeomAbs_Torus,
    GeomAbs_BezierSurface,
    GeomAbs_BSplineSurface,
    GeomAbs_SurfaceOfRevolution,
    GeomAbs_SurfaceOfExtrusion,
    GeomAbs_OffsetSurface,
    GeomAbs_OtherSurface,
)
from OCC.Core.BRepAdaptor import BRepAdaptor_Surface, BRepAdaptor_Curve
from OCC.Core.Geom import Geom_BSplineCurve, Geom_BezierCurve, Geom_Surface
from OCC.Core.GeomAPI import GeomAPI_PointsToBSpline
from OCC.Core.GProp import GProp_GProps
from OCC.Core.BRepGProp import brepgprop
from OCC.Core.TColgp import TColgp_Array1OfPnt
from OCC.Core.TopoDS import (
    TopoDS_Face,
    TopoDS_Shape,
    TopoDS_Vertex,
    TopoDS_Edge,
    TopoDS_Wire,
)
from OCC.Core.gp import (
    gp,
    gp_Vec,
    gp_Pnt,
    gp_Trsf,
    gp_Ax1,
    gp_Ax2,
    gp_Dir,
    gp_GTrsf,
    gp_Mat,
    gp_XYZ,
)
from OCC.Core.BRepMesh import BRepMesh_IncrementalMesh

from OCC.Extend.TopologyUtils import is_edge, is_face


#
# assert utils
#
def assert_shape_not_null(shp: TopoDS_Shape) -> None:
    """Checks if a shape is not None."""
    if shp is None:
        raise AssertionError("Shape is Null.")


def assert_isdone(inst: Any, message: str) -> None:
    """Checks if a BRepBuilderAPI algorithm has completed successfully."""
    if not inst.IsDone():
        raise AssertionError(message)


def point_list_to_TColgp_Array1OfPnt(li: List[gp_Pnt]) -> TColgp_Array1OfPnt:
    """
    Converts a list of gp_Pnt to a TColgp_Array1OfPnt.

    :param li: A list of gp_Pnt.
    :return: A TColgp_Array1OfPnt containing the points.
    """
    pts = TColgp_Array1OfPnt(0, len(li) - 1)
    for n, i in enumerate(li):
        pts.SetValue(n, i)
    return pts


#
# 0D
def make_vertex(*args: Union[gp_Pnt, float]) -> TopoDS_Vertex:
    """
    Creates a TopoDS_Vertex from a point.

    :param args: A gp_Pnt or the coordinates (x, y, z) of the point.
    :return: The created TopoDS_Vertex.
    """
    vert = BRepBuilderAPI_MakeVertex(*args)
    assert_isdone(vert, "failed to produce vertex")
    return vert.Vertex()


#
# 1D
#
def make_edge(*args: Any) -> TopoDS_Edge:
    """
    Creates a TopoDS_Edge from various inputs.

    Can create an edge from:
    - Two gp_Pnt
    - A TopoDS_Vertex and a gp_Pnt
    - Two TopoDS_Vertex
    - A Geom_Curve

    :param args: The input geometry to create the edge from.
    :return: The created TopoDS_Edge.
    """
    edge = BRepBuilderAPI_MakeEdge(*args)
    assert_isdone(edge, "failed to produce edge")
    return edge.Edge()


def make_edge2d(*args: Any) -> TopoDS_Edge:
    """
    Creates a 2D TopoDS_Edge.

    :param args: Arguments for BRepBuilderAPI_MakeEdge2d.
    :return: The created 2D TopoDS_Edge.
    """
    edge = BRepBuilderAPI_MakeEdge2d(*args)
    assert_isdone(edge, "failed to produce edge")
    return edge.Edge()


def make_wire(*args: Union[List[TopoDS_Edge], TopoDS_Edge]) -> TopoDS_Wire:
    """
    Creates a TopoDS_Wire from a list of edges or by connecting edges.

    If the first argument is a list or tuple of edges, it creates a wire from them.
    Otherwise, it can take multiple TopoDS_Edge arguments and connect them.

    :param args: A list of edges or a sequence of edges.
    :return: The created TopoDS_Wire.
    """
    # if we get an iterable, than add all edges to wire builder
    if isinstance(args[0], (list, tuple)):
        wire = BRepBuilderAPI_MakeWire()
        for i in args[0]:
            wire.Add(i)
        wire.Build()
        return wire.Wire()
    wire = BRepBuilderAPI_MakeWire(*args)
    assert_isdone(wire, "failed to produce wire")
    return wire.Wire()


def points_to_bspline(pnts: List[gp_Pnt]) -> Geom_BSplineCurve:
    """
    Creates a BSpline curve from a list of points.

    :param pnts: A list of gp_Pnt.
    :return: A Geom_BSplineCurve.
    """
    pts = TColgp_Array1OfPnt(0, len(pnts) - 1)
    for n, i in enumerate(pnts):
        pts.SetValue(n, i)
    crv = GeomAPI_PointsToBSpline(pts)
    return crv.Curve()


def edge_to_bezier(
    topods_edge: TopoDS_Edge,
) -> Tuple[bool, Geom_BezierCurve, int]:
    """
    Converts a TopoDS_Edge to a Bezier curve if possible.

    :param topods_edge: The edge to convert.
    :return: A tuple containing:
        - A boolean indicating if the conversion was successful.
        - The Geom_BezierCurve if successful, otherwise None.
        - The degree of the Bezier curve if successful, otherwise None.
    """
    ad = BRepAdaptor_Curve(topods_edge)
    if ad.IsRational():
        return True, ad.Bezier(), ad.Degree()
    return False, None, None


#
# 2D
#
def make_n_sided(
    edges: List[TopoDS_Edge], continuity: GeomAbs_Shape = GeomAbs_C0
) -> TopoDS_Face:
    """
    Creates an n-sided face from a list of edges.

    :param edges: A list of TopoDS_Edge that form a closed boundary.
    :param continuity: The continuity of the surface. Defaults to GeomAbs_C0.
    :return: The created TopoDS_Face.
    """
    n_sided = BRepFill_Filling()
    for edg in edges:
        n_sided.Add(edg, continuity)
    n_sided.Build()
    assert_isdone(n_sided, "failed to produce n_sided")
    return n_sided.Face()


def make_face(*args: Union[TopoDS_Wire, Geom_Surface]) -> TopoDS_Face:
    """
    Creates a TopoDS_Face from various inputs.

    Can create a face from:
    - A TopoDS_Wire
    - A Geom_Surface

    :param args: The input geometry to create the face from.
    :return: The created TopoDS_Face.
    """
    face = BRepBuilderAPI_MakeFace(*args)
    assert_isdone(face, "failed to produce face")
    return face.Face()


def get_aligned_boundingbox(
    shape: TopoDS_Shape, tol: float = 1e-6, optimal_BB: bool = True
) -> Tuple[gp_Pnt, List[float], TopoDS_Shape]:
    """
    Computes the axis-aligned bounding box of a shape.

    :param shape: The TopoDS_Shape to compute the bounding box from.
    :param tol: The tolerance of the bounding box. Defaults to 1e-6.
    :param optimal_BB: If True, computes the optimal (tightest) bounding box.
        Defaults to True.
    :return: A tuple containing:
        - The center of the bounding box (gp_Pnt).
        - A list of the dimensions [dx, dy, dz] of the bounding box.
        - A TopoDS_Shape representing the bounding box.
    """
    bbox = Bnd_Box()
    bbox.SetGap(tol)

    # note: useTriangulation is True by default, we set it explicitly, but t's not necessary
    if optimal_BB:
        use_triangulation = True
        use_shapetolerance = True
        brepbndlib.AddOptimal(shape, bbox, use_triangulation, use_shapetolerance)
    else:
        brepbndlib.Add(shape, bbox)
    xmin, ymin, zmin, xmax, ymax, zmax = bbox.Get()
    corner1 = gp_Pnt(xmin, ymin, zmin)
    corner2 = gp_Pnt(xmax, ymax, zmax)
    center = midpoint(corner1, corner2)
    dx = xmax - xmin
    dy = ymax - ymin
    dz = zmax - zmin
    box_shp = BRepPrimAPI_MakeBox(corner1, corner2).Shape()
    return center, [dx, dy, dz], box_shp


def get_oriented_boundingbox(
    shape: TopoDS_Shape, optimal_OBB: bool = True
) -> Tuple[gp_Pnt, List[float], TopoDS_Shape]:
    """
    Computes the oriented bounding box of a shape.

    :param shape: The TopoDS_Shape to compute the bounding box from.
    :param optimal_OBB: If True, computes the smallest possible oriented
        bounding box. This can be slower. Defaults to True.
    :return: A tuple containing:
        - The center of the bounding box (gp_Pnt).
        - A list of the half-dimensions [hx, hy, hz] of the bounding box.
        - A TopoDS_Shape representing the bounding box.
    """
    obb = Bnd_OBB()
    if optimal_OBB:
        is_triangulation_used = True
        is_optimal = True
        is_shape_tolerance_used = False
        brepbndlib.AddOBB(
            shape, obb, is_triangulation_used, is_optimal, is_shape_tolerance_used
        )
    else:
        brepbndlib.AddOBB(shape, obb)

    # converts the bounding box to a shape
    bary_center = obb.Center()
    x_direction = obb.XDirection()
    y_direction = obb.YDirection()
    z_direction = obb.ZDirection()
    a_half_x = obb.XHSize()
    a_half_y = obb.YHSize()
    a_half_z = obb.ZHSize()

    ax = gp_XYZ(x_direction.X(), x_direction.Y(), x_direction.Z())
    ay = gp_XYZ(y_direction.X(), y_direction.Y(), y_direction.Z())
    az = gp_XYZ(z_direction.X(), z_direction.Y(), z_direction.Z())
    p = gp_Pnt(bary_center.X(), bary_center.Y(), bary_center.Z())
    an_axe = gp_Ax2(p, gp_Dir(z_direction), gp_Dir(x_direction))
    an_axe.SetLocation(gp_Pnt(gp_XYZ() - ax * a_half_x - ay * a_half_y - az * a_half_z))
    a_box = BRepPrimAPI_MakeBox(
        an_axe, 2.0 * a_half_x, 2.0 * a_half_y, 2.0 * a_half_z
    ).Shape()
    return bary_center, [a_half_x, a_half_y, a_half_z], a_box


def midpoint(point_A: gp_Pnt, point_B: gp_Pnt) -> gp_Pnt:
    """
    Computes the midpoint between two points.

    :param point_A: The first point (gp_Pnt).
    :param point_B: The second point (gp_Pnt).
    :return: The midpoint (gp_Pnt).
    """
    vec_1 = gp_Vec(point_A.XYZ())
    vec_2 = gp_Vec(point_B.XYZ())
    mid = (vec_1 + vec_2) * 0.5
    return gp_Pnt(mid.XYZ())


def center_boundingbox(shape: TopoDS_Shape) -> gp_Pnt:
    """
    Computes the center of the bounding box of a shape.

    :param shape: The TopoDS_Shape to compute the center of.
    :return: The center point (gp_Pnt).
    """
    xmin, ymin, zmin, xmax, ymax, zmax = get_boundingbox(shape, 1e-6)
    return midpoint(gp_Pnt(xmin, ymin, zmin), gp_Pnt(xmax, ymax, zmax))


def get_boundingbox(
    shape: TopoDS_Shape, tol: float = 1e-6, use_mesh: bool = True
) -> Tuple[float, float, float, float, float, float]:
    """
    Computes the axis-aligned bounding box of a shape.

    :param shape: The TopoDS_Shape to compute the bounding box from.
    :param tol: The tolerance of the bounding box. Defaults to 1e-6.
    :param use_mesh: If True, the shape is meshed before computing the
        bounding box for better accuracy. Defaults to True.
    :return: A tuple of the min and max coordinates (xmin, ymin, zmin, xmax, ymax, zmax).
    """
    bbox = Bnd_Box()
    bbox.SetGap(tol)
    if use_mesh:
        mesh = BRepMesh_IncrementalMesh()
        mesh.SetParallelDefault(True)
        mesh.SetShape(shape)
        mesh.Perform()
        if not mesh.IsDone():
            raise AssertionError("Mesh not done.")
    brepbndlib.Add(shape, bbox, use_mesh)

    xmin, ymin, zmin, xmax, ymax, zmax = bbox.Get()
    return xmin, ymin, zmin, xmax, ymax, zmax


def translate_shp(shp: TopoDS_Shape, vec: gp_Vec, copy: bool = False) -> TopoDS_Shape:
    """
    Translates a shape by a vector.

    :param shp: The TopoDS_Shape to translate.
    :param vec: The translation vector (gp_Vec).
    :param copy: If True, a new shape is created. Otherwise, the original shape is modified. Defaults to False.
    :return: The translated TopoDS_Shape.
    """
    trns = gp_Trsf()
    trns.SetTranslation(vec)
    brep_trns = BRepBuilderAPI_Transform(shp, trns, copy)
    brep_trns.Build()
    return brep_trns.Shape()


def rotate_shape(
    shape: TopoDS_Shape, axis: gp_Ax1, angle: float, unite: str = "deg"
) -> TopoDS_Shape:
    """
    Rotates a shape around an axis by a given angle.

    :param shape: The TopoDS_Shape to rotate.
    :param axis: The axis of rotation (gp_Ax1).
    :param angle: The angle of rotation.
    :param unite: The unit of the angle, either "deg" for degrees or "rad" for radians. Defaults to "deg".
    :return: The rotated TopoDS_Shape.
    """
    assert_shape_not_null(shape)
    if unite == "deg":  # convert angle to radians
        angle = radians(angle)
    trns = gp_Trsf()
    trns.SetRotation(axis, angle)
    brep_trns = BRepBuilderAPI_Transform(shape, trns, False)
    brep_trns.Build()
    return brep_trns.Shape()


def rotate_shp_3_axis(
    shape: TopoDS_Shape, rx: float, ry: float, rz: float, unity: str = "deg"
) -> TopoDS_Shape:
    """
    Rotates a shape around the X, Y, and Z axes.

    :param shape: The TopoDS_Shape to rotate.
    :param rx: The rotation angle around the X-axis.
    :param ry: The rotation angle around the Y-axis.
    :param rz: The rotation angle around the Z-axis.
    :param unity: The unit of the angles, either "deg" for degrees or "rad" for radians. Defaults to "deg".
    :return: The rotated TopoDS_Shape.
    """
    assert_shape_not_null(shape)
    if unity == "deg":  # convert angle to radians
        rx = radians(rx)
        ry = radians(ry)
        rz = radians(rz)
    alpha = gp_Trsf()
    alpha.SetRotation(gp.OX(), rx)
    beta = gp_Trsf()
    beta.SetRotation(gp.OY(), ry)
    gamma = gp_Trsf()
    gamma.SetRotation(gp.OZ(), rz)
    brep_trns = BRepBuilderAPI_Transform(shape, alpha * beta * gamma, False)
    return brep_trns.Shape()


def scale_shape(shape: TopoDS_Shape, fx: float, fy: float, fz: float) -> TopoDS_Shape:
    """
    Scales a shape along the X, Y, and Z axes.

    :param shape: The TopoDS_Shape to scale.
    :param fx: The scaling factor along the X-axis.
    :param fy: The scaling factor along the Y-axis.
    :param fz: The scaling factor along the Z-axis.
    :return: The scaled TopoDS_Shape.
    """
    assert_shape_not_null(shape)
    scale_trsf = gp_GTrsf()
    rot = gp_Mat(fx, 0.0, 0.0, 0.0, fy, 0.0, 0.0, 0.0, fz)
    scale_trsf.SetVectorialPart(rot)
    return BRepBuilderAPI_GTransform(shape, scale_trsf).Shape()


def make_extrusion(
    face: TopoDS_Face, length: float, vector: gp_Vec = None
) -> TopoDS_Shape:
    """
    Creates an extrusion from a face along a vector.

    :param face: The TopoDS_Face to extrude.
    :param length: The length of the extrusion.
    :param vector: The direction of the extrusion (gp_Vec). If None, the Z-axis is used. Defaults to None.
    :return: The extruded TopoDS_Shape (a solid).
    """
    if vector is None:
        vector = gp_Vec(0.0, 0.0, 1.0)
    if not isinstance(vector, gp_Vec):
        raise TypeError("vector must be a gp_Vec")
    vector.Normalize()
    vector.Scale(length)
    return BRepPrimAPI_MakePrism(face, vector).Shape()


##################################
# Recognize functions
##################################
def recognize_face(
    topods_face: TopoDS_Face,
) -> Tuple[str, gp_Pnt, gp_Dir]:
    """
    Recognizes the type of a TopoDS_Face and returns its properties.

    :param topods_face: The face to recognize.
    :return: A tuple containing:
        - The type of the face as a string (e.g., "Plane", "Cylinder").
        - The location of the surface (e.g., a point on the plane or axis).
        - The normal or axis of the surface.
    """
    if not isinstance(topods_face, TopoDS_Face):
        return "Not a face", None, None
    surf = BRepAdaptor_Surface(topods_face, True)
    surf_type = surf.GetType()
    if surf_type == GeomAbs_Plane:
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
    else:
        return "Unknown", None, None


##############################################################################
# Measure functions
##############################################################################
def measure_shape_volume(shape: TopoDS_Shape) -> float:
    """
    Measures the volume of a shape.

    :param shape: The TopoDS_Shape to measure.
    :return: The volume of the shape.
    """
    inertia_props = GProp_GProps()
    brepgprop.VolumeProperties(shape, inertia_props)
    return inertia_props.Mass()


def measure_shape_mass_center_of_gravity(
    shape: TopoDS_Shape,
) -> Tuple[gp_Pnt, float, str]:
    """
    Measures the mass, center of gravity, and the property used for mass calculation (Length, Area, or Volume).

    :param shape: The TopoDS_Shape to measure.
    :return: A tuple containing:
        - The center of gravity (gp_Pnt).
        - The mass (a float).
        - The mass property as a string ("Length", "Area", or "Volume").
    """
    inertia_props = GProp_GProps()
    if is_edge(shape):
        brepgprop.LinearProperties(shape, inertia_props)
        mass_property = "Length"
    elif is_face(shape):
        brepgprop.SurfaceProperties(shape, inertia_props)
        mass_property = "Area"
    else:
        brepgprop.VolumeProperties(shape, inertia_props)
        mass_property = "Volume"
    cog = inertia_props.CentreOfMass()
    mass = inertia_props.Mass()
    return cog, mass, mass_property
