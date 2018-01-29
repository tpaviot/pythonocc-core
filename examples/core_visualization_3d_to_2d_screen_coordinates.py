##Copyright 2017 Thomas Paviot (jelleferinga@gmail.com)
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

""" Select a vertex, and you'll see both 3d and 2d screen
coordinates in the console.
"""

from OCC.Display.SimpleGui import init_display
from OCC.Core.Graphic3d import Graphic3d_Camera
from OCC.Core.TopoDS import topods_Vertex
from OCC.Core.BRep import BRep_Tool
from OCC.Extend.DataExchange import read_step_file

def vertex_clicked(shp, *kwargs):
    """ This function is called whenever a vertex is selected
    """
    for shape in shp:  # this should be a TopoDS_Vertex
        print("Face selected: ", shape)
        v = topods_Vertex(shape)
        pnt = BRep_Tool.Pnt(v)
        print("3d gp_Pnt selected coordinates : X=", pnt.X(),
              "Y=", pnt.Y(), "Z=", pnt.Z())
        # then convert to screen coordinates
        screen_coord = display.View.Convert(pnt.X(), pnt.Y(), pnt.Z())
        print("2d screen coordinates : ", screen_coord)

display, start_display, add_menu, add_function_to_menu = init_display()
# loads  and displays a step file
the_shape = read_step_file('./models/as1_pe_203.stp')

display.SetSelectionModeVertex()  # switch to Vertex selection mode
display.register_select_callback(vertex_clicked)
display.DisplayShape(the_shape, update=True)
start_display()
