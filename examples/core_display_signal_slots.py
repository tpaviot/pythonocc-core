from __future__ import print_function
import sys

from OCC.BRepGProp import brepgprop_LinearProperties
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox, BRepPrimAPI_MakeSphere
from OCC.Display.SimpleGui import init_display
from OCC.Display.backend import get_qt_modules
from OCC.GProp import GProp_GProps
from OCC.TopAbs import TopAbs_SOLID, TopAbs_EDGE, TopAbs_FACE
from OCC.TopLoc import TopLoc_Location
from OCC.gp import gp_Trsf, gp_Vec

display, start_display, add_menu, add_function_to_menu = init_display("qt-pyqt5")
QtCore, QtGui, QtWidgets, QtOpenGL = get_qt_modules()

from OCC.Display.qtDisplay import qtViewer3d

print("Usage: press G to find the linear properties for volume, face, edge, vertex...")


def get_occ_viewer():
    """

    Returns
    -------

    qtViewer3d

    """
    app = QtWidgets.QApplication.instance()  # checks if QApplication already exists
    if not app:
        app = QtWidgets.QApplication(sys.argv)
    widgets = app.topLevelWidgets()
    for wi in widgets:
        if hasattr(wi, "_menus"):  # OCC.Display.SimpleGui.MainWindow
            viewer = wi.findChild(qtViewer3d, "qt_viewer_3d")
            return viewer


def on_select(shapes):
    """

    Parameters
    ----------
    shape : TopoDS_Shape

    """
    g1 = GProp_GProps()

    for shape in shapes:
        brepgprop_LinearProperties(shape, g1)
        mass = g1.Mass()
        centre_of_mass = g1.CentreOfMass()
        com_x = centre_of_mass.X()
        com_y = centre_of_mass.Y()
        com_z = centre_of_mass.Z()
        static_moments = g1.StaticMoments()
        print("shape {shape}: \n mass: {mass}"
              "\n center of mass: {com_x}, {com_y}, {com_z}"
              "\n static moments: {static_moments}".format(**vars()))


def also_on_select(shapes):
    for shape in shapes:
        if shape.ShapeType() == TopAbs_SOLID:
            print("solid selected")
        if shape.ShapeType() == TopAbs_EDGE:
            print("edge selected")
        if shape.ShapeType() == TopAbs_FACE:
            print("face selected")

def location_from_vector(x, y, z):
    trsf = gp_Trsf()
    trsf.SetTranslation(gp_Vec(500, 0, 0))
    loc = TopLoc_Location(trsf)
    return loc

cube = BRepPrimAPI_MakeBox(100, 100, 100).Shape()
sphere = BRepPrimAPI_MakeSphere(100).Shape()
sphere.Move(location_from_vector(500,0,0))

display.DisplayShape(cube)
display.DisplayShape(sphere)

viewer = get_occ_viewer()
viewer.sig_topods_selected.connect(on_select)
viewer.sig_topods_selected.connect(also_on_select)

display.FitAll()
start_display()
