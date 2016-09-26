##Copyright 2016 Jelle Feringa (jelleferinga@gmail.com)
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

from OCC.BOPAlgo import BOPAlgo_MakerVolume
from OCC.BRepAdaptor import BRepAdaptor_Surface
from OCC.BRepBuilderAPI import BRepBuilderAPI_Transform
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.BRepTools import breptools_UVBounds
from OCC.Display.SimpleGui import init_display
from OCC.Graphic3d import Graphic3d_NOM_STEEL
from OCC.STEPControl import STEPControl_Reader
from OCC.gp import gp_Trsf
from OCC.gp import gp_Vec

display, start_display, add_menu, add_function_to_menu = init_display()

#-------------------------------------------------------------------------------
# adapted from: http://dev.opencascade.org/index.php?q=node/1062
#-------------------------------------------------------------------------------


# The usage of the algorithm on the API level:
# BOPAlgo_MakerVolume aMV;
# BOPCol_ListOfShape aLS = …; // arguments
# Standard_Boolean bRunParallel = Standard_False; /* parallel or single mode (the default value is FALSE)*/
# Standard_Boolean bIntersect = Standard_True; /* intersect or not the arguments (the default value is TRUE)*/
# Standard_Real aTol = 0.0; /* fuzzy option (default value is 0)*/
# //
# aMV.SetArguments(aLS);
# aMV.SetRunParallel(bRunParallel);
# aMV.SetIntersect(bIntersect);
# aMV.SetFuzzyValue(aTol);
# //
# aMV.Perform(); //perform the operation
# if (aMV.ErrorStatus()) { //check error status
# return;
# }
# //
# const TopoDS_Shape& aResult = aMV.Shape(); // result of the operation
#


# aMV.SetArguments(aLS);
# aMV.SetIntersect(bToIntersect);
# aMV.SetRunParallel(bRunParallel);
# //
# aMV.Perform();
# if (aMV.ErrorStatus()) {
# di << "Error status: " << aMV.ErrorStatus();
# return 1;
# }
# //
# const
# TopoDS_Shape & aR = aMV.Shape();


def domain(face):
    '''the u,v domain of the curve
    :return: UMin, UMax, VMin, VMax
    '''
    return breptools_UVBounds(face)


def mid_point(face):
    """
    :return: the parameter at the mid point of the face,
    and its corresponding gp_Pnt
    """
    u_min, u_max, v_min, v_max = domain(face)
    u_mid = (u_min + u_max) / 2.
    v_mid = (v_min + v_max) / 2.
    srf_adap = BRepAdaptor_Surface(face)
    return ((u_mid, v_mid), srf_adap.Value(u_mid, v_mid))



# loads file
step_reader = STEPControl_Reader()
step_reader.ReadFile('./models/cylinder_block_mold_model.stp')
step_reader.TransferRoot()
block_cylinder_shape = step_reader.Shape()

# create box
box = BRepPrimAPI_MakeBox(30, 90, 90)
trns = gp_Trsf()
trns.SetTranslation(gp_Vec(0, -35, -35))
mold_basis = BRepBuilderAPI_Transform(box.Shape(), trns).Shape()

# get limits on faces along X-axis
left_face = box.LeftFace()
right_face = box.RightFace()

# find the points at the center of the face
pt_left_face = mid_point(left_face)
pt_right_face = mid_point(left_face)

# interpolate a nr of points along the limits
latTrns = gp_Trsf()
latTrns.SetTranslation(gp_Vec(0, -35, -35))


# compute mold print
# mold = BRepAlgoAPI_Cut(mold_basis, block_cylinder_shape).Shape()
mv = BOPAlgo_MakerVolume()
mv.AddArgument(block_cylinder_shape)
mv.AddArgument(mold_basis)
# mv.SetRunParallel(True)
mv.SetIntersect(True)
# mv.SetFuzzyValue(0.1)
mv.Perform()
mv.Faces()
# <Swig Object of type 'BOPCol_ListOfShape *' at 0x117808b40>
mv.ShapesSD()
# <Swig Object of type 'BOPCol_DataMapOfShapeShape *' at 0x1047c54b0>

mv.Images()
# <Swig Object of type 'BOPCol_DataMapOfShapeListOfShape *' at 0x125004f60>



# display
display, start_display, add_menu, add_function_to_menu = init_display()
display.DisplayShape(mold_basis, update=True, material=Graphic3d_NOM_STEEL)
start_display()
