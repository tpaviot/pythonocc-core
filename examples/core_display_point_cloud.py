#!/usr/bin/env python

##Copyright 2016 Thomas Paviot (tpaviot@gmail.com)
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

import os
import random

from OCC.Graphic3d import Graphic3d_ArrayOfPoints
from OCC.AIS import AIS_PointCloud

from OCC.Display.SimpleGui import init_display
display, start_display, add_menu, add_function_to_menu = init_display()


def random_points(event=None):
    n_points = 500000
    # first, create a set of 1000 points
    points_3d = Graphic3d_ArrayOfPoints(n_points)
    for idx in range(n_points):
        x = random.uniform(-50, 50)
        y = random.uniform(-50, 50)
        z = random.uniform(-50, 50)
        points_3d.AddVertex(x, y, z)

    # then build the point cloud
    point_cloud = AIS_PointCloud()
    point_cloud.SetPoints(points_3d.GetHandle())

    # display
    ais_context = display.GetContext().GetObject()
    ais_context.Display(point_cloud.GetHandle())
    display.View_Iso()
    display.FitAll()

def bunny(event=None):
    pcd_file = open(os.path.join('models', 'bunny.pcd'), 'r').readlines()[10:]
    # create the point_cloud
    pc = Graphic3d_ArrayOfPoints(len(pcd_file))
    for line in pcd_file:
        x, y, z = map(float, line.split())
        pc.AddVertex(x, y, z)
    point_cloud = AIS_PointCloud()
    point_cloud.SetPoints(pc.GetHandle())
    ais_context = display.GetContext().GetObject()
    ais_context.Display(point_cloud.GetHandle())
    display.View_Iso()
    display.FitAll()

if __name__ == '__main__':
    add_menu('pointcloud')
    add_function_to_menu('pointcloud', random_points)
    add_function_to_menu('pointcloud', bunny)
    start_display()
