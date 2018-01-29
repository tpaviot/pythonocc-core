##Copyright 2017 Thomas Paviot (tpaviot@gmail.com)
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

""" Loads a STEP file and identify geometrical nature of each face
(cylindrical face, planar etc.)
See github issue https://github.com/tpaviot/pythonocc-core/issues/470

Two options in this example:

1. Click any planar or cylindrical face from the 3d window. They will
be identified as known surfaces, their properties displayed in the
console

2. A batch mode : click the menu button. All the faces will be traversed
and analyzed
"""

from __future__ import print_function

import os
import os.path
import sys


from OCC.Core.STEPControl import STEPControl_Reader
from OCC.Core.IFSelect import IFSelect_RetDone, IFSelect_ItemsByEntity
from OCC.Core.GeomAbs import GeomAbs_Plane, GeomAbs_Cylinder
from OCC.Core.TopoDS import topods_Face
from OCC.Core.BRepAdaptor import BRepAdaptor_Surface
from OCC.Display.SimpleGui import init_display

from OCC.Extend.TopologyUtils import TopologyExplorer


def read_step_file(filename):
    """ read the STEP file and returns a compound
    """
    step_reader = STEPControl_Reader()
    status = step_reader.ReadFile(filename)

    if status == IFSelect_RetDone:  # check status
        failsonly = False
        step_reader.PrintCheckLoad(failsonly, IFSelect_ItemsByEntity)
        step_reader.PrintCheckTransfer(failsonly, IFSelect_ItemsByEntity)
        step_reader.TransferRoot(1)
        a_shape = step_reader.Shape(1)
    else:
        print("Error: can't read file.")
        sys.exit(0)
    return a_shape


def recognize_face(a_face):
    """ Takes a TopoDS shape and tries to identify its nature
    whether it is a plane a cylinder a torus etc.
    if a plane, returns the normal
    if a cylinder, returns the radius
    """
    surf = BRepAdaptor_Surface(a_face, True)
    surf_type = surf.GetType()
    if  surf_type == GeomAbs_Plane:
        print("--> plane")
        # look for the properties of the plane
        # first get the related gp_Pln
        gp_pln = surf.Plane()
        location = gp_pln.Location()  # a point of the plane
        normal = gp_pln.Axis().Direction()  # the plane normal
        # then export location and normal to the console output
        print("--> Location (global coordinates)", location.X(), location.Y(), location.Z())
        print("--> Normal (global coordinates)", normal.X(), normal.Y(), normal.Z())
    elif surf_type == GeomAbs_Cylinder:
        print("--> cylinder")
        # look for the properties of the cylinder
        # first get the related gp_Cyl
        gp_cyl = surf.Cylinder()
        location = gp_cyl.Location()  # a point of the axis
        axis = gp_cyl.Axis().Direction()  # the cylinder axis
        # then export location and normal to the console output
        print("--> Location (global coordinates)", location.X(), location.Y(), location.Z())
        print("--> Axis (global coordinates)", axis.X(), axis.Y(), axis.Z())
    else:
        # TODO there are plenty other type that can be checked
        # see documentation for the BRepAdaptor class
        # https://www.opencascade.com/doc/occt-6.9.1/refman/html/class_b_rep_adaptor___surface.html
        print("not implemented")


def recognize_clicked(shp, *kwargs):
    """ This is the function called every time
    a face is clicked in the 3d view
    """
    for shape in shp:  # this should be a TopoDS_Face TODO check it is
        print("Face selected: ", shape)
        recognize_face(topods_Face(shape))


def recognize_batch(event=None):
    """ Menu item : process all the faces of a single shape
    """
    # then traverse the topology using the Topo class
    t = TopologyExplorer(shp)
    # loop over faces only
    for f in t.faces():
        # call the recognition function
        recognize_face(f)


def exit(event=None):
    sys.exit()


if __name__ == '__main__':
    display, start_display, add_menu, add_function_to_menu = init_display()
    display.SetSelectionModeFace()  # switch to Face selection mode
    display.register_select_callback(recognize_clicked)
    # first loads the STEP file and display
    shp = read_step_file(os.path.join('.', 'models', 'face_recognition_sample_part.stp'))
    display.DisplayShape(shp, update=True)
    add_menu('recognition')
    add_function_to_menu('recognition', recognize_batch)
    start_display()
