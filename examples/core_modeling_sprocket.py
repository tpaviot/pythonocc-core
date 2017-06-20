#!/usr/bin/env python

##Copyright 2016 Luke Chen (@chentao807, https://github.com/chentao807)
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
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/

# This example is a port of the C++ code
# available at http://www.algotopia.com/contents/opencascade/opencascade_sprocket

import sys
from math import pi as M_PI, sin, cos, pow, atan

from OCC.gp import gp_Pnt2d, gp_Ax2d, gp_Dir2d, gp_Circ2d, gp_Origin2d, gp_DX2d, \
    gp_Ax2, gp_OX2d, gp_Lin2d, gp_Trsf, gp_XOY, \
    gp_Pnt, gp_Vec, gp_Ax3, gp_Pln, gp_Origin, gp_DX, gp_DY, gp_DZ, gp_OZ
from OCC.GCE2d import GCE2d_MakeArcOfCircle, GCE2d_MakeCircle, GCE2d_MakeLine
from OCC.Geom2dAPI import Geom2dAPI_InterCurveCurve
from OCC.Geom2d import Handle_Geom2d_TrimmedCurve
from OCC.GeomAPI import geomapi_To3d
from OCC.BRepBuilderAPI import (BRepBuilderAPI_MakeEdge,
                                BRepBuilderAPI_MakeWire,
                                BRepBuilderAPI_MakeFace,
                                BRepBuilderAPI_Transform)
from OCC.BRepPrimAPI import (BRepPrimAPI_MakePrism, BRepPrimAPI_MakeRevol,
                             BRepPrimAPI_MakeCylinder, BRepPrimAPI_MakeCone)
from OCC.GccAna import GccAna_Circ2d2TanRad
from OCC.BRepAlgoAPI import BRepAlgoAPI_Cut, BRepAlgoAPI_Fuse
from OCC.BRepFilletAPI import BRepFilletAPI_MakeFillet2d
from OCC.BRepTools import BRepTools_WireExplorer
from OCC.Display.SimpleGui import init_display

roller_diameter = 10.2
pitch = 15.875
num_teeth = 40
chain_width = 6.35

#  Dimensions derived from the provided inputs
roller_radius = roller_diameter / 2.
tooth_angle = (2 * M_PI) / num_teeth
pitch_circle_diameter = pitch / sin(tooth_angle / 2.)
pitch_circle_radius = pitch_circle_diameter / 2.

roller_contact_angle_min = (M_PI * 120 / 180) - ((M_PI / 2.) / num_teeth)
roller_contact_angle_max = (M_PI * 140 / 180) - ((M_PI / 2.) / num_teeth)
roller_contact_angle = (roller_contact_angle_min + roller_contact_angle_max) / 2.

tooth_radius_min = 0.505 * roller_diameter
tooth_radius_max = tooth_radius_min + (0.069 * pow(roller_diameter, 1.0 / 3.0))
tooth_radius = (tooth_radius_min + tooth_radius_max) / 2.

profile_radius = 0.12 * roller_diameter * (num_teeth + 2)
top_diameter = pitch_circle_diameter + ((1 - (1.6 / num_teeth)) * pitch) - roller_diameter
top_radius = top_diameter / 2.

thickness = chain_width * 0.95

# Center hole data
center_radius = 125.0 / 2.

# Mounting hole data
mounting_hole_count = 6
mounting_radius = 153.0 / 2.
hole_radius = 8.5 / 2.


class Proxy(object):
    def __init__(self, obj):
        self.obj = obj.GetObject()

    def __getattribute__(self, attr):
        obj = object.__getattribute__(self, 'obj')
        return getattr(obj, attr).__get__(obj)


