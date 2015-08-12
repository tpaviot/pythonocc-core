#!/usr/bin/env python

##Copyright 2009-2014 Thomas Paviot (tpaviot@gmail.com)
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

import sys
from OCC.Display import OCCViewer

HAVE_PYQT4 = False
HAVE_PYSIDE = False
try:
    from PyQt4 import QtCore, QtGui, QtOpenGL
    HAVE_PYQT4 = True
    print("Using PyQt4")
except ImportError:
    from PySide import QtCore, QtGui, QtOpenGL
    HAVE_PYSIDE = True
    print("PyQt4 not found - using PySide")


def get_qt_modules():
    return QtCore, QtGui, QtOpenGL


class point(object):
    def __init__(self, obj=None):
        self.x = 0
        self.y = 0
        if obj is not None:
            self.set(obj)

    def set(self, obj):
        self.x = obj.x()
        self.y = obj.y()


class qtBaseViewer(QtOpenGL.QGLWidget):
    ''' The base Qt Widget for an OCC viewer
    '''
    def __init__(self, parent=None):
        QtOpenGL.QGLWidget.__init__(self, parent)
        self._display = None
        self._inited = False

        # enable Mouse Tracking
        self.setMouseTracking(True)
        # Strong focus
        self.setFocusPolicy(QtCore.Qt.WheelFocus)

        # required for overpainting the widget
        self.setAttribute(QtCore.Qt.WA_PaintOnScreen)
        self.setAttribute(QtCore.Qt.WA_NoSystemBackground)
        self.setAutoFillBackground(False)

    def GetHandle(self):
        ''' returns an the identifier of the GUI widget.
        It must be an integer
        '''
        win_id = self.winId()  ## this returns either an int or voitptr
        if HAVE_PYSIDE:
            ### with PySide, self.winId() does not return an integer
            if sys.platform == "win32":
                ## Be careful, this hack is py27 specific
                ## does not work with python31 or higher
                ## since the PyCObject api was changed
                import ctypes
                ctypes.pythonapi.PyCObject_AsVoidPtr.restype = ctypes.c_void_p
                ctypes.pythonapi.PyCObject_AsVoidPtr.argtypes = [ctypes.py_object]
                win_id = ctypes.pythonapi.PyCObject_AsVoidPtr(win_id)                
        elif HAVE_PYQT4:
            ## below integer cast may be required because self.winId() can
            ## returns a sip.voitptr according to the PyQt version used
            ## as well as the python version
            if type(win_id) is not int:  # cast to int using the int() funtion
                win_id = int(win_id)
        return win_id

    def resizeEvent(self, event):
        if self._inited:
            self._display.OnResize()


