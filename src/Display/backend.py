##Copyright 2009 Thomas Paviot (tpaviot@gmail.com)
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

import logging
import os
import sys

# backend constants
WX = "wx"
PYQT5 = "pyqt5"
PYSIDE2 = "pyside2"
PYQT6 = "pyqt6"
PYSIDE6 = "pyside6"
TK = "tk"

# backend module
HAVE_PYQT5, HAVE_PYSIDE2, HAVE_PYQT6, HAVE_PYSIDE6, HAVE_WX = (
    False,
    False,
    False,
    False,
    False,
)

# is any backend imported?
HAVE_BACKEND = False
BACKEND_MODULE = "No backend loaded"

log = logging.getLogger(__name__)
log.setLevel(logging.DEBUG)


def qt6_force_xcb_on_linux():
    """Force QT_QPA_PLATFORM to 'xcb' on Linux for Qt6. wayland implementation
    prevents winId to provide with the correct x11 windows id"""
    if sys.platform == "linux" and "XDG_SESSION_TYPE" in os.environ:
        if os.environ["XDG_SESSION_TYPE"] == "wayland":
            os.environ["QT_QPA_PLATFORM"] = "xcb"


def load_pyqt5():
    """Return True is PyQt5 found, else False"""
    global HAVE_PYQT5, QtCore, QtGui, QtWidgets, QtOpenGL

    # backend already loaded, dont load another one
    if loaded_backend():
        return False
    try:
        from PyQt5 import QtCore, QtGui, QtOpenGL, QtWidgets

        HAVE_PYQT5 = True
    except ImportError:
        HAVE_PYQT5 = False
    return HAVE_PYQT5


def load_pyside2():
    """Return True is PySide2 found, else False"""
    global HAVE_PYSIDE2, QtCore, QtGui, QtWidgets, QtOpenGL

    # backend already loaded, dont load another one
    if loaded_backend():
        return False
    try:
        from PySide2 import QtCore, QtGui, QtOpenGL, QtWidgets

        HAVE_PYSIDE2 = True
    except ImportError:
        HAVE_PYSIDE2 = False
    return HAVE_PYSIDE2


def load_pyqt6():
    """Return True is PyQt5 found, else False"""
    global HAVE_PYQT6, QtCore, QtGui, QtWidgets, QtOpenGL

    # backend already loaded, dont load another one
    if loaded_backend():
        return False
    try:
        qt6_force_xcb_on_linux()
        from PyQt6 import QtCore, QtGui, QtOpenGL, QtWidgets

        HAVE_PYQT6 = True
    except ImportError:
        HAVE_PYQT6 = False
    return HAVE_PYQT6


def load_pyside6():
    """Return True is PyQt5 found, else False"""
    global HAVE_PYSIDE6, QtCore, QtGui, QtWidgets, QtOpenGL

    # backend already loaded, dont load another one
    if loaded_backend():
        return False
    try:
        qt6_force_xcb_on_linux()
        from PySide6 import QtCore, QtGui, QtOpenGL, QtWidgets

        HAVE_PYSIDE6 = True
    except ImportError:
        HAVE_PYSIDE6 = False
    return HAVE_PYSIDE6


def load_wx():
    """Return True is wxPython found, else False"""

    # backend already loaded, dont load another one
    if loaded_backend():
        return False
    global HAVE_WX
    try:
        import wx

        HAVE_WX = True
    except ImportError:
        HAVE_WX = False
    return HAVE_WX


def loaded_backend():
    return HAVE_BACKEND


def get_loaded_backend():
    return BACKEND_MODULE


def load_any_qt_backend():
    """Load any qt based backend. First try to load
    PyQt5, then PyQt6. Raise an exception if none of them are available
    """
    pyqt5_loaded = False
    # by default, load PyQt5
    pyqt5_loaded = load_backend(PYQT5)
    if not pyqt5_loaded:
        pyqt6_loaded = load_backend(PYQT6)
    if not (pyqt5_loaded or pyqt6_loaded):
        raise AssertionError("None of the PyQt5 or PyQt6 can be loaded")
    return True