def build_tooth():
    base_center = gp_Pnt2d(pitch_circle_radius + (tooth_radius - roller_radius), 0)
    base_circle = gp_Circ2d(gp_Ax2d(base_center, gp_Dir2d()), tooth_radius)
    trimmed_base = GCE2d_MakeArcOfCircle(base_circle,
                                         M_PI - (roller_contact_angle / 2.),
                                         M_PI).Value()
    Proxy(trimmed_base).Reverse()  # just a trick
    p0 = Proxy(trimmed_base).StartPoint()
    p1 = Proxy(trimmed_base).EndPoint()

    # Determine the center of the profile circle
    x_distance = cos(roller_contact_angle / 2.) * (profile_radius + tooth_radius)
    y_distance = sin(roller_contact_angle / 2.) * (profile_radius + tooth_radius)
    profile_center = gp_Pnt2d(pitch_circle_radius - x_distance, y_distance)

    # Construct the profile circle gp_Circ2d
    profile_circle = gp_Circ2d(gp_Ax2d(profile_center, gp_Dir2d()),
                               profile_center.Distance(p1))
    geom_profile_circle = GCE2d_MakeCircle(profile_circle).Value()

    # Construct the outer circle gp_Circ2d
    outer_circle = gp_Circ2d(gp_Ax2d(gp_Pnt2d(0, 0), gp_Dir2d()), top_radius)
    geom_outer_circle = GCE2d_MakeCircle(outer_circle).Value()

    inter = Geom2dAPI_InterCurveCurve(geom_profile_circle, geom_outer_circle)
    num_points = inter.NbPoints()
    assert isinstance(p1, gp_Pnt2d)
    if num_points == 2:
        if p1.Distance(inter.Point(1)) < p1.Distance(inter.Point(2)):
            p2 = inter.Point(1)
        else:
            p2 = inter.Point(2)
    elif num_points == 1:
        p2 = inter.Point(1)
    else:
        sys.exit(-1)

    # Trim the profile circle and mirror
    trimmed_profile = GCE2d_MakeArcOfCircle(profile_circle, p1, p2).Value()

    # Calculate the outermost point
    p3 = gp_Pnt2d(cos(tooth_angle / 2.) * top_radius,
                  sin(tooth_angle / 2.) * top_radius)

    # and use it to create the third arc
    trimmed_outer = GCE2d_MakeArcOfCircle(outer_circle, p2, p3).Value()

    # Mirror and reverse the three arcs
    mirror_axis = gp_Ax2d(gp_Origin2d(), gp_DX2d().Rotated(tooth_angle / 2.))

    mirror_base = Handle_Geom2d_TrimmedCurve.DownCast(Proxy(trimmed_base).Copy())
    mirror_profile = Handle_Geom2d_TrimmedCurve.DownCast(Proxy(trimmed_profile).Copy())
    mirror_outer = Handle_Geom2d_TrimmedCurve.DownCast(Proxy(trimmed_outer).Copy())

    Proxy(mirror_base).Mirror(mirror_axis)
    Proxy(mirror_profile).Mirror(mirror_axis)
    Proxy(mirror_outer).Mirror(mirror_axis)

    Proxy(mirror_base).Reverse()
    Proxy(mirror_profile).Reverse()
    Proxy(mirror_outer).Reverse()

    # Replace the two outer arcs with a single one
    outer_start = Proxy(trimmed_outer).StartPoint()
    outer_mid = Proxy(trimmed_outer).EndPoint()
    outer_end = Proxy(mirror_outer).EndPoint()

    outer_arc = GCE2d_MakeArcOfCircle(outer_start, outer_mid, outer_end).Value()

    # Create an arc for the inside of the wedge
    inner_circle = gp_Circ2d(gp_Ax2d(gp_Pnt2d(0, 0), gp_Dir2d()),
                             top_radius - roller_diameter)
    inner_start = gp_Pnt2d(top_radius - roller_diameter, 0)
    inner_arc = GCE2d_MakeArcOfCircle(inner_circle, inner_start, tooth_angle).Value()
    Proxy(inner_arc).Reverse()

    # Convert the 2D arcs and two extra lines to 3D edges
    plane = gp_Pln(gp_Origin(), gp_DZ())
    arc1 = BRepBuilderAPI_MakeEdge(geomapi_To3d(trimmed_base, plane)).Edge()
    arc2 = BRepBuilderAPI_MakeEdge(geomapi_To3d(trimmed_profile, plane)).Edge()
    arc3 = BRepBuilderAPI_MakeEdge(geomapi_To3d(outer_arc, plane)).Edge()
    arc4 = BRepBuilderAPI_MakeEdge(geomapi_To3d(mirror_profile, plane)).Edge()
    arc5 = BRepBuilderAPI_MakeEdge(geomapi_To3d(mirror_base, plane)).Edge()

    p4 = Proxy(mirror_base).EndPoint()
    p5 = Proxy(inner_arc).StartPoint()

    lin1 = BRepBuilderAPI_MakeEdge(gp_Pnt(p4.X(), p4.Y(), 0),
                                   gp_Pnt(p5.X(), p5.Y(), 0)).Edge()
    arc6 = BRepBuilderAPI_MakeEdge(geomapi_To3d(inner_arc, plane)).Edge()

    p6 = Proxy(inner_arc).EndPoint()
    lin2 = BRepBuilderAPI_MakeEdge(gp_Pnt(p6.X(), p6.Y(), 0),
                                   gp_Pnt(p0.X(), p0.Y(), 0)).Edge()

    wire = BRepBuilderAPI_MakeWire(arc1)
    wire.Add(arc2)
    wire.Add(arc3)
    wire.Add(arc4)
    wire.Add(arc5)
    wire.Add(lin1)
    wire.Add(arc6)
    wire.Add(lin2)

    face = BRepBuilderAPI_MakeFace(wire.Wire())

    wedge = BRepPrimAPI_MakePrism(face.Shape(), gp_Vec(0.0, 0.0, thickness))

    return wedge.Shape()


