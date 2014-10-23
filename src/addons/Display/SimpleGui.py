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

import sys
from OCC import VERSION


def get_backend():
    """
    loads a backend
    backends are loaded in order of preference
    since python comes with Tk included, but that PySide or PyQt4
    is much preferred
    """
    try:
        from PySide import QtCore, QtGui
        return 'pyside'
    except:
        pass
    try:
        from PyQt4 import QtCore, QtGui
        return 'pyqt4'
    except:
        pass
    # Check wxPython
    try:
        import wx
        return 'wx'
    except:
        raise ImportError("No compliant GUI library found. You must have either PySide, PyQt4 or wxPython installed.")
        sys.exit(1)


def init_display(backend_str=None, size=(1024, 768)):
    global display, add_menu, add_function_to_menu, start_display, app, win, USED_BACKEND

    if not backend_str:
        USED_BACKEND = get_backend()
    elif backend_str in ['wx', 'pyside', 'pyqt4']:
        USED_BACKEND = backend_str
    else:
        raise ValueError("You should pass either 'wx','qt' or 'tkinter' to the init_display function.")
        sys.exit(1)
    # wxPython based simple GUI
    if USED_BACKEND == 'wx':
        try:
            import wx
        except:
            raise ImportError("Please install wxPython.")
        from wxDisplay import wxViewer3d

        class AppFrame(wx.Frame):
            def __init__(self, parent):
                wx.Frame.__init__(self, parent, -1, "pythonOCC-%s 3d viewer ('wx' backend)" % VERSION, style=wx.DEFAULT_FRAME_STYLE, size=size)
                self.canva = wxViewer3d(self)
                self.menuBar = wx.MenuBar()
                self._menus = {}
                self._menu_methods = {}

            def add_menu(self, menu_name):
                _menu = wx.Menu()
                self.menuBar.Append(_menu, "&"+menu_name)
                self.SetMenuBar(self.menuBar)
                self._menus[menu_name] = _menu

            def add_function_to_menu(self, menu_name, _callable):
                # point on curve
                _id = wx.NewId()
                assert callable(_callable), 'the function supplied is not callable'
                try:
                    self._menus[menu_name].Append(_id, _callable.__name__.replace('_', ' ').lower())
                except KeyError:
                    raise ValueError('the menu item %s does not exist' % menu_name)
                self.Bind(wx.EVT_MENU, _callable, id=_id)
        app = wx.PySimpleApp()
        win = AppFrame(None)
        win.Show(True)
        wx.SafeYield()
        win.canva.InitDriver()
        app.SetTopWindow(win)
        display = win.canva._display

        def add_menu(*args, **kwargs):
            win.add_menu(*args, **kwargs)

        def add_function_to_menu(*args, **kwargs):
            win.add_function_to_menu(*args, **kwargs)

        def start_display():
            app.MainLoop()

    # Qt based simple GUI
    elif USED_BACKEND in ['pyqt4', 'pyside']:
        if USED_BACKEND == 'pyqt4':
            from PyQt4 import QtCore, QtGui, QtOpenGL
            from OCC.Display.pyqt4Display import qtViewer3d
        elif USED_BACKEND == 'pyside':
            from PySide import QtCore, QtGui, QtOpenGL
            from OCC.Display.pysideDisplay import qtViewer3d

        class MainWindow(QtGui.QMainWindow):
            def __init__(self, *args):
                QtGui.QMainWindow.__init__(self, *args)
                self.canva = qtViewer3d(self)
                self.setWindowTitle("pythonOCC-%s 3d viewer ('%s' backend)" % (VERSION, USED_BACKEND))
                self.resize(size[0], size[1])
                self.setCentralWidget(self.canva)
                if not sys.platform == 'darwin':
                    self.menu_bar = self.menuBar()
                else:
                    # create a parentless menubar
                    # see: http://stackoverflow.com/questions/11375176/qmenubar-and-qmenu-doesnt-show-in-mac-os-x?lq=1
                    # noticeable is that the menu ( alas ) is created in the topleft of the screen, just
                    # next to the apple icon
                    # still does ugly things like showing the "Python" menu in bold
                    self.menu_bar = QtGui.QMenuBar()
                self._menus = {}
                self._menu_methods = {}
                # place the window in the center of the screen, at half the screen size
                self.centerOnScreen()

            def centerOnScreen(self):
                '''Centers the window on the screen.'''
                resolution = QtGui.QDesktopWidget().screenGeometry()
                self.move((resolution.width() / 2) - (self.frameSize().width() / 2),
                          (resolution.height() / 2) - (self.frameSize().height() / 2))

            def add_menu(self, menu_name):
                _menu = self.menu_bar.addMenu("&"+menu_name)
                self._menus[menu_name] = _menu

            def add_function_to_menu(self, menu_name, _callable):
                assert callable(_callable), 'the function supplied is not callable'
                try:
                    _action = QtGui.QAction(_callable.__name__.replace('_', ' ').lower(), self)
                    # if not, the "exit" action is now shown...
                    _action.setMenuRole(QtGui.QAction.NoRole)
                    self.connect(_action, QtCore.SIGNAL("triggered()"), _callable)
                    self._menus[menu_name].addAction(_action)
                except KeyError:
                    raise ValueError('the menu item %s does not exist' % menu_name)
        # following couple of lines is a twek to enable ipython --gui='qt'
        app = QtGui.QApplication.instance()  # checks if QApplication already exists 
        if not app:  # create QApplication if it doesnt exist 
            app = QtGui.QApplication(sys.argv)
        win = MainWindow()
        win.show()
        win.canva.InitDriver()
        display = win.canva._display
        if sys.platform != "linux2":
            display.EnableAntiAliasing()
        # background gradient
        display.set_bg_gradient_color(206, 215, 222, 128, 128, 128)
        # display black trihedron
        display.display_trihedron()

        def add_menu(*args, **kwargs):
            win.add_menu(*args, **kwargs)

        def add_function_to_menu(*args, **kwargs):
            win.add_function_to_menu(*args, **kwargs)

        def start_display():
            win.raise_()  # make the application float to the top
            app.exec_()
    return display, start_display, add_menu, add_function_to_menu

if __name__ == '__main__':
    display, start_display, add_menu, add_function_to_menu = init_display()
    from OCC.BRepPrimAPI import BRepPrimAPI_MakeSphere, BRepPrimAPI_MakeBox

    def sphere(event=None):
        display.DisplayShape(BRepPrimAPI_MakeSphere(100).Shape(), update=True)

    def cube(event=None):
        display.DisplayShape(BRepPrimAPI_MakeBox(1, 1, 1).Shape(), update=True)

    def exit(event=None):
        sys.exit()

    add_menu('primitives')
    add_function_to_menu('primitives', sphere)
    add_function_to_menu('primitives', cube)
    add_function_to_menu('primitives', exit)
    start_display()