def load_backend(backend_str=None):
    """Load a GUI backend

    If no Qt backend is found (PyQt5 or PySide), wx is loaded

    The search order for pythonocc compatible gui modules is:
        PyQt5, PySide2, PyQt6, PySide6, wx

    Note
    ----
    wx is imported when no Qt backend is found.

    Parameters
    ----------
    backend_str : str

        specifies which backend to load

        backend_str is one of ( "pyqt5", "pyqt6", "pyside2", "pyside6", "wx" )

        if no value has been set, load the first module in gui module search
        order

    Returns
    -------
    str
        the name of the loaded backend
        one of ( "pyqt5", "pyqt6", "pyside2", "pyside6", "wx" )

    Raises
    ------

    ValueError
        * when a backend is already loaded
        * when an invalid backend_str is specified

    ImportError
        when the backend specified in ``backend_str`` could not be imported

    """
    global HAVE_BACKEND, BACKEND_MODULE

    if HAVE_BACKEND:
        msg = (
            "The %s backend is already loaded..."
            "``load_backend`` can only be called once per session"
        )
        log.info(msg, BACKEND_MODULE)
        return BACKEND_MODULE

    if backend_str is not None:
        compatible_backends = (PYQT5, PYQT6, PYSIDE2, PYSIDE6, WX, TK)
        if backend_str not in compatible_backends:
            msg = (
                f"incompatible backend_str specified: {backend_str}\n"
                f"backend is one of : {compatible_backends}"
            )
            log.critical(msg)
            raise ValueError(msg)

    if backend_str == PYQT5 or backend_str is None:
        if load_pyqt5():
            HAVE_BACKEND = True
            BACKEND_MODULE = "pyqt5"
            log.info("backend loaded: %s", BACKEND_MODULE)
            return BACKEND_MODULE
    if backend_str == PYQT5 and not HAVE_BACKEND:
        msg = f"{backend_str} backend could not be loaded"
        log.exception(msg)
        raise ValueError(msg)

    if backend_str == PYSIDE2 or (backend_str is None and not HAVE_BACKEND):
        if load_pyside2():
            HAVE_BACKEND = True
            BACKEND_MODULE = "pyside2"
            log.info("backend loaded: %s", BACKEND_MODULE)
            return BACKEND_MODULE
        elif backend_str == PYSIDE2 and not HAVE_BACKEND:
            msg = f"{backend_str} could not be loaded"
            log.exception(msg)
            raise ValueError(msg)

    if backend_str == PYQT6 or backend_str is None:
        if load_pyqt6():
            HAVE_BACKEND = True
            BACKEND_MODULE = "pyqt6"
            log.info("backend loaded: %s", BACKEND_MODULE)
            return BACKEND_MODULE
    if backend_str == PYQT6 and not HAVE_BACKEND:
        msg = f"{backend_str} backend could not be loaded"
        log.exception(msg)
        raise ValueError(msg)

    if backend_str == PYSIDE6 or backend_str is None:
        if load_pyside6():
            HAVE_BACKEND = True
            BACKEND_MODULE = "pyside6"
            log.info("backend loaded: %s", BACKEND_MODULE)
            return BACKEND_MODULE
    if backend_str == PYSIDE6 and not HAVE_BACKEND:
        msg = f"{backend_str} backend could not be loaded"
        log.exception(msg)
        raise ValueError(msg)

    if backend_str == WX or (backend_str is None and not HAVE_BACKEND):
        if load_wx():
            HAVE_BACKEND = True
            BACKEND_MODULE = "wx"
            log.info("backend loaded: %s", BACKEND_MODULE)
            return BACKEND_MODULE
        elif backend_str == WX and not HAVE_BACKEND:
            msg = f"{backend_str} backend could not be loaded"
            log.exception("%s backend could not be loaded", backend_str)
            raise ValueError(msg)

    # finally, return a tk backend, available on all machines
    return "tk"


def get_qt_modules():
    """

    Returns
    -------
    tuple : ( QtCore, QtGui, QtWidgets, QtOpenGL )
        here QtWidgets shadows QtGui when a PySide module is loaded
        this is the most coherent way to get PyQt5 compliant code

    Raises
    ------

    ValueError
        when no Qt backend has been yet loaded
        informs the user to call `load_backend` or that no Qt python module
        (PyQt5, PySide) is found

    """
    if not HAVE_BACKEND:
        raise ValueError(
            "no backend has been imported yet with " "``load_backend``... "
        )
    if HAVE_PYQT5 or HAVE_PYQT6 or HAVE_PYSIDE2 or HAVE_PYSIDE6:
        return QtCore, QtGui, QtWidgets, QtOpenGL
    if HAVE_WX:
        raise ValueError("the wx backend is already loaded")
    msg = (
        "no Qt backend is loaded, hence cannot return any modules\n"
        "either you haven't got PyQt5, PyQt6, PySide2 or PySide6 installed\n"
        "or you haven't yet loaded a backend with the "
        "`OCC.Display.backend.load_backend` function"
    )
    raise ValueError(msg)