class qtViewer3d(qtBaseViewer):
    def __init__(self, *kargs):
        qtBaseViewer.__init__(self, *kargs)
        self._drawbox = False
        self._zoom_area = False
        self._select_area = False
        self._inited = False
        self._leftisdown = False
        self._middleisdown = False
        self._rightisdown = False
        self._selection = None
        self._drawtext = True

    def InitDriver(self):
        self._display = OCCViewer.Viewer3d(self.GetHandle())
        self._display.Create()
        # background gradient
        self._display.set_bg_gradient_color(206, 215, 222, 128, 128, 128)
        # background gradient
        self._display.display_trihedron()
        self._display.SetModeShaded()
        self._display.EnableAntiAliasing()
        self._inited = True
        # dict mapping keys to functions
        self._SetupKeyMap()

    def _SetupKeyMap(self):
        def set_shade_mode():
            self._display.DisableAntiAliasing()
            self._display.SetModeShaded()

        self._key_map = {ord('W'): self._display.SetModeWireFrame,
                         ord('S'): set_shade_mode,
                         ord('A'): self._display.EnableAntiAliasing,
                         ord('B'): self._display.DisableAntiAliasing,
                         ord('H'): self._display.SetModeHLR,
                         ord('F'): self._display.FitAll,
                         ord('G'): self._display.SetSelectionMode
                         }

    def keyPressEvent(self, event):
        code = event.key()
        if code in self._key_map:
            self._key_map[code]()
        else:
            print('key', code, ' not mapped to any function')

    def Test(self):
        if self._inited:
            self._display.Test()

    def focusInEvent(self, event):
        if self._inited:
            self._display.Repaint()

    def focusOutEvent(self, event):
        if self._inited:
            self._display.Repaint()

    def paintEvent(self, event):
        if self._inited:
            self._display.Context.UpdateCurrentViewer()
            # important to allow overpainting of the OCC OpenGL context in Qt
            self.swapBuffers()

        if self._drawbox:
            self.makeCurrent()
            painter = QtGui.QPainter(self)
            painter.setPen(QtGui.QPen(QtGui.QColor(0, 0, 0), 1))
            rect = QtCore.QRect(*self._drawbox)
            painter.drawRect(rect)
            painter.end()
            self.doneCurrent()

    def resizeGL(self, width, height):
        self.setupViewport(width, height)

    def ZoomAll(self, evt):
        self._display.FitAll()

    def wheelEvent(self, event):
        if event.delta() > 0:
            zoom_factor = 2
        else:
            zoom_factor = 0.5
        self._display.Repaint()
        self._display.ZoomFactor(zoom_factor)

    def dragMoveEvent(self, event):
        pass

    def mousePressEvent(self, event):
        self.setFocus()
        self.dragStartPos = point(event.pos())
        self._display.StartRotation(self.dragStartPos.x, self.dragStartPos.y)

    def mouseReleaseEvent(self, event):
        pt = point(event.pos())
        modifiers = event.modifiers()

        if event.button() == QtCore.Qt.LeftButton:
            pt = point(event.pos())
            if self._select_area:
                [Xmin, Ymin, dx, dy] = self._drawbox
                self._display.SelectArea(Xmin, Ymin, Xmin+dx, Ymin+dy)
                self._select_area = False
            else:
                # multiple select if shift is pressed
                if modifiers == QtCore.Qt.ShiftModifier:
                    self._display.ShiftSelect(pt.x, pt.y)
                else:
                    # single select otherwise
                    self._display.Select(pt.x, pt.y)
        elif event.button() == QtCore.Qt.RightButton:
            if self._zoom_area:
                [Xmin, Ymin, dx, dy] = self._drawbox
                self._display.ZoomArea(Xmin, Ymin, Xmin+dx, Ymin+dy)
                self._zoom_area = False

    def DrawBox(self, event):
        tolerance = 2
        pt = point(event.pos())
        dx = pt.x - self.dragStartPos.x
        dy = pt.y - self.dragStartPos.y
        if abs(dx) <= tolerance and abs(dy) <= tolerance:
            return
        self._drawbox = [self.dragStartPos.x, self.dragStartPos.y, dx, dy]
        self.update()

    def mouseMoveEvent(self, evt):
        pt = point(evt.pos())
        buttons = int(evt.buttons())
        modifiers = evt.modifiers()
        # ROTATE
        if (buttons == QtCore.Qt.LeftButton and not modifiers == QtCore.Qt.ShiftModifier):
            dx = pt.x - self.dragStartPos.x
            dy = pt.y - self.dragStartPos.y
            self._display.Rotation(pt.x, pt.y)
            self._drawbox = False
        # DYNAMIC ZOOM
        elif (buttons == QtCore.Qt.RightButton and not modifiers == QtCore.Qt.ShiftModifier):
            self._display.Repaint()
            self._display.DynamicZoom(abs(self.dragStartPos.x), abs(self.dragStartPos.y), abs(pt.x), abs(pt.y))
            self.dragStartPos.x = pt.x
            self.dragStartPos.y = pt.y
            self._drawbox = False
        # PAN
        elif buttons == QtCore.Qt.MidButton:
            dx = pt.x - self.dragStartPos.x
            dy = pt.y - self.dragStartPos.y
            self.dragStartPos.x = pt.x
            self.dragStartPos.y = pt.y
            self._display.Pan(dx, -dy)
            self._drawbox = False
        # DRAW BOX
        # ZOOM WINDOW
        elif (buttons == QtCore.Qt.RightButton and modifiers == QtCore.Qt.ShiftModifier):
            self._zoom_area = True
            self.DrawBox(evt)
        # SELECT AREA
        elif (buttons == QtCore.Qt.LeftButton and modifiers == QtCore.Qt.ShiftModifier):
            self._select_area = True
            self.DrawBox(evt)
        else:
            self._drawbox = False
            self._display.MoveTo(pt.x, pt.y)


def Test3d():
    class AppFrame(QtGui.QWidget):
        def __init__(self, parent=None):
            QtGui.QWidget.__init__(self, parent)
            self.setWindowTitle(self.tr("qtDisplay3d sample"))
            self.resize(640, 480)
            self.canva = qtViewer3d(self)
            mainLayout = QtGui.QHBoxLayout()
            mainLayout.addWidget(self.canva)
            mainLayout.setContentsMargins(0, 0, 0, 0)
            self.setLayout(mainLayout)

        def runTests(self):
            self.canva._display.Test()

    app = QtGui.QApplication(sys.argv)
    frame = AppFrame()
    frame.show()
    frame.canva.InitDriver()
    frame.runTests()
    sys.exit(app.exec_())

if __name__ == "__main__":
    Test3d()
