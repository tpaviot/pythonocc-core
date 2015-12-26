import logging
import sys

global QtCore, QtGui, QtWidgets, QtOpenGL, HAVE_BACKEND

logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)
log = logging.getLogger(__name__)

# which Qt module
HAVE_PYQT5, HAVE_PYQT4, HAVE_PYSIDE = False, False, False

# is any backend imported?
HAVE_BACKEND = False


def get_backend(backend_str=None):
    """
    loads a backend
    backends are loaded in order of preference
    since python comes with Tk included, but that PySide or PyQt4
    is much preferred
    """

    if HAVE_BACKEND:
        raise ImportError("a backend is already loaded...")

    # -------------------------------------------------------------------------------
    # Really, the way to do this is how its done in matplotlib:
    # https://github.com/matplotlib/matplotlib/blob/master/lib/matplotlib/backends/qt_compat.py
    # -------------------------------------------------------------------------------

    if backend_str == "qt-pyqt5" or backend_str == None:
        try:
            from PyQt5 import QtCore, QtGui, QtOpenGL
            HAVE_BACKEND = True
            return 'qt-pyqt5'

        except ImportError:
            if backend_str is not None:
                log.exception("{0} could not be loaded")
                raise
            else:
                pass

    elif backend_str == "qt-pyqt4" or backend_str == None:
        try:
            from PyQt4 import QtCore, QtGui, QtOpenGL
            QtWidgets = QtGui

            HAVE_BACKEND = True
            return 'qt-pyqt4'

        except ImportError:
            if backend_str is not None:
                log.exception("{0} could not be loaded")
                raise
            else:
                pass

    elif backend_str == "qt-pyside" or backend_str == None:
        try:
            from PySide import QtCore, QtGui, QtOpenGL
            QtWidgets = QtGui

            HAVE_BACKEND = True
            return 'qt-pyside'
        except ImportError:
            if backend_str is not None:
                log.exception("{0} could not be loaded")
                raise
            else:
                pass

    elif backend_str == "wx" or backend_str == None:
        try:
            import wx

            HAVE_BACKEND = True
            return 'wx'
        except:
            if backend_str is not None:
                log.exception("{0} could not be loaded")
                raise
            else:
                pass

    if not HAVE_BACKEND:
        raise ImportError("No compliant GUI library could be imported.\n You must have either "
                          "PyQt5, PyQt4, PySide, or wxPython installed.")


def get_qt_modules():
    if HAVE_PYQT5 or HAVE_PYQT4 or HAVE_PYSIDE:
        return QtCore, QtGui, QtWidgets, QtOpenGL
    else:
        raise ValueError("no Qt backend is loaded, hence cannot return any modules")

