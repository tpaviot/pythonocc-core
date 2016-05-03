#!/usr/bin/env python

##Copyright 2009-2015 Jelle Ferina (jelleferinga@gmail.com)
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

from __future__ import print_function

from OCC.BRepExtrema import BRepExtrema_DistShapeShape
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.Display.SimpleGui import init_display
from OCC.gp import gp_Pnt, gp_Ax2, gp_Circ

from core_geometry_utils import make_edge, make_vertex

display, start_display, add_menu, add_function_to_menu = init_display()


def compute_minimal_distance_between_cubes():
    """ compute the minimal distance between 2 cubes

    the line between the 2 points is rendered in cyan

    """
    b1 = BRepPrimAPI_MakeBox(gp_Pnt(100, 0, 0), 10., 10., 10.).Shape()
    b2 = BRepPrimAPI_MakeBox(gp_Pnt(45, 45, 45), 10., 10., 10.).Shape()
    display.DisplayShape([b1, b2])

    dss = BRepExtrema_DistShapeShape()
    dss.LoadS1(b1)
    dss.LoadS2(b2)
    dss.Perform()

    assert dss.IsDone()

    edg = make_edge(dss.PointOnShape1(1), dss.PointOnShape2(1))
    display.DisplayColoredShape([edg], color="CYAN")


def compute_minimal_distance_between_circles():
    """ compute the minimal distance between 2 circles

    here the minimal distance overlaps the intersection of the circles
    the points are rendered to indicate the locations

    """
    # required for precise rendering of the circles
    display.Context.SetDeviationCoefficient(0.0001)
    L = gp_Pnt(4, 10, 0)
    M = gp_Pnt(10, 16, 0)

    Laxis = gp_Ax2()
    Maxis = gp_Ax2()
    Laxis.SetLocation(L)
    Maxis.SetLocation(M)

    r1 = 12.0
    r2 = 15.0
    Lcircle = gp_Circ(Laxis, r1)
    Mcircle = gp_Circ(Maxis, r2)

    l_circle, m_circle = make_edge(Lcircle), make_edge(Mcircle)
    display.DisplayShape((l_circle, m_circle))

    # compute the minimal distance between 2 circles
    # the minimal distance here matches the intersection of the circles
    dss = BRepExtrema_DistShapeShape(l_circle, m_circle)

    print("intersection parameters on l_circle:",
          [dss.ParOnEdgeS1(i) for i in range(1, dss.NbSolution() + 1)])
    print("intersection parameters on m_circle:",
          [dss.ParOnEdgeS2(i) for i in range(1, dss.NbSolution() + 1)])

    for i in range(1, dss.NbSolution() + 1):
        pnt = dss.PointOnShape1(i)
        display.DisplayShape(make_vertex(pnt))


if __name__ == "__main__":
    compute_minimal_distance_between_cubes()
    compute_minimal_distance_between_circles()
    display.FitAll()
    start_display()
