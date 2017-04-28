#!/usr/bin/env python

##Copyright Jelle Feringa (jelleferinga@gmail.com)
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

import random
import time
import sys

from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeCylinder, BRepPrimAPI_MakeCone
from OCC.gp import gp_Pnt, gp_Vec, gp_Ax2, gp_Dir
from OCC.BRepAlgoAPI import BRepAlgoAPI_Cut
from OCC.TopTools import TopTools_ListOfShape

from OCC.Display.SimpleGui import init_display

display, start_display, add_menu, add_function_to_menu = init_display()

def random_pnt():
    x, y, z = [random.uniform(0, 1) for i in range(3)]
    return gp_Pnt(x, y, z)

def random_vec():
    x, y, z = [random.uniform(-1, 1) for i in range(3)]
    return gp_Vec(x, y, z)

def fuzzy_cut(shape_A, shape_B, tol=5e-5, parallel=False):
    """ returns shape_A - shape_B
    """
    cut = BRepAlgoAPI_Cut()
    L1 = TopTools_ListOfShape()
    L1.Append(shape_A)
    L2 = TopTools_ListOfShape()
    L2.Append(shape_B)
    cut.SetArguments(L1)
    cut.SetTools(L2)
    cut.SetFuzzyValue(tol)
    cut.SetRunParallel(parallel)
    cut.Build()
    return cut.Shape()

def emmenthaler(event=None):
    init_time = time.time()
    scope = 200.
    nb_iter = 40
    box = BRepPrimAPI_MakeBox(scope, scope, scope).Shape()

    def do_cyl():
        axe = gp_Ax2()
        axe.SetLocation(gp_Pnt((random_vec()*scope).XYZ()))
        axe.SetDirection(gp_Dir(random_vec()))
        cyl = BRepPrimAPI_MakeCylinder(axe, random.uniform(8, 36), 5000.)
        return cyl.Shape()

    def do_cone():
        axe = gp_Ax2()
        axe.SetLocation(gp_Pnt((random_vec()*scope).XYZ()))
        axe.SetDirection(gp_Dir(random_vec()))
        cone = BRepPrimAPI_MakeCone(axe,
                                    0, #random.uniform(0,), # r1
                                    random.uniform(10, 30), # r2
                                    random.uniform(30, 1500), # h
                                   )
        return cone.Shape()

    # perform a recursive fusszy cut
    # initialize the loop with the box shape
    shp = box
    for i in range(nb_iter):
        cyl = do_cyl()
        tA = time.time()
        shp = fuzzy_cut(shp, cyl, 1e-4)
        print('boolean cylinder:', i, 'took', time.time()-tA)
    total_time = time.time() - init_time
    print("Total time : %fs" % total_time)
    display.DisplayShape(shp)
    start_display()


def exit(event=None):
    sys.exit()

if __name__ == '__main__':
    add_menu('fuzzy boolean operations')
    add_function_to_menu('fuzzy boolean operations', emmenthaler)
    start_display()
