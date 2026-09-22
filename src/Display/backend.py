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

"""Loading of the GUI toolkit (PyQt5, PySide2, PyQt6, PySide6, wx or tk) used
by the viewer widgets."""

import logging
import os
import sys
from typing import Any, Optional

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


def qt6_force_xcb_on_linux() -> None:
    """
    Force QT_QPA_PLATFORM to 'xcb' on Linux for Qt6.

    Wayland implementation prevents winId to provide with the correct x11
    windows id.
    """
    if sys.platform == "linux" and "XDG_SESSION_TYPE" in os.environ:
        if os.environ["XDG_SESSION_TYPE"] == "wayland":
            os.environ["QT_QPA_PLATFORM"] = "xcb"


def load_pyqt5() -> bool:
    """
    Loads the PyQt5 backend.

    Returns:
        bool: True if PyQt5 is found, False otherwise.
    """
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


def load_pyside2() -> bool:
    """
    Loads the PySide2 backend.

    Returns:
        bool: True if PySide2 is found, False otherwise.
    """
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


def load_pyqt6() -> bool:
    """
    Loads the PyQt6 backend.

    Returns:
        bool: True if PyQt6 is found, False otherwise.
    """
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


def load_pyside6() -> bool:
    """
    Loads the PySide6 backend.

    Returns:
        bool: True if PySide6 is found, False otherwise.
    """
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


def load_wx() -> bool:
    """
    Loads the wxPython backend.

    Returns:
        bool: True if wxPython is found, False otherwise.
    """

    # backend already loaded, dont load another one
    if loaded_backend():
        return False
    global HAVE_WX
    try:
        import wx  # noqa: F401, the import is the availability test

        HAVE_WX = True
    except ImportError:
        HAVE_WX = False
    return HAVE_WX


def loaded_backend() -> bool:
    """
    Returns True if a backend is loaded, False otherwise.
    """
    return HAVE_BACKEND


def get_loaded_backend() -> str:
    """
    Returns the name of the loaded backend.
    """
    return BACKEND_MODULE


def load_any_qt_backend() -> bool:
    """
    Loads the first available Qt backend, in the order PyQt5, PySide2,
    PyQt6, PySide6.

    Returns:
        bool: True when a Qt backend is loaded.

    Raises:
        ValueError: If no Qt backend can be loaded, or if another backend
            is already loaded.
    """
    for backend_str in (PYQT5, PYSIDE2, PYQT6, PYSIDE6):
        try:
            if load_backend(backend_str) == backend_str:
                return True
        except ValueError:
            continue
    raise ValueError("None of PyQt5, PySide2, PyQt6 or PySide6 can be loaded")


# the loaders of the backends, in the search order
_BACKEND_LOADERS = (
    (PYQT5, load_pyqt5),
    (PYSIDE2, load_pyside2),
    (PYQT6, load_pyqt6),
    (PYSIDE6, load_pyside6),
    (WX, load_wx),
)


def load_backend(backend_str: Optional[str] = None) -> str:
    """Load a GUI backend

    The search order for pythonocc compatible gui modules is:
        PyQt5, PySide2, PyQt6, PySide6, wx

    tk, available with any python, is used when none of them is found.

    Parameters
    ----------
    backend_str : str

        specifies which backend to load

        backend_str is one of ( "pyqt5", "pyqt6", "pyside2", "pyside6", "wx",
        "tk" )

        if no value has been set, load the first module in gui module search
        order

    Returns
    -------
    str
        the name of the loaded backend
        one of ( "pyqt5", "pyqt6", "pyside2", "pyside6", "wx", "tk" )

    Raises
    ------

    ValueError
        * when an invalid backend_str is specified
        * when the backend specified in ``backend_str`` could not be imported

    Note
    ----
    ``load_backend`` loads one backend per session: once a backend is
    loaded, the following calls return its name whatever ``backend_str``.

    """
    global HAVE_BACKEND, BACKEND_MODULE

    if HAVE_BACKEND:
        msg = "The %s backend is already loaded, load_backend can only be called once"
        log.info(msg, BACKEND_MODULE)
        return BACKEND_MODULE

    compatible_backends = (PYQT5, PYQT6, PYSIDE2, PYSIDE6, WX, TK)
    if backend_str is not None and backend_str not in compatible_backends:
        msg = (
            f"incompatible backend_str specified: {backend_str}\n"
            f"backend is one of : {compatible_backends}"
        )
        log.critical(msg)
        raise ValueError(msg)

    for name, loader in _BACKEND_LOADERS:
        if backend_str not in (None, name):
            continue
        if loader():
            HAVE_BACKEND = True
            BACKEND_MODULE = name
            log.info("backend loaded: %s", BACKEND_MODULE)
            return BACKEND_MODULE
        if backend_str == name:
            msg = f"{backend_str} backend could not be loaded"
            log.error(msg)
            raise ValueError(msg)

    # finally, the tk backend, available on all machines
    HAVE_BACKEND = True
    BACKEND_MODULE = TK
    log.info("backend loaded: %s", BACKEND_MODULE)
    return BACKEND_MODULE


def get_qt_modules() -> tuple[Any, Any, Any, Any]:
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
