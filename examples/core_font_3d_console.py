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

import sys
from code import InteractiveConsole
from StringIO import StringIO

from OCC.gp import gp_Vec
from OCC.Addons import text_to_brep, Font_FA_Bold

from OCC.Display.SimpleGui import init_display
from core_geometry_utils import translate_shp, make_extrusion

display, start_display, add_menu, add_function_to_menu = init_display("qt-pyqt4")

from OCC.Display.qtDisplay import qtViewer3d
from OCC.Display.backend import get_qt_modules
QtCore, QtGui, QtWidgets, QtOpenGL = get_qt_modules()


def display_str_at_pos(stri, col, line):
    brepstr = text_to_brep(stri, "Arial", Font_FA_Bold, 12., True)
    # translate the letter to the right
    brepstr_translated = translate_shp(brepstr, gp_Vec(col*8, -line*10, 0))
    brepstr_extruded = make_extrusion(brepstr_translated, 2.5)
    display.DisplayColoredShape(brepstr_extruded, 'WHITE')
    display.Repaint()

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
            viewer = wi.findChild(qtViewer3d)
            return viewer
viewer = get_occ_viewer()

welcome = """%s
Type "help", "copyright", "credits" or "license" for more information.
>>>""" % sys.version
display_str_at_pos(welcome, 0, 0)
col = 3
lin = 3
shift_pressed = False
python_cmd = ""

def newKeyReleaseEvent(event):
    global shift_pressed
    code = event.key()
    if code == QtCore.Qt.Key_Shift:
        shift_pressed = False
        print("Shift released")

def newkeyPressEvent(event):
    global python_cmd, col, lin, shift_pressed
    code = event.key()
    if code == QtCore.Qt.Key_Shift:
        shift_pressed = True
    elif code == QtCore.Qt.Key_Return or code == QtCore.Qt.Key_Enter:  # enter key
        # pass the python command to the interpreter
        output = c.runcode(python_cmd)
        lines = output.splitlines()
        for line in lines:
            if len(line) > 0:
                lin += 1
                display_str_at_pos(line, 0, lin)
        lin += 1
        python_cmd = ""
        ### display prompt below
        display_str_at_pos(">>>", 0, lin)
        col = 3
    elif code == QtCore.Qt.Key_Escape:
        sys.exit(0)
    else:
        if code > 255:
            return
        if not shift_pressed:
            chr_to_add = chr(code).lower()
        else:
            chr_to_add = chr(code)
        display_str_at_pos(chr_to_add, col, lin)
        python_cmd += chr_to_add
        col += 1

viewer.keyPressEvent = newkeyPressEvent
viewer.keyReleaseEvent = newKeyReleaseEvent

class Interpreter(InteractiveConsole):
    def __init__(self):
        self.l = {}
        InteractiveConsole.__init__(self, self.l)

    def write(self, data):
        print(data)

    def runcode(self, codez):
        out = StringIO()
        sys.stdout = out
        sys.stderr = out
        InteractiveConsole.runcode(self, codez)
        sys.stdout = sys.__stdout__
        sys.stderr = sys.__stderr__
        return out.getvalue()

c = Interpreter()

# black background
display.set_bg_gradient_color(0, 0, 0, 0, 0, 0)
display.FitAll()
start_display()
