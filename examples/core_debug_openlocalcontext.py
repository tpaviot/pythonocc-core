from OCC import gp
from OCC.AIS import AIS_Line, AIS_Trihedron, AIS_Shaded, AIS_InteractiveObject, AIS_Axis, Handle_AIS_Axis
from OCC.BRepPrimAPI import BRepPrimAPI_MakeBox
from OCC.Display.SimpleGui import init_display
from OCC.Display.backend import get_qt_modules
from OCC.Geom import Geom_CartesianPoint, Geom_Axis2Placement
from PyQt5.QtCore import QObject


display, start_display, add_menu, add_function_to_menu = init_display()


display.Context.CloseAllContexts()
display.Context.OpenLocalContext()