def round_tooth(wedge):
    round_x = 2.6
    round_z = 0.06 * pitch
    round_radius = pitch

    # Determine where the circle used for rounding has to start and stop
    p2d_1 = gp_Pnt2d(top_radius - round_x, 0)
    p2d_2 = gp_Pnt2d(top_radius, round_z)

    # Construct the rounding circle
    round_circle = GccAna_Circ2d2TanRad(p2d_1, p2d_2, round_radius, 0.01)
    if (round_circle.NbSolutions() != 2):
        sys.exit(-2)

    round_circle_2d_1 = round_circle.ThisSolution(1)
    round_circle_2d_2 = round_circle.ThisSolution(2)

    if (round_circle_2d_1.Position().Location().Coord()[1] >= 0):
        round_circle_2d = round_circle_2d_1
    else:
        round_circle_2d = round_circle_2d_2

    # Remove the arc used for rounding
    trimmed_circle = GCE2d_MakeArcOfCircle(round_circle_2d, p2d_1, p2d_2).Value()

    # Calculate extra points used to construct lines
    p1 = gp_Pnt(p2d_1.X(), 0, p2d_1.Y())
    p2 = gp_Pnt(p2d_2.X(), 0, p2d_2.Y())
    p3 = gp_Pnt(p2d_2.X() + 1, 0, p2d_2.Y())
    p4 = gp_Pnt(p2d_2.X() + 1, 0, p2d_1.Y() - 1)
    p5 = gp_Pnt(p2d_1.X(), 0, p2d_1.Y() - 1)

    # Convert the arc and four extra lines into 3D edges
    plane = gp_Pln(gp_Ax3(gp_Origin(), gp_DY().Reversed(), gp_DX()))
    arc1 = BRepBuilderAPI_MakeEdge(geomapi_To3d(trimmed_circle, plane)).Edge()
    lin1 = BRepBuilderAPI_MakeEdge(p2, p3).Edge()
    lin2 = BRepBuilderAPI_MakeEdge(p3, p4).Edge()
    lin3 = BRepBuilderAPI_MakeEdge(p4, p5).Edge()
    lin4 = BRepBuilderAPI_MakeEdge(p5, p1).Edge()

    # Make a wire composed of the edges
    round_wire = BRepBuilderAPI_MakeWire(arc1)
    round_wire.Add(lin1)
    round_wire.Add(lin2)
    round_wire.Add(lin3)
    round_wire.Add(lin4)

    # Turn the wire into a face
    round_face = BRepBuilderAPI_MakeFace(round_wire.Wire()).Shape()

    # Revolve the face around the Z axis over the tooth angle
    rounding_cut_1 = BRepPrimAPI_MakeRevol(round_face, gp_OZ(), tooth_angle).Shape()

    # Construct a mirrored copy of the first cutting shape
    mirror = gp_Trsf()
    mirror.SetMirror(gp_XOY())
    mirrored_cut_1 = BRepBuilderAPI_Transform(rounding_cut_1, mirror, True).Shape()

    # and translate it so that it ends up on the other side of the wedge
    translate = gp_Trsf()
    translate.SetTranslation(gp_Vec(0, 0, thickness))
    rounding_cut_2 = BRepBuilderAPI_Transform(mirrored_cut_1, translate, False).Shape()

    # Cut the wedge using the first and second cutting shape
    cut_1 = BRepAlgoAPI_Cut(wedge, rounding_cut_1).Shape()
    cut_2 = BRepAlgoAPI_Cut(cut_1, rounding_cut_2).Shape()

    return cut_2


