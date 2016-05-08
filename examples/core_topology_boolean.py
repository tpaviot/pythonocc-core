##Copyright 2009-2016 Thomas Paviot (tpaviot@gmail.com)
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
import sys
import time

from OCC.BRepAlgoAPI import BRepAlgoAPI_Fuse, BRepAlgoAPI_Common, BRepAlgoAPI_Section, BRepAlgoAPI_Cut
from OCC.BRepBuilderAPI import BRepBuilderAPI_MakeFace, BRepBuilderAPI_Transform
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeWedge, BRepPrimAPI_MakeSphere, BRepPrimAPI_MakeTorus
from OCC.Display.SimpleGui import init_display
from OCC.gp import gp_Vec, gp_Ax2, gp_Pnt, gp_Dir, gp_Pln, gp_Trsf

display, start_display, add_menu, add_function_to_menu = init_display()


def translate_topods_from_vector(brep_or_iterable, vec, copy=False):
    '''
    translate a brep over a vector
    @param brep:    the Topo_DS to translate
    @param vec:     the vector defining the translation
    @param copy:    copies to brep if True
    '''
    trns = gp_Trsf()
    trns.SetTranslation(vec)
    brep_trns = BRepBuilderAPI_Transform(brep_or_iterable, trns, copy)
    brep_trns.Build()
    return brep_trns.Shape()


def fuse(event=None):
    display.EraseAll()
    box1 = BRepPrimAPI_MakeBox(2, 1, 1).Shape()
    box2 = BRepPrimAPI_MakeBox(2, 1, 1).Shape()
    box1 = translate_topods_from_vector(box1, gp_Vec(.5, .5, 0))
    fuse = BRepAlgoAPI_Fuse(box1, box2).Shape()
    display.DisplayShape(fuse)
    display.FitAll()


def common(event=None):
    # Create Box
    axe = gp_Ax2(gp_Pnt(10, 10, 10), gp_Dir(1, 2, 1))
    Box = BRepPrimAPI_MakeBox(axe, 60, 80, 100).Shape()
    # Create wedge
    Wedge = BRepPrimAPI_MakeWedge(60., 100., 80., 20.).Shape()
    # Common surface
    CommonSurface = BRepAlgoAPI_Common(Box, Wedge).Shape()

    display.EraseAll()
    ais_box = display.DisplayShape(Box)
    ais_wedge = display.DisplayShape(Wedge)
    display.Context.SetTransparency(ais_box, 0.8)
    display.Context.SetTransparency(ais_wedge, 0.8)
    display.DisplayShape(CommonSurface)
    display.FitAll()


def slicer(event=None):
    # Param
    Zmin, Zmax, deltaZ = -100, 100, 5
    # Note: the shape can also come from a shape selected from InteractiveViewer
    if 'display' in dir():
        shape = display.GetSelectedShape()
    else:
        # Create the shape to slice
        shape = BRepPrimAPI_MakeSphere(60.).Shape()
    # Define the direction
    D = gp_Dir(0., 0., 1.)  # the z direction
    # Perform slice
    sections = []
    init_time = time.time()  # for total time computation
    for z in range(Zmin, Zmax, deltaZ):
        # Create Plane defined by a point and the perpendicular direction
        P = gp_Pnt(0, 0, z)
        Pln = gp_Pln(P, D)
        face = BRepBuilderAPI_MakeFace(Pln).Shape()
        # Computes Shape/Plane intersection
        section = BRepAlgoAPI_Section(shape, face)
        if section.IsDone():
            sections.append(section)
    total_time = time.time() - init_time
    print("%.3fs necessary to perform slice." % total_time)

    display.EraseAll()
    display.DisplayShape(shape)
    for section in sections:
        display.DisplayShape(section.Shape())
    display.FitAll()


def section(event=None):
    Torus = BRepPrimAPI_MakeTorus(120, 20).Shape()
    radius = 120.0
    sections = []
    for i in range(-3, 4):
        # Create Sphere
        Sphere = BRepPrimAPI_MakeSphere(gp_Pnt(26 * 3 * i, 0, 0), radius).Shape()
        # Computes Torus/Sphere section
        section = BRepAlgoAPI_Section(Torus, Sphere, False)
        section.ComputePCurveOn1(True)
        section.Approximation(True)
        section.Build()
        sections.append(section)

    display.EraseAll()
    display.DisplayShape(Torus)
    for section in sections:
        display.DisplayShape(section.Shape())
    display.FitAll()


def cut(event=None):
    # Create Box
    Box = BRepPrimAPI_MakeBox(200, 60, 60).Shape()
    # Create Sphere
    Sphere = BRepPrimAPI_MakeSphere(gp_Pnt(100, 20, 20), 80).Shape()
    # Cut: the shere is cut 'by' the box
    Cut = BRepAlgoAPI_Cut(Sphere, Box).Shape()
    display.EraseAll()
    ais_box = display.DisplayShape(Box)
    display.Context.SetTransparency(ais_box, 0.8)
    display.DisplayShape(Cut)
    display.FitAll()


def exit(event=None):
    sys.exit()


if __name__ == '__main__':
    add_menu('topology boolean operations')
    add_function_to_menu('topology boolean operations', fuse)
    add_function_to_menu('topology boolean operations', common)
    add_function_to_menu('topology boolean operations', cut)
    add_function_to_menu('topology boolean operations', section)
    add_function_to_menu('topology boolean operations', slicer)
    add_function_to_menu('topology boolean operations', exit)
    start_display()
