#!/usr/bin/env python

# Copyright 2009-2016 Thomas Paviot (tpaviot@gmail.com)
##
# This file is part of pythonOCC.
##
# pythonOCC is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
##
# pythonOCC is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
##
# You should have received a copy of the GNU Lesser General Public License
# along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

import logging
import os
import sys
from typing import Any, Callable, List, Optional, Tuple

from OCC import VERSION
from OCC.Display.backend import get_qt_modules, load_backend
from OCC.Display.OCCViewer import OffscreenRenderer, Viewer3d

log = logging.getLogger(__name__)


def check_callable(_callable: Callable) -> None:
    """
    Checks if the given object is callable.

    Args:
        _callable: The object to check.

    Raises:
        AssertionError: If the object is not callable.
    """
    if not callable(_callable):
        raise AssertionError("The function supplied is not callable")


def init_display(
    backend_str: Optional[str] = None,
    size: Optional[Tuple[int, int]] = (1024, 768),
    display_triedron: Optional[bool] = True,
    background_gradient_color1: Optional[List[int]] = [206, 215, 222],
    background_gradient_color2: Optional[List[int]] = [128, 128, 128],
) -> Tuple[Viewer3d, Callable, Callable, Callable]:
    """
    Initializes a GUI for the 3D viewer.

    This function loads and initializes a GUI using either wx, pyqt5, pyqt6,
    pyside2 or pyside6. If the environment variable
    PYTHONOCC_OFFSCREEN_RENDERER is set to "1", the GUI is ignored and an
    offscreen renderer is returned instead.

    Args:
        backend_str (str, optional): The backend to use. If not specified,
            it will be automatically detected.
        size (tuple, optional): The size of the window.
        display_triedron (bool, optional): Whether to display the triedron.
        background_gradient_color1 (list, optional): The first color of the
            background gradient.
        background_gradient_color2 (list, optional): The second color of the
            background gradient.

    Returns:
        A tuple containing:
        - display: An instance of Viewer3d.
        - start_display: A function to start the GUI main loop.
        - add_menu: A function to add a menu to the GUI.
        - add_function_to_menu: A function to add a function to a menu.
    """
    if size is None:  # prevent size to being None (mypy)
        raise AssertionError("window size cannot be None")

    if os.getenv("PYTHONOCC_OFFSCREEN_RENDERER") == "1":
        # create the offscreen renderer
        offscreen_renderer = OffscreenRenderer()

        def do_nothing(*args: Any, **kwargs: Any) -> None:
            """takes as many parameters as you want, and does nothing"""
            return None

        def call_function(s: str, func: Callable) -> None:
            """A function that calls another function.
            Helpful to bypass add_function_to_menu. s should be a string
            """
            check_callable(func)
            log.info(f"Execute {s} :: {func.__name__} menu function")
            func()
            log.info("done")

            # returns empty classes and functions

        # returns empty classes and functions
        return offscreen_renderer, do_nothing, do_nothing, call_function

    used_backend = load_backend(backend_str)

    # tkinter SimpleGui
    if used_backend == "tk":
        import tkinter as tk

        from OCC.Display.tkDisplay import tkViewer3d

        root = tk.Tk()
        root_menu = tk.Menu(root)

        canva = tkViewer3d(root)
        canva.pack()
        canva.wait_visibility()

        all_menus = {}

        display = canva._display

        def start_display() -> None:
            root.config(menu=root_menu)
            root.mainloop()

        def add_menu(menu_name: str) -> None:
            new_menu = tk.Menu(root_menu)
            root_menu.add_cascade(label=menu_name, menu=new_menu)
            all_menus[menu_name] = new_menu

        def add_function_to_menu(menu_name: str, _callable: Callable) -> None:
            all_menus[menu_name].add_command(
                label=_callable.__name__, command=_callable
            )

    # wxPython based simple GUI
    if used_backend == "wx":
        import wx
        from OCC.Display.wxDisplay import wxViewer3d

        print("wxPython backend - ", wx.version())

        class AppFrame(wx.Frame):
            def __init__(self, parent: Any) -> None:
                wx.Frame.__init__(
                    self,
                    parent,
                    -1,
                    f"pythonOCC-{VERSION} 3d viewer ('wx' backend)",
                    style=wx.DEFAULT_FRAME_STYLE,
                    size=size,
                )
                self.canva = wxViewer3d(self)
                self.menuBar = wx.MenuBar()
                self._menus = {}
                self._menu_methods = {}

            def add_menu(self, menu_name: str) -> None:
                _menu = wx.Menu()
                self.menuBar.Append(_menu, f"&{menu_name}")
                self.SetMenuBar(self.menuBar)
                self._menus[menu_name] = _menu

            def add_function_to_menu(self, menu_name: str, _callable: Callable) -> None:
                # point on curve
                _id = wx.NewId()
                check_callable(_callable)
                if menu_name not in self._menus:
                    raise ValueError(f"the menu item {menu_name} does not exist")
                self._menus[menu_name].Append(
                    _id, _callable.__name__.replace("_", " ").lower()
                )
                self.Bind(wx.EVT_MENU, _callable, id=_id)

        app = wx.App(False)
        win = AppFrame(None)
        win.Show(True)
        wx.SafeYield()
        win.canva.InitDriver()
        app.SetTopWindow(win)
        display = win.canva._display

        def add_menu(*args: Any, **kwargs: Any) -> None:
            win.add_menu(*args, **kwargs)

        def add_function_to_menu(*args: Any, **kwargs: Any) -> None:
            win.add_function_to_menu(*args, **kwargs)

        def start_display() -> None:
            app.MainLoop()

    elif used_backend in ["pyqt5", "pyqt6", "pyside2", "pyside6"]:
        from OCC.Display.qtDisplay import qtViewer3d

        QtCore, QtGui, QtWidgets, QtOpenGL = get_qt_modules()
        # check Qt version
        qt_version = QtCore.qVersion()
        print(f"{used_backend} backend - Qt version {qt_version}")

        class MainWindow(QtWidgets.QMainWindow):
            def __init__(self, *args: Any) -> None:
                QtWidgets.QMainWindow.__init__(self, *args)
                self.canva = qtViewer3d(self)
                self.setWindowTitle(
                    f"pythonOCC-{VERSION} 3d viewer ('{used_backend}' backend)"
                )
                self.setCentralWidget(self.canva)
                if sys.platform != "darwin":
                    self.menu_bar = self.menuBar()
                else:
                    # create a parentless menubar
                    # see: http://stackoverflow.com/questions/11375176/qmenubar-and-qmenu-doesnt-show-in-mac-os-x?lq=1
                    # noticeable is that the menu ( alas ) is created in the
                    # topleft of the screen, just
                    # next to the apple icon
                    # still does ugly things like showing the "Python" menu in
                    # bold
                    self.menu_bar = QtWidgets.QMenuBar()
                self._menus = {}
                self._menu_methods = {}
                # place the window in the center of the screen, at half the
                # screen size
                self.center_on_screen()

            def center_on_screen(self) -> None:
                """Centers the window on the screen."""
                qr = self.frameGeometry()
                cp = QtGui.QGuiApplication.primaryScreen().availableGeometry().center()
                qr.moveCenter(cp)
                self.move(qr.topLeft())

            def add_menu(self, menu_name: str) -> None:
                _menu = self.menu_bar.addMenu(f"&{menu_name}")
                self._menus[menu_name] = _menu

            def add_function_to_menu(self, menu_name: str, _callable: Callable) -> None:
                check_callable(_callable)
                if menu_name not in self._menus:
                    raise ValueError(f"the menu item {menu_name} does not exist")
                qaction = (
                    QtGui.QAction
                    if used_backend in ["pyqt6", "pyside6"]
                    else QtWidgets.QAction
                )
                _action = qaction(_callable.__name__.replace("_", " ").lower(), self)
                _action.triggered.connect(_callable)
                self._menus[menu_name].addAction(_action)

        # following couple of lines is a tweak to enable ipython --gui='qt'
        app = QtWidgets.QApplication.instance() or QtWidgets.QApplication(sys.argv)
        win = MainWindow()
        win.resize(size[0] - 1, size[1] - 1)
        win.show()
        win.center_on_screen()
        win.raise_()
        win.canva.InitDriver()
        win.resize(size[0], size[1])
        win.canva.qApp = app
        display = win.canva._display

        def add_menu(*args: Any, **kwargs: Any) -> None:
            win.add_menu(*args, **kwargs)

        def add_function_to_menu(*args: Any, **kwargs: Any) -> None:
            win.add_function_to_menu(*args, **kwargs)

        def start_display() -> None:
            win.raise_()  # make the application float to the top
            main_loop = app.exec if used_backend in ["pyqt6", "pyside6"] else app.exec_
            main_loop()

    if display_triedron:
        display.display_triedron()

    if background_gradient_color1 and background_gradient_color2:
        # background gradient
        display.set_bg_gradient_color(
            background_gradient_color1, background_gradient_color2
        )

    return display, start_display, add_menu, add_function_to_menu