def clone_tooth(base_shape):
    clone = gp_Trsf()
    grouped_shape = base_shape

    # Find a divisor, between 1 and 8, for the number_of teeth
    multiplier = 1
    max_multiplier = 1
    for i in range(0, 8):
        if num_teeth % multiplier == 0:
            max_multiplier = i + 1

    multiplier = max_multiplier
    for i in range(1, multiplier):
        clone.SetRotation(gp_OZ(), -i * tooth_angle)
        rotated_shape = BRepBuilderAPI_Transform(base_shape, clone, True).Shape()
        grouped_shape = BRepAlgoAPI_Fuse(grouped_shape, rotated_shape).Shape()

    # Rotate the basic tooth and fuse together
    aggregated_shape = grouped_shape
    for i in range(1, int(num_teeth / multiplier)):
        clone.SetRotation(gp_OZ(), - i * multiplier * tooth_angle)
        rotated_shape = BRepBuilderAPI_Transform(grouped_shape, clone, True).Shape()
        aggregated_shape = BRepAlgoAPI_Fuse(aggregated_shape, rotated_shape).Shape()

    cylinder = BRepPrimAPI_MakeCylinder(gp_XOY(),
                                        top_radius - roller_diameter,
                                        thickness)
    aggregated_shape = BRepAlgoAPI_Fuse(aggregated_shape,
                                        cylinder.Shape()).Shape()

    return aggregated_shape


def center_hole(base):
    cylinder = BRepPrimAPI_MakeCylinder(center_radius, thickness).Shape()
    cut = BRepAlgoAPI_Cut(base, cylinder)
    return cut.Shape()


def mounting_holes(base):
    result = base
    for i in range(0, mounting_hole_count):
        center = gp_Pnt(cos(i * M_PI / 3) * mounting_radius,
                        sin(i * M_PI / 3) * mounting_radius, 0.0)
        center_axis = gp_Ax2(center, gp_DZ())

        cylinder = BRepPrimAPI_MakeCylinder(center_axis, hole_radius,
                                            thickness).Shape()
        result = BRepAlgoAPI_Cut(result, cylinder).Shape()

        cone = BRepPrimAPI_MakeCone(center_axis,
                                    hole_radius + thickness / 2.,
                                    hole_radius, thickness / 2.)
        result = BRepAlgoAPI_Cut(result, cone.Shape()).Shape()

    return result


def cut_out(base):
    outer = gp_Circ2d(gp_OX2d(), top_radius - 1.75 * roller_diameter)
    inner = gp_Circ2d(gp_OX2d(), center_radius + 0.75 * roller_diameter)

    geom_outer = GCE2d_MakeCircle(outer).Value()
    geom_inner = GCE2d_MakeCircle(inner).Value()
    Proxy(geom_inner).Reverse()

    base_angle = (2. * M_PI) / mounting_hole_count
    hole_angle = atan(hole_radius / mounting_radius)
    correction_angle = 3 * hole_angle

    left = gp_Lin2d(gp_Origin2d(), gp_DX2d())
    right = gp_Lin2d(gp_Origin2d(), gp_DX2d())
    left.Rotate(gp_Origin2d(), correction_angle)
    right.Rotate(gp_Origin2d(), base_angle - correction_angle)

    geom_left = GCE2d_MakeLine(left).Value()
    geom_right = GCE2d_MakeLine(right).Value()

    inter_1 = Geom2dAPI_InterCurveCurve(geom_outer, geom_left)
    inter_2 = Geom2dAPI_InterCurveCurve(geom_outer, geom_right)
    inter_3 = Geom2dAPI_InterCurveCurve(geom_inner, geom_right)
    inter_4 = Geom2dAPI_InterCurveCurve(geom_inner, geom_left)

    if inter_1.Point(1).X() > 0:
        p1 = inter_1.Point(1)
    else:
        p1 = inter_1.Point(2)

    if inter_2.Point(1).X() > 0:
        p2 = inter_2.Point(1)
    else:
        p2 = inter_2.Point(2)

    if inter_3.Point(1).X() > 0:
        p3 = inter_3.Point(1)
    else:
        p3 = inter_3.Point(2)

    if inter_4.Point(1).X() > 0:
        p4 = inter_4.Point(1)
    else:
        p4 = inter_4.Point(2)

    trimmed_outer = GCE2d_MakeArcOfCircle(outer, p1, p2).Value()
    trimmed_inner = GCE2d_MakeArcOfCircle(inner, p4, p3).Value()

    plane = gp_Pln(gp_Origin(), gp_DZ())

    arc1 = BRepBuilderAPI_MakeEdge(geomapi_To3d(trimmed_outer, plane)).Edge()

    lin1 = BRepBuilderAPI_MakeEdge(gp_Pnt(p2.X(), p2.Y(), 0),
                                   gp_Pnt(p3.X(), p3.Y(), 0)).Edge()

    arc2 = BRepBuilderAPI_MakeEdge(geomapi_To3d(trimmed_inner, plane)).Edge()

    lin2 = BRepBuilderAPI_MakeEdge(gp_Pnt(p4.X(), p4.Y(), 0),
                                   gp_Pnt(p1.X(), p1.Y(), 0)).Edge()

    cutout_wire = BRepBuilderAPI_MakeWire(arc1)
    cutout_wire.Add(lin1)
    cutout_wire.Add(arc2)
    cutout_wire.Add(lin2)

    # Turn the wire into a face
    cutout_face = BRepBuilderAPI_MakeFace(cutout_wire.Wire())
    filleted_face = BRepFilletAPI_MakeFillet2d(cutout_face.Face())

    explorer = BRepTools_WireExplorer(cutout_wire.Wire())
    while explorer.More():
        vertex = explorer.CurrentVertex()
        filleted_face.AddFillet(vertex, roller_radius)
        explorer.Next()

    cutout = BRepPrimAPI_MakePrism(filleted_face.Shape(),
                                   gp_Vec(0.0, 0.0, thickness)).Shape()

    result = base
    rotate = gp_Trsf()
    for i in range(0, mounting_hole_count):
        rotate.SetRotation(gp_OZ(), i * 2. * M_PI / mounting_hole_count)
        rotated_cutout = BRepBuilderAPI_Transform(cutout, rotate, True)

        result = BRepAlgoAPI_Cut(result,
                                 rotated_cutout.Shape()).Shape()

    return result


def build_sprocket():
    # create the sprocket model
    wedge = build_tooth()
    rounded_wedge = round_tooth(wedge)
    basic_disk = clone_tooth(rounded_wedge)
    cut_disc = center_hole(basic_disk)
    mountable_disc = mounting_holes(cut_disc)
    sprocket = cut_out(mountable_disc)
    return sprocket


sprocket_model = build_sprocket()
# display the sprocket
display, start_display, add_menu, add_function_to_menu = init_display()
display.DisplayShape(sprocket_model, update=True)
display.FitAll()
start_display()
